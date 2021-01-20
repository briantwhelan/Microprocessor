----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 02.01.2021 23:49:58
-- Module Name: program_counter_32bit_CLA - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity program_counter_32bit_CLA is
 Port(
      extend : in std_logic_vector(31 downto 0);
      reset : in std_logic;
      PL, PI : in std_logic;
      Clk : in std_logic;
      pc : inout std_logic_vector(31 downto 0)
      );
end program_counter_32bit_CLA;

architecture Behavioral of program_counter_32bit_CLA is
    --components
    component carry_lookahead_adder_32bit
     Port(
          A, B : in std_logic_vector (31 downto 0);
          carry_in : in std_logic;
          final_sum : out std_logic_vector (31 downto 0);
          carry_out, overflow : out std_logic
          );
    end component;
    
    --signals
    signal pc_extend : std_logic_vector(31 downto 0);
    signal C : std_logic;
    signal V : std_logic;
begin
    --port maps
    carryLookaheadAdder : carry_lookahead_adder_32bit PORT MAP
    (
        A => pc,
        B => extend,
        carry_in => extend(31),
        final_sum => pc_extend,
        carry_out => C,
        overflow => V
    );
    
    process(Clk)
    begin
        if(rising_edge(Clk)) then
            if(reset = '1') then
                pc <= x"00000040" after 5ns;
            elsif(PL = '1') then 
                pc <= pc_extend after 5ns;
            elsif(PI = '1') then
                pc <= pc + 1 after 5ns;
            end if;
        end if;
    end process;    
end Behavioral;