-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- VENDOR "Altera"
-- PROGRAM "Quartus II 64-Bit"
-- VERSION "Version 13.1.0 Build 162 10/23/2013 SJ Web Edition"

-- DATE "04/06/2024 10:48:57"

-- 
-- Device: Altera EP4CGX15BF14C6 Package FBGA169
-- 

-- 
-- This VHDL file should be used for ModelSim-Altera (VHDL) only
-- 

LIBRARY ALTERA;
LIBRARY CYCLONEIV;
LIBRARY IEEE;
LIBRARY STD;
USE ALTERA.ALTERA_PRIMITIVES_COMPONENTS.ALL;
USE CYCLONEIV.CYCLONEIV_COMPONENTS.ALL;
USE IEEE.STD_LOGIC_1164.ALL;
USE IEEE.STD_LOGIC_ARITH.ALL;
USE STD.STANDARD.ALL;

ENTITY 	Distributeur_Cafe IS
    PORT (
	clk : IN std_logic;
	reset : IN std_logic;
	bouton_Cafe_Noir : IN std_logic;
	bouton_Cafe_Lait : IN std_logic;
	bouton_Cappuccino : IN std_logic;
	bouton_Lait_Chocolat : IN std_logic;
	piece_1DH : IN std_logic;
	piece_2DH : IN std_logic;
	piece_5DH : IN std_logic;
	piece_10DH : IN std_logic;
	cafe_pret : OUT std_logic;
	monnaie_insuffisante : OUT std_logic;
	monnaie_exacte : OUT std_logic;
	monnaie_excedentaire : OUT std_logic;
	reste_monnaie : OUT STD.STANDARD.integer range 0 TO 10;
	somme_monnaie : OUT STD.STANDARD.integer range 0 TO 10;
	cafe_delivre : OUT std_logic
	);
END Distributeur_Cafe;

-- Design Ports Information
-- cafe_pret	=>  Location: PIN_N6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monnaie_insuffisante	=>  Location: PIN_L9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monnaie_exacte	=>  Location: PIN_L5,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- monnaie_excedentaire	=>  Location: PIN_K13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reste_monnaie[0]	=>  Location: PIN_N8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reste_monnaie[1]	=>  Location: PIN_L7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reste_monnaie[2]	=>  Location: PIN_K8,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reste_monnaie[3]	=>  Location: PIN_K9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- somme_monnaie[0]	=>  Location: PIN_M13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- somme_monnaie[1]	=>  Location: PIN_K12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- somme_monnaie[2]	=>  Location: PIN_K11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- somme_monnaie[3]	=>  Location: PIN_N13,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- cafe_delivre	=>  Location: PIN_M6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bouton_Cafe_Noir	=>  Location: PIN_N10,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- clk	=>  Location: PIN_J7,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- reset	=>  Location: PIN_J6,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bouton_Cappuccino	=>  Location: PIN_N11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bouton_Cafe_Lait	=>  Location: PIN_L11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- bouton_Lait_Chocolat	=>  Location: PIN_N9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- piece_10DH	=>  Location: PIN_N12,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- piece_5DH	=>  Location: PIN_M11,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- piece_1DH	=>  Location: PIN_M9,	 I/O Standard: 2.5 V,	 Current Strength: Default
-- piece_2DH	=>  Location: PIN_K10,	 I/O Standard: 2.5 V,	 Current Strength: Default


