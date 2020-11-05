library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity addsub is
    generic (
        N: natural := 8
    );
    port (
        A, B: in std_logic_vector(N-1 downto 0);
        operation: in std_logic;
        S: out std_logic_vector(N-1 downto 0)
    );
end entity;

architecture behavioral of addsub is
begin
    p1: process(A, B)
    begin 
        if operation = '0' then
            S <= std_logic_vector(signed(A) + signed(B));
        else 
            S <= std_logic_vector(signed(A) - signed(B));
        end if;
    end process p1;
end architecture;
