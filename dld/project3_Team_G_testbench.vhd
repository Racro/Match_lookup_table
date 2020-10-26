----------------------------------------------------------------------------------
	-- Company: 
	-- Engineer: 
	-- 
	-- Create Date:    17:47:05 05/01/2019 
	-- Design Name: 
	-- Module Name:    top_module - Behavioral 
	-- Project Name: 
	-- Target Devices: 
	-- Tool versions: 
	-- Description: 
	--
	-- Dependencies: 
	--
	-- Revision: 
	-- Revision 0.01 - File Created
	-- Additional Comments: 
	--
	----------------------------------------------------------------------------------
	library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;
	use IEEE.numeric_std.all;

	-- Uncomment the following library declaration if using
	-- arithmetic functions with Signed or Unsigned values
	--use IEEE.NUMERIC_STD.ALL;

	-- Uncomment the following library declaration if instantiating
	-- any Xilinx primitives in this code.
	--library UNISIM;
	--use UNISIM.VComponents.all;

	entity top_module is
		 Port ( lkup_data1 : in  STD_LOGIC_VECTOR (127 downto 0);
				  lkup_data_valid1 : in  STD_LOGIC;
				  lkup_data2 : in  STD_LOGIC_VECTOR (127 downto 0);
				  lkup_data_valid2 : in  STD_LOGIC;
				  lkup_data3 : in  STD_LOGIC_VECTOR (127 downto 0);
				  lkup_data_valid3 : in  STD_LOGIC;
				  lkup_data4 : in  STD_LOGIC_VECTOR (127 downto 0);
				  lkup_data_valid4 : in  STD_LOGIC;
				  lkup_data5 : in  STD_LOGIC_VECTOR (127 downto 0);
				  lkup_data_valid5 : in  STD_LOGIC;
				  lkup_data6 : in  STD_LOGIC_VECTOR (127 downto 0);
				  lkup_data_valid6 : in  STD_LOGIC;
				  lkup_data7 : in  STD_LOGIC_VECTOR (127 downto 0);
				  lkup_data_valid7 : in  STD_LOGIC;
				  lkup_data8 : in  STD_LOGIC_VECTOR (127 downto 0);
				  lkup_data_valid8 : in  STD_LOGIC;
				  lkup_data9 : in  STD_LOGIC_VECTOR (127 downto 0);
				  lkup_data_valid9 : in  STD_LOGIC;
				  lkup_data10 : in  STD_LOGIC_VECTOR (127 downto 0);
				  lkup_data_valid10 : in  STD_LOGIC;
				  lkup_data11 : in  STD_LOGIC_VECTOR (127 downto 0);
				  lkup_data_valid11 : in  STD_LOGIC;
				  lkup_data12 : in  STD_LOGIC_VECTOR (127 downto 0);
				  lkup_data_valid12 : in  STD_LOGIC;
				  lkup_data13 : in  STD_LOGIC_VECTOR (127 downto 0);
				  lkup_data_valid13 : in  STD_LOGIC;
				  lkup_data14 : in  STD_LOGIC_VECTOR (127 downto 0);
				  lkup_data_valid14 : in  STD_LOGIC;
				  lkup_data15 : in  STD_LOGIC_VECTOR (127 downto 0);
				  lkup_data_valid15 : in  STD_LOGIC;
				  lkup_data16 : in  STD_LOGIC_VECTOR (127 downto 0);
				  lkup_data_valid16 : in  STD_LOGIC;
				  
				  flow_addr : in  STD_LOGIC_VECTOR (9 downto 0);
				  flow_lkup_info : in  STD_LOGIC_VECTOR (127 downto 0);
				  lkup_info_wr : in  STD_LOGIC;
				  flow_tag : in  STD_LOGIC_VECTOR (255 downto 0);
				  flow_tag_wr : in  STD_LOGIC;
				  active_flow_addr : in  STD_LOGIC_VECTOR (9 downto 0);
				  active_flow : in  STD_LOGIC;
				  active_flow_wr : in  STD_LOGIC;
				  lkup_miss : out  STD_LOGIC;
				  flow_priority : out  STD_LOGIC_VECTOR (2 downto 0);
				  --lkup_flow_id : out  STD_LOGIC_VECTOR (7 downto 0);
				  matched_tag_valid : out  STD_LOGIC_VECTOR (7 downto 0);
				  matched_flow_tag : out  STD_LOGIC_VECTOR (255 downto 0);
				  clk : in std_logic;
				  grant_out : inout std_logic_vector(15 downto 0);
				  request_out: out std_logic_vector(15 downto 0);
				  debug : inout integer;
				  matched_offset_out : out std_logic_vector(9 downto 0);
				  info_out :  out std_logic_vector(127 downto 0)
				  );
				  
	end top_module;

	architecture Behavioral of top_module is
	        
	        component rrarbiter is
			 Port ( clk : in  STD_LOGIC;
					  rst_n : in  STD_LOGIC;
					  req : in  STD_LOGIC_VECTOR (15 downto 0);
					  ack : in  STD_LOGIC;
					  grant : out STD_LOGIC_VECTOR (15 downto 0)
					  );
		end component;

		 COMPONENT FIFO
		 PORT(
				clk : IN  std_logic;
				rst : IN  std_logic;
				din : IN  std_logic_vector(127 downto 0);
				wr_en : IN  std_logic;
				rd_en : IN  std_logic;
				dout : OUT  std_logic_vector(127 downto 0);
				full : OUT  std_logic;
				empty : OUT  std_logic
			  );
		 END COMPONENT;
		 
		COMPONENT table_fs IS
	  PORT (
		 clka : IN STD_LOGIC;
		 ena : IN STD_LOGIC;
		 wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		 addra : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 dina : IN STD_LOGIC_VECTOR(149 DOWNTO 0);
		 clkb : IN STD_LOGIC;
		 rstb : IN STD_LOGIC;
		 enb : IN STD_LOGIC;
		 addrb : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 doutb : OUT STD_LOGIC_VECTOR(149 DOWNTO 0)
	  );
	END COMPONENT;
	COMPONENT table_ss
	  PORT (
		 clka : IN STD_LOGIC;
		 ena : IN STD_LOGIC;
		 wea : IN STD_LOGIC_VECTOR(0 DOWNTO 0);
		 addra : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 dina : IN STD_LOGIC_VECTOR(255 DOWNTO 0);
		 clkb : IN STD_LOGIC;
		 rstb : IN STD_LOGIC;
		 enb : IN STD_LOGIC;
		 addrb : IN STD_LOGIC_VECTOR(9 DOWNTO 0);
		 doutb : OUT STD_LOGIC_VECTOR(255 DOWNTO 0)
	  );
	END COMPONENT;

	signal offset : std_logic_vector(9 downto 0) := "0000000000";
	signal addras,addrbs : std_logic_vector(9 downto 0);
	signal enas,enbs : std_logic;
	signal dinas,doutbs : std_logic_vector(255 downto 0);
	signal clka,ena,clkb,enb : std_logic_vector(7 downto 0);
	
	signal rstb: std_logic_vector(7 downto 0) := "00000000";
	signal rstbs : std_logic :='0';
	
	signal wea1,wea2,wea3,wea4,wea5,wea6,wea7,wea8,weas : std_logic_vector(0 downto 0);
	signal addra1,addra2,addra3,addra4,addra5,addra6,addra7,addra8 : std_logic_vector(6 downto 0);
	signal addrb1,addrb2,addrb3,addrb4,addrb5,addrb6,addrb7,addrb8 : std_logic_vector(6 downto 0);
	signal dina1,dina2,dina3,dina4,dina5,dina6,dina7,dina8: std_logic_vector(149 downto 0);
	signal doutb1,doutb2,doutb3,doutb4,doutb5,doutb6,doutb7,doutb8 : std_logic_vector(149 downto 0);

	signal rst,wr_en,rd_en,full,empty : std_logic_vector(7 downto 0);
	signal din1,din2,din3,din4,din5,din6,din7,din8 : std_logic_vector(127 downto 0);
	signal dout1,dout2,dout3,dout4,dout5,dout6,dout7,dout8 : std_logic_vector(127 downto 0);
	
	signal port_rst : std_logic := '0';
	signal ack : std_logic := '0';
	signal request : std_logic_vector(15 downto 0); 
	signal port_rd_en0, port_rd_en1, port_rd_en2, port_rd_en3, port_rd_en4, port_rd_en5, port_rd_en6, port_rd_en7, port_rd_en8, port_rd_en9, port_rd_en10, port_rd_en11, port_rd_en12, port_rd_en13, port_rd_en14, port_rd_en15 : std_logic := '0';
	signal port_dout0, port_dout1, port_dout2, port_dout3, port_dout4, port_dout5, port_dout6, port_dout7, port_dout8, port_dout9, port_dout10, port_dout11, port_dout12, port_dout13, port_dout14, port_dout15 : std_logic_vector(127 downto 0);
	signal port_full0, port_empty0, port_full1, port_empty1, port_full2, port_empty2, port_full3, port_empty3, port_full4, port_empty4, port_full5, port_empty5, port_full6, port_empty6, port_full7, port_empty7, port_full8, port_empty8, port_full9, port_empty9, port_full10, port_empty10, port_full11, port_empty11, port_full12, port_empty12, port_full13, port_empty13, port_full14, port_empty14, port_full15, port_empty15 :  std_logic := '0';		
	signal grant,grant1 : std_logic_vector(15 downto 0) ;--:= "0000000000000000";
	signal arbit_rst : std_logic := '0';
	
	signal tester : std_logic := '1';
	signal shit : std_logic := '0';
	begin
	enb <= "11111111";
	enas <= '1';
	dut1: table_fs PORT MAP (
				 clka => clk,
				 ena => ena(0),
				 wea => wea1,
				 addra => addra1,
				 dina => dina1,
				 clkb => clk,
				 rstb => rstb(0),
				 enb => enb(0),
				 addrb => addrb1,
				 doutb => doutb1
			  );

	dut2: table_fs PORT MAP (
				 clka => clk,
				 ena => ena(1),
				 wea => wea2,
				 addra => addra2,
				 dina => dina2,
				 clkb => clk,
				 rstb => rstb(1),
				 enb => enb(1),
				 addrb => addrb2,
				 doutb => doutb2
			  );
	dut3: table_fs PORT MAP (
				 clka => clk,
				 ena => ena(2),
				 wea => wea3,
				 addra => addra3,
				 dina => dina3,
				 clkb => clk,
				 rstb => rstb(2),
				 enb => enb(2),
				 addrb => addrb3,
				 doutb => doutb3
			  );
	dut4: table_fs PORT MAP (
				 clka => clk,
				 ena => ena(3),
				 wea => wea4,
				 addra => addra4,
				 dina => dina4,
				 clkb => clk,
				 rstb => rstb(3),
				 enb => enb(3),
				 addrb => addrb4,
				 doutb => doutb4
			  );

	dut5: table_fs PORT MAP (
				 clka => clk,
				 ena => ena(4),
				 wea => wea5,
				 addra => addra5,
				 dina => dina5,
				 clkb => clk,
				 rstb => rstb(4),
				 enb => enb(4),
				 addrb => addrb5,
				 doutb => doutb5
			  );
	dut6: table_fs PORT MAP (
				 clka => clk,
				 ena => ena(5),
				 wea => wea6,
				 addra => addra6,
				 dina => dina6,
				 clkb => clk,
				 rstb => rstb(5),
				 enb => enb(5),
				 addrb => addrb6,
				 doutb => doutb6
			  );
	dut7: table_fs PORT MAP (
				 clka => clk,
				 ena => ena(6),
				 wea => wea7,
				 addra => addra7,
				 dina => dina7,
				 clkb => clk,
				 rstb => rstb(6),
				 enb => enb(6),
				 addrb => addrb7,
				 doutb => doutb7
			  );
			  
	dut8: table_fs PORT MAP (
				 clka => clk,
				 ena => ena(7),
				 wea => wea8,
				 addra => addra8,
				 dina => dina8,
				 clkb => clk,
				 rstb => rstb(7),
				 enb => enb(7),
				 addrb => addrb8,
				 doutb => doutb8
			  );
	dut9: table_ss PORT MAP (
				 clka => clk,
				 ena => enas,
				 wea => weas,
				 addra => addras,
				 dina => dinas,
				 clkb => clk,
				 rstb => rstbs,
				 enb => enbs,
				 addrb => addrbs,
				 doutb => doutbs
			  );

	uut1 : FIFO PORT MAP(
				clk => clk,
				rst => rst(0),
				din => din1,
				wr_en => wr_en(0),         
				rd_en => rd_en(0),
				dout => dout1,
				full => full(0),
				empty => empty(0)
			  );
	uut2 : FIFO PORT MAP(
				clk => clk,
				rst => rst(1),
				din => din2,
				wr_en => wr_en(1),         
				rd_en => rd_en(1),
				dout => dout2,
				full => full(1),
				empty => empty(1)
			  );
	uut3 : FIFO PORT MAP(
				clk => clk,
				rst => rst(2),
				din => din3,
				wr_en => wr_en(2),         
				rd_en => rd_en(2),
				dout => dout3,
				full => full(2),
				empty => empty(2)
			  );
	uut4 : FIFO PORT MAP(
				clk => clk,
				rst => rst(3),
				din => din4,
				wr_en => wr_en(3),         
				rd_en => rd_en(3),
				dout => dout4,
				full => full(3),
				empty => empty(3)
			  );
	uut5 : FIFO PORT MAP(
				clk => clk,
				rst => rst(4),
				din => din5,
				wr_en => wr_en(4),         
				rd_en => rd_en(4),
				dout => dout5,
				full => full(4),
				empty => empty(4)
			  );
	uut6 : FIFO PORT MAP(
				clk => clk,
				rst => rst(5),
				din => din6,
				wr_en => wr_en(5),         
				rd_en => rd_en(5),
				dout => dout6,
				full => full(5),
				empty => empty(5)
			  );
	uut7 : FIFO PORT MAP(
				clk => clk,
				rst => rst(6),
				din => din7,
				wr_en => wr_en(6),         
				rd_en => rd_en(6),
				dout => dout7,
				full => full(6),
				empty => empty(6)
			  );

	uut8 : FIFO PORT MAP(
				clk => clk,
				rst => rst(7),
				din => din8,
				wr_en => wr_en(7),         
				rd_en => rd_en(7),
				dout => dout8,
				full => full(7),
				empty => empty(7)
			  );
			  
			  
	port_fifo0 : FIFO PORT MAP(
			clk => clk,
			rst => port_rst,
			din => lkup_data1,
			wr_en => lkup_data_valid1,
			rd_en => port_rd_en0,
			dout => port_dout0,
			full => port_full0,
			empty => port_empty0
			);

	port_fifo1 : FIFO PORT MAP(
			clk => clk,
			rst => port_rst,
			din => lkup_data2,
			wr_en => lkup_data_valid2,
			rd_en => port_rd_en1,
			dout => port_dout1,
			full => port_full1,
			empty => port_empty1
			);

	port_fifo2 : FIFO PORT MAP(
			clk => clk,
			rst => port_rst,
			din => lkup_data3,
			wr_en => lkup_data_valid3,
			rd_en => port_rd_en2,
			dout => port_dout2,
			full => port_full2,
			empty => port_empty2
			);

	port_fifo3 : FIFO PORT MAP(
			clk => clk,
			rst => port_rst,
			din => lkup_data4,
			wr_en => lkup_data_valid4,
			rd_en => port_rd_en3,
			dout => port_dout3,
			full => port_full3,
			empty => port_empty3
			);

	port_fifo4 : FIFO PORT MAP(
			clk => clk,
			rst => port_rst,
			din => lkup_data5,
			wr_en => lkup_data_valid5,
			rd_en => port_rd_en4,
			dout => port_dout4,
			full => port_full4,
			empty => port_empty4
			);

	port_fifo5 : FIFO PORT MAP(
			clk => clk,
			rst => port_rst,
			din => lkup_data6,
			wr_en => lkup_data_valid6,
			rd_en => port_rd_en5,
			dout => port_dout5,
			full => port_full5,
			empty => port_empty5
			);

	port_fifo6 : FIFO PORT MAP(
			clk => clk,
			rst => port_rst,
			din => lkup_data7,
			wr_en => lkup_data_valid7,
			rd_en => port_rd_en6,
			dout => port_dout6,
			full => port_full6,
			empty => port_empty6
			);

	port_fifo7 : FIFO PORT MAP(
			clk => clk,
			rst => port_rst,
			din => lkup_data8,
			wr_en => lkup_data_valid8,
			rd_en => port_rd_en7,
			dout => port_dout7,
			full => port_full7,
			empty => port_empty7
			);

	port_fifo8 : FIFO PORT MAP(
			clk => clk,
			rst => port_rst,
			din => lkup_data9,
			wr_en => lkup_data_valid9,
			rd_en => port_rd_en8,
			dout => port_dout8,
			full => port_full8,
			empty => port_empty8
			);

	port_fifo9 : FIFO PORT MAP(
			clk => clk,
			rst => port_rst,
			din => lkup_data10,
			wr_en => lkup_data_valid10,
			rd_en => port_rd_en9,
			dout => port_dout9,
			full => port_full9,
			empty => port_empty9
			);

	port_fifo10 : FIFO PORT MAP(
			clk => clk,
			rst => port_rst,
			din => lkup_data11,
			wr_en => lkup_data_valid11,
			rd_en => port_rd_en10,
			dout => port_dout10,
			full => port_full10,
			empty => port_empty10
			);

	port_fifo11 : FIFO PORT MAP(
			clk => clk,
			rst => port_rst,
			din => lkup_data12,
			wr_en => lkup_data_valid12,
			rd_en => port_rd_en11,
			dout => port_dout11,
			full => port_full11,
			empty => port_empty11
			);

	port_fifo12 : FIFO PORT MAP(
			clk => clk,
			rst => port_rst,
			din => lkup_data13,
			wr_en => lkup_data_valid13,
			rd_en => port_rd_en12,
			dout => port_dout12,
			full => port_full12,
			empty => port_empty12
			);

	port_fifo13 : FIFO PORT MAP(
			clk => clk,
			rst => port_rst,
			din => lkup_data14,
			wr_en => lkup_data_valid14,
			rd_en => port_rd_en13,
			dout => port_dout13,
			full => port_full13,
			empty => port_empty13
			);

	port_fifo14 : FIFO PORT MAP(
			clk => clk,
			rst => port_rst,
			din => lkup_data15,
			wr_en => lkup_data_valid15,
			rd_en => port_rd_en14,
			dout => port_dout14,
			full => port_full14,
			empty => port_empty14
			);

	port_fifo15 : FIFO PORT MAP(
			clk => clk,
			rst => port_rst,
			din => lkup_data16,
			wr_en => lkup_data_valid16,
			rd_en => port_rd_en15,
			dout => port_dout15,
			full => port_full15,
			empty => port_empty15
			);


	rrarbit : rrarbiter port map(
			clk => clk,
			rst_n => arbit_rst,
			req => request,
			ack => ack,
			grant => grant
			);
			
	

