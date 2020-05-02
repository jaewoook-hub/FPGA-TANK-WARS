library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.std_logic_arith.all;
use IEEE.std_logic_unsigned.all;

package tank_package is

	-- Mini Project Components
	component VGA_top_level is
	port(
			CLOCK_50 													: in std_logic;
			RESET_N														: in std_logic;
			tank_a, tank_b												: in integer;
			score_a, score_b											: in integer;
			bullet_a_x, bullet_a_y, bullet_b_x, bullet_b_y	: in integer;
	
			--VGA 
			VGA_RED, VGA_GREEN, VGA_BLUE 							: out std_logic_vector(7 downto 0); 
			HORIZ_SYNC, VERT_SYNC, VGA_BLANK, VGA_CLK			: out std_logic

		);
	end component VGA_top_level;
	
	component pixelGenerator is
	port(
			clk, ROM_clk, rst_n, video_on, eof 					: in std_logic;
			pixel_row, pixel_column						    		: in std_logic_vector(9 downto 0);
			tank_a_x, tank_b_x										: in integer;
			score_a, score_b											: in integer;
			bullet_a_y, bullet_b_y, bullet_a_x, bullet_b_x 	: in integer;
			red_out, green_out, blue_out							: out std_logic_vector(7 downto 0)
		);
	end component pixelGenerator;
	
	component VGA_SYNC is
		port(
				clock_50Mhz										: in std_logic;
				horiz_sync_out, vert_sync_out, video_on, pixel_clock, eof	: out std_logic;												
				pixel_row, pixel_column						: out std_logic_vector(9 downto 0)
			);
	end component VGA_SYNC;
	
	component de2lcd IS
		PORT(reset, clk_50Mhz			: IN	STD_LOGIC;
			winner							: in integer;
			LCD_RS, LCD_E, LCD_ON, RESET_LED, SEC_LED		: OUT	STD_LOGIC;
			LCD_RW							: BUFFER STD_LOGIC;
			DATA_BUS							: INOUT	STD_LOGIC_VECTOR(7 DOWNTO 0));
	end component de2lcd;
	
	component ps2 is
		port( 	keyboard_clk, keyboard_data, clock_50MHz ,
			reset : in std_logic;
			scan_code : out std_logic_vector( 7 downto 0 );
			scan_readyo : out std_logic;
--			hist3 : out std_logic_vector(7 downto 0);
			hist2 : out std_logic_vector(7 downto 0);
			hist1 : out std_logic_vector(7 downto 0);
			hist0 : out std_logic_vector(7 downto 0)
		);
	end component ps2;
	
	-- Tank Components
	component tank is
		port(
			clk, rst 	: in std_logic;
			move 		: out integer
		);
	end component tank;

	component tank_clock is
		port (
			clk, rst		: in std_logic;
			speed			: in integer;
			tank_clk		: out std_logic
		);
	end component;

	component bullet_clock is
		port (
			clk, rst			: in std_logic;
			bullet_clk		: out std_logic
		);
	end component;
	
	component bullet_position is
		port (
			clk: in std_logic;
			reset: in std_logic;
			direction: in std_logic;
			bullet_fired: in std_logic;
			bullet_hit: in std_logic;
			current_bullet_exists: in std_logic;
			current_bullet_position_x, current_bullet_position_y	: in integer;
			current_tank_position_x, current_tank_position_y	: in integer;
			new_bullet_position_x, new_bullet_position_y	: out integer;
			new_bullet_exists: out std_logic
		);
	end component;

	component collision_detector is
		port (
			box1_left, box1_right, box1_top, box1_bottom : in integer;
			box2_left, box2_right, box2_top, box2_bottom : in integer;
			collision : out std_logic
		);
	end component;
	
	component bullet_hit is
		port (
			temp1_x, temp1_y 	: in integer;
			temp2_x, temp2_y	: in integer;
			hit 				: out std_logic
		);
	end component;
	
	component update_clk_val is
		port (
			clk 							: in std_logic;
			check_a, check_b			: in std_logic;
			d_a1, d_a2, d_b1, d_b2	: in integer;
			q_a1, q_a2, q_b1, q_b2	: inout integer;
			exist_a, exist_b			: inout std_logic
		);
	end component update_clk_val;
	
	component update_score is
		port (
			clk, rst, marked1, marked2		: in std_logic;
			score1, score2						: inout integer;
			game_over							: inout integer;
			score_out1, score_out2			: out std_logic_vector(6 downto 0)
		);
	end component update_score;
	
	component speedup_controls is
		port (
			scan_readyo_signal, rst : in std_logic;
			hist0, hist1, hist2		: in std_logic_vector(7 downto 0);
			bullet_1, bullet_2		: inout std_logic;
			speed_a, speed_b			: inout integer
		);
	end component speedup_controls;

end package tank_package;

package body tank_package is
end package body tank_package;
