library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity Distributeur_de_Cafe is
  Port (
    -- Les signaux d'entrée
    horloge : in STD_LOGIC; 
	 reset : in STD_LOGIC; 
	 -- Les types de café
	 Bouton_Expresso : in STD_LOGIC;
	 Bouton_Cafe_Long : in STD_LOGIC;
	 Bouton_Cafe_au_Lait : in STD_LOGIC;
	 Bouton_Cafe_Creme : in STD_LOGIC;
	 Bouton_Cappuccino : in STD_LOGIC;
	 Bouton_Cafe_Noisette : in STD_LOGIC;
	 Bouton_Lait : in STD_LOGIC;
	 Bouton_Chocolat_Fort : in STD_LOGIC;
	 Bouton_Lait_Chocolat : in STD_LOGIC;
	 Bouton_The_Citron : in STD_LOGIC;
    -- Les pièces de monnaie à entrer
	 Piece_Monnaie_1DH : in STD_LOGIC;
	 Piece_Monnaie_2DH : in STD_LOGIC;
	 Piece_Monnaie_5DH : in STD_LOGIC;
	 Piece_Monnaie_10DH : in STD_LOGIC;

    -- Les signaux de sortie
    monnaie_insuffisante : out STD_LOGIC;
    monnaie_exacte : out STD_LOGIC;
    monnaie_excedentaire : out STD_LOGIC;
	 somme_monnaie : out integer range 0 to 20;
    reste_monnaie : out integer range 0 to 20;
	 cafe_pret : out STD_LOGIC;
    cafe_delivre : out STD_LOGIC
  );
end entity Distributeur_de_Cafe;

architecture Traitement of Distributeur_de_Cafe is

  -- Les prix des cafés
    constant Prix_Expresso         : integer:= 12;        
    constant Prix_Cafe_Long        : integer:=13;       
    constant Prix_Cafe_au_Lait     : integer:=15;    
    constant Prix_Cafe_Creme       : integer:=14;       
    constant Prix_Cappuccino       : integer:=16;       
    constant Prix_Cafe_Noisette    : integer:=17;   
    constant Prix_Lait             : integer:=17;             
    constant Prix_Chocolat_Fort    : integer:=18;    
    constant Prix_Lait_Chocolat    : integer:=18;    
    constant Prix_The_Citron       : integer:=9; 
	signal total_insere : integer range 0 to 20 := 0;
	signal reste : integer range 0 to 20 := 0;