process(clk)

	variable table : std_logic_vector(2 downto 0);
	variable index : std_logic_vector(6 downto 0);
	variable padding : std_logic_vector(10 downto 0) := (others => '0');
	variable en_flag : std_logic := '0'; 
	variable data : std_logic_vector(149 downto 0);
	variable flag1 : std_logic := '0'; 
	
	variable count : integer := 0;
	variable found : std_logic := '1';
	variable info : std_logic_vector(127 downto 0);
	variable matched_offset : std_logic_vector(9 downto 0);
	variable miss : std_logic :='0';
	variable init : std_logic := '0';
	variable ongoing : std_logic := '0';
	variable state_wait : integer := 0;
	variable count4,count2,count3 : integer :=0;
	variable key : std_logic_vector(9 downto 0);
	variable update : std_logic_vector(149 downto 0);

	begin
	if rising_edge(clk) then
		if lkup_info_wr = '1' then
			enb <= "00000000";
			enbs <= '0';
			enas <= '0';
			weas <= "0";
			
			count2:=0;
			count3:=0;
			
			if count4=0 then
				count4:=1;
				table := flow_addr(9 downto 7);
				index := flow_addr(6 downto 0);
				
				if table = "000" then
					ena(0) <= '1';
					wea1 <= "1";
					addra1 <= index;
					dina1 <= flow_lkup_info & '1' & offset & padding ;  
				elsif table = "001" then
					ena(1) <= '1';
					wea2 <= "1";
					addra2 <= index;
					dina2 <= flow_lkup_info &  '1' & offset & padding; 
				elsif table = "010" then
					ena(2) <= '1';
					wea3 <= "1";
					addra3 <= index;
					dina3 <= flow_lkup_info &  '1' & offset & padding; 
				elsif table = "011" then
					ena(3) <= '1';
					wea4 <= "1";
					addra4 <= index;
					dina4 <= flow_lkup_info &  '1' & offset & padding; 
				elsif table = "100" then
					ena(4) <= '1';
					wea5 <= "1";
					addra5 <= index;
					dina5 <= flow_lkup_info &  '1' & offset & padding;
				elsif table = "101" then
					ena(5) <= '1';
					wea6 <= "1";
					addra6 <= index;
					dina6 <= flow_lkup_info &  '1' & offset & padding;
				elsif table = "110" then
					ena(6) <= '1';
					wea7 <= "1";
					addra7 <= index;
					dina7 <= flow_lkup_info &  '1' & offset & padding;
				elsif table = "111" then
					ena(7) <= '1';
					wea8 <= "1";
					addra8 <= index;
					dina8 <= flow_lkup_info &  '1' & offset & padding;
				end if;
				offset <= std_logic_vector(to_unsigned(to_integer(unsigned(offset)) + 1, 10));
			elsif count4=1 then 
				count4 := 0;
				ena <= "00000000";
				wea1 <= "0";
				wea2 <= "0";
				wea3 <= "0";
				wea4 <= "0";
				wea5 <= "0";
				wea6 <= "0";
				wea7 <= "0";
				wea8 <= "0";
			end if;

	elsif flow_tag_wr = '1' then
			count4:=0;
			count3:=0;
			enb <= "11111111";
			enbs <= '0';
			ena <= "00000000";
		
			table := flow_addr(9 downto 7);
			index := flow_addr(6 downto 0);
			
			if count2=0 then
			
				enas <= '0';
				weas <= "0";
				
				key := "0000000000";
				debug <= 0;
				if table="000" then
					addrb1 <= index;
				elsif table="001" then
					addrb2 <= index;
				elsif table="010" then
					addrb3 <= index;
				elsif table="011" then
					addrb4 <= index;
				elsif table="100" then
					addrb5 <= index;
				elsif table="101" then
					addrb6 <= index;
				elsif table="110" then
					addrb7 <= index;
				elsif table="111" then
					addrb8 <= index;
				end if;
				count2:=1;	
			elsif count2=1 then
				enas <= '0';
				weas <= "0";
				debug <= 1;
				count2 := 2;
				
			elsif count2=2 then
				debug <= 2;
				count2 := 3;
				if table="000" then
					key := doutb1(20 downto 11);
				elsif table="001" then
					key := doutb2(20 downto 11);
				elsif table="010" then
					key := doutb3(20 downto 11);
				elsif table="011" then
					key := doutb4(20 downto 11);
				elsif table="100" then
					key := doutb5(20 downto 11);
				elsif table="101" then
					key := doutb6(20 downto 11);
				elsif table="110" then
					key := doutb7(20 downto 11);
				elsif table="111" then
					key := doutb8(20 downto 11);
				end if;
				
				enas <= '1';
				weas <= "1";
				addras <= key;
				dinas <= flow_tag;
				--info_out <= flow_addr & doutb1(149 downto 32);
			elsif count2=3 then
				enas <= '0';
				weas <= "0";
				count2:=4;
				debug <= 3;
			elsif count2=4 then
				enas <= '0';
				weas <= "0";
				count2:=0;
				debug <= 4;
			end if;
			
		elsif active_flow_wr='1' then
			count2:=0;
			count4:=0;
			enbs <= '0';
			enas <= '0';
			weas <= "0";
		
			table := active_flow_addr(9 downto 7);
			index := active_flow_addr(6 downto 0);
			
			if count3=0 then
				wea1 <= "0";
				wea2 <= "0";
				wea3 <= "0";
				wea4 <= "0";
				wea5 <= "0";
				wea6 <= "0";
				wea7 <= "0";
				wea8 <= "0";
				ena <= "00000000";
				enb <= "11111111";
				key := "0000000000";
				debug <= 0;
				if table="000" then
					addrb1 <= index;
				elsif table="001" then
					addrb2 <= index;
				elsif table="010" then
					addrb3 <= index;
				elsif table="011" then
					addrb4 <= index;
				elsif table="100" then
					addrb5 <= index;
				elsif table="101" then
					addrb6 <= index;
				elsif table="110" then
					addrb7 <= index;
				elsif table="111" then
					addrb8 <= index;
				end if;
				--info_out <= flow_addr & doutb1(149 downto 32);
				count3:=1;	
			elsif count3=1 then
				ena <= "00000000";
				enb <= "11111111";
				debug <= 1;
				count3 := 2;
			elsif count3=2 then
				debug <= 2;
				count3 := 3;
				enb <= "00000000";
				
				if table="000" then
					update := doutb1;
				elsif table="001" then
					update := doutb2;
				elsif table="010" then
					update := doutb3;
				elsif table="011" then
					update := doutb4;
				elsif table="100" then
					update := doutb5;
				elsif table="101" then
					update := doutb6;
				elsif table="110" then
					update := doutb7;
				elsif table="111" then
					update := doutb8;
				end if;
				
				update(21) := active_flow;
				
				if table="000" then
					addra1 <= index;
					dina1 <= update;
					wea1 <= "1";
					ena <= "00000001";
				elsif table="001" then
					addra2 <= index;
					dina2 <= update;
					wea2 <= "1";
					ena <= "00000010";
				elsif table="010" then
					addra3 <= index;
					dina3 <= update;
					wea3 <= "1";
					ena <= "00000100";
				elsif table="011" then
					addra4<= index;
					dina4 <= update;
					wea4 <= "1";
					ena <= "00001000";
				elsif table="100" then
					addra5 <= index;
					dina5 <= update;
					wea5 <= "1";
					ena <= "00010000";
				elsif table="101" then
					addra6 <= index;
					dina6 <= update;
					wea6 <= "1";
					ena <= "00100000";
				elsif table="110" then
					addra7 <= index;
					dina7 <= update;
					wea7 <= "1";
					ena <= "01000000";
				elsif table="111" then
					addra8 <= index;
					dina8 <= update;
					wea8 <= "1";
					ena <= "10000000";
				end if;
			
			elsif count3=3 then
				count3:=4;
				debug <= 3;
				wea1 <= "0";
				wea2 <= "0";
				wea3 <= "0";
				wea4 <= "0";
				wea5 <= "0";
				wea6 <= "0";
				wea7 <= "0";
				wea8 <= "0";
				ena <= "00000000";
				enb <= "00000000";
			elsif count3=4 then
				count3:=0;
				debug <= 4;
			end if;
		else
			count2:=0;
			count3:=0;
			count4:=0;
			enb <= "11111111";
			enbs <= '1';
			ena <= "00000000";
			enas <= '0';
			weas <= "0";
			matched_offset_out <= matched_offset;
			arbit_rst <= '1';
			request <= (not port_empty15) & (not port_empty14) & (not port_empty13) & (not port_empty12) & (not port_empty11) & (not port_empty10) & (not port_empty9) & (not port_empty8) & (not port_empty7) & (not port_empty6) & (not port_empty5) & (not port_empty4) & (not port_empty3) & (not port_empty2) & (not port_empty1) & (not port_empty0);
			request_out <= (not port_empty15) & (not port_empty14) & (not port_empty13) & (not port_empty12) & (not port_empty11) & (not port_empty10) & (not port_empty9) & (not port_empty8) & (not port_empty7) & (not port_empty6) & (not port_empty5) & (not port_empty4) & (not port_empty3) & (not port_empty2) & (not port_empty1) & (not port_empty0);
			grant_out <= grant;
			grant1 <= grant_out;

			if miss='1' and state_wait=0 then
				enbs<='1';
				addrbs <= matched_offset;
				miss := '1';
				state_wait := 1;
				lkup_miss <= '1';
				debug <= 15;
			elsif miss='1' and state_wait=1 then
				--matched_flow_tag <= doutbs;
				lkup_miss <= '1';
				miss := '1';
				state_wait := 2;
				debug <= 16;