ARCHITECTURE structure OF Distributeur_Cafe IS
SIGNAL gnd : std_logic := '0';
SIGNAL vcc : std_logic := '1';
SIGNAL unknown : std_logic := 'X';
SIGNAL devoe : std_logic := '1';
SIGNAL devclrn : std_logic := '1';
SIGNAL devpor : std_logic := '1';
SIGNAL ww_devoe : std_logic;
SIGNAL ww_devclrn : std_logic;
SIGNAL ww_devpor : std_logic;
SIGNAL ww_clk : std_logic;
SIGNAL ww_reset : std_logic;
SIGNAL ww_bouton_Cafe_Noir : std_logic;
SIGNAL ww_bouton_Cafe_Lait : std_logic;
SIGNAL ww_bouton_Cappuccino : std_logic;
SIGNAL ww_bouton_Lait_Chocolat : std_logic;
SIGNAL ww_piece_1DH : std_logic;
SIGNAL ww_piece_2DH : std_logic;
SIGNAL ww_piece_5DH : std_logic;
SIGNAL ww_piece_10DH : std_logic;
SIGNAL ww_cafe_pret : std_logic;
SIGNAL ww_monnaie_insuffisante : std_logic;
SIGNAL ww_monnaie_exacte : std_logic;
SIGNAL ww_monnaie_excedentaire : std_logic;
SIGNAL ww_reste_monnaie : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_somme_monnaie : std_logic_vector(3 DOWNTO 0);
SIGNAL ww_cafe_delivre : std_logic;
SIGNAL \reset~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \clk~inputclkctrl_INCLK_bus\ : std_logic_vector(3 DOWNTO 0);
SIGNAL \cafe_pret~output_o\ : std_logic;
SIGNAL \monnaie_insuffisante~output_o\ : std_logic;
SIGNAL \monnaie_exacte~output_o\ : std_logic;
SIGNAL \monnaie_excedentaire~output_o\ : std_logic;
SIGNAL \reste_monnaie[0]~output_o\ : std_logic;
SIGNAL \reste_monnaie[1]~output_o\ : std_logic;
SIGNAL \reste_monnaie[2]~output_o\ : std_logic;
SIGNAL \reste_monnaie[3]~output_o\ : std_logic;
SIGNAL \somme_monnaie[0]~output_o\ : std_logic;
SIGNAL \somme_monnaie[1]~output_o\ : std_logic;
SIGNAL \somme_monnaie[2]~output_o\ : std_logic;
SIGNAL \somme_monnaie[3]~output_o\ : std_logic;
SIGNAL \cafe_delivre~output_o\ : std_logic;
SIGNAL \clk~input_o\ : std_logic;
SIGNAL \clk~inputclkctrl_outclk\ : std_logic;
SIGNAL \piece_5DH~input_o\ : std_logic;
SIGNAL \piece_2DH~input_o\ : std_logic;
SIGNAL \piece_1DH~input_o\ : std_logic;
SIGNAL \total_insere~11_combout\ : std_logic;
SIGNAL \piece_10DH~input_o\ : std_logic;
SIGNAL \total_insere~8_combout\ : std_logic;
SIGNAL \total_insere~12_combout\ : std_logic;
SIGNAL \reset~input_o\ : std_logic;
SIGNAL \reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \total_insere[1]~19_combout\ : std_logic;
SIGNAL \bouton_Cafe_Noir~input_o\ : std_logic;
SIGNAL \total_insere[2]~9_combout\ : std_logic;
SIGNAL \total_insere[2]~18_combout\ : std_logic;
SIGNAL \total_insere[2]~10_combout\ : std_logic;
SIGNAL \cafe_delivre~2_combout\ : std_logic;
SIGNAL \total_insere~20_combout\ : std_logic;
SIGNAL \total_insere~21_combout\ : std_logic;
SIGNAL \total_insere~13_combout\ : std_logic;
SIGNAL \total_insere~14_combout\ : std_logic;
SIGNAL \total_insere~15_combout\ : std_logic;
SIGNAL \total_insere~16_combout\ : std_logic;
SIGNAL \total_insere~17_combout\ : std_logic;
SIGNAL \cafe_delivre~5_combout\ : std_logic;
SIGNAL \bouton_Lait_Chocolat~input_o\ : std_logic;
SIGNAL \bouton_Cafe_Lait~input_o\ : std_logic;
SIGNAL \bouton_Cappuccino~input_o\ : std_logic;
SIGNAL \LessThan1~0_combout\ : std_logic;
SIGNAL \cafe_delivre~3_combout\ : std_logic;
SIGNAL \cafe_delivre~4_combout\ : std_logic;
SIGNAL \cafe_delivre~reg0_q\ : std_logic;
SIGNAL \monnaie_insuffisante~0_combout\ : std_logic;
SIGNAL \reste_monnaie~2_combout\ : std_logic;
SIGNAL \LessThan0~0_combout\ : std_logic;
SIGNAL \monnaie_insuffisante~1_combout\ : std_logic;
SIGNAL \monnaie_insuffisante~2_combout\ : std_logic;
SIGNAL \monnaie_insuffisante~reg0_q\ : std_logic;
SIGNAL \monnaie_exacte~0_combout\ : std_logic;
SIGNAL \monnaie_exacte~1_combout\ : std_logic;
SIGNAL \monnaie_exacte~reg0_q\ : std_logic;
SIGNAL \monnaie_excedentaire~0_combout\ : std_logic;
SIGNAL \monnaie_excedentaire~reg0_q\ : std_logic;
SIGNAL \reste_monnaie~3_combout\ : std_logic;
SIGNAL \reste_monnaie~4_combout\ : std_logic;
SIGNAL \process_0~0_combout\ : std_logic;
SIGNAL \reste_monnaie~5_combout\ : std_logic;
SIGNAL \reste_monnaie~6_combout\ : std_logic;
SIGNAL \reste_monnaie[0]~reg0_q\ : std_logic;
SIGNAL \reste_monnaie[1]~7_combout\ : std_logic;
SIGNAL \Add4~0_combout\ : std_logic;
SIGNAL \reste_monnaie[1]~0_combout\ : std_logic;
SIGNAL \reste_monnaie[1]~8_combout\ : std_logic;
SIGNAL \reste_monnaie[1]~9_combout\ : std_logic;
SIGNAL \reste_monnaie[1]~10_combout\ : std_logic;
SIGNAL \reste_monnaie[1]~reg0_q\ : std_logic;
SIGNAL \Add5~0_combout\ : std_logic;
SIGNAL \reste_monnaie[2]~1_combout\ : std_logic;
SIGNAL \Add4~1_combout\ : std_logic;
SIGNAL \reste_monnaie[2]~reg0_q\ : std_logic;
SIGNAL \reste_monnaie~12_combout\ : std_logic;
SIGNAL \reste_monnaie~11_combout\ : std_logic;
SIGNAL \reste_monnaie~13_combout\ : std_logic;
SIGNAL \reste_monnaie[3]~reg0_q\ : std_logic;
SIGNAL \somme_monnaie[0]~reg0feeder_combout\ : std_logic;
SIGNAL \somme_monnaie[0]~reg0_q\ : std_logic;
SIGNAL \somme_monnaie[1]~reg0feeder_combout\ : std_logic;
SIGNAL \somme_monnaie[1]~reg0_q\ : std_logic;
SIGNAL \somme_monnaie[2]~reg0feeder_combout\ : std_logic;
SIGNAL \somme_monnaie[2]~reg0_q\ : std_logic;
SIGNAL \somme_monnaie[3]~reg0feeder_combout\ : std_logic;
SIGNAL \somme_monnaie[3]~reg0_q\ : std_logic;
SIGNAL total_insere : std_logic_vector(3 DOWNTO 0);
SIGNAL \ALT_INV_reset~inputclkctrl_outclk\ : std_logic;
SIGNAL \ALT_INV_reset~input_o\ : std_logic;

