library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- 4-bit register: four d_ff instances sharing the same clock and reset.
-- On every rising edge of clk, q captures the current value of d as a
-- single atomic 4-bit word.
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
    gen_bits: for i in 0 to 3 generate
        bit_ff: d_ff
            port map (
                clk => clk,
                rst => rst,
                d   => d(i),
                q   => q(i)
            );
    end generate gen_bits;

end architecture structural;
