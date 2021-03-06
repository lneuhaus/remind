*** |  (C) 2006-2019 Potsdam Institute for Climate Impact Research (PIK)
*** |  authors, and contributors see CITATION.cff file. This file is part
*** |  of REMIND and licensed under AGPL-3.0-or-later. Under Section 7 of
*** |  AGPL-3.0, you are granted additional permissions described in the
*** |  REMIND License Exception, version 1.0 (see LICENSE file).
*** |  Contact: remind@pik-potsdam.de
*** SOF ./modules/35_transport/edge_esm/sets.gms

sets

teEs_dyn35(all_teEs)  "technologies - transport module additions"
/
    te_espet_pass_sm "short-to-medium distance passenger transport CES node"
    te_esdie_pass_sm "short-to-medium distance passenger transport CES node"
    te_eselt_pass_sm "short-to-medium distance passenger transport CES node"
*    te_esh2t_pass_sm "short-to-medium distance passenger transport CES node"
*    te_esgat_pass_sm "short-to-medium distance passenger transport CES node"
    te_esdie_pass_lo "long distance passenger transport (aviation) CES node"
    te_esdie_frgt_sm "short-to-medium distance freight transport CES node"
    te_eselt_frgt_sm "short-to-medium distance freight transport CES node"
*    te_esh2t_frgt_sm "short-to-medium distance freight transport CES node"
*    te_esgat_frgt_sm "short-to-medium distance freight transport CES node"
    te_esdie_frgt_lo "long distance freight transport CES node"    
/    
    
in_dyn35(all_in)          "all inputs and outputs of the CES function - transport module additions"
/
    entrp "transport CES node"
    entrp_pass "passenger transport CES node"
    entrp_frgt "freight transport CES node"
    entrp_pass_sm "short-to-medium distance passenger transport CES node"
    entrp_pass_lo "long distance passenger transport (aviation) CES node"
    entrp_frgt_sm "short-to-medium distance freight transport CES node"
    entrp_frgt_lo "long distance freight transport CES node"
/

esty_dyn35(all_esty)            "Energy service types"
/
    espet_pass_sm
    esdie_pass_sm
    esdie_pass_lo
    eselt_pass_sm
*    esh2t_pass_sm
*    esgat_pass_sm
    esdie_frgt_lo
    esdie_frgt_sm
*    esh2t_frgt_sm
    eselt_frgt_sm
*    esgat_frgt_sm
/

ppfen_dyn35(all_in)   "all energy input nodes - transport module additions"
/
    entrp_pass_sm "short-to-medium distance passenger transport CES node"
    entrp_pass_lo "long distance passenger transport (aviation) CES node"
    entrp_frgt_sm "short-to-medium distance freight transport CES node"
    entrp_frgt_lo "long distance freight transport CES node"
/

es2ppfen_dyn35(all_esty,all_in)      "matching FE to ppfEn in MACRO"
/
    espet_pass_sm.entrp_pass_sm
    esdie_pass_sm.entrp_pass_sm
    esdie_pass_lo.entrp_pass_lo
    eselt_pass_sm.entrp_pass_sm
*    esh2t_pass_sm.entrp_pass_sm
*    esgat_pass_sm.entrp_pass_sm
    esdie_frgt_lo.entrp_frgt_lo
    esdie_frgt_sm.entrp_frgt_sm
*    esh2t_frgt_sm.entrp_frgt_sm
    eselt_frgt_sm.entrp_frgt_sm
*    esgat_frgt_sm.entrp_frgt_sm
/

fe2es_dyn35(all_enty,all_esty,all_teEs)    "map FE carriers to ES via appliances"
/
    fepet.espet_pass_sm.te_espet_pass_sm
    fedie.esdie_pass_sm.te_esdie_pass_sm
    fedie.esdie_pass_lo.te_esdie_pass_lo
    feelt.eselt_pass_sm.te_eselt_pass_sm
    fedie.esdie_frgt_lo.te_esdie_frgt_lo
    fedie.esdie_frgt_sm.te_esdie_frgt_sm
    feelt.eselt_frgt_sm.te_eselt_frgt_sm
/


ces_transport_dyn35(all_in,all_in)   "CES tree structure - edge transport"
/
   en    . entrp
   entrp . (entrp_pass, entrp_frgt)
   entrp_pass  . (entrp_pass_sm, entrp_pass_lo)
   entrp_frgt  . (entrp_frgt_sm, entrp_frgt_lo)
/

*** sets for the reporting, to be consistent with *complex* realisation
FE_Transp_fety35(all_enty)  "set for reporting"
/ fepet, fedie, feh2t, feelt /
FE_Elec_fety35(all_enty)    "set for reporting" 
/ feels, feelt /
;

teEs(teEs_dyn35)         = YES;
in(in_dyn35)             = YES;

esty(esty_dyn35)     = YES;

fe2es(fe2es_dyn35)       = YES;
es2ppfen(es2ppfen_dyn35) = YES;
ppfEn(ppfen_dyn35)       = YES;

cesOut2cesIn(ces_transport_dyn35)            = YES;

*** EOF ./modules/35_transport/edge_esm/sets.gms
