entity testbench_register_n is
end testbench_register_n ;

architecture mixed of testbench_register_n is

  signal data_c, queue_c: bit_vector(3 downto 0);
  signal clock_c: bit;

  signal data_p, queue_p: bit_vector(3 downto 0);
  signal clock_p: bit;

begin

  register_c: entity work.register_n(behavioral_concurrent)
    generic map(n => 4)
    port map(data => data_c, clock => clock_c, queue => queue_c);

  register_p: entity work.register_n(behavioral_process)
    generic map(n => 4)
    port map(data => data_p, clock => clock_p, queue => queue_p);

  p1: process 
      variable input: bit_vector(3 downto 0) := "1010";
    begin
      data_c <= input;
      data_p <= input;
      wait for 2 ns;
      clock_c <= '1';
      clock_p <= '1';
      wait for 2 ns;

      wait;
    end process p1;

end architecture mixed; -- mixed