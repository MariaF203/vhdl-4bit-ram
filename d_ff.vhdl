library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Single-bit D flip-flop, edge-triggered on the rising edge of clk,
-- with an asynchronous active-high reset.
entity d_ff is
    port (
        clk   : in  std_logic;
        rst   : in  std_logic;
        d     : in  std_logic;
        q     : out std_logic
    );
end entity d_ff;

architecture rtl of d_ff is
begin
    process(clk, rst)
    begin
        if rst = '1' then
            q <= '0';
        elsif rising_edge(clk) then
            q <= d;
        end if;
    end process;
end architecture rtl;