--			elsif miss='1' and state_wait=2 then
--				matched_flow_tag <= doutbs;
--				lkup_miss <= '1';
--				miss := '1';
--				state_wait := 3;
--				debug <= 17;
			elsif miss='1' and state_wait=2 then
				matched_flow_tag <= doutbs;
				lkup_miss <= '0';
				miss := '0';
				state_wait := 0;
				debug <= 18;
			elsif found='1' or grant = "0000000000000000" then
				lkup_miss <= '1';
				ack <= '1';
				count:=0;
				found := '0';
				init:='0';
				debug <= 1;
			elsif grant /="0000000000000000" and init = '0' then
				ack <= '0';
				miss := '0';
				count:=-1;
				found := '0';
				init := '1';
						if grant(0)='1' then 
							port_rd_en0<='1';
						else
							port_rd_en0<='0';
						end if;
						if grant(1)='1' then 
							port_rd_en1<='1';
						else
							port_rd_en1<='0';
						end if;
						if grant(2)='1' then 
							port_rd_en2<='1';
						else
							port_rd_en2<='0';
						end if;
						if grant(3)='1' then 
							port_rd_en3<='1';
						else
							port_rd_en3<='0';
						end if;
						if grant(4)='1' then 
							port_rd_en4<='1';
						else
							port_rd_en4<='0';
						end if;
						if grant(5)='1' then 
							port_rd_en5<='1';
						else
							port_rd_en5<='0';
						end if;
						if grant(6)='1' then 
							port_rd_en6<='1';
						else
							port_rd_en6<='0';
						end if;
						if grant(7)='1' then 
							port_rd_en7<='1';
						else
							port_rd_en7<='0';
						end if;
						if grant(8)='1' then 
							port_rd_en8<='1';
						else
							port_rd_en8<='0';
						end if;
						if grant(9)='1' then 
							port_rd_en9<='1';
						else
							port_rd_en9<='0';
						end if;
						if grant(10)='1' then 
							port_rd_en10<='1';
						else
							port_rd_en10<='0';
						end if;
						if grant(11)='1' then 
							port_rd_en11<='1';
						else
							port_rd_en11<='0';
						end if;
						if grant(12)='1' then 
							port_rd_en12<='1';
						else
							port_rd_en12<='0';
						end if;
						if grant(13)='1' then 
							port_rd_en13<='1';
						else
							port_rd_en13<='0';
						end if;
						if grant(14)='1' then 
							port_rd_en14<='1';
						else
							port_rd_en14<='0';
						end if;
						if grant(15)='1' then 
							port_rd_en15<='1';
						else
							port_rd_en15<='0';
						end if;		
				--info_out <= port_dout0;
				debug <= 3;
			elsif count=129 then
				ack <= '0';
				miss := '0';
				count:=0;
				found := '1';
				init:= '1';
				debug <= 4;
				lkup_miss <= '1';
			elsif count=-1 then
				ack <= '0';
				count:= count+1;
				debug <= 5;
			elsif count=0 then
				init:= '1';
				ack <= '0';
				port_rd_en0<='0';
				port_rd_en1<='0';
				port_rd_en2<='0';
				port_rd_en3<='0';
				port_rd_en4<='0';
				port_rd_en5<='0';
				port_rd_en6<='0';
				port_rd_en7<='0';
				port_rd_en8<='0';
				port_rd_en9<='0';
				port_rd_en10<='0';
				port_rd_en11<='0';
				port_rd_en12<='0';
				port_rd_en13<='0';
				port_rd_en14<='0';
				port_rd_en15<='0';
				
					if grant1(0)='1' then
						info := port_dout0;
						info_out <= port_dout0;
					elsif grant1(1)='1' then
						info := port_dout1;
						info_out <= port_dout1;
					elsif grant1(2)='1' then
						info := port_dout2;
						info_out <= port_dout2;
					elsif grant1(3)='1' then
						info := port_dout3;
						info_out <= port_dout3;
					elsif grant1(4)='1' then
						info := port_dout4;
						info_out <= port_dout4;
					elsif grant1(5)='1' then
						info := port_dout5;
						info_out <= port_dout5;
					elsif grant1(6)='1' then
						info := port_dout6;
						info_out <= port_dout6;
					elsif grant1(7)='1' then
						info := port_dout7;
						info_out <= port_dout7;
					elsif grant1(8)='1' then
						info := port_dout8;
						info_out <= port_dout8;
					elsif grant1(9)='1' then
						info := port_dout9;
						info_out <= port_dout9;
					elsif grant1(10)='1' then
						info := port_dout10;
						info_out <= port_dout10;
					elsif grant1(11)='1' then
						info := port_dout11;
						info_out <= port_dout11;
					elsif grant1(12)='1' then
						info := port_dout12;
						info_out <= port_dout12;
					elsif grant1(13)='1' then
						info := port_dout13;
						info_out <= port_dout13;
					elsif grant1(14)='1' then
						info := port_dout14;
						info_out <= port_dout14;
					elsif grant1(15)='1' then
						info := port_dout15;
						info_out <= port_dout15;
					end if;
					--info_out <= port_dout0;
					--info_out <= info;
					
				--enb <= "11111111";
				addrb1 <= std_logic_vector(to_unsigned(count,7));
				addrb2 <= std_logic_vector(to_unsigned(count,7));
				addrb3 <= std_logic_vector(to_unsigned(count,7));
				addrb4 <= std_logic_vector(to_unsigned(count,7));
				addrb5 <= std_logic_vector(to_unsigned(count,7));
				addrb6 <= std_logic_vector(to_unsigned(count,7));
				addrb7 <= std_logic_vector(to_unsigned(count,7));
				addrb8 <= std_logic_vector(to_unsigned(count,7));
				count:= count+1;
				miss := '0';
				debug <= 10;
