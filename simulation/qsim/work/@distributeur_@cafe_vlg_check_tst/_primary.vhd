library verilog;
use verilog.vl_types.all;
entity Distributeur_Cafe_vlg_check_tst is
    port(
        cafe_delivre    : in     vl_logic;
        cafe_pret       : in     vl_logic;
        monnaie_exacte  : in     vl_logic;
        monnaie_excedentaire: in     vl_logic;
        monnaie_insuffisante: in     vl_logic;
        reste_monnaie   : in     vl_logic_vector(3 downto 0);
        somme_monnaie   : in     vl_logic_vector(3 downto 0);
        sampler_rx      : in     vl_logic
    );
end Distributeur_Cafe_vlg_check_tst;
