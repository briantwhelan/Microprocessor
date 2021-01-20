----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 04.11.2020 17:37:47
-- Module Name: ripple_adder_32bit - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity ripple_adder_32bit is
 Port(
      A, B : in std_logic_vector(31 downto 0);
      carry_in : in std_logic;
      final_sum : out std_logic_vector(31 downto 0);
      carry_out, overflow : out std_logic
      );
end ripple_adder_32bit;

architecture Behavioral of ripple_adder_32bit is
    --components
    component full_adder
     Port(
          in0, in1 : in std_logic;
          c_in : in std_logic;
          sum, c_out : out std_logic
          );
    end component;
    
    --signals
    signal carry : std_logic_vector(31 downto 0);
    signal total_sum : std_logic_vector(31 downto 0);
begin
    --port maps
    fa0 : full_adder PORT MAP
    (
        in0 => A(0),
        in1 => B(0),
        c_in => carry_in,
        sum => total_sum(0),
        c_out => carry(0)
    );
    fa1 : full_adder PORT MAP
    (
        in0 => A(1),
        in1 => B(1),
        c_in => carry(0),
        sum => total_sum(1),
        c_out => carry(1)
    ); 
    fa2 : full_adder PORT MAP
    (
        in0 => A(2),
        in1 => B(2),
        c_in => carry(1),
        sum => total_sum(2),
        c_out => carry(2)
    );
    fa3 : full_adder PORT MAP
    (
        in0 => A(3),
        in1 => B(3),
        c_in => carry(2),
        sum => total_sum(3),
        c_out => carry(3)
    );
    fa4 : full_adder PORT MAP
    (
        in0 => A(4),
        in1 => B(4),
        c_in => carry(3),
        sum => total_sum(4),
        c_out => carry(4)
    );
    fa5 : full_adder PORT MAP
    (
        in0 => A(5),
        in1 => B(5),
        c_in => carry(4),
        sum => total_sum(5),
        c_out => carry(5)
    );
    fa6 : full_adder PORT MAP
    (
        in0 => A(6),
        in1 => B(6),
        c_in => carry(5),
        sum => total_sum(6),
        c_out => carry(6)
    );
    fa7 : full_adder PORT MAP
    (
        in0 => A(7),
        in1 => B(7),
        c_in => carry(6),
        sum => total_sum(7),
        c_out => carry(7)
    );
    fa8 : full_adder PORT MAP
    (
        in0 => A(8),
        in1 => B(8),
        c_in => carry(7),
        sum => total_sum(8),
        c_out => carry(8)
    );
    fa9 : full_adder PORT MAP
    (
        in0 => A(9),
        in1 => B(9),
        c_in => carry(8),
        sum => total_sum(9),
        c_out => carry(9)
    );
    fa10 : full_adder PORT MAP
    (
        in0 => A(10),
        in1 => B(10),
        c_in => carry(9),
        sum => total_sum(10),
        c_out => carry(10)
    );
    fa11 : full_adder PORT MAP
    (
        in0 => A(11),
        in1 => B(11),
        c_in => carry(10),
        sum => total_sum(11),
        c_out => carry(11)
    );
    fa12 : full_adder PORT MAP
    (
        in0 => A(12),
        in1 => B(12),
        c_in => carry(11),
        sum => total_sum(12),
        c_out => carry(12)
    );
    fa13 : full_adder PORT MAP
    (
        in0 => A(13),
        in1 => B(13),
        c_in => carry(12),
        sum => total_sum(13),
        c_out => carry(13)
    );
    fa14 : full_adder PORT MAP
    (
        in0 => A(14),
        in1 => B(14),
        c_in => carry(13),
        sum => total_sum(14),
        c_out => carry(14)
    );
    fa15 : full_adder PORT MAP
    (
        in0 => A(15),
        in1 => B(15),
        c_in => carry(14),
        sum => total_sum(15),
        c_out => carry(15)
    );
    fa16 : full_adder PORT MAP
    (
        in0 => A(16),
        in1 => B(16),
        c_in => carry(15),
        sum => total_sum(16),
        c_out => carry(16)
    );
    fa17 : full_adder PORT MAP
    (
        in0 => A(17),
        in1 => B(17),
        c_in => carry(16),
        sum => total_sum(17),
        c_out => carry(17)
    );
    fa18 : full_adder PORT MAP
    (
        in0 => A(18),
        in1 => B(18),
        c_in => carry(17),
        sum => total_sum(18),
        c_out => carry(18)
    );
    fa19 : full_adder PORT MAP
    (
        in0 => A(19),
        in1 => B(19),
        c_in => carry(18),
        sum => total_sum(19),
        c_out => carry(19)
    );
    fa20 : full_adder PORT MAP
    (
        in0 => A(20),
        in1 => B(20),
        c_in => carry(19),
        sum => total_sum(20),
        c_out => carry(20)
    );
    fa21 : full_adder PORT MAP
    (
        in0 => A(21),
        in1 => B(21),
        c_in => carry(20),
        sum => total_sum(21),
        c_out => carry(21)
    );
    fa22 : full_adder PORT MAP
    (
        in0 => A(22),
        in1 => B(22),
        c_in => carry(21),
        sum => total_sum(22),
        c_out => carry(22)
    );
    fa23 : full_adder PORT MAP
    (
        in0 => A(23),
        in1 => B(23),
        c_in => carry(22),
        sum => total_sum(23),
        c_out => carry(23)
    );
    fa24 : full_adder PORT MAP
    (
        in0 => A(24),
        in1 => B(24),
        c_in => carry(23),
        sum => total_sum(24),
        c_out => carry(24)
    );
    fa25 : full_adder PORT MAP
    (
        in0 => A(25),
        in1 => B(25),
        c_in => carry(24),
        sum => total_sum(25),
        c_out => carry(25)
    );
    fa26 : full_adder PORT MAP
    (
        in0 => A(26),
        in1 => B(26),
        c_in => carry(25),
        sum => total_sum(26),
        c_out => carry(26)
    );
    fa27 : full_adder PORT MAP
    (
        in0 => A(27),
        in1 => B(27),
        c_in => carry(26),
        sum => total_sum(27),
        c_out => carry(27)
    );
    fa28 : full_adder PORT MAP
    (
        in0 => A(28),
        in1 => B(28),
        c_in => carry(27),
        sum => total_sum(28),
        c_out => carry(28)
    );
    fa29 : full_adder PORT MAP
    (
        in0 => A(29),
        in1 => B(29),
        c_in => carry(28),
        sum => total_sum(29),
        c_out => carry(29)
    );
    fa30 : full_adder PORT MAP
    (
        in0 => A(30),
        in1 => B(30),
        c_in => carry(29),
        sum => total_sum(30),
        c_out => carry(30)
    );
    fa31 : full_adder PORT MAP
    (
        in0 => A(31),
        in1 => B(31),
        c_in => carry(30),
        sum => total_sum(31),
        c_out => carry(31)
    );
    
    final_sum <= total_sum;
    carry_out <= carry(31);
    overflow <= carry(31) XOR carry(30);
end Behavioral;