BEGIN

ww_clk <= clk;
ww_reset <= reset;
ww_bouton_Cafe_Noir <= bouton_Cafe_Noir;
ww_bouton_Cafe_Lait <= bouton_Cafe_Lait;
ww_bouton_Cappuccino <= bouton_Cappuccino;
ww_bouton_Lait_Chocolat <= bouton_Lait_Chocolat;
ww_piece_1DH <= piece_1DH;
ww_piece_2DH <= piece_2DH;
ww_piece_5DH <= piece_5DH;
ww_piece_10DH <= piece_10DH;
cafe_pret <= ww_cafe_pret;
monnaie_insuffisante <= ww_monnaie_insuffisante;
monnaie_exacte <= ww_monnaie_exacte;
monnaie_excedentaire <= ww_monnaie_excedentaire;
reste_monnaie <= IEEE.STD_LOGIC_ARITH.CONV_INTEGER(UNSIGNED(ww_reste_monnaie));
somme_monnaie <= IEEE.STD_LOGIC_ARITH.CONV_INTEGER(UNSIGNED(ww_somme_monnaie));
cafe_delivre <= ww_cafe_delivre;
ww_devoe <= devoe;
ww_devclrn <= devclrn;
ww_devpor <= devpor;

\reset~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \reset~input_o\);

\clk~inputclkctrl_INCLK_bus\ <= (vcc & vcc & vcc & \clk~input_o\);
\ALT_INV_reset~inputclkctrl_outclk\ <= NOT \reset~inputclkctrl_outclk\;
\ALT_INV_reset~input_o\ <= NOT \reset~input_o\;

-- Location: IOOBUF_X12_Y0_N2
\cafe_pret~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cafe_delivre~reg0_q\,
	devoe => ww_devoe,
	o => \cafe_pret~output_o\);

-- Location: IOOBUF_X24_Y0_N9
\monnaie_insuffisante~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \monnaie_insuffisante~reg0_q\,
	devoe => ww_devoe,
	o => \monnaie_insuffisante~output_o\);

-- Location: IOOBUF_X14_Y0_N9
\monnaie_exacte~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \monnaie_exacte~reg0_q\,
	devoe => ww_devoe,
	o => \monnaie_exacte~output_o\);

-- Location: IOOBUF_X33_Y15_N2
\monnaie_excedentaire~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \monnaie_excedentaire~reg0_q\,
	devoe => ww_devoe,
	o => \monnaie_excedentaire~output_o\);

-- Location: IOOBUF_X20_Y0_N9
\reste_monnaie[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reste_monnaie[0]~reg0_q\,
	devoe => ww_devoe,
	o => \reste_monnaie[0]~output_o\);

-- Location: IOOBUF_X14_Y0_N2
\reste_monnaie[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reste_monnaie[1]~reg0_q\,
	devoe => ww_devoe,
	o => \reste_monnaie[1]~output_o\);

-- Location: IOOBUF_X22_Y0_N9
\reste_monnaie[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reste_monnaie[2]~reg0_q\,
	devoe => ww_devoe,
	o => \reste_monnaie[2]~output_o\);

-- Location: IOOBUF_X22_Y0_N2
\reste_monnaie[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \reste_monnaie[3]~reg0_q\,
	devoe => ww_devoe,
	o => \reste_monnaie[3]~output_o\);

-- Location: IOOBUF_X33_Y10_N2
\somme_monnaie[0]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \somme_monnaie[0]~reg0_q\,
	devoe => ww_devoe,
	o => \somme_monnaie[0]~output_o\);

-- Location: IOOBUF_X33_Y11_N9
\somme_monnaie[1]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \somme_monnaie[1]~reg0_q\,
	devoe => ww_devoe,
	o => \somme_monnaie[1]~output_o\);

-- Location: IOOBUF_X33_Y11_N2
\somme_monnaie[2]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \somme_monnaie[2]~reg0_q\,
	devoe => ww_devoe,
	o => \somme_monnaie[2]~output_o\);

-- Location: IOOBUF_X33_Y10_N9
\somme_monnaie[3]~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \somme_monnaie[3]~reg0_q\,
	devoe => ww_devoe,
	o => \somme_monnaie[3]~output_o\);

-- Location: IOOBUF_X12_Y0_N9
\cafe_delivre~output\ : cycloneiv_io_obuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	open_drain_output => "false")
-- pragma translate_on
PORT MAP (
	i => \cafe_delivre~reg0_q\,
	devoe => ww_devoe,
	o => \cafe_delivre~output_o\);

-- Location: IOIBUF_X16_Y0_N15
\clk~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_clk,
	o => \clk~input_o\);

-- Location: CLKCTRL_G17
\clk~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \clk~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \clk~inputclkctrl_outclk\);

-- Location: IOIBUF_X29_Y0_N8
\piece_5DH~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_piece_5DH,
	o => \piece_5DH~input_o\);

-- Location: IOIBUF_X31_Y0_N8
\piece_2DH~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_piece_2DH,
	o => \piece_2DH~input_o\);

-- Location: IOIBUF_X24_Y0_N1
\piece_1DH~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_piece_1DH,
	o => \piece_1DH~input_o\);

-- Location: LCCOMB_X25_Y3_N22
\total_insere~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \total_insere~11_combout\ = (!\piece_1DH~input_o\ & ((\piece_2DH~input_o\) # (!\piece_5DH~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110100001101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \piece_5DH~input_o\,
	datab => \piece_2DH~input_o\,
	datac => \piece_1DH~input_o\,
	combout => \total_insere~11_combout\);

-- Location: IOIBUF_X29_Y0_N1
\piece_10DH~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_piece_10DH,
	o => \piece_10DH~input_o\);