--			elsif debug = 10 then
--				debug <= to_integer(unsigned(doutb1(149 downto 22)));
			else
				init:= '1';
				ack <= '0';
				miss := '0';
				
				if count /=128 then
				--enb <= "11111111";
				addrb1 <= std_logic_vector(to_unsigned(count,7));
				addrb2 <= std_logic_vector(to_unsigned(count,7));
				addrb3 <= std_logic_vector(to_unsigned(count,7));
				addrb4 <= std_logic_vector(to_unsigned(count,7));
				addrb5 <= std_logic_vector(to_unsigned(count,7));
				addrb6 <= std_logic_vector(to_unsigned(count,7));
				addrb7 <= std_logic_vector(to_unsigned(count,7));
				addrb8 <= std_logic_vector(to_unsigned(count,7));
				end if;
				debug <= 11;
				
				if doutb1(149 downto 21) = info & '1' then
					miss := '1';
					found := '1';
					matched_offset := doutb1(20 downto 11);
				elsif doutb2(149 downto 21) = info & '1' then
					miss := '1';
					found := '1';
					matched_offset := doutb2(20 downto 11);
				elsif doutb3(149 downto 21) = info & '1' then
					miss := '1';
					found := '1';
					matched_offset := doutb3(20 downto 11);
				elsif doutb4(149 downto 21) = info & '1' then
					miss := '1';
					found := '1';
					matched_offset := doutb4(20 downto 11);
				elsif doutb5(149 downto 21) = info & '1' then
					miss := '1';
					found := '1';
					matched_offset := doutb5(20 downto 11);
				elsif doutb6(149 downto 21) = info & '1' then
					miss := '1';
					found := '1';
					matched_offset := doutb6(20 downto 11);
				elsif doutb7(149 downto 21) = info & '1' then
					miss := '1';
					found := '1';
					matched_offset := doutb7(20 downto 11);
				elsif doutb8(149 downto 21) = info & '1' then
					miss := '1';
					found := '1';
					matched_offset := doutb8(20 downto 11);
				else
					miss:='0';
					found:='0';
				end if;
				
				if found='1' then
					init:='0';
					--ongoing := '0';
				end if;
				count:= count+1;
				--info_out <= port_dout0;
				--info_out <= info;
				--debug <= 6;
			end if;
		end if;
	end if;
