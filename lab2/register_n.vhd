entity register_n is 
  generic ( n: natural := 4 );
  port (
    data: in bit_vector(n-1 downto 0);
    clock: in bit;
    queue: out bit_vector(n-1 downto 0)
  );
end entity register_n;

architecture behavioral_concurrent of register_n is
begin
  queue <= data when clock'event and clock = '1';
end behavioral_concurrent ; -- behavioral_concurrent

architecture behavioral_process of register_n is
begin
  p1: process(clock)
  begin 
    if clock = '1' then
      queue <= data;
    end if;
  end process p1;
end architecture  behavioral_process ;
