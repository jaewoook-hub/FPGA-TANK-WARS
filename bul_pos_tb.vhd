library IEEE;
library STD; 

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all; 
use std.textio.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;


entity bul_pos_tb is
end entity bul_pos_tb;


architecture behavioral of bul_pos_tb is
	
	component bul_pos is
		port (
			clk, rst, dir						: in std_logic;
			bullet_fired, bullet_hit 		: in std_logic;
			curr_bullet_active				: in std_logic;
			curr_bullet_x, curr_bullet_y	: in integer;
			curr_tank_x, curr_tank_y		: in integer;
			new_bullet_x, new_bullet_y		: out integer;
			new_bullet_active					: out std_logic
		);
	end component bul_pos;
		
			signal clk : std_logic;
			signal rst : std_logic;
			signal dir : std_logic;
			signal bullet_fired : std_logic;
			signal bullet_hit : std_logic;
			signal curr_bullet_active : std_logic;
			signal curr_bullet_x, curr_bullet_y	: integer;
			signal curr_tank_x, curr_tank_y	: integer;
			signal new_bullet_x, new_bullet_y	: integer;
			signal new_bullet_active : std_logic;
	
begin
	
	bull_pos : bul_pos
		port map(
			clk => clk,
			rst => rst,
			dir => dir, 
			bullet_fired => bullet_fired,
			bullet_hit => bullet_hit,
			curr_bullet_active => curr_bullet_active,
			curr_bullet_x => curr_bullet_x,
			curr_bullet_y => curr_bullet_y,
			curr_tank_x => curr_tank_x,
			curr_tank_y => curr_tank_y,
			new_bullet_x => new_bullet_x,
			new_bullet_y => new_bullet_y,
			new_bullet_active => new_bullet_active
		);
   
   bull_pos_process: process is
   begin
		rst <= '0';
		clk <= '0';
		dir <= '0';
		curr_bullet_active <= '1';
		curr_bullet_x <= 120;
		curr_bullet_y <= 300;
		curr_tank_x <= 400;
		curr_tank_y <= 0; 
		wait for 5 ns;
		rst <= '1';
		wait for 5 ns;
		-- test update bullet + bullet doesn't exist -- 
		rst <= '0';
		clk <= not clk; 
		curr_bullet_active <= '1';
		curr_bullet_x <= 320;
		curr_bullet_y <= 60;
		curr_tank_x <= 320;
		curr_tank_y <= 0; 
		wait for 5 ns;
		clk <= not clk;
		wait for 5 ns;
		clk <= not clk;
		curr_bullet_x <= 320;
		curr_bullet_y <= new_bullet_y;
		wait for 5 ns;
		for i in 0 to 500 loop 
			clk <= not clk;
			wait for 5 ns;
			clk <= not clk;
			curr_bullet_x <= new_bullet_x;
			curr_bullet_y <= new_bullet_y;
			wait for 5 ns;
		end loop;
		wait;

   end process;
   
end architecture behavioral;