end process;		
			
--			
--	assign : process(clk)
--		variable count : integer := 0;
--		variable found : std_logic := '1';
--		variable info : std_logic_vector(127 downto 0);
--		variable matched_offset : std_logic_vector(9 downto 0);
--		variable miss : std_logic :='0';
--		variable init : std_logic := '0';
--		variable ongoing : std_logic := '0';
--	begin 
--		if(rising_edge(clk)) then
--			
--			matched_offset_out <= matched_offset;
--			arbit_rst <= '1';
--			request <= (not port_empty15) & (not port_empty14) & (not port_empty13) & (not port_empty12) & (not port_empty11) & (not port_empty10) & (not port_empty9) & (not port_empty8) & (not port_empty7) & (not port_empty6) & (not port_empty5) & (not port_empty4) & (not port_empty3) & (not port_empty2) & (not port_empty1) & (not port_empty0);
--			request_out <= (not port_empty15) & (not port_empty14) & (not port_empty13) & (not port_empty12) & (not port_empty11) & (not port_empty10) & (not port_empty9) & (not port_empty8) & (not port_empty7) & (not port_empty6) & (not port_empty5) & (not port_empty4) & (not port_empty3) & (not port_empty2) & (not port_empty1) & (not port_empty0);
--			grant_out <= grant;
--			grant1 <= grant_out;
--			--info := port_dout0;
--			
----			if request = "0000000000000000" and ongoing = '0' then
----				debug <= 0; 
----			els
----			if found='1' and request = "0000000000000000" then
----				debug <= 0;
--			if found='1' or grant = "0000000000000000" then
--				ack <= '1';
--				count:=0;
--				found := '0';
--				init:='0';
--				--info_out <= port_dout0;
--				debug <= 1;
--				--ongoing := '1';
----			elsif grant = "0000000000000000" then
----				ack <= '0';
----				count:=0;
----				found := '1';
----				init:='0';
----				debug <= 2;
--			elsif grant /="0000000000000000" and init = '0' then
--				ack <= '0';
--				miss := '0';
--				count:=-1;
--				found := '0';
--				init := '1';
--						if grant(0)='1' then 
--							port_rd_en0<='1';
--						else
--							port_rd_en0<='0';
--						end if;
--						if grant(1)='1' then 
--							port_rd_en1<='1';
--						else
--							port_rd_en1<='0';
--						end if;
--						if grant(2)='1' then 
--							port_rd_en2<='1';
--						else
--							port_rd_en2<='0';
--						end if;
--						if grant(3)='1' then 
--							port_rd_en3<='1';
--						else
--							port_rd_en3<='0';
--						end if;
--						if grant(4)='1' then 
--							port_rd_en4<='1';
--						else
--							port_rd_en4<='0';
--						end if;
--						if grant(5)='1' then 
--							port_rd_en5<='1';
--						else
--							port_rd_en5<='0';
--						end if;
--						if grant(6)='1' then 
--							port_rd_en6<='1';
--						else
--							port_rd_en6<='0';
--						end if;
--						if grant(7)='1' then 
--							port_rd_en7<='1';
--						else
--							port_rd_en7<='0';
--						end if;
--						if grant(8)='1' then 
--							port_rd_en8<='1';
--						else
--							port_rd_en8<='0';
--						end if;
--						if grant(9)='1' then 
--							port_rd_en9<='1';
--						else
--							port_rd_en9<='0';
--						end if;
--						if grant(10)='1' then 
--							port_rd_en10<='1';
--						else
--							port_rd_en10<='0';
--						end if;
--						if grant(11)='1' then 
--							port_rd_en11<='1';
--						else
--							port_rd_en11<='0';
--						end if;
--						if grant(12)='1' then 
--							port_rd_en12<='1';
--						else
--							port_rd_en12<='0';
--						end if;
--						if grant(13)='1' then 
--							port_rd_en13<='1';
--						else
--							port_rd_en13<='0';
--						end if;
--						if grant(14)='1' then 
--							port_rd_en14<='1';
--						else
--							port_rd_en14<='0';
--						end if;
--						if grant(15)='1' then 
--							port_rd_en15<='1';
--						else
--							port_rd_en15<='0';
--						end if;		
--				--info_out <= port_dout0;
--				debug <= 3;
--	
--			elsif count=128 then
--				ack <= '0';
--				miss := '0';
--				count:=0;
--				found := '1';
--				init:= '1';
--				debug <= 4;
--			elsif count=-1 then
--				ack <= '0';
--				count:= count+1;
--			elsif count=0 then
--				init:= '1';
--				ack <= '0';
--				port_rd_en0<='0';
--				port_rd_en1<='0';
--				port_rd_en2<='0';
--				port_rd_en3<='0';
--				port_rd_en4<='0';
--				port_rd_en5<='0';
--				port_rd_en6<='0';
--				port_rd_en7<='0';
--				port_rd_en8<='0';
--				port_rd_en9<='0';
--				port_rd_en10<='0';
--				port_rd_en11<='0';
--				port_rd_en12<='0';
--				port_rd_en13<='0';
--				port_rd_en14<='0';
--				port_rd_en15<='0';
--				
--				
--				
--					if grant1(0)='1' then
--						info := port_dout0;
--						info_out <= port_dout0;
--					elsif grant1(1)='1' then
--						info := port_dout1;
--						info_out <= port_dout1;
--					elsif grant1(2)='1' then
--						info := port_dout2;
--						info_out <= port_dout2;
--					elsif grant1(3)='1' then
--						info := port_dout3;
--						info_out <= port_dout3;
--					elsif grant1(4)='1' then
--						info := port_dout4;
--						info_out <= port_dout4;
--					elsif grant1(5)='1' then
--						info := port_dout5;
--						info_out <= port_dout5;
--					elsif grant1(6)='1' then
--						info := port_dout6;
--						info_out <= port_dout6;
--					elsif grant1(7)='1' then
--						info := port_dout7;
--						info_out <= port_dout7;
--					elsif grant1(8)='1' then
--						info := port_dout8;
--						info_out <= port_dout8;
--					elsif grant1(9)='1' then
--						info := port_dout9;
--						info_out <= port_dout9;
--					elsif grant1(10)='1' then
--						info := port_dout10;
--						info_out <= port_dout10;
--					elsif grant1(11)='1' then
--						info := port_dout11;
--						info_out <= port_dout11;
--					elsif grant1(12)='1' then
--						info := port_dout12;
--						info_out <= port_dout12;
--					elsif grant1(13)='1' then
--						info := port_dout13;
--						info_out <= port_dout13;
--					elsif grant1(14)='1' then
--						info := port_dout14;
--						info_out <= port_dout14;
--					elsif grant1(15)='1' then
--						info := port_dout15;
--						info_out <= port_dout15;
--					end if;
--					--info_out <= port_dout0;
--					--info_out <= info;
--					
--				enb <= "11111111";
--				addrb1 <= std_logic_vector(to_unsigned(count,7));
--				addrb2 <= std_logic_vector(to_unsigned(count,7));
--				addrb3 <= std_logic_vector(to_unsigned(count,7));
--				addrb4 <= std_logic_vector(to_unsigned(count,7));
--				addrb5 <= std_logic_vector(to_unsigned(count,7));
--				addrb6 <= std_logic_vector(to_unsigned(count,7));
--				addrb7 <= std_logic_vector(to_unsigned(count,7));
--				addrb8 <= std_logic_vector(to_unsigned(count,7));
--				count:= count+1;
--				miss := '0';
--				debug <= 10;
--			elsif debug = 10 then
--				debug <= to_integer(unsigned(doutb1(149 downto 22)));
--			else
--				init:= '1';
--				ack <= '0';
--				enb <= "11111111";
--				miss := '0';
--				
--				addrb1 <= std_logic_vector(to_unsigned(count,7));
--				addrb2 <= std_logic_vector(to_unsigned(count,7));
--				addrb3 <= std_logic_vector(to_unsigned(count,7));
--				addrb4 <= std_logic_vector(to_unsigned(count,7));
--				addrb5 <= std_logic_vector(to_unsigned(count,7));
--				addrb6 <= std_logic_vector(to_unsigned(count,7));
--				addrb7 <= std_logic_vector(to_unsigned(count,7));
--				addrb8 <= std_logic_vector(to_unsigned(count,7));
--				debug <= 10;
----				if count = 6 then
----					debug <= to_integer(unsigned(doutb1(149 downto 22)));
----				else 
----					debug <= 6;
----				end if;
--				if doutb1(149 downto 22) = info then
--					miss := '1';
--					found := '1';
--					matched_offset := doutb1(20 downto 11);
--				elsif doutb2(149 downto 22) = info then
--					miss := '1';
--					found := '1';
--					matched_offset := doutb2(20 downto 11);
--				elsif doutb3(149 downto 22) = info then
--					miss := '1';
--					found := '1';
--					matched_offset := doutb3(20 downto 11);
--				elsif doutb4(149 downto 22) = info then
--					miss := '1';
--					found := '1';
--					matched_offset := doutb4(20 downto 11);
--				elsif doutb5(149 downto 22) = info then
--					miss := '1';
--					found := '1';
--					matched_offset := doutb5(20 downto 11);
--				elsif doutb6(149 downto 22) = info then
--					miss := '1';
--					found := '1';
--					matched_offset := doutb6(20 downto 11);
--				elsif doutb7(149 downto 22) = info then
--					miss := '1';
--					found := '1';
--					matched_offset := doutb7(20 downto 11);
--				elsif doutb8(149 downto 22) = info then
--					miss := '1';
--					found := '1';
--					matched_offset := doutb8(20 downto 11);
--				else
--					miss:='0';
--					found:='0';
--				end if;
--				
--				if found='1' then
--					init:='0';
--					--ongoing := '0';
--				end if;
--				count:= count+1;
--				--info_out <= port_dout0;
--				--info_out <= info;
--				--debug <= 6;
--			end if;		
--		end if;
--	end process;
	
