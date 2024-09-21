library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- Déclaration de l'entité
entity Distributeur_Cafe is
  Port (
    -- Signaux d'entrée
    clk : in std_logic; -- Ajout de l'entrée clk
	 reset : in STD_LOGIC;
    bouton_Cafe_Noir : in std_logic;
    bouton_Cafe_Lait : in std_logic;
    bouton_Cappuccino : in std_logic;
    bouton_Lait_Chocolat : in std_logic;
    piece_1DH : in std_logic;
    piece_2DH : in std_logic;
    piece_5DH : in std_logic;
    piece_10DH : in std_logic;
    -- Signaux de sortie
    cafe_pret : out std_logic;
    monnaie_insuffisante : out std_logic;
    monnaie_exacte : out std_logic;
    monnaie_excedentaire : out std_logic;
    reste_monnaie : out integer range 0 to 10;
    somme_monnaie : out integer range 0 to 10;
    cafe_delivre : out std_logic
  );
end entity Distributeur_Cafe;

-- Déclaration de l'architecture
architecture Behavioral of Distributeur_Cafe is

  -- Déclaration des constantes pour les prix des cafés
  constant PRIX_CAFE_NOIR : integer := 3;
  constant PRIX_CAFE_LAIT : integer := 4;
  constant PRIX_CAPPUCINO : integer := 5;
  constant PRIX_LAIT_CHOCOLAT : integer := 4;
  signal total_insere : integer range 0 to 10 := 0;
 
begin

  -- Processus pour la sélection du café et la gestion de la monnaie
  process (clk, bouton_Cafe_Noir, bouton_Cafe_Lait, bouton_Cappuccino, bouton_Lait_Chocolat, piece_1DH, piece_2DH, piece_5DH, piece_10DH)

  begin
  
  	 if reset = '1' then
        -- Initialisation des signaux de sortie
      cafe_pret <= '0';
      monnaie_insuffisante <= '0';
      monnaie_exacte <= '0';
      monnaie_excedentaire <= '0';
      cafe_delivre <= '0';
      reste_monnaie <= 0;
		total_insere <= 0;
    elsif rising_edge(clk) then -- Utilisation de la condition rising_edge pour synchroniser le processus sur le front montant du signal clk

      -- Calcul du total de l'argent insérée
      if piece_1DH = '1' then
        total_insere <= total_insere + 1;
      elsif piece_2DH = '1' then
        total_insere <= total_insere + 2;
      elsif piece_5DH = '1' then
        total_insere <= total_insere + 5;
      elsif piece_10DH = '1' then
        total_insere <= total_insere + 10;
      end if;

      -- Sélection du café
      if bouton_Cafe_Noir = '1' then
        if total_insere >= PRIX_CAFE_NOIR then
          cafe_pret <= '1';
          cafe_delivre <= '1';
          reste_monnaie <= total_insere - PRIX_CAFE_NOIR;
        else
          monnaie_insuffisante <= '1';
        end if;
      elsif bouton_Cafe_Lait = '1' then
        if total_insere >= PRIX_CAFE_LAIT then
          cafe_pret <= '1';
          cafe_delivre <= '1';
          reste_monnaie <= total_insere - PRIX_CAFE_LAIT;
        else
          monnaie_insuffisante <= '1';
        end if;
      elsif bouton_Cappuccino = '1' then
        if total_insere >= PRIX_CAPPUCINO then
          cafe_pret <= '1';
          cafe_delivre <= '1';
          reste_monnaie <= total_insere - PRIX_CAPPUCINO;
        else
          monnaie_insuffisante <= '1';
        end if;
      elsif bouton_Lait_Chocolat = '1' then
        if total_insere >= PRIX_LAIT_CHOCOLAT then
          cafe_pret <= '1';
          cafe_delivre <= '1';
          reste_monnaie <= total_insere - PRIX_LAIT_CHOCOLAT;
        else
          monnaie_insuffisante <= '1';
        end if;
      end if;

      -- Gestion de la monnaie
      if total_insere = PRIX_CAFE_NOIR or total_insere = PRIX_CAFE_LAIT or total_insere = PRIX_CAPPUCINO or total_insere = PRIX_LAIT_CHOCOLAT then
        monnaie_exacte <= '1';
      elsif total_insere > PRIX_CAFE_NOIR or total_insere > PRIX_CAFE_LAIT or total_insere > PRIX_CAPPUCINO or total_insere > PRIX_LAIT_CHOCOLAT then
        monnaie_excedentaire <= '1';
      end if;

      somme_monnaie <= total_insere;

    end if;
  end process;

end architecture Behavioral;