-- Entidade testbench do somador1b: nao possui sinais de entrada e saida
entity tb_somador1b is 
end tb_somador1b;
-- Arquitetura do testbench
architecture mixed of tb_somador1b is
  -- Fios para interligacao
  signal a, b, cin, sum, cout: bit;
begin 
  -- Instanciacao da entidade somador1b => comando concorrente
  somador1b: entity work.somador1b(behavioral)
    port map (a, b, cin, sum, cout);
    -- Processo => comando concorrente
    estimulo_checagem: process is 
      -- Area de declaracoes do processo
      type linha_tabela_verdade is record
        a, b, cin, sum, cout: bit;
      end record;

      type vetor_linha_tabela_verdade is array (0 to 7) of linha_tabela_verdade;

      constant tabela_verdade: vetor_linha_tabela_verdade := -- Modelo de referencia
      (
        --a    b   cin  sum  cout
        ('0', '0', '0', '0', '0'),
        ('0', '0', '1', '1', '0'),
        ('0', '1', '0', '1', '0'),
        ('0', '1', '1', '0', '1'),
        ('1', '0', '0', '1', '0'),
        ('1', '0', '1', '0', '1'),
        ('1', '1', '0', '0', '1'),
        ('1', '1', '1', '1', '1')
      );
    begin 
      for i in tabela_verdade'range loop
        -- Estimulo: Seta sinais de entrada
        a <= tabela_verdade(i).a;
        b <= tabela_verdade(i).b;
        cin <= tabela_verdade(i).cin;

        -- Espera resultado
        wait for 1 ns;

        -- Testa sinal de saida
        assert sum = tabela_verdade(i).sum report "unexpected value. sum = " & bit'image(tabela_verdade(i).sum) 
          & " - expected sum = " & bit'image(sum) severity error;
        assert cout = tabela_verdade(i).cout report "unexpected value. cout = " & bit'image(tabela_verdade(i).sum) 
        & " - expected cout = " & bit'image(sum) severity error;
      end loop;

      report "Fim dos testes";

      -- Suspende processo indefinidamente => termina simulacao
      wait;
    end process estimulo_checagem;
end mixed;
