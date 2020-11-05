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
    signal S_andor, S_addsub: std_logic_vector(N-1 downto 0);

begin
    andor: entity work.andor(behavioral)
        generic map(N => N)
        port map(A => A, B => B, operation => C(1), S => S_andor);
    
    addsub: entity work.addsub(behavioral)
        generic map(N => N)
        port map(A => A, B => B, operation => C(2), S => S_addsub);

    multiplex2x1: entity work.multiplex2x1(behavioral)
        generic map(N => N)
        port map(input0 => S_andor, input1 => S_addsub, sel => C(0), output => S);
end architecture;
