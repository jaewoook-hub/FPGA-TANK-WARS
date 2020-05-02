library IEEE;
library STD; 

use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_textio.all; 
use std.textio.all;
USE  IEEE.STD_LOGIC_ARITH.all;
USE  IEEE.STD_LOGIC_UNSIGNED.all;
use work.tank_package.all;


entity tank_game_tb is
end entity tank_game_tb;


architecture behavioral of tank_game_tb is

	component tank_game is
		port(
		clk										: in std_logic;
		reset										: in std_logic;
		keyboard_clk, keyboard_data		: in std_logic;
		LCD_RS, LCD_E, LCD_ON, RESET_LED, SEC_LED		: OUT	STD_LOGIC;
		LCD_RW						: BUFFER STD_LOGIC;
		DATA_BUS				: INOUT	STD_LOGIC_VECTOR(7 DOWNTO 0);
		score_disp_a, score_disp_b : out std_logic_vector(6 downto 0);
		
		VGA_RED, VGA_GREEN, VGA_BLUE 						: out std_logic_vector(7 downto 0); 
		HORIZ_SYNC, VERT_SYNC, VGA_BLANK, VGA_CLK		: out std_logic
		);
	end component tank_game;
	
		signal clk										: std_logic;
		signal reset										: std_logic;
		signal keyboard_clk, keyboard_data		: std_logic;
		signal LCD_RS, LCD_E, LCD_ON, RESET_LED, SEC_LED		: STD_LOGIC;
		signal LCD_RW						: STD_LOGIC;
		signal DATA_BUS				: STD_LOGIC_VECTOR(7 DOWNTO 0);
		signal score_disp_a, score_disp_b : std_logic_vector(6 downto 0);
		signal VGA_RED, VGA_GREEN, VGA_BLUE 						: std_logic_vector(7 downto 0); 
		signal HORIZ_SYNC, VERT_SYNC, VGA_BLANK, VGA_CLK		: std_logic;
	
begin
	
	tank_game_go : tank_game
		port map(
			clk	=> clk,									
			reset => reset,									
			keyboard_clk => keyboard_clk, 
			keyboard_data => keyboard_data,		
			LCD_RS => LCD_RS, 
			LCD_E => LCD_E, 
			LCD_ON => LCD_ON, 
			RESET_LED => RESET_LED, 
			SEC_LED	=> SEC_LED,	
			LCD_RW => LCD_RW,					
			DATA_BUS => DATA_BUS,				
			score_disp_a => score_disp_a, 
			score_disp_b => score_disp_b,
			VGA_RED => VGA_RED, 
			VGA_GREEN => VGA_GREEN, 
			VGA_BLUE => VGA_BLUE, 						
			HORIZ_SYNC => HORIZ_SYNC, 
			VERT_SYNC => VERT_SYNC, 
			VGA_BLANK => VGA_BLANK, 
			VGA_CLK => VGA_CLK	
		);
		
   tank_game_process: process is
   begin
		clk <= '0';
		keyboard_clk <= '0';
		keyboard_data <= '0';
		reset <= '1';
		wait for 5 ns; 
		clk <= not clk;
		keyboard_clk <= not keyboard_clk;
		keyboard_data <= '0';
		reset <= '0';
		wait for 5 ns; 
		clk <= not clk;
		keyboard_clk <= not keyboard_clk;
		keyboard_data <= '1';
		reset <= '0';
		wait for 5 ns; 
		clk <= not clk;
		keyboard_clk <= not keyboard_clk;
		keyboard_data <= '1';
		reset <= '0';
		wait for 5 ns; 
		clk <= not clk;
		keyboard_clk <= not keyboard_clk;
		keyboard_data <= '1';
		reset <= '0';
		wait for 5 ns; 
		clk <= not clk;
		keyboard_clk <= not keyboard_clk;
		keyboard_data <= '1';
		reset <= '0';
		wait for 5 ns; 
		clk <= not clk;
		keyboard_clk <= not keyboard_clk;
		keyboard_data <= '1';
		reset <= '0';
		wait for 5 ns; 
		clk <= not clk;
		keyboard_clk <= not keyboard_clk;
		keyboard_data <= '1';
		reset <= '0';
		wait for 5 ns; 
		wait;
   end process tank_game_process;

end architecture behavioral;
