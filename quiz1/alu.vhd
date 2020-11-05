library ieee;
use ieee.std_logic_1164.all;

entity alu is
    generic( 
        N: natural := 8 
    );
    port(
        A, B: in std_logic_vector(N-1 downto 0);
        C: in std_logic_vector(2 downto 0);
        S: out std_logic_vector(N-1 downto 0)
    );
end entity;

architecture structural of alu is

-- SEU CODIGO AQUI

begin

-- SEU CODIGO AQUI

end architecture;
