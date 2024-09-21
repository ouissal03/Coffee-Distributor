library verilog;
use verilog.vl_types.all;
entity Distributeur_Cafe_vlg_sample_tst is
    port(
        bouton_Cafe_Lait: in     vl_logic;
        bouton_Cafe_Noir: in     vl_logic;
        bouton_Cappuccino: in     vl_logic;
        bouton_Lait_Chocolat: in     vl_logic;
        clk             : in     vl_logic;
        piece_1DH       : in     vl_logic;
        piece_2DH       : in     vl_logic;
        piece_5DH       : in     vl_logic;
        piece_10DH      : in     vl_logic;
        reset           : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Distributeur_Cafe_vlg_sample_tst;
