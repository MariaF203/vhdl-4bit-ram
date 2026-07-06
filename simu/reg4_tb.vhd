library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Testbench for reg4: generates a 10 ns clock, holds reset high for
-- 12 ns, then drives d through a few values to verify that q captures
-- the correct 4-bit word on every rising clock edge.
entity reg4_tb is
end entity reg4_tb;

architecture sim of reg4_tb is

    signal clk_tb : std_logic := '0';
    signal rst_tb : std_logic := '1';
    signal d_tb   : std_logic_vector(3 downto 0) := "0000";
    signal q_tb   : std_logic_vector(3 downto 0);

begin
    uut: entity work.reg4
        port map (
            clk => clk_tb,
            rst => rst_tb,
            d   => d_tb,
            q   => q_tb
        );

    clk_process: process
    begin
        clk_tb <= '0';
        wait for 5 ns;
        clk_tb <= '1';
        wait for 5 ns;
    end process;

    stim_process: process
    begin
        wait for 12 ns;
        rst_tb <= '0';

        d_tb <= "1010";
        wait for 10 ns;

        d_tb <= "0110";
        wait for 10 ns;

        d_tb <= "1111";
        wait for 10 ns;

        wait;
    end process;

end architecture sim;