--			  
--	process(lkup_info_wr, flow_tag_wr)
--
--	variable table : std_logic_vector(2 downto 0);
--	variable index : std_logic_vector(6 downto 0);
--	variable padding : std_logic_vector(21 downto 0) := (others => '0');
--	--variable tb_store: std_logic_vector(2 downto 0);
--	variable data : std_logic_vector(149 downto 0);
--	
--	variable flag : std_logic := '0';
--	--variable flow_data : std_logic_vector(149 downto 0);
--
--	begin
----
--if rising_edge(clk) then
----	if flow_tag_wr = '1' then 
----
----	matched_offset_out <= "0000000000";
----		table := flow_addr(9 downto 7);
----		index := flow_addr(6 downto 0);
--	--	tb_store := table;
--		--if flag = '0' then 
--			--flag := '1';
----			if table = "000" then
----				enb(0) <= '1';
----    			addrb1 <= index;
----			elsif table = "001" then
------				enb(1) <= '1';
------				addrb2 <= index;
----
----			elsif table = "010" then
----				enb(2) <= '1';
----				addrb3 <= index;
----
----			elsif table = "011" then
----				enb(3) <= '1';
----				addrb4 <= index;
----
----			elsif table = "100" then
----				enb(4) <= '1';
----				addrb5 <= index;
----
----			elsif table = "101" then
----				enb(5) <= '1';
----				addrb6<= index;
----
----			elsif table = "110" then
----				enb(6) <= '1';
----				addrb7 <= index;
----
----			elsif table = "111" then
----				enb(7) <= '1';
----				addrb8 <= index;
----			end if;
--			
----		else
----		flag := '0';
----			if table = "000" then
----				data := doutb1;
----				data := data(149 downto 22) & '0' & offset & padding(10 downto 0);
----			ena(0) <= '1';
----			addra1 <= index;
----			dina1 <= data;
----			wea1 <= "1";
----				
----			elsif table = "001" then
----				data := doutb2;
----				data := data(149 downto 22) & '0' & offset & padding(10 downto 0);
----			ena(0) <= '1';
----			addra1 <= index;
----			dina1 <= data;
----			wea1 <= "1";
----
----			elsif table = "010" then
----				data := doutb3;
----				data := data(149 downto 22) & '0' & offset & padding(10 downto 0);
----			ena(0) <= '1';
----			addra1 <= index;
----			dina1 <= data;
----			wea1 <= "1";
----
----			elsif table = "011" then
----				data := doutb4;
----				data := data(149 downto 22) & '0' & offset & padding(10 downto 0);
----			ena(0) <= '1';
----			addra1 <= index;
----			dina1 <= data;
----			wea1 <= "1";
----
----			elsif table = "100" then
----				data := doutb5;
----				data := data(149 downto 22) & '0' & offset & padding(10 downto 0);
----			ena(0) <= '1';
----			addra1 <= index;
----			dina1 <= data;
----			wea1 <= "1";
----			
----			elsif table = "101" then
----				data := doutb6;
----				data := data(149 downto 22) & '0' & offset & padding(10 downto 0);
----			ena(0) <= '1';
----			addra1 <= index;
----			dina1 <= data;
----			wea1 <= "1";
----		
----			elsif table = "110" then
----				data := doutb7;
----				data := data(149 downto 22) & '0' & offset & padding(10 downto 0);
----			ena(0) <= '1';
----			addra1 <= index;
----			dina1 <= data;
----			wea1 <= "1";
----				
----			elsif table = "111" then
----				data := doutb8;
----				data := data(149 downto 22) & '0' & offset & padding(10 downto 0);
----			ena(0) <= '1';
----			addra1 <= index;
----			dina1 <= data;
----			wea1 <= "1";
----			end if;
--			
--			
--			--matched_flow_tag(255 downto 101) <= data; 
--			
----			
----			enas <= '1';
----			weas <= "1";
----			addras <= offset;
----			dinas <= flow_tag; 
----			offset <= std_logic_vector(to_unsigned(to_integer(unsigned(offset)) + 1, 10));
------		
------			
----			
--	--end if;
--	if lkup_info_wr = '1' then 
--		table := flow_addr(9 downto 7);
--		index := flow_addr(6 downto 0);
--					matched_tag_valid <= "00000000";
--
--		
--		if table = "000" then
--			ena(0) <= '1';
--			wea1 <= "1";
--			addra1 <= index;
--			dina1 <= flow_lkup_info & padding ; 
----			matched_tag_valid(7 downto 0) <= index;
----		matched_flow_tag(255 downto 128) <= flow_lkup_info;
----		
--			 
--		elsif table = "001" then
--			matched_tag_valid <= "00000000";
--			ena(1) <= '1';
--			wea2 <= "1";
--			addra2 <= index;
--			dina2 <= flow_lkup_info & padding; 
--
--		elsif table = "010" then
--			ena(2) <= '1';
--			wea3 <= "1";
--			addra3 <= index;
--			dina3 <= flow_lkup_info & padding; 
--
--		elsif table = "011" then
--			ena(3) <= '1';
--			wea4 <= "1";
--			addra4 <= index;
--			dina4 <= flow_lkup_info & padding; 
--
--		elsif table = "100" then
--			ena(4) <= '1';
--			wea5 <= "1";
--			addra5 <= index;
--			dina5 <= flow_lkup_info & padding;
--		elsif table = "101" then
--			ena(5) <= '1';
--			wea6 <= "1";
--			addra6 <= index;
--			dina6 <= flow_lkup_info & padding;
--		elsif table = "110" then
--			ena(6) <= '1';
--			wea7 <= "1";
--			addra7 <= index;
--			dina7 <= flow_lkup_info & padding;
--		elsif table = "111" then
--			ena(7) <= '1';
--			wea8 <= "1";
--			addra8 <= index;
--			dina8 <= flow_lkup_info & padding;
--		end if;
--	end if;
--end if;
----	end if;
--	end process;
----
----
--
----	process(clk)
----	
----	  
----
------	           flow_tag : in  STD_LOGIC_VECTOR (255 downto 0);
------	           flow_tag_wr : in  STD_LOGIC;
------
------	           active_flow : in  STD_LOGIC;
------
------	           active_flow_wr : in  STD_LOGIC;
------	           lkup_miss : out  STD_LOGIC;
------	           flow_priority : out  STD_LOGIC_VECTOR (2 downto 0);
------				  --lkup_flow_id : out  STD_LOGIC_VECTOR (7 downto 0);
------	           matched_tag_valid : out  STD_LOGIC_VECTOR (7 downto 0);
------	           matched_flow_tag : out  STD_LOGIC_VECTOR (255 downto 0);
------				  clk : in std_logic);
----	variable table : std_logic_vector(2 downto 0);
----	variable index : std_logic_vector(6 downto 0);
----	variable padding : std_logic_vector(21 downto 0) := (others => '0');
----	--variable flag : std_logic : '0';
----	variable flow_data : std_logic_vector(149 downto 0);
----	begin
----	if rising_edge(clk) then
----	
----	if lkup_info_wr = '1' then 
----		table := flow_addr(9 downto 7);
----		index := flow_addr(6 downto 0);
----		
----		if table = "000" then
----			ena(0) <= '1';
----			wea1 <= "1";
----			addra1 <= index;
----			dina1 <= flow_lkup_info & padding ; 
------			matched_tag_valid(7 downto 0) <= index;
------		matched_flow_tag(255 downto 128) <= flow_lkup_info;
------		
----			 
----		elsif table = "001" then
----			ena(1) <= '1';
----			wea2 <= "1";
----			addra2 <= index;
----			dina2 <= flow_lkup_info & padding; 
----
----		elsif table = "010" then
----			ena(2) <= '1';
----			wea3 <= "1";
----			addra3 <= index;
----			dina3 <= flow_lkup_info & padding; 
----
----		elsif table = "011" then
----			ena(3) <= '1';
----			wea4 <= "1";
----			addra4 <= index;
----			dina4 <= flow_lkup_info & padding; 
----
----		elsif table = "100" then
----			ena(4) <= '1';
----			wea5 <= "1";
----			addra5 <= index;
----			dina5 <= flow_lkup_info & padding;
----		elsif table = "101" then
----			ena(5) <= '1';
----			wea6 <= "1";
----			addra6 <= index;
----			dina6 <= flow_lkup_info & padding;
----		elsif table = "110" then
----			ena(6) <= '1';
----			wea7 <= "1";
----			addra7 <= index;
----			dina7 <= flow_lkup_info & padding;
----		elsif table = "111" then
----			ena(7) <= '1';
----			wea8 <= "1";
----			addra8 <= index;
----			dina8 <= flow_lkup_info & padding;
----		end if;
----	end if;
----	end if;
----	end process;
--			
--	
----		
--	process(clk)
--	begin
--	if rising_edge(clk) then
--
--
--		enb(0) <= '1';
--	--wea1 <= "0";
--		addrb1 <= "0000001";
--		info_out <= doutb1(149 downto 22);
--	
--	end if;
--	--matched_flow_tag <= doutbs;
--		
--	end process;
--
--
	end Behavioral;