begin

  -- Processus pour la sélection du café et la gestion de la monnaie
  process (horloge,Bouton_Expresso, Bouton_Cafe_Long, Bouton_Cafe_au_Lait,
        Bouton_Cafe_Creme, Bouton_Cappuccino, Bouton_Cafe_Noisette, Bouton_Lait, 
        Bouton_Chocolat_Fort, Bouton_Lait_Chocolat, Bouton_The_Citron,
        Piece_Monnaie_1DH, Piece_Monnaie_2DH, Piece_Monnaie_5DH, Piece_Monnaie_10DH)
		  
  begin
	 if reset = '1' then
		   -- Initialisation des signaux de sortie
			monnaie_insuffisante <= '0';
			monnaie_exacte <= '0';
			monnaie_excedentaire <= '0';
			cafe_pret <= '0';
			cafe_delivre <= '0';
			reste <= 0;
			total_insere <= 0;
    elsif rising_edge(horloge) then 

			-- Calcul du total de monnaie insérée
			
			if Piece_Monnaie_1DH = '1' then
			  total_insere <= total_insere + 1;
			elsif Piece_Monnaie_2DH = '1' then
			  total_insere <= total_insere + 2;
			elsif Piece_Monnaie_5DH = '1' then
			  total_insere <= total_insere + 5;
			elsif Piece_Monnaie_10DH = '1' then
			  total_insere <= total_insere + 10;
			end if;

			-- Sélection du café
			if Bouton_Expresso = '1' then
			  if total_insere > Prix_Expresso then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 reste <= total_insere-Prix_Expresso;
				 monnaie_excedentaire <= '1';
			  elsif total_insere = Prix_Expresso then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 monnaie_exacte <= '1';
			  else
				 monnaie_insuffisante <= '1';
			  end if;
			elsif Bouton_Cafe_Long = '1' then
			  if total_insere > Prix_Cafe_Long then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 reste <= total_insere - Prix_Cafe_Long;
				 monnaie_excedentaire <= '1';
			  elsif total_insere = Prix_Cafe_Long then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 monnaie_exacte <= '1';
			  else
				 monnaie_insuffisante <= '1';
			  end if;
			elsif Bouton_Cafe_au_Lait = '1' then
			  if total_insere > Prix_Cafe_au_Lait then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 reste <= total_insere - Prix_Cafe_au_Lait;
				 monnaie_excedentaire <= '1';
			  elsif total_insere = Prix_Cafe_au_Lait then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 monnaie_exacte <= '1';
			  else
				monnaie_insuffisante <= '1';
			  end if;
			elsif Bouton_Cafe_Creme = '1' then
			  if total_insere > Prix_Cafe_Creme then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 reste <= total_insere - Prix_Cafe_Creme;
				 monnaie_excedentaire <= '1';
			  elsif total_insere = Prix_Cafe_Creme then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 monnaie_exacte <= '1';
			  else
				 monnaie_insuffisante <= '1';
			  end if;
			 elsif Bouton_Cappuccino = '1' then
			  if total_insere > Prix_Cappuccino then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 reste <= total_insere - Prix_Cappuccino;
				 monnaie_excedentaire <= '1';
			  elsif total_insere = Prix_Cappuccino then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 monnaie_exacte <= '1';
			  else
				 monnaie_insuffisante <= '1';
			  end if;
			 elsif Bouton_Cafe_Noisette = '1' then
			  if total_insere > Prix_Cafe_Noisette then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 reste <= total_insere - Prix_Cafe_Noisette;
				 monnaie_excedentaire <= '1';
			  elsif total_insere = Prix_Cafe_Noisette then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 monnaie_exacte <= '1';
			  else
				 monnaie_insuffisante <= '1';
			  end if;
			 elsif Bouton_Lait = '1' then
			  if total_insere > Prix_Lait then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 reste <= total_insere - Prix_Lait;
				 monnaie_excedentaire <= '1';
			  elsif total_insere = Prix_Lait then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 monnaie_exacte <= '1';
			  else
				 monnaie_insuffisante <= '1';
			  end if;
			 elsif Bouton_Chocolat_Fort = '1' then
			  if total_insere > Prix_Chocolat_Fort then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 reste <= total_insere - Prix_Chocolat_Fort;
				 monnaie_excedentaire <= '1';
			  elsif total_insere = Prix_Chocolat_Fort then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 monnaie_exacte <= '1';
			  else
				 monnaie_insuffisante <= '1';
			  end if;
			 elsif Bouton_Lait_Chocolat = '1' then
			  if total_insere > Prix_Lait_Chocolat then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 reste <= total_insere - Prix_Lait_Chocolat;
				 monnaie_excedentaire <= '1';
			  elsif total_insere = Prix_Lait_Chocolat then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 monnaie_exacte <= '1';
			  else
				 monnaie_insuffisante <= '1';
			  end if;
			 elsif Bouton_The_Citron = '1' then
			  if total_insere > Prix_The_Citron then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 reste <= total_insere - Prix_The_Citron;
				 monnaie_excedentaire <= '1';
			  elsif total_insere = Prix_The_Citron then
				 cafe_pret <= '1';
				 cafe_delivre <= '1';
				 monnaie_exacte <= '1';
			  else
				 monnaie_insuffisante <= '1';
			  end if;			  
			 end if;

    end if;
	somme_monnaie <= total_insere;
	reste_monnaie <= reste;
 end process;

end architecture Traitement;