-- Location: LCCOMB_X25_Y3_N2
\total_insere~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \total_insere~8_combout\ = (!\piece_1DH~input_o\ & (!\piece_2DH~input_o\ & (!\piece_5DH~input_o\ & !\piece_10DH~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000000001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \piece_1DH~input_o\,
	datab => \piece_2DH~input_o\,
	datac => \piece_5DH~input_o\,
	datad => \piece_10DH~input_o\,
	combout => \total_insere~8_combout\);

-- Location: LCCOMB_X25_Y3_N12
\total_insere~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \total_insere~12_combout\ = total_insere(0) $ (((\piece_1DH~input_o\) # ((\piece_5DH~input_o\ & !\piece_2DH~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000110111110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \piece_5DH~input_o\,
	datab => \piece_2DH~input_o\,
	datac => \piece_1DH~input_o\,
	datad => total_insere(0),
	combout => \total_insere~12_combout\);

-- Location: IOIBUF_X16_Y0_N22
\reset~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_reset,
	o => \reset~input_o\);

-- Location: CLKCTRL_G19
\reset~inputclkctrl\ : cycloneiv_clkctrl
-- pragma translate_off
GENERIC MAP (
	clock_type => "global clock",
	ena_register_mode => "none")
-- pragma translate_on
PORT MAP (
	inclk => \reset~inputclkctrl_INCLK_bus\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	outclk => \reset~inputclkctrl_outclk\);

-- Location: FF_X24_Y3_N25
\total_insere[0]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \total_insere~12_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => total_insere(0));

-- Location: LCCOMB_X25_Y3_N30
\total_insere[1]~19\ : cycloneiv_lcell_comb
-- Equation(s):
-- \total_insere[1]~19_combout\ = total_insere(1) $ (((!\total_insere~8_combout\ & ((\total_insere~11_combout\) # (total_insere(0))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110100110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \total_insere~11_combout\,
	datab => \total_insere~8_combout\,
	datac => total_insere(0),
	datad => total_insere(1),
	combout => \total_insere[1]~19_combout\);

-- Location: FF_X24_Y3_N31
\total_insere[1]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	asdata => \total_insere[1]~19_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => VCC,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => total_insere(1));

-- Location: IOIBUF_X26_Y0_N8
\bouton_Cafe_Noir~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bouton_Cafe_Noir,
	o => \bouton_Cafe_Noir~input_o\);

-- Location: LCCOMB_X25_Y3_N28
\total_insere[2]~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \total_insere[2]~9_combout\ = (\piece_2DH~input_o\) # (!\piece_5DH~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \piece_2DH~input_o\,
	datac => \piece_5DH~input_o\,
	combout => \total_insere[2]~9_combout\);

-- Location: LCCOMB_X24_Y3_N30
\total_insere[2]~18\ : cycloneiv_lcell_comb
-- Equation(s):
-- \total_insere[2]~18_combout\ = (\piece_1DH~input_o\ & (((total_insere(1) & total_insere(0))))) # (!\piece_1DH~input_o\ & ((\total_insere[2]~9_combout\ & (total_insere(1))) # (!\total_insere[2]~9_combout\ & ((!total_insere(0)) # (!total_insere(1))))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110000101010001",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \piece_1DH~input_o\,
	datab => \total_insere[2]~9_combout\,
	datac => total_insere(1),
	datad => total_insere(0),
	combout => \total_insere[2]~18_combout\);

-- Location: LCCOMB_X24_Y3_N0
\total_insere[2]~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \total_insere[2]~10_combout\ = total_insere(2) $ (((!\total_insere~8_combout\ & \total_insere[2]~18_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \total_insere~8_combout\,
	datac => total_insere(2),
	datad => \total_insere[2]~18_combout\,
	combout => \total_insere[2]~10_combout\);

-- Location: FF_X24_Y3_N1
\total_insere[2]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \total_insere[2]~10_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => total_insere(2));

-- Location: LCCOMB_X24_Y3_N22
\cafe_delivre~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \cafe_delivre~2_combout\ = (\bouton_Cafe_Noir~input_o\ & ((total_insere(2)) # ((total_insere(1) & total_insere(0)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110010000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => total_insere(1),
	datab => \bouton_Cafe_Noir~input_o\,
	datac => total_insere(0),
	datad => total_insere(2),
	combout => \cafe_delivre~2_combout\);

-- Location: LCCOMB_X25_Y3_N20
\total_insere~20\ : cycloneiv_lcell_comb
-- Equation(s):
-- \total_insere~20_combout\ = (\piece_5DH~input_o\) # ((\piece_2DH~input_o\) # (\piece_1DH~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \piece_5DH~input_o\,
	datab => \piece_2DH~input_o\,
	datac => \piece_1DH~input_o\,
	combout => \total_insere~20_combout\);

-- Location: LCCOMB_X25_Y3_N26
\total_insere~21\ : cycloneiv_lcell_comb
-- Equation(s):
-- \total_insere~21_combout\ = (\piece_1DH~input_o\) # ((\piece_2DH~input_o\) # ((!\piece_5DH~input_o\ & \piece_10DH~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110111111101110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \piece_1DH~input_o\,
	datab => \piece_2DH~input_o\,
	datac => \piece_5DH~input_o\,
	datad => \piece_10DH~input_o\,
	combout => \total_insere~21_combout\);

