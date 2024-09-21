library verilog;
use verilog.vl_types.all;
entity Distributeur_Cafe is
    port(
        clk             : in     vl_logic;
        reset           : in     vl_logic;
        bouton_Cafe_Noir: in     vl_logic;
        bouton_Cafe_Lait: in     vl_logic;
        bouton_Cappuccino: in     vl_logic;
        bouton_Lait_Chocolat: in     vl_logic;
        piece_1DH       : in     vl_logic;
        piece_2DH       : in     vl_logic;
        piece_5DH       : in     vl_logic;
        piece_10DH      : in     vl_logic;
        cafe_pret       : out    vl_logic;
        monnaie_insuffisante: out    vl_logic;
        monnaie_exacte  : out    vl_logic;
        monnaie_excedentaire: out    vl_logic;
        reste_monnaie   : out    vl_logic_vector(3 downto 0);
        somme_monnaie   : out    vl_logic_vector(3 downto 0);
        cafe_delivre    : out    vl_logic
    );
end Distributeur_Cafe;
