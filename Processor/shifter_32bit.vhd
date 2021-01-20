----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 14.11.2020 16:27:18
-- Module Name: shifter_32bit - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity shifter_32bit is
 Port(
      B : in std_logic_vector(31 downto 0);
      s : in std_logic_vector(1 downto 0);
      IL, IR : in std_logic;
      H : out std_logic_vector(31 downto 0) 
     );
end shifter_32bit;

architecture Behavioral of shifter_32bit is
    --components
    component mux4_1bit 
     Port(
          in0, in1, in2, in3 : in std_logic;
          s : in std_logic_vector(1 downto 0);
          output : out std_logic
          );
    end component;
    
    --signals
    signal H_output : std_logic_vector(31 downto 0);
    
begin
    --port maps
    mux0 : mux4_1bit PORT MAP
    (
        in0 => B(0),
        in1 => B(1),
        in2 => IL,
        in3 => '0',
        s => s,
        output => H_output(0)
    ); 
    mux1 : mux4_1bit PORT MAP
    (
        in0 => B(1),
        in1 => B(2),
        in2 => B(0),
        in3 => '0',
        s => s,
        output => H_output(1)
    );
    mux2 : mux4_1bit PORT MAP
    (
        in0 => B(2),
        in1 => B(3),
        in2 => B(1),
        in3 => '0',
        s => s,
        output => H_output(2)
    );
    mux3 : mux4_1bit PORT MAP
    (
        in0 => B(3),
        in1 => B(4),
        in2 => B(2),
        in3 => '0',
        s => s,
        output => H_output(3)
    );
    mux4 : mux4_1bit PORT MAP
    (
        in0 => B(4),
        in1 => B(5),
        in2 => B(3),
        in3 => '0',
        s => s,
        output => H_output(4)
    );
    mux5 : mux4_1bit PORT MAP
    (
        in0 => B(5),
        in1 => B(6),
        in2 => B(4),
        in3 => '0',
        s => s,
        output => H_output(5)
    );
    mux6 : mux4_1bit PORT MAP
    (
        in0 => B(6),
        in1 => B(7),
        in2 => B(5),
        in3 => '0',
        s => s,
        output => H_output(6)
    );
    mux7 : mux4_1bit PORT MAP
    (
        in0 => B(7),
        in1 => B(8),
        in2 => B(6),
        in3 => '0',
        s => s,
        output => H_output(7)
    );
    mux8 : mux4_1bit PORT MAP
    (
        in0 => B(8),
        in1 => B(9),
        in2 => B(7),
        in3 => '0',
        s => s,
        output => H_output(8)
    );
    mux9 : mux4_1bit PORT MAP
    (
        in0 => B(9),
        in1 => B(10),
        in2 => B(8),
        in3 => '0',
        s => s,
        output => H_output(9)
    );
    mux10 : mux4_1bit PORT MAP
    (
        in0 => B(10),
        in1 => B(11),
        in2 => B(9),
        in3 => '0',
        s => s,
        output => H_output(10)
    );
    mux11 : mux4_1bit PORT MAP
    (
        in0 => B(11),
        in1 => B(12),
        in2 => B(10),
        in3 => '0',
        s => s,
        output => H_output(11)
    );
    mux12 : mux4_1bit PORT MAP
    (
        in0 => B(12),
        in1 => B(13),
        in2 => B(11),
        in3 => '0',
        s => s,
        output => H_output(12)
    );
    mux13 : mux4_1bit PORT MAP
    (
        in0 => B(13),
        in1 => B(14),
        in2 => B(12),
        in3 => '0',
        s => s,
        output => H_output(13)
    );
    mux14 : mux4_1bit PORT MAP
    (
        in0 => B(14),
        in1 => B(15),
        in2 => B(13),
        in3 => '0',
        s => s,
        output => H_output(14)
    );
    mux15 : mux4_1bit PORT MAP
    (
        in0 => B(15),
        in1 => B(16),
        in2 => B(14),
        in3 => '0',
        s => s,
        output => H_output(15)
    );
    mux16 : mux4_1bit PORT MAP
    (
        in0 => B(16),
        in1 => B(17),
        in2 => B(15),
        in3 => '0',
        s => s,
        output => H_output(16)
    );
    mux17 : mux4_1bit PORT MAP
    (
        in0 => B(17),
        in1 => B(18),
        in2 => B(16),
        in3 => '0',
        s => s,
        output => H_output(17)
    );
    mux18 : mux4_1bit PORT MAP
    (
        in0 => B(18),
        in1 => B(19),
        in2 => B(17),
        in3 => '0',
        s => s,
        output => H_output(18)
    );
    mux19 : mux4_1bit PORT MAP
    (
        in0 => B(19),
        in1 => B(20),
        in2 => B(18),
        in3 => '0',
        s => s,
        output => H_output(19)
    );
    mux20 : mux4_1bit PORT MAP
    (
        in0 => B(20),
        in1 => B(21),
        in2 => B(19),
        in3 => '0',
        s => s,
        output => H_output(20)
    );
    mux21 : mux4_1bit PORT MAP
    (
        in0 => B(21),
        in1 => B(22),
        in2 => B(20),
        in3 => '0',
        s => s,
        output => H_output(21)
    );
    mux22 : mux4_1bit PORT MAP
    (
        in0 => B(22),
        in1 => B(23),
        in2 => B(21),
        in3 => '0',
        s => s,
        output => H_output(22)
    );
    mux23 : mux4_1bit PORT MAP
    (
        in0 => B(23),
        in1 => B(24),
        in2 => B(22),
        in3 => '0',
        s => s,
        output => H_output(23)
    );
    mux24 : mux4_1bit PORT MAP
    (
        in0 => B(24),
        in1 => B(25),
        in2 => B(23),
        in3 => '0',
        s => s,
        output => H_output(24)
    );
    mux25 : mux4_1bit PORT MAP
    (
        in0 => B(25),
        in1 => B(26),
        in2 => B(24),
        in3 => '0',
        s => s,
        output => H_output(25)
    );
    mux26 : mux4_1bit PORT MAP
    (
        in0 => B(26),
        in1 => B(27),
        in2 => B(25),
        in3 => '0',
        s => s,
        output => H_output(26)
    );
    mux27 : mux4_1bit PORT MAP
    (
        in0 => B(27),
        in1 => B(28),
        in2 => B(26),
        in3 => '0',
        s => s,
        output => H_output(27)
    );
    mux28 : mux4_1bit PORT MAP
    (
        in0 => B(28),
        in1 => B(29),
        in2 => B(27),
        in3 => '0',
        s => s,
        output => H_output(28)
    );
    mux29 : mux4_1bit PORT MAP
    (
        in0 => B(29),
        in1 => B(30),
        in2 => B(28),
        in3 => '0',
        s => s,
        output => H_output(29)
    );
    mux30 : mux4_1bit PORT MAP
    (
        in0 => B(30),
        in1 => B(31),
        in2 => B(29),
        in3 => '0',
        s => s,
        output => H_output(30)
    );
    mux31 : mux4_1bit PORT MAP
    (
        in0 => B(31),
        in1 => IR,
        in2 => B(30),
        in3 => '0',
        s => s,
        output => H_output(31)
    );

    H <= H_output;
end Behavioral;