-- Location: LCCOMB_X24_Y3_N20
\total_insere~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \total_insere~13_combout\ = (total_insere(0)) # ((!\piece_1DH~input_o\ & \piece_2DH~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111010011110100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \piece_1DH~input_o\,
	datab => \piece_2DH~input_o\,
	datac => total_insere(0),
	combout => \total_insere~13_combout\);

-- Location: LCCOMB_X24_Y3_N14
\total_insere~14\ : cycloneiv_lcell_comb
-- Equation(s):
-- \total_insere~14_combout\ = (total_insere(1) & ((\total_insere~13_combout\) # (!\total_insere~20_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111000000110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \total_insere~20_combout\,
	datac => total_insere(1),
	datad => \total_insere~13_combout\,
	combout => \total_insere~14_combout\);

-- Location: LCCOMB_X24_Y3_N28
\total_insere~15\ : cycloneiv_lcell_comb
-- Equation(s):
-- \total_insere~15_combout\ = (\total_insere~21_combout\ & (\total_insere~14_combout\ & total_insere(2))) # (!\total_insere~21_combout\ & ((\total_insere~14_combout\) # (total_insere(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111001100110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \total_insere~21_combout\,
	datac => \total_insere~14_combout\,
	datad => total_insere(2),
	combout => \total_insere~15_combout\);

-- Location: LCCOMB_X24_Y3_N2
\total_insere~16\ : cycloneiv_lcell_comb
-- Equation(s):
-- \total_insere~16_combout\ = (\total_insere~20_combout\ & ((total_insere(3) $ (\total_insere~15_combout\)))) # (!\total_insere~20_combout\ & (\total_insere~21_combout\ & (total_insere(3) $ (!\total_insere~15_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0100101010100100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \total_insere~20_combout\,
	datab => \total_insere~21_combout\,
	datac => total_insere(3),
	datad => \total_insere~15_combout\,
	combout => \total_insere~16_combout\);

-- Location: LCCOMB_X24_Y3_N16
\total_insere~17\ : cycloneiv_lcell_comb
-- Equation(s):
-- \total_insere~17_combout\ = (\total_insere~16_combout\) # ((\total_insere~8_combout\ & total_insere(3)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111110100000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \total_insere~8_combout\,
	datac => total_insere(3),
	datad => \total_insere~16_combout\,
	combout => \total_insere~17_combout\);

-- Location: FF_X24_Y3_N17
\total_insere[3]\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \total_insere~17_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => total_insere(3));

-- Location: LCCOMB_X24_Y3_N4
\cafe_delivre~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \cafe_delivre~5_combout\ = (\cafe_delivre~2_combout\) # ((total_insere(3)) # ((\cafe_delivre~reg0_q\) # (total_insere(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \cafe_delivre~2_combout\,
	datab => total_insere(3),
	datac => \cafe_delivre~reg0_q\,
	datad => total_insere(2),
	combout => \cafe_delivre~5_combout\);

-- Location: IOIBUF_X20_Y0_N1
\bouton_Lait_Chocolat~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bouton_Lait_Chocolat,
	o => \bouton_Lait_Chocolat~input_o\);

-- Location: IOIBUF_X31_Y0_N1
\bouton_Cafe_Lait~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bouton_Cafe_Lait,
	o => \bouton_Cafe_Lait~input_o\);

-- Location: IOIBUF_X26_Y0_N1
\bouton_Cappuccino~input\ : cycloneiv_io_ibuf
-- pragma translate_off
GENERIC MAP (
	bus_hold => "false",
	simulate_z_as => "z")
-- pragma translate_on
PORT MAP (
	i => ww_bouton_Cappuccino,
	o => \bouton_Cappuccino~input_o\);

-- Location: LCCOMB_X24_Y3_N18
\LessThan1~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan1~0_combout\ = (!total_insere(3) & (((!total_insere(1) & !total_insere(0))) # (!total_insere(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000100110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => total_insere(1),
	datab => total_insere(3),
	datac => total_insere(0),
	datad => total_insere(2),
	combout => \LessThan1~0_combout\);

-- Location: LCCOMB_X24_Y3_N12
\cafe_delivre~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \cafe_delivre~3_combout\ = (\bouton_Cafe_Lait~input_o\) # ((\bouton_Cappuccino~input_o\ & ((!\LessThan1~0_combout\))) # (!\bouton_Cappuccino~input_o\ & (\bouton_Lait_Chocolat~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111011111110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bouton_Lait_Chocolat~input_o\,
	datab => \bouton_Cafe_Lait~input_o\,
	datac => \bouton_Cappuccino~input_o\,
	datad => \LessThan1~0_combout\,
	combout => \cafe_delivre~3_combout\);

-- Location: LCCOMB_X24_Y3_N10
\cafe_delivre~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \cafe_delivre~4_combout\ = (\cafe_delivre~2_combout\) # ((\bouton_Cafe_Noir~input_o\ & (total_insere(3))) # (!\bouton_Cafe_Noir~input_o\ & ((\cafe_delivre~3_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => total_insere(3),
	datab => \bouton_Cafe_Noir~input_o\,
	datac => \cafe_delivre~2_combout\,
	datad => \cafe_delivre~3_combout\,
	combout => \cafe_delivre~4_combout\);

-- Location: FF_X24_Y3_N5
\cafe_delivre~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \cafe_delivre~5_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \cafe_delivre~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \cafe_delivre~reg0_q\);

