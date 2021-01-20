----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 17.12.2020 21:05:07
-- Module Name: processor_32bit - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity processor_32bit is
 Port(
      reset : in std_logic;
      Clk : in std_logic
     );
end processor_32bit;

architecture Behavioral of processor_32bit is
    --components
    component datapath_32bit
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
    
    component control_unit_32bit
     Port( 
          reset : in std_logic;
          instruction : in std_logic_vector(31 downto 0);
          V, C, N, Z : in std_logic;
          Clk : in std_logic;
          DR, SA, SB : out std_logic_vector(4 downto 0);
          TD, TA, TB : out std_logic;
          MB, MD, RW, MM, MW : out std_logic;
          FS : out std_logic_vector(4 downto 0);
          pc : inout std_logic_vector(31 downto 0)
         );
    end component;
    
    component memory_32bit
     Port( 
          address : in std_logic_vector(31 downto 0); 
          data_in : in std_logic_vector(31 downto 0);
          MW : in std_logic;
          Clk : in std_logic;
          data_out : out std_logic_vector(31 downto 0) 
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
    signal memory_output : std_logic_vector(31 downto 0);
    signal control_word : std_logic_vector(22 downto 0);
    signal V_signal, C_signal, N_signal, Z_signal : std_logic;
    signal DR_signal, SA_signal, SB_signal : std_logic_vector(4 downto 0); 
    signal TD_signal, TA_signal, TB_signal : std_logic;
    signal MB_signal, MD_signal, RW_signal, MM_signal, MW_signal : std_logic;
    signal FS_signal : std_logic_vector(4 downto 0);
    signal pc_signal : std_logic_vector(31 downto 0);
    signal bus_A, bus_B : std_logic_vector(31 downto 0);
    signal memory_address : std_logic_vector(31 downto 0);
    
begin    
    control_word <= DR_signal & SA_signal & SB_signal & MB_signal & FS_signal & MD_signal & RW_signal;
    
    --port maps
    datapath : datapath_32bit PORT MAP
    (
        data_in => memory_output,
        constant_in => SB_signal,
        control_word => control_word,
        TD => TD_signal,
        TA => TA_signal,
        TB => TB_signal,
        Clk => Clk,
        V => V_signal,
        C => C_signal,
        N => N_signal,
        Z => Z_signal,
        address_out => bus_A,
        data_out => bus_B
    );
    
   control_unit : control_unit_32bit PORT MAP
   (
        reset => reset,
        instruction => memory_output,
        V => V_signal,
        C => C_signal,
        N => N_signal,
        Z => Z_signal,
        Clk => Clk,
        DR => DR_signal,
        SA => SA_signal,
        SB => SB_signal,
        TD => TD_signal,
        TA => TA_signal,
        TB => TB_signal,
        MB => MB_signal,
        MD => MD_signal,
        RW => RW_signal,
        MM => MM_signal,
        MW => MW_signal,
        FS => FS_signal,
        pc => pc_signal
    );
    
   memory : memory_32bit PORT MAP
   (
        address => memory_address,
        data_in => bus_B,
        MW => MW_signal,
        Clk => Clk,
        data_out => memory_output
    );
    
   muxM : mux2_32bit PORT MAP
   (
        in0 => bus_A,
        in1 => pc_signal,
        s => MM_signal,
        output => memory_address
    );
end Behavioral;