----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 23.10.2020 15:57:50
-- Module Name: register_file_32bit - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity register_file_32bit is
 Port(
      data : in std_logic_vector(31 downto 0);
      write : in std_logic;
      address_A, address_B, address_des : in std_logic_vector(4 downto 0);
      TD, TA, TB : in std_logic;
      Clk : in std_logic;
      output_A, output_B : out std_logic_vector(31 downto 0)
     );
end register_file_32bit;

architecture Behavioral of register_file_32bit is
    --components
    component register_32bit
     Port(
          D : in std_logic_vector(31 downto 0);
          load, Clk : in std_logic;
          Q : out std_logic_vector(31 downto 0)
          );
    end component;
    
    component decoder_5to32
     Port(
          A : in std_logic_vector (4 downto 0);
          Q : out std_logic_vector (31 downto 0)
          );    
    end component;
    
    component mux32_32bit
     Port(
          in0, in1, in2 ,in3, in4, in5, in6, in7, in8, in9, in10, in11, in12, in13, in14, in15, in16, in17, in18, in19, in20, in21, in22, in23, in24, in25, in26, in27, in28, in29, in30, in31 : in std_logic_vector(31 downto 0);
          s : in std_logic_vector(4 downto 0);
          output : out std_logic_vector(31 downto 0)
          );
    end component;
    
    component mux2_32bit
     Port(
          in0, in1 : in std_logic_vector(31 downto 0);
          s : in std_logic;
          output : out std_logic_vector(31 downto 0)
         );
    end component;
    
    --signals
    signal load_reg : std_logic_vector(31 downto 0);
    signal load_reg0, load_reg1, load_reg2, load_reg3, load_reg4, load_reg5, load_reg6, load_reg7, load_reg8, load_reg9, load_reg10, load_reg11, load_reg12, load_reg13, load_reg14, load_reg15, load_reg16, load_reg17, load_reg18, load_reg19, load_reg20, load_reg21, load_reg22, load_reg23, load_reg24, load_reg25, load_reg26, load_reg27, load_reg28, load_reg29, load_reg30, load_reg31, load_reg32 : std_logic;
    signal reg0_q, reg1_q, reg2_q, reg3_q, reg4_q, reg5_q, reg6_q, reg7_q, reg8_q, reg9_q, reg10_q, reg11_q, reg12_q, reg13_q, reg14_q, reg15_q, reg16_q, reg17_q, reg18_q, reg19_q, reg20_q, reg21_q, reg22_q, reg23_q, reg24_q, reg25_q, reg26_q, reg27_q, reg28_q, reg29_q, reg30_q, reg31_q, reg32_q  : std_logic_vector(31 downto 0);
    signal A_mux_out, B_mux_out : std_logic_vector(31 downto 0);
    