-- Location: LCCOMB_X25_Y3_N10
\monnaie_insuffisante~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \monnaie_insuffisante~0_combout\ = (!\bouton_Cafe_Lait~input_o\ & (!\bouton_Cafe_Noir~input_o\ & (\bouton_Cappuccino~input_o\ & \LessThan1~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0001000000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bouton_Cafe_Lait~input_o\,
	datab => \bouton_Cafe_Noir~input_o\,
	datac => \bouton_Cappuccino~input_o\,
	datad => \LessThan1~0_combout\,
	combout => \monnaie_insuffisante~0_combout\);

-- Location: LCCOMB_X24_Y3_N8
\reste_monnaie~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reste_monnaie~2_combout\ = (!\bouton_Cafe_Noir~input_o\ & ((\bouton_Cafe_Lait~input_o\) # ((\bouton_Lait_Chocolat~input_o\ & !\bouton_Cappuccino~input_o\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000011001110",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bouton_Lait_Chocolat~input_o\,
	datab => \bouton_Cafe_Lait~input_o\,
	datac => \bouton_Cappuccino~input_o\,
	datad => \bouton_Cafe_Noir~input_o\,
	combout => \reste_monnaie~2_combout\);

-- Location: LCCOMB_X23_Y3_N28
\LessThan0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \LessThan0~0_combout\ = (total_insere(0) & total_insere(1))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100110000000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => total_insere(0),
	datad => total_insere(1),
	combout => \LessThan0~0_combout\);

-- Location: LCCOMB_X24_Y3_N6
\monnaie_insuffisante~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \monnaie_insuffisante~1_combout\ = (!total_insere(2) & ((\reste_monnaie~2_combout\) # ((\bouton_Cafe_Noir~input_o\ & !\LessThan0~0_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011000000110010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bouton_Cafe_Noir~input_o\,
	datab => total_insere(2),
	datac => \reste_monnaie~2_combout\,
	datad => \LessThan0~0_combout\,
	combout => \monnaie_insuffisante~1_combout\);

-- Location: LCCOMB_X25_Y3_N24
\monnaie_insuffisante~2\ : cycloneiv_lcell_comb
-- Equation(s):
-- \monnaie_insuffisante~2_combout\ = (\monnaie_insuffisante~0_combout\) # ((\monnaie_insuffisante~reg0_q\) # ((!total_insere(3) & \monnaie_insuffisante~1_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111101111111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \monnaie_insuffisante~0_combout\,
	datab => total_insere(3),
	datac => \monnaie_insuffisante~reg0_q\,
	datad => \monnaie_insuffisante~1_combout\,
	combout => \monnaie_insuffisante~2_combout\);

-- Location: FF_X25_Y3_N25
\monnaie_insuffisante~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \monnaie_insuffisante~2_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \monnaie_insuffisante~reg0_q\);

-- Location: LCCOMB_X23_Y3_N26
\monnaie_exacte~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \monnaie_exacte~0_combout\ = (!total_insere(3) & ((total_insere(2) & ((!total_insere(1)))) # (!total_insere(2) & (total_insere(0) & total_insere(1)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000010001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => total_insere(3),
	datab => total_insere(0),
	datac => total_insere(2),
	datad => total_insere(1),
	combout => \monnaie_exacte~0_combout\);

-- Location: LCCOMB_X22_Y3_N0
\monnaie_exacte~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \monnaie_exacte~1_combout\ = (\monnaie_exacte~reg0_q\) # (\monnaie_exacte~0_combout\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111110000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => \monnaie_exacte~reg0_q\,
	datad => \monnaie_exacte~0_combout\,
	combout => \monnaie_exacte~1_combout\);

-- Location: FF_X22_Y3_N1
\monnaie_exacte~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \monnaie_exacte~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \monnaie_exacte~reg0_q\);

-- Location: LCCOMB_X26_Y3_N28
\monnaie_excedentaire~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \monnaie_excedentaire~0_combout\ = (total_insere(3)) # ((\monnaie_excedentaire~reg0_q\) # ((total_insere(1) & total_insere(2))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011111010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => total_insere(3),
	datab => total_insere(1),
	datac => \monnaie_excedentaire~reg0_q\,
	datad => total_insere(2),
	combout => \monnaie_excedentaire~0_combout\);

-- Location: FF_X26_Y3_N29
\monnaie_excedentaire~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \monnaie_excedentaire~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \monnaie_excedentaire~reg0_q\);

-- Location: LCCOMB_X25_Y3_N4
\reste_monnaie~3\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reste_monnaie~3_combout\ = (total_insere(0) & ((total_insere(3)) # ((total_insere(2))))) # (!total_insere(0) & (\bouton_Cafe_Noir~input_o\ & ((total_insere(3)) # (total_insere(2)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111110010101000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => total_insere(0),
	datab => total_insere(3),
	datac => total_insere(2),
	datad => \bouton_Cafe_Noir~input_o\,
	combout => \reste_monnaie~3_combout\);

-- Location: LCCOMB_X23_Y3_N24
\reste_monnaie~4\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reste_monnaie~4_combout\ = (\bouton_Cafe_Lait~input_o\) # ((!\bouton_Cappuccino~input_o\ & \bouton_Lait_Chocolat~input_o\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1101110011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bouton_Cappuccino~input_o\,
	datab => \bouton_Cafe_Lait~input_o\,
	datac => \bouton_Lait_Chocolat~input_o\,
	combout => \reste_monnaie~4_combout\);

-- Location: LCCOMB_X23_Y3_N14
\process_0~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \process_0~0_combout\ = (!total_insere(2) & !total_insere(3))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000000000001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datac => total_insere(2),
	datad => total_insere(3),
	combout => \process_0~0_combout\);

