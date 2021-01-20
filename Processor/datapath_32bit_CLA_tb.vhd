----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 02.01.2021 23:49:58
-- Module Name: datapath_32bit_tb - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity datapath_32bit_CLA_tb is
end datapath_32bit_CLA_tb;

architecture Behavioral of datapath_32bit_CLA_tb is
    --Component Declaration for the Unit Under Test (UUT)
    component datapath_32bit_CLA 
     Port(
          data_in : in std_logic_vector(31 downto 0);
          constant_in : in std_logic_vector(4 downto 0);
          control_word : in std_logic_vector(22 downto 0);
          TD, TA, TB : in std_logic;
          Clk : in std_logic;
          V, C, N, Z : out std_logic;
          address_out, data_out : out std_logic_vector(31 downto 0)
        );
    end component;
        
    --Inputs
    signal data_in : std_logic_vector(31 downto 0);
    signal constant_in : std_logic_vector(4 downto 0);
    signal control_word : std_logic_vector(22 downto 0);
    signal TD : std_logic;
    signal TA : std_logic;
    signal TB : std_logic;
    signal Clk : std_logic := '1';
    
    --Outputs
    signal address_out : std_logic_vector(31 downto 0);
    signal data_out : std_logic_vector(31 downto 0);
    signal V : std_logic;
    signal C : std_logic;
    signal N : std_logic;
    signal Z : std_logic;

