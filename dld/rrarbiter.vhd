----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:47:20 04/03/2019 
-- Design Name: 
-- Module Name:    rrarbiter - Behavioral 
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
use IEEE.NUMERIC_STD.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity rrarbiter is
    Port ( clk : in  STD_LOGIC;
           rst_n : in  STD_LOGIC;
           req : in  STD_LOGIC_VECTOR (15 downto 0);
           ack : in  STD_LOGIC;
           grant : out  STD_LOGIC_VECTOR (15 downto 0)
			  );
end rrarbiter;

architecture Behavioral of rrarbiter is
signal grant_q, pre_req, sel_gnt, isol_lsb, mask_pre, win : std_logic_vector(15 downto 0);
begin

grant<=grant_q;
mask_pre <= req and not (std_logic_vector (unsigned(pre_req)-1) or pre_req);
sel_gnt <= mask_pre and std_logic_vector(unsigned(not(mask_pre)) + 1);
isol_lsb <= req and std_logic_vector(unsigned(not(req)) + 1);
win <= sel_gnt when mask_pre /= (15 downto 0 => '0') else isol_lsb;

process (clk, rst_n)
	begin
		if rst_n = '0' then
			pre_req <= (others => '0');
			grant_q <= (others => '0');
		elsif rising_edge(clk) then
			--grant_q <= grant_q;
			--pre_req <= pre_req;
			
			if grant_q = (15 downto 0 => '0') or ack = '1' then
				if win/= (15 downto 0 => '0') then
					pre_req <= win;
				end if;
				grant_q <= win;
			end if;
		end if;
	end process;

end Behavioral;