-- Location: LCCOMB_X24_Y3_N24
\reste_monnaie~5\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reste_monnaie~5_combout\ = (total_insere(0) & (\reste_monnaie[0]~reg0_q\)) # (!total_insere(0) & (\reste_monnaie~4_combout\ & ((!\process_0~0_combout\) # (!\reste_monnaie[0]~reg0_q\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010010010101100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reste_monnaie[0]~reg0_q\,
	datab => \reste_monnaie~4_combout\,
	datac => total_insere(0),
	datad => \process_0~0_combout\,
	combout => \reste_monnaie~5_combout\);

-- Location: LCCOMB_X24_Y3_N26
\reste_monnaie~6\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reste_monnaie~6_combout\ = (total_insere(0) & (\reste_monnaie~2_combout\ & ((\reste_monnaie~3_combout\) # (\reste_monnaie~5_combout\)))) # (!total_insere(0) & ((\reste_monnaie~3_combout\) # ((!\reste_monnaie~5_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1110001010110011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \reste_monnaie~3_combout\,
	datab => total_insere(0),
	datac => \reste_monnaie~2_combout\,
	datad => \reste_monnaie~5_combout\,
	combout => \reste_monnaie~6_combout\);

-- Location: FF_X24_Y3_N27
\reste_monnaie[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \reste_monnaie~6_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \cafe_delivre~4_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reste_monnaie[0]~reg0_q\);

-- Location: LCCOMB_X23_Y3_N4
\reste_monnaie[1]~7\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reste_monnaie[1]~7_combout\ = (\bouton_Cafe_Lait~input_o\) # (!\bouton_Cappuccino~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111111001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \bouton_Cafe_Lait~input_o\,
	datac => \bouton_Cappuccino~input_o\,
	combout => \reste_monnaie[1]~7_combout\);

-- Location: LCCOMB_X23_Y3_N30
\Add4~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add4~0_combout\ = total_insere(1) $ (total_insere(0))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0011001111001100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => total_insere(1),
	datad => total_insere(0),
	combout => \Add4~0_combout\);

-- Location: LCCOMB_X23_Y3_N0
\reste_monnaie[1]~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reste_monnaie[1]~0_combout\ = (\reste_monnaie[1]~7_combout\ & ((total_insere(1)))) # (!\reste_monnaie[1]~7_combout\ & (!\Add4~0_combout\))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100111100000011",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => \reste_monnaie[1]~7_combout\,
	datac => \Add4~0_combout\,
	datad => total_insere(1),
	combout => \reste_monnaie[1]~0_combout\);

-- Location: LCCOMB_X23_Y3_N6
\reste_monnaie[1]~8\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reste_monnaie[1]~8_combout\ = (total_insere(0)) # ((total_insere(3)) # (total_insere(1)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => total_insere(0),
	datac => total_insere(3),
	datad => total_insere(1),
	combout => \reste_monnaie[1]~8_combout\);

-- Location: LCCOMB_X23_Y3_N12
\reste_monnaie[1]~9\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reste_monnaie[1]~9_combout\ = (\bouton_Cafe_Lait~input_o\) # ((\bouton_Cappuccino~input_o\ & ((\reste_monnaie[1]~8_combout\))) # (!\bouton_Cappuccino~input_o\ & (\bouton_Lait_Chocolat~input_o\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111011011100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bouton_Cappuccino~input_o\,
	datab => \bouton_Cafe_Lait~input_o\,
	datac => \bouton_Lait_Chocolat~input_o\,
	datad => \reste_monnaie[1]~8_combout\,
	combout => \reste_monnaie[1]~9_combout\);

