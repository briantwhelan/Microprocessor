----------------------------------------------------------------------------------
-- Company: TCD
-- Engineer: Brian Whelan
-- 
-- Create Date: 23.10.2020 15:57:50
-- Module Name: decoder_5to32 - Behavioral
-- Project Name: processor_project
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity decoder_5to32 is
 Port(
      A : in std_logic_vector(4 downto 0);
      Q : out std_logic_vector(31 downto 0)
      );
end decoder_5to32;

architecture Behavioral of decoder_5to32 is
begin
    Q(0) <=  ((not A(4)) and (not A(3)) and (not A(2)) and (not A(1)) and (not A(0))) after 5ns;
    Q(1) <=  ((not A(4)) and (not A(3)) and (not A(2)) and (not A(1)) and      A(0))  after 5ns;
    Q(2) <=  ((not A(4)) and (not A(3)) and (not A(2)) and      A(1)  and (not A(0))) after 5ns;
    Q(3) <=  ((not A(4)) and (not A(3)) and (not A(2)) and      A(1)  and      A(0))  after 5ns;
    Q(4) <=  ((not A(4)) and (not A(3)) and      A(2)  and (not A(1)) and (not A(0))) after 5ns;
    Q(5) <=  ((not A(4)) and (not A(3)) and      A(2)  and (not A(1)) and      A(0))  after 5ns;
    Q(6) <=  ((not A(4)) and (not A(3)) and      A(2)  and      A(1)  and (not A(0))) after 5ns;
    Q(7) <=  ((not A(4)) and (not A(3)) and      A(2)  and      A(1)  and      A(0))  after 5ns;
    Q(8) <=  ((not A(4)) and      A(3)  and (not A(2)) and (not A(1)) and (not A(0))) after 5ns;
    Q(9) <=  ((not A(4)) and      A(3)  and (not A(2)) and (not A(1)) and      A(0))  after 5ns;
    Q(10) <= ((not A(4)) and      A(3)  and (not A(2)) and      A(1)  and (not A(0))) after 5ns;
    Q(11) <= ((not A(4)) and      A(3)  and (not A(2)) and      A(1)  and      A(0))  after 5ns;
    Q(12) <= ((not A(4)) and      A(3)  and      A(2)  and (not A(1)) and (not A(0))) after 5ns;
    Q(13) <= ((not A(4)) and      A(3)  and      A(2)  and (not A(1)) and      A(0))  after 5ns;
    Q(14) <= ((not A(4)) and      A(3)  and      A(2)  and      A(1)  and (not A(0))) after 5ns;
    Q(15) <= ((not A(4)) and      A(3)  and      A(2)  and      A(1)  and      A(0))  after 5ns;
    Q(16) <=      (A(4)  and (not A(3)) and (not A(2)) and (not A(1)) and (not A(0))) after 5ns;
    Q(17) <=      (A(4)  and (not A(3)) and (not A(2)) and (not A(1)) and      A(0))  after 5ns;
    Q(18) <=      (A(4)  and (not A(3)) and (not A(2)) and      A(1)  and (not A(0))) after 5ns;
    Q(19) <=      (A(4)  and (not A(3)) and (not A(2)) and      A(1)  and      A(0))  after 5ns;
    Q(20) <=      (A(4)  and (not A(3)) and      A(2)  and (not A(1)) and (not A(0))) after 5ns;
    Q(21) <=      (A(4)  and (not A(3)) and      A(2)  and (not A(1)) and      A(0))  after 5ns;
    Q(22) <=      (A(4)  and (not A(3)) and      A(2)  and      A(1)  and (not A(0))) after 5ns;
    Q(23) <=      (A(4)  and (not A(3)) and      A(2)  and      A(1)  and      A(0))  after 5ns;
    Q(24) <=      (A(4)  and      A(3)  and (not A(2)) and (not A(1)) and (not A(0))) after 5ns;
    Q(25) <=      (A(4)  and      A(3)  and (not A(2)) and (not A(1)) and      A(0))  after 5ns;
    Q(26) <=      (A(4)  and      A(3)  and (not A(2)) and      A(1)  and (not A(0))) after 5ns;
    Q(27) <=      (A(4)  and      A(3)  and (not A(2)) and      A(1)  and      A(0))  after 5ns;
    Q(28) <=      (A(4)  and      A(3)  and      A(2)  and (not A(1)) and (not A(0))) after 5ns;
    Q(29) <=      (A(4)  and      A(3)  and      A(2)  and (not A(1)) and      A(0))  after 5ns;
    Q(30) <=      (A(4)  and      A(3)  and      A(2)  and      A(1)  and (not A(0))) after 5ns;
    Q(31) <=      (A(4)  and      A(3)  and      A(2)  and      A(1)  and      A(0))  after 5ns;
end Behavioral;