begin
    load_reg0 <=  load_reg(0)  AND write AND not(TD);
    load_reg1 <=  load_reg(1)  AND write AND not(TD);
    load_reg2 <=  load_reg(2)  AND write AND not(TD);
    load_reg3 <=  load_reg(3)  AND write AND not(TD);
    load_reg4 <=  load_reg(4)  AND write AND not(TD);
    load_reg5 <=  load_reg(5)  AND write AND not(TD);
    load_reg6 <=  load_reg(6)  AND write AND not(TD);
    load_reg7 <=  load_reg(7)  AND write AND not(TD);
    load_reg8 <=  load_reg(8)  AND write AND not(TD);
    load_reg9 <=  load_reg(9)  AND write AND not(TD);
    load_reg10 <= load_reg(10) AND write AND not(TD);
    load_reg11 <= load_reg(11) AND write AND not(TD);
    load_reg12 <= load_reg(12) AND write AND not(TD);
    load_reg13 <= load_reg(13) AND write AND not(TD);
    load_reg14 <= load_reg(14) AND write AND not(TD);
    load_reg15 <= load_reg(15) AND write AND not(TD);
    load_reg16 <= load_reg(16) AND write AND not(TD);
    load_reg17 <= load_reg(17) AND write AND not(TD);
    load_reg18 <= load_reg(18) AND write AND not(TD);
    load_reg19 <= load_reg(19) AND write AND not(TD);
    load_reg20 <= load_reg(20) AND write AND not(TD);
    load_reg21 <= load_reg(21) AND write AND not(TD);
    load_reg22 <= load_reg(22) AND write AND not(TD);
    load_reg23 <= load_reg(23) AND write AND not(TD);
    load_reg24 <= load_reg(24) AND write AND not(TD);
    load_reg25 <= load_reg(25) AND write AND not(TD);
    load_reg26 <= load_reg(26) AND write AND not(TD);
    load_reg27 <= load_reg(27) AND write AND not(TD);
    load_reg28 <= load_reg(28) AND write AND not(TD);
    load_reg29 <= load_reg(29) AND write AND not(TD);
    load_reg30 <= load_reg(30) AND write AND not(TD);
    load_reg31 <= load_reg(31) AND write AND not(TD);
    load_reg32 <= write AND TD;
    
    --port maps
    regSelect : decoder_5to32 PORT MAP
    (
        A => address_des,
        Q => load_reg
    );
    
    A_mux32to32bit : mux32_32bit PORT MAP
    (
        in0 => reg0_q,
        in1 => reg1_q,
        in2 => reg2_q,
        in3 => reg3_q,
        in4 => reg4_q,
        in5 => reg5_q,
        in6 => reg6_q,
        in7 => reg7_q,
        in8 => reg8_q,
        in9 => reg9_q,
        in10 => reg10_q,
        in11 => reg11_q,
        in12 => reg12_q,
        in13 => reg13_q,
        in14 => reg14_q,
        in15 => reg15_q,
        in16 => reg16_q,
        in17 => reg17_q,
        in18 => reg18_q,
        in19 => reg19_q,
        in20 => reg20_q,
        in21 => reg21_q,
        in22 => reg22_q,
        in23 => reg23_q,
        in24 => reg24_q,
        in25 => reg25_q,
        in26 => reg26_q,
        in27 => reg27_q,
        in28 => reg28_q,
        in29 => reg29_q,
        in30 => reg30_q,
        in31 => reg31_q,
        s => address_A,
        output => A_mux_out
    );
    
    B_mux32to32bit : mux32_32bit PORT MAP
    (
        in0 => reg0_q,
        in1 => reg1_q,
        in2 => reg2_q,
        in3 => reg3_q,
        in4 => reg4_q,
        in5 => reg5_q,
        in6 => reg6_q,
        in7 => reg7_q,
        in8 => reg8_q,
        in9 => reg9_q,
        in10 => reg10_q,
        in11 => reg11_q,
        in12 => reg12_q,
        in13 => reg13_q,
        in14 => reg14_q,
        in15 => reg15_q,
        in16 => reg16_q,
        in17 => reg17_q,
        in18 => reg18_q,
        in19 => reg19_q,
        in20 => reg20_q,
        in21 => reg21_q,
        in22 => reg22_q,
        in23 => reg23_q,
        in24 => reg24_q,
        in25 => reg25_q,
        in26 => reg26_q,
        in27 => reg27_q,
        in28 => reg28_q,
        in29 => reg29_q,
        in30 => reg30_q,
        in31 => reg31_q,
        s => address_B,
        output => B_mux_out
    );
    
    A_mux2to32bit : mux2_32bit PORT MAP
    (
        in0 => A_mux_out,
        in1 => reg32_q,
        s => TA,
        output => output_A
    );
    
    B_mux2to32bit : mux2_32bit PORT MAP
    (
        in0 => B_mux_out,
        in1 => reg32_q,
        s => TB,
        output => output_B
    );

    register0 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg0,
        Clk => Clk,
        Q => reg0_q   
    );
    register1 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg1,
        Clk => Clk,
        Q => reg1_q   
    );
    register2 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg2,
        Clk => Clk,
        Q => reg2_q   
    );
    register3 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg3,
        Clk => Clk,
        Q => reg3_q   
    );
    register4 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg4,
        Clk => Clk,
        Q => reg4_q   
    );
    register5 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg5,
        Clk => Clk,
        Q => reg5_q   
    );
    register6 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg6,
        Clk => Clk,
        Q => reg6_q   
    );
    register7 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg7,
        Clk => Clk,
        Q => reg7_q   
    );
    register8 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg8,
        Clk => Clk,
        Q => reg8_q   
    );
    register9 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg9,
        Clk => Clk,
        Q => reg9_q   
    );
    register10 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg10,
        Clk => Clk,
        Q => reg10_q   
    );
    register11 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg11,
        Clk => Clk,
        Q => reg11_q   
    );
    register12 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg12,
        Clk => Clk,
        Q => reg12_q   
    );    
    register13 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg13,
        Clk => Clk,
        Q => reg13_q   
    );
    register14 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg14,
        Clk => Clk,
        Q => reg14_q   
    );
    register15 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg15,
        Clk => Clk,
        Q => reg15_q   
    );    
    register16 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg16,
        Clk => Clk,
        Q => reg16_q   
    );
    register17 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg17,
        Clk => Clk,
        Q => reg17_q   
    );
    register18 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg18,
        Clk => Clk,
        Q => reg18_q   
    );
    register19 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg19,
        Clk => Clk,
        Q => reg19_q   
    );
    register20 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg20,
        Clk => Clk,
        Q => reg20_q   
    );
    register21 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg21,
        Clk => Clk,
        Q => reg21_q   
    );
    register22 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg22,
        Clk => Clk,
        Q => reg22_q   
    );
    register23 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg23,
        Clk => Clk,
        Q => reg23_q   
    );
    register24 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg24,
        Clk => Clk,
        Q => reg24_q   
    );
    register25 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg25,
        Clk => Clk,
        Q => reg25_q   
    );
    register26 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg26,
        Clk => Clk,
        Q => reg26_q   
    );
    register27 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg27,
        Clk => Clk,
        Q => reg27_q   
    );
    register28 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg28,
        Clk => Clk,
        Q => reg28_q   
    );
    register29 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg29,
        Clk => Clk,
        Q => reg29_q   
    );
    register30 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg30,
        Clk => Clk,
        Q => reg30_q   
    );
    register31 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg31,
        Clk => Clk,
        Q => reg31_q   
    );
    register32 : register_32bit PORT MAP
    (
        D => data, 
        load => load_reg32,
        Clk => Clk,
        Q => reg32_q   
    );
end Behavioral;