-- Location: LCCOMB_X23_Y3_N18
\reste_monnaie[1]~10\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reste_monnaie[1]~10_combout\ = (\bouton_Cafe_Noir~input_o\ & ((\LessThan0~0_combout\) # ((!\process_0~0_combout\)))) # (!\bouton_Cafe_Noir~input_o\ & (((!\process_0~0_combout\ & \reste_monnaie[1]~9_combout\))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1000111110001010",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bouton_Cafe_Noir~input_o\,
	datab => \LessThan0~0_combout\,
	datac => \process_0~0_combout\,
	datad => \reste_monnaie[1]~9_combout\,
	combout => \reste_monnaie[1]~10_combout\);

-- Location: FF_X23_Y3_N1
\reste_monnaie[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \reste_monnaie[1]~0_combout\,
	asdata => \Add4~0_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => \bouton_Cafe_Noir~input_o\,
	ena => \reste_monnaie[1]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reste_monnaie[1]~reg0_q\);

-- Location: LCCOMB_X23_Y3_N20
\Add5~0\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add5~0_combout\ = total_insere(2) $ (((total_insere(0)) # (total_insere(1))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0000111100111100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => total_insere(0),
	datac => total_insere(2),
	datad => total_insere(1),
	combout => \Add5~0_combout\);

-- Location: LCCOMB_X23_Y3_N10
\reste_monnaie[2]~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reste_monnaie[2]~1_combout\ = (\reste_monnaie[1]~7_combout\ & (!total_insere(2))) # (!\reste_monnaie[1]~7_combout\ & ((\Add5~0_combout\)))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0111011101000100",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => total_insere(2),
	datab => \reste_monnaie[1]~7_combout\,
	datad => \Add5~0_combout\,
	combout => \reste_monnaie[2]~1_combout\);

-- Location: LCCOMB_X23_Y3_N22
\Add4~1\ : cycloneiv_lcell_comb
-- Equation(s):
-- \Add4~1_combout\ = total_insere(2) $ (((!total_insere(1)) # (!total_insere(0))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1100001100001111",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datab => total_insere(0),
	datac => total_insere(2),
	datad => total_insere(1),
	combout => \Add4~1_combout\);

-- Location: FF_X23_Y3_N11
\reste_monnaie[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \reste_monnaie[2]~1_combout\,
	asdata => \Add4~1_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	sload => \bouton_Cafe_Noir~input_o\,
	ena => \reste_monnaie[1]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reste_monnaie[2]~reg0_q\);

-- Location: LCCOMB_X23_Y3_N2
\reste_monnaie~12\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reste_monnaie~12_combout\ = (!\bouton_Cafe_Noir~input_o\ & total_insere(2))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "0101000001010000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bouton_Cafe_Noir~input_o\,
	datac => total_insere(2),
	combout => \reste_monnaie~12_combout\);

-- Location: LCCOMB_X23_Y3_N8
\reste_monnaie~11\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reste_monnaie~11_combout\ = ((total_insere(0)) # ((\bouton_Cafe_Lait~input_o\) # (total_insere(1)))) # (!\bouton_Cappuccino~input_o\)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111111111101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => \bouton_Cappuccino~input_o\,
	datab => total_insere(0),
	datac => \bouton_Cafe_Lait~input_o\,
	datad => total_insere(1),
	combout => \reste_monnaie~11_combout\);

-- Location: LCCOMB_X23_Y3_N16
\reste_monnaie~13\ : cycloneiv_lcell_comb
-- Equation(s):
-- \reste_monnaie~13_combout\ = total_insere(3) $ (((!\cafe_delivre~2_combout\ & ((!\reste_monnaie~11_combout\) # (!\reste_monnaie~12_combout\)))))

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1010101010010101",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	dataa => total_insere(3),
	datab => \reste_monnaie~12_combout\,
	datac => \reste_monnaie~11_combout\,
	datad => \cafe_delivre~2_combout\,
	combout => \reste_monnaie~13_combout\);

-- Location: FF_X23_Y3_N17
\reste_monnaie[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \reste_monnaie~13_combout\,
	clrn => \ALT_INV_reset~inputclkctrl_outclk\,
	ena => \reste_monnaie[1]~10_combout\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \reste_monnaie[3]~reg0_q\);

-- Location: LCCOMB_X26_Y3_N10
\somme_monnaie[0]~reg0feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \somme_monnaie[0]~reg0feeder_combout\ = total_insere(0)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => total_insere(0),
	combout => \somme_monnaie[0]~reg0feeder_combout\);

-- Location: FF_X26_Y3_N11
\somme_monnaie[0]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \somme_monnaie[0]~reg0feeder_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \somme_monnaie[0]~reg0_q\);

-- Location: LCCOMB_X26_Y3_N4
\somme_monnaie[1]~reg0feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \somme_monnaie[1]~reg0feeder_combout\ = total_insere(1)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => total_insere(1),
	combout => \somme_monnaie[1]~reg0feeder_combout\);

-- Location: FF_X26_Y3_N5
\somme_monnaie[1]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \somme_monnaie[1]~reg0feeder_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \somme_monnaie[1]~reg0_q\);

-- Location: LCCOMB_X26_Y3_N6
\somme_monnaie[2]~reg0feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \somme_monnaie[2]~reg0feeder_combout\ = total_insere(2)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => total_insere(2),
	combout => \somme_monnaie[2]~reg0feeder_combout\);

-- Location: FF_X26_Y3_N7
\somme_monnaie[2]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \somme_monnaie[2]~reg0feeder_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \somme_monnaie[2]~reg0_q\);

-- Location: LCCOMB_X26_Y3_N16
\somme_monnaie[3]~reg0feeder\ : cycloneiv_lcell_comb
-- Equation(s):
-- \somme_monnaie[3]~reg0feeder_combout\ = total_insere(3)

-- pragma translate_off
GENERIC MAP (
	lut_mask => "1111111100000000",
	sum_lutc_input => "datac")
-- pragma translate_on
PORT MAP (
	datad => total_insere(3),
	combout => \somme_monnaie[3]~reg0feeder_combout\);

-- Location: FF_X26_Y3_N17
\somme_monnaie[3]~reg0\ : dffeas
-- pragma translate_off
GENERIC MAP (
	is_wysiwyg => "true",
	power_up => "low")
-- pragma translate_on
PORT MAP (
	clk => \clk~inputclkctrl_outclk\,
	d => \somme_monnaie[3]~reg0feeder_combout\,
	ena => \ALT_INV_reset~input_o\,
	devclrn => ww_devclrn,
	devpor => ww_devpor,
	q => \somme_monnaie[3]~reg0_q\);

ww_cafe_pret <= \cafe_pret~output_o\;

ww_monnaie_insuffisante <= \monnaie_insuffisante~output_o\;

ww_monnaie_exacte <= \monnaie_exacte~output_o\;

ww_monnaie_excedentaire <= \monnaie_excedentaire~output_o\;

ww_reste_monnaie(0) <= \reste_monnaie[0]~output_o\;

ww_reste_monnaie(1) <= \reste_monnaie[1]~output_o\;

ww_reste_monnaie(2) <= \reste_monnaie[2]~output_o\;

ww_reste_monnaie(3) <= \reste_monnaie[3]~output_o\;

ww_somme_monnaie(0) <= \somme_monnaie[0]~output_o\;

ww_somme_monnaie(1) <= \somme_monnaie[1]~output_o\;

ww_somme_monnaie(2) <= \somme_monnaie[2]~output_o\;

ww_somme_monnaie(3) <= \somme_monnaie[3]~output_o\;

ww_cafe_delivre <= \cafe_delivre~output_o\;
END structure;


