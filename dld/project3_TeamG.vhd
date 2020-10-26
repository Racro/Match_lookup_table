--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   20:10:07 05/01/2019
-- Design Name:   
-- Module Name:   /home/anurag/FFL/tb_test1.vhd
-- Project Name:  FFL
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: top_module
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_test1 IS
END tb_test1;
 
ARCHITECTURE behavior OF tb_test1 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT top_module
    PORT(
         lkup_data1 : IN  std_logic_vector(127 downto 0);
         lkup_data_valid1 : IN  std_logic;
         lkup_data2 : IN  std_logic_vector(127 downto 0);
         lkup_data_valid2 : IN  std_logic;
         lkup_data3 : IN  std_logic_vector(127 downto 0);
         lkup_data_valid3 : IN  std_logic;
         lkup_data4 : IN  std_logic_vector(127 downto 0);
         lkup_data_valid4 : IN  std_logic;
         lkup_data5 : IN  std_logic_vector(127 downto 0);
         lkup_data_valid5 : IN  std_logic;
         lkup_data6 : IN  std_logic_vector(127 downto 0);
         lkup_data_valid6 : IN  std_logic;
			 lkup_data7 : IN  std_logic_vector(127 downto 0);
         lkup_data_valid7 : IN  std_logic;
         lkup_data8 : IN  std_logic_vector(127 downto 0);
         lkup_data_valid8 : IN  std_logic;
         lkup_data9 : IN  std_logic_vector(127 downto 0);
         lkup_data_valid9 : IN  std_logic;
         lkup_data10 : IN  std_logic_vector(127 downto 0);
         lkup_data_valid10 : IN  std_logic;
         lkup_data11 : IN  std_logic_vector(127 downto 0);
         lkup_data_valid11 : IN  std_logic;
         lkup_data12 : IN  std_logic_vector(127 downto 0);
         lkup_data_valid12 : IN  std_logic;
         lkup_data13 : IN  std_logic_vector(127 downto 0);
         lkup_data_valid13 : IN  std_logic;
         lkup_data14 : IN  std_logic_vector(127 downto 0);
         lkup_data_valid14 : IN  std_logic;
         lkup_data15 : IN  std_logic_vector(127 downto 0);
         lkup_data_valid15 : IN  std_logic;
         lkup_data16 : IN  std_logic_vector(127 downto 0);
         lkup_data_valid16 : IN  std_logic;
         flow_addr : IN  std_logic_vector(9 downto 0);
         flow_lkup_info : IN  std_logic_vector(127 downto 0);
         lkup_info_wr : IN  std_logic;
         flow_tag : IN  std_logic_vector(255 downto 0);
         flow_tag_wr : IN  std_logic;
         active_flow_addr : IN  std_logic_vector(9 downto 0);
         active_flow : IN  std_logic;
         active_flow_wr : IN  std_logic;
         lkup_miss : OUT  std_logic;
         flow_priority : OUT  std_logic_vector(2 downto 0);
         matched_tag_valid : OUT  std_logic_vector(7 downto 0);
         matched_flow_tag : OUT  std_logic_vector(255 downto 0);
         clk : IN  std_logic;
			grant_out : inout std_logic_vector(15 downto 0);
			request_out: out std_logic_vector(15 downto 0);
			debug : inout integer;
			matched_offset_out : out std_logic_vector(9 downto 0);
			info_out :  out std_logic_vector(127 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal lkup_data1 : std_logic_vector(127 downto 0) := (others => '0');
   signal lkup_data_valid1 : std_logic := '0';
   signal lkup_data2 : std_logic_vector(127 downto 0) := (others => '0');
   signal lkup_data_valid2 : std_logic := '0';
   signal lkup_data3 : std_logic_vector(127 downto 0) := (others => '0');
   signal lkup_data_valid3 : std_logic := '0';
   signal lkup_data4 : std_logic_vector(127 downto 0) := (others => '0');
   signal lkup_data_valid4 : std_logic := '0';
   signal lkup_data5 : std_logic_vector(127 downto 0) := (others => '0');
   signal lkup_data_valid5 : std_logic := '0';
   signal lkup_data6 : std_logic_vector(127 downto 0) := (others => '0');
   signal lkup_data_valid6 : std_logic := '0';
	signal lkup_data7 : std_logic_vector(127 downto 0) := (others => '0');
   signal lkup_data_valid7 : std_logic := '0';
   signal lkup_data8 : std_logic_vector(127 downto 0) := (others => '0');
   signal lkup_data_valid8 : std_logic := '0';
   signal lkup_data9 : std_logic_vector(127 downto 0) := (others => '0');
   signal lkup_data_valid9 : std_logic := '0';
   signal lkup_data10 : std_logic_vector(127 downto 0) := (others => '0');
   signal lkup_data_valid10 : std_logic := '0';
   signal lkup_data11 : std_logic_vector(127 downto 0) := (others => '0');
   signal lkup_data_valid11 : std_logic := '0';
   signal lkup_data12 : std_logic_vector(127 downto 0) := (others => '0');
   signal lkup_data_valid12 : std_logic := '0';
   signal lkup_data13 : std_logic_vector(127 downto 0) := (others => '0');
   signal lkup_data_valid13 : std_logic := '0';
   signal lkup_data14 : std_logic_vector(127 downto 0) := (others => '0');
   signal lkup_data_valid14 : std_logic := '0';
   signal lkup_data15 : std_logic_vector(127 downto 0) := (others => '0');
   signal lkup_data_valid15 : std_logic := '0';
   signal lkup_data16 : std_logic_vector(127 downto 0) := (others => '0');
   signal lkup_data_valid16 : std_logic := '0';
   signal flow_addr : std_logic_vector(9 downto 0) := (others => '0');
   signal flow_lkup_info : std_logic_vector(127 downto 0) := (others => '0');
   signal lkup_info_wr : std_logic := '0';
   signal flow_tag : std_logic_vector(255 downto 0) := (others => '0');
   signal flow_tag_wr : std_logic := '0';
   signal active_flow_addr : std_logic_vector(9 downto 0) := (others => '0');
   signal active_flow : std_logic := '0';
   signal active_flow_wr : std_logic := '0';
   signal clk : std_logic := '0';

 	--Outputs
   signal lkup_miss : std_logic;
   signal flow_priority : std_logic_vector(2 downto 0);
   signal matched_tag_valid : std_logic_vector(7 downto 0);
   signal matched_flow_tag : std_logic_vector(255 downto 0);
	signal grant_out,request_out : std_logic_vector(15 downto 0);
	signal debug : integer;
	signal matched_offset_out : std_logic_vector(9 downto 0);
	signal info_out : std_logic_vector(127 downto 0);
	
   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: top_module PORT MAP (
          lkup_data1 => lkup_data1,
          lkup_data_valid1 => lkup_data_valid1,
          lkup_data2 => lkup_data2,
          lkup_data_valid2 => lkup_data_valid2,
          lkup_data3 => lkup_data3,
          lkup_data_valid3 => lkup_data_valid3,
          lkup_data4 => lkup_data4,
          lkup_data_valid4 => lkup_data_valid4,
          lkup_data5 => lkup_data5,
          lkup_data_valid5 => lkup_data_valid5,
          lkup_data6 => lkup_data6,
          lkup_data_valid6 => lkup_data_valid6,
          lkup_data7 => lkup_data7,
          lkup_data_valid7 => lkup_data_valid7,
			 lkup_data8 => lkup_data8,
          lkup_data_valid8 => lkup_data_valid8,
          lkup_data9 => lkup_data9,
          lkup_data_valid9 => lkup_data_valid9,
          lkup_data10 => lkup_data10,
          lkup_data_valid10 => lkup_data_valid10,
          lkup_data11 => lkup_data11,
          lkup_data_valid11 => lkup_data_valid11,
          lkup_data12 => lkup_data12,
          lkup_data_valid12 => lkup_data_valid12,
          lkup_data13 => lkup_data13,
          lkup_data_valid13 => lkup_data_valid13,
          lkup_data14 => lkup_data14,
          lkup_data_valid14 => lkup_data_valid14,
          lkup_data15 => lkup_data15,
          lkup_data_valid15 => lkup_data_valid15,
          lkup_data16 => lkup_data16,
          lkup_data_valid16 => lkup_data_valid16,
          flow_addr => flow_addr,
          flow_lkup_info => flow_lkup_info,
          lkup_info_wr => lkup_info_wr,
          flow_tag => flow_tag,
          flow_tag_wr => flow_tag_wr,
          active_flow_addr => active_flow_addr,
          active_flow => active_flow,
          active_flow_wr => active_flow_wr,
          lkup_miss => lkup_miss,
          flow_priority => flow_priority,
          matched_tag_valid => matched_tag_valid,
          matched_flow_tag => matched_flow_tag,
          clk => clk,
			 grant_out => grant_out,
			 request_out => request_out,
			 debug => debug,
			 info_out => info_out,
			 matched_offset_out => matched_offset_out
        );

   -- Clock process definitions

	clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

	 -- Stimulus process
   stim_proc: process
   begin		

	active_flow <= '0';
	
	wait until rising_edge(clk);
	lkup_info_wr <= '1';
	flow_addr <= "0010010010";
   flow_lkup_info <= ('0','0','1','0','0' ,others=>'0');
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	lkup_info_wr <= '0';
	
	wait until rising_edge(clk);
	flow_addr <= "0010010010";
	flow_tag <= ('0','1','1','1','0','1', others => '0');
	flow_tag_wr <= '1';
   wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	flow_tag_wr <= '0';
	wait until rising_edge(clk);

	wait until rising_edge(clk);
	lkup_data_valid1 <= '1';
	lkup_data1 <= ('0','0','1','0','0' ,others=>'0');
	wait until rising_edge(clk);
	lkup_data_valid1 <= '0';
	
	wait for clk_period*150;
	
	wait until rising_edge(clk);
	active_flow_addr <= "0010010010";
	active_flow <= '0';
	active_flow_wr <= '1';
   wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	active_flow_wr <= '0';
	wait until rising_edge(clk);
	
	
	wait until rising_edge(clk);
	lkup_data_valid1 <= '1';
	lkup_data1 <= ('0','0','1','0','0' ,others=>'0');
	wait until rising_edge(clk);
	lkup_data_valid1 <= '0';
	
	wait for clk_period*150;
		
	
	active_flow <= '1';
	
	wait until rising_edge(clk);
	lkup_info_wr <= '1';
	flow_addr <= "1110000010";
   flow_lkup_info <= ('1','1','1','0','0','0','0',others=>'1');
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	lkup_info_wr <= '0';
	
	wait until rising_edge(clk);
	flow_addr <= "1110000010";
	flow_tag <= ('1','1','0','1','0','1', others => '1');
	flow_tag_wr <= '1';
   wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	flow_tag_wr <= '0';
	wait until rising_edge(clk);
	
	wait until rising_edge(clk);
	lkup_info_wr <= '1';
	flow_addr <= "0100100010";
   flow_lkup_info <= ('1','0','1','1','1','1','1' ,others=>'0');
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);

	lkup_info_wr <= '0';
	
	wait until rising_edge(clk);
	flow_addr <= "0100100010";
	flow_tag <= ('1','1','1','1','0','0', others => '1');
	flow_tag_wr <= '1';
   wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	flow_tag_wr <= '0';
	
	wait until rising_edge(clk);
	lkup_info_wr <= '1';
	flow_addr <= "0000000100";
   flow_lkup_info <= ('0','0','1','1','1' ,others=>'0');
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	lkup_info_wr <= '0';
	
	wait until rising_edge(clk);
	lkup_info_wr <= '1';
	flow_addr <= "0001010100";
   flow_lkup_info <= ('1','0','1','0','0' ,others=>'1');
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	lkup_info_wr <= '0';
	
	wait until rising_edge(clk);
	lkup_info_wr <= '1';
	flow_addr <= "1000100111";
   flow_lkup_info <= ('1','0','1','1','1','0','1','0',others=>'1');
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	lkup_info_wr <= '0';
	
	wait until rising_edge(clk);
	lkup_data_valid1 <= '1';
	lkup_data1 <= ('0','0','1','0','0' ,others=>'0');
	wait until rising_edge(clk);
	lkup_data_valid1 <= '0';

	
	wait until rising_edge(clk);
	lkup_info_wr <= '1';
	flow_addr <= "1110001111";
   flow_lkup_info <= ('1','0','0','0','0','1','1' ,others=>'0');
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	lkup_info_wr <= '0';
	
	wait until rising_edge(clk);
	lkup_info_wr <= '1';
	flow_addr <= "1100001110";
   flow_lkup_info <= ('1','1','1','0','1','1','0','0','0' ,others=>'1');
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	lkup_info_wr <= '0';
	wait until rising_edge(clk);
	
	wait until rising_edge(clk);
	lkup_data_valid1 <= '1';
	lkup_data1 <= ('0','0','0','0','0', others => '1');
	wait until rising_edge(clk);
	lkup_data_valid1 <= '0';
	
	wait until rising_edge(clk);
	flow_addr <= "1000100111";
	flow_tag <= ('0','1','1','1','0','0','0','1', others => '0');
	flow_tag_wr <= '1';
   wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);

	flow_tag_wr <= '0';
	
	
	wait until rising_edge(clk);
	lkup_data_valid5 <= '1';
	lkup_data5 <= ('1','0','1','1','1','1','1' ,others=>'0');
	wait until rising_edge(clk);
	lkup_data_valid5 <= '0';
	
	wait until rising_edge(clk);
	lkup_data_valid9 <= '1';
	lkup_data9 <= ('1','1','1','0','0','0','0',others=>'1');
	wait until rising_edge(clk);
	lkup_data_valid9 <= '0';
	
	wait until rising_edge(clk);
	lkup_data_valid8 <= '1';
	lkup_data8 <= ('1','0','1','0','0','0','0',others=>'1');
	wait until rising_edge(clk);
	lkup_data_valid8 <= '0';
	
	--
	wait until rising_edge(clk);
	flow_addr <= "0000000100";
	flow_tag <= ('0','0','1','1','0','1','0','1', others => '1');
	flow_tag_wr <= '1';
   wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);

	flow_tag_wr <= '0';
	
	wait until rising_edge(clk);
	flow_addr <= "0001010100";
	flow_tag <= ('0','0','1','1','0','1','0','1','0', others => '1');
	flow_tag_wr <= '1';
   wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);

	flow_tag_wr <= '0';
	
	wait until rising_edge(clk);
	lkup_data_valid3 <= '1';
	lkup_data3 <= ('1','0','1','0','0','0','0',others=>'1');
	wait until rising_edge(clk);
	lkup_data_valid3 <= '0';
	
	wait until rising_edge(clk);
	flow_addr <= "1110001111";
	flow_tag <= ('0','0','1','0','0','1','0','1','0','0', others => '1');
	flow_tag_wr <= '1';
   wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);

	flow_tag_wr <= '0';

	wait until rising_edge(clk);
	flow_addr <= "1100001110";
	flow_tag <= ('0','0','0','1','1','0','1','0','1','0', others => '1');
	flow_tag_wr <= '1';
   wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);
	wait until rising_edge(clk);

	flow_tag_wr <= '0';
	---
	wait until rising_edge(clk);
	lkup_data_valid11 <= '1';
	lkup_data11 <= ('0','0','1','1','1', others=>'1');
	wait until rising_edge(clk);
	lkup_data_valid11 <= '0';
	
	wait until rising_edge(clk);
	lkup_data_valid6 <= '1';
	lkup_data6 <= ('0','1','1','1','1', others => '0');
	wait until rising_edge(clk);
	lkup_data_valid6 <= '0';
	
	wait until rising_edge(clk);
	lkup_data_valid11 <= '1';
	lkup_data11 <= ('0','0','1','0','0' ,others=>'0');
	wait until rising_edge(clk);
	lkup_data_valid11 <= '0';
	
	wait until rising_edge(clk);
	lkup_data_valid12 <= '1';
	lkup_data12 <= ('1','0','1','1','1','1','1' ,others=>'0');
	wait until rising_edge(clk);
	lkup_data_valid12 <= '0';
	
	
	
   wait;
   end process;
END;