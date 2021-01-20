----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 17.12.2020 22:53:32
-- Module Name: control_unit_32bit - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity control_unit_32bit is
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
end control_unit_32bit;

architecture Behavioral of control_unit_32bit is
    --components
    component extend_32bit
     Port( 
          input : in std_logic_vector(9 downto 0);
          output : out std_logic_vector(31 downto 0)
          );
    end component;
    
    component program_counter_32bit
     Port( 
          extend : in std_logic_vector(31 downto 0);
          reset : in std_logic;
          PL, PI : in std_logic;
          Clk : in std_logic;
          pc : inout std_logic_vector(31 downto 0)
          );
    end component;
    
    component instruction_register_32bit
     Port( 
          instruction : in std_logic_vector(31 downto 0);
          IL : in std_logic;
          Clk : in std_logic;
          opcode : out std_logic_vector(16 downto 0);
          DR, SA, SB : out std_logic_vector(4 downto 0)
          );
    end component;
    
    component mux8_1bit
     Port(
          in0, in1, in2, in3, in4, in5, in6, in7 : in std_logic;
          s : in std_logic_vector(2 downto 0);
          output : out std_logic
          );
    end component;
    
    component mux2_17bit
     Port(
          in0, in1 : in std_logic_vector(16 downto 0);
          s : in std_logic;
          output : out std_logic_vector(16 downto 0) 
          );
    end component;
    
    component control_address_register
     Port( 
          reset : in std_logic;
          input : in std_logic_vector(16 downto 0);
          load : in std_logic;
          Clk : in std_logic;
          address : inout std_logic_vector(16 downto 0) 
          );
    end component;
    
    component control_memory_32bit 
     Port(
          in_CAR : in std_logic_vector(16 downto 0); 
          FL : out std_logic;                           -- 0
          RZ : out std_logic;                           -- 1
          RN : out std_logic;                           -- 2
          RC : out std_logic;                           -- 3
          RV : out std_logic;                           -- 4
          MW : out std_logic;                           -- 5
          MM : out std_logic;                           -- 6
          RW : out std_logic;                           -- 7
          MD : out std_logic;                           -- 8
          FS : out std_logic_vector(4 downto 0);        -- 9 to 13
          MB : out std_logic;                           -- 14
          TB : out std_logic;                           -- 15
          TA : out std_logic;                           -- 16
          TD : out std_logic;                           -- 17
          PL : out std_logic;                           -- 18
          PI : out std_logic;                           -- 19
          IL : out std_logic;                           -- 20
          MC : out std_logic;                           -- 21
          MS : out std_logic_vector(2 downto 0);        -- 22 to 24
          NA : out std_logic_vector(16 downto 0)        -- 25 to 41        
         );
    end component;
    
    component flag_register
     Port( 
          Z, N, C, V : in std_logic;
          FL, RZ, RN, RC, RV : in std_logic;
          Clk : in std_logic;
          flags : inout std_logic_vector(3 downto 0)
          );
    end component;
    
    --signals
    signal DR_signal, SB_signal : std_logic_vector(4 downto 0);
    signal extend_input : std_logic_vector(9 downto 0);
    signal extend_output : std_logic_vector(31 downto 0);
    signal opcode : std_logic_vector(16 downto 0);
    signal CAR_input : std_logic_vector(16 downto 0);
    signal CAR_load : std_logic;
    signal CAR_output : std_logic_vector(16 downto 0);
    signal FL, RZ, RN, RC, RV, PL, PI, IL, MC : std_logic;                                                  
    signal MS : std_logic_vector(2 downto 0);        
    signal NA : std_logic_vector(16 downto 0);          
    signal VCNZ : std_logic_vector(3 downto 0);
    signal notC, notZ : std_logic;
    
begin
    extend_input <= DR_signal & SB_signal;
    notC <= not VCNZ(2);
    notZ <= not VCNZ(0);
    
    --port maps
    extend : extend_32bit PORT MAP
    (
        input => extend_input,
        output => extend_output
    );
    
    program_counter : program_counter_32bit PORT MAP
    (
        extend => extend_output,
        reset => reset,
        PL => PL,
        PI => PI,
        Clk => Clk,
        pc => pc
     );
     
    IR : instruction_register_32bit PORT MAP
    (
        instruction => instruction,
        IL => IL,
        Clk => Clk,
        opcode => opcode,
        DR => DR_signal,
        SA => SA,
        SB => SB_signal
     );
     
    muxS : mux8_1bit PORT MAP
    (
        in0 => '0',
        in1 => '1',
        in2 => VCNZ(2),
        in3 => VCNZ(3),
        in4 => VCNZ(0),
        in5 => VCNZ(1),
        in6 => notC,
        in7 => notZ,
        s => MS,
        output => CAR_load
     );
     
    muxC : mux2_17bit PORT MAP
    (
        in0 => NA,
        in1 => opcode,
        s => MC,
        output => CAR_input
     );
    
    CAR : control_address_register PORT MAP
    (
        reset => reset,
        input => CAR_input,
        load => CAR_load,
        Clk => Clk,
        address => CAR_output
     );
     
    control_memory : control_memory_32bit PORT MAP
    (
        in_CAR => CAR_output,
        FL => Fl,
        RZ => RZ,
        RN => RN,
        RC => RC,
        RV => RV,
        MW => MW,
        MM => MM,
        RW => RW,
        MD => MD,
        FS => FS,
        MB => MB,
        TB => TB,
        TA => TA,
        TD => TD,
        PL => PL,
        PI => PI,
        IL => IL,
        MC => MC,
        MS => MS,
        NA => NA
    );
    
   conditional_flags : flag_register PORT MAP
   (
        Z => Z,     
        N => N,
        C => C,    
        V => V,       
        FL => FL, 
        RZ => RZ,  
        RN => RN,      
        RC => RC,
        RV => RV,                                                                                                                                                                                                                     
        Clk => Clk,
        flags => VCNZ
    );
    
    DR <= DR_signal;
    SB <= SB_signal;
end Behavioral;
