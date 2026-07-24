library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Testbench for the 4-bit memory reg4
entity reg4_tb is
end entity reg4_tb;

architecture sim of reg4_tb is

    signal clk_tb : std_logic := '0';
    signal rst_tb : std_logic := '1';
    signal d_tb   : std_logic_vector(3 downto 0) := "0000";
    signal q_tb   : std_logic_vector(3 downto 0);

begin
    -- Connect the register to the testbench signals
    uut: entity work.reg4
        port map (
            clk => clk_tb,
            rst => rst_tb,
            d   => d_tb,
            q   => q_tb
        );

    -- Generate a 10ns clock period (5ns low, 5ns high)
    clk_process: process
    begin
        clk_tb <= '0';
        wait for 5 ns;
        clk_tb <= '1';
        wait for 5 ns;
    end process;

    stim_process: process
    begin
        -- Step 1: rst is high, all outputs are forced to '0'
        -- regardless of d or clk
        wait for 12 ns;
        rst_tb <= '0';

        -- Step 2: load "1010", Q should capture this value on the next
        -- rising clock edge
        d_tb <= "1010";
        wait for 10 ns;

        -- Step 3: load "0110", Q should capture this value on the next
        -- rising clock edge
        d_tb <= "0110";
        wait for 10 ns;

        -- Step 4: load "1111", Q should capture this value on the next
        -- rising clock edge
        d_tb <= "1111";
        wait for 10 ns;

        wait;
    end process;

end architecture sim;