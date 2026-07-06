library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 4-bit register: four d_ff instances sharing the same clock and reset,
-- one per bit.
entity reg4 is
    port (
        clk   : in  std_logic;
        rst   : in  std_logic;
        d     : in  std_logic_vector(3 downto 0);
        q     : out std_logic_vector(3 downto 0)
    );
end entity reg4;

architecture structural of reg4 is

    component d_ff is
        port (
            clk : in  std_logic;
            rst : in  std_logic;
            d   : in  std_logic;
            q   : out std_logic
        );
    end component;

begin
    bit0: d_ff
        port map (
            clk => clk,
            rst => rst,
            d   => d(0),
            q   => q(0)
        );

    bit1: d_ff
        port map (
            clk => clk,
            rst => rst,
            d   => d(1),
            q   => q(1)
        );

    bit2: d_ff
        port map (
            clk => clk,
            rst => rst,
            d   => d(2),
            q   => q(2)
        );

    bit3: d_ff
        port map (
            clk => clk,
            rst => rst,
            d   => d(3),
            q   => q(3)
        );

end architecture structural;