begin
   --Instantiate the Unit Under Test (UUT)
   uut : datapath_32bit_CLA PORT MAP
   (
          data_in => data_in,
          constant_in => constant_in,
          control_word => control_word,
          TD => TD,
          TA => TA,
          TB => TB,
          Clk => Clk,
          V => V,
          C => C,
          N => N,
          Z => Z,
          address_out => address_out,
          data_out => data_out
    );
    
   Clk <= not Clk after 100ns;
   stim_proc: process
   begin 
        TD <= '0';
        TA <= '0';
        TB <= '0';
        --load registers with values        
        --write the contents of data_in into reg0
        data_in <= x"0000FFFF";
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "00000"&"00000"&"00001"&"0"&"00000"&"1"&"1";
        wait for 200ns;
        --write the contents of data_in into reg1
        data_in <= x"FFFF0000";
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "00001"&"00000"&"00001"&"0"&"00000"&"1"&"1";
        wait for 200ns;
        --write the contents of data_in into reg2
        data_in <= x"0000AAAA";
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "00010"&"00000"&"00010"&"0"&"00000"&"1"&"1";
        wait for 200ns;
        --write the contents of data_in into reg3
        data_in <= x"AAAA0000";
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "00011"&"00000"&"00011"&"0"&"00000"&"1"&"1";
        wait for 200ns;
        --write the contents of data_in into reg4
        data_in <= x"0000BBBB";
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "00100"&"00000"&"00100"&"0"&"00000"&"1"&"1";
        wait for 200ns;
        --write the contents of data_in into reg5
        data_in <= x"BBBB0000";
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "00101"&"00000"&"00101"&"0"&"00000"&"1"&"1";
        wait for 200ns;
        --write the contents of data_in into reg6
        data_in <= x"0000CCCC";
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "00110"&"00000"&"00110"&"0"&"00000"&"1"&"1";
        wait for 200ns;
        --write the contents of data_in into reg7
        data_in <= x"CCCC0000";
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "00111"&"00000"&"00111"&"0"&"00000"&"1"&"1";
        wait for 200ns;
        --write the contents of data_in into reg8
        data_in <= x"0000DDDD";
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "01000"&"00000"&"01000"&"0"&"00000"&"1"&"1";
        wait for 200ns;
        --write the contents of data_in into reg9
        data_in <= x"DDDD0000";
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "01001"&"00000"&"01001"&"0"&"00000"&"1"&"1";
        wait for 200ns;
        --write the contents of data_in into reg10
        data_in <= x"0000EEEE";
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "01010"&"00000"&"01010"&"0"&"00000"&"1"&"1";
        wait for 200ns;
        --write the contents of data_in into reg11
        data_in <= x"EEEE0000";
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "01011"&"00000"&"01011"&"0"&"00000"&"1"&"1";
        wait for 200ns;
        --write the contents of data_in into reg12
        data_in <= x"11111111";
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "01100"&"00000"&"01100"&"0"&"00000"&"1"&"1";
        wait for 200ns;
        --write the contents of data_in into reg13
        data_in <= x"BBBBBBBB";
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "01101"&"00000"&"01101"&"0"&"00000"&"1"&"1";
        wait for 200ns;
        --write the contents of data_in into reg14
        data_in <= x"00FFFF00";
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "01110"&"00000"&"01110"&"0"&"00000"&"1"&"1";
        wait for 200ns;
        --write the contents of data_in into reg15
        data_in <= x"19334414";
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "01111"&"00000"&"01111"&"0"&"00000"&"1"&"1";
        wait for 200ns;
        
        --test loading register when write is 0
        data_in <= x"12345678";
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "10000"&"00000"&"10000"&"0"&"00000"&"1"&"0";
        wait for 200ns;        
        
        --perform all operations
        --transfer reg15 and store the result in reg16
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "10000"&"01111"&"00000"&"0"&"00000"&"0"&"1";
        wait for 200ns;
        --increment reg0 and store the result in reg17
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "10001"&"00000"&"00000"&"0"&"00001"&"0"&"1";
        wait for 200ns;
        --compute reg0 + reg1 and store the result in reg18
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "10010"&"00000"&"00001"&"0"&"00010"&"0"&"1";
        wait for 200ns;
        --compute reg2 + reg3 + 1 and store the result in reg19
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "10011"&"00010"&"00011"&"0"&"00011"&"0"&"1";
        wait for 200ns;
        --compute reg0 + (NOT)reg1 and store the result in reg20
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "10100"&"00000"&"00001"&"0"&"00100"&"0"&"1";
        wait for 200ns;
        --compute reg0 + (NOT)reg1 + 1 and store the result in reg21
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "10101"&"00000"&"00001"&"0"&"00101"&"0"&"1";
        wait for 200ns;
        --decrement reg0 and store the result in reg22
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "10110"&"00000"&"00000"&"0"&"00110"&"0"&"1";
        wait for 200ns;
        --transfer reg15 and store the result in reg23
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "10111"&"01111"&"00000"&"0"&"00111"&"0"&"1";
        wait for 200ns;
        --compute reg12 AND reg13 and store the result in reg24
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "11000"&"01100"&"01101"&"0"&"01000"&"0"&"1";
        wait for 200ns;
        --compute reg12 OR reg13 and store the result in reg25
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "11001"&"01100"&"01101"&"0"&"01010"&"0"&"1";
        wait for 200ns;
        --compute reg12 XOR reg13 and store the result in reg26
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "11010"&"01100"&"01101"&"0"&"01100"&"0"&"1";
        wait for 200ns;
        --(NOT)reg0 and store the result in reg27
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "11011"&"00000"&"00000"&"0"&"01110"&"0"&"1";
        wait for 200ns;
        --transfer reg15 and store the result in reg28
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "11100"&"00000"&"01111"&"0"&"10000"&"0"&"1";
        wait for 200ns;
        --shift reg14 right and store the result in reg29
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "11101"&"00000"&"01110"&"0"&"10100"&"0"&"1";
        wait for 200ns;
        --shift reg14 left and store the result in reg30
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "11110"&"00000"&"01110"&"0"&"11000"&"0"&"1";
        wait for 200ns;
        
        
        --compute reg14 + constant and store the result in reg31
        constant_in <= "01111";
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "11111"&"01110"&"00000"&"1"&"00010"&"0"&"1";
        wait for 200ns;
        
        --write the contents of data_in into reg32
        TD <= '1';
        TA <= '1';
        TB <= '1';
        data_in <= x"F0F0F0F0";
                     --|22   18|17   13|12    8|7  |6     2|1  |0
                     --|  DA   |  AA   |  BA   |MB |  FS   |MD |RW
        control_word <= "00000"&"00000"&"00000"&"0"&"00000"&"1"&"1";
        wait;
   end process;
end Behavioral;