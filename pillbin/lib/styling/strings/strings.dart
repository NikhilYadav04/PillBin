import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:pillbin/styling/sizeconfig/sizeconfig.dart';
import 'package:url_launcher/url_launcher.dart';

class Strings {
  Strings._();

  static List<String> drawer_items = [
    "Home",
    "About",
    "Risk",
    "Reasons",
    "Take-back Programs",
    "Disposal",
    "Know More"
  ];

  static List<String> rules_strict = [
    "1. Over-purchasing and Early Discontinuation",
    "2. Improper Disposal Practices",
    "3. Community Drug Donation",
    "4. Eco-friendly Disposal Awareness"
  ];

  static List<String> rules_desc = [
    "Many Indians buy excess medicines or stop treatment prematurely, leading to surplus medicines that increase misuse and health risks. Strict rules can promote responsible use and adherence to prescriptions.",
    "Flushing unused medicines is common, causing environmental harm. Clear guidelines are needed to regulate which medicines can be flushed and encourage eco-friendly disposal methods for others.",
    "Establishing systems for collecting and redistributing unused medicines can reduce waste and provide essential medications to those in need.",
    "Public education on safe disposal methods and accessible return systems can prevent environmental damage and encourage responsible handling of pharmaceutical waste."
  ];

  static List<String> drug_title = [
    "1. Periodic Drug Take-Back Events",
    "2. Drug Take-Back Locations",
    "3. Prepaid Drug Mail-Back Envelopes"
  ];

  static List<String> drug_desc = [
    "There should be temporary setting up of collection sites for safe disposal of medications. Local law enforcement and waste management authorities  should organize similar events.",
    "Authorized facilities, such as pharmacies, clinics, and law enforcement agencies, should provide year-round disposal options, including kiosks, drop-off boxes, and mail-back programs. To locate a nearby facility, use Google Maps (\"drug disposal near me\").",
    "they  should be available for purchase at pharmacies or online, these envelopes provide a convenient way to dispose of medications."
  ];

  static RichText drug = RichText(
    text: TextSpan(children: [
      TextSpan(
        text: "• Drug disposal refers to the process of safely discarding unused, expired, or unwanted pharmaceutical products to prevent harm to the environment, humans, and animals.\n\n",style: style.copyWith(color: Colors.grey.shade700)
      ),
      TextSpan(
        text: "• Proper drug disposal ensures that pharmaceuticals are not misused, abused, or introduced into ecosystems through improper channels like flushing down drains or throwing in regular trash.\n\n",style: style.copyWith(color: Colors.grey.shade700)
      ),
      TextSpan(
        text: "• Daily Use of Medicines: Contain active pharmaceutical ingredients that can harm the environment.\n\n",style: style.copyWith(color: Colors.grey.shade700)
      ),
      TextSpan(
      text:  "• Leakage Points : ",style: style.copyWith(color: Colors.black)
      ),
      TextSpan(
        text: "Manufacturing, distribution, use, and improper disposal. In Asian and African it is found that the most common method of disposing of unused medication was throwing in the garbage, which ended up in landfills.\n\n",style: style.copyWith(color: Colors.grey.shade700)
      ),
      TextSpan(
        text: "• In Maine, US state the pain reliever acetaminophen, for example, was present in samples from one landfill at concentrations of",style: style.copyWith(color: Colors.grey.shade700)
      ),
      TextSpan(
      text:  " 117,000 ng/L, ",style: style.copyWith(color: Colors.black)
      ),
       TextSpan(
        text: "the highest level of any drug measured in the study\n\n",style: style.copyWith(color: Colors.grey.shade700)
      ),
      TextSpan(
      text: "• Sewage Treatment Limitations : ",style: style.copyWith(color: Colors.black)
      ),
      TextSpan(
        text: " Conventional methods target general properties and can't fully remove pharmaceutical compounds.",style: style.copyWith(color: Colors.grey.shade700)
      )
    ]),
  );

  static RichText drug_risks = RichText(
    text: TextSpan(
      children: [
        TextSpan(text: "• The release of antibiotics into the environment, mainly through wastewater and improper disposal, drives the emergence of antimicrobial resistance.\n\n",style: style.copyWith(color: Colors.grey.shade700)),
        TextSpan(text: "• Unused and expired antibiotics are often discarded in garbage, landfills, or sewers due to the cost of proper disposal. A recent study found that ",style: style.copyWith(color: Colors.grey.shade700)),
        TextSpan(text: "more than a quarter of some 258 rivers ",style: style.copyWith(color: Colors.black)),
        TextSpan(text: "around the world were polluted with drugs to a toxic degree. The highest concentrations of active pharmaceutical ingredients were found in Sub-Saharan Africa, South Asia, and South America.",style: style.copyWith(color: Colors.grey.shade700)),
        TextSpan(text: " Know More\n\n",style: style.copyWith(color: Colors.black,decoration: TextDecoration.underline,decorationThickness: 2),recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchUrl("https://www.pnas.org/doi/10.1073/pnas.2113947119");
                    }
                      ),
        TextSpan(text: "• Even in small concentrations, these antibiotics promote resistance through horizontal gene transfer or genetic modification. This indiscriminate release transforms harmless microbes into resistant pathogens, compromising antibiotic effectiveness. Third-generation cephalosporin-resistant E. coli , methicillin-resistant Staphylococcus aureus, multi drug resistant Candida auris, Klebsiella pneumoniae are the examples of antibiotic resistant organisms.",
        style: style.copyWith(color: Colors.grey.shade700)),
          TextSpan(text: " Know More\n\n",style: style.copyWith(color: Colors.black,decoration: TextDecoration.underline,decorationThickness: 2),recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchUrl("https://www.who.int/news-room/fact-sheets/detail/antimicrobial-resistance");
                    },),
          TextSpan(text: "When transmitted to humans, resistant bacteria lead to higher morbidity, mortality, and economic strain on healthcare systems. It was associated with an estimated ",style: style.copyWith(color: Colors.grey.shade700)),
          TextSpan(text: "five million deaths in 2019. ",style: style.copyWith(color: Colors.black)),
          TextSpan(text: " Know More\n\n",style: style.copyWith(color: Colors.black,decoration: TextDecoration.underline,decorationThickness: 2),recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchUrl("https://www.unep.org/resources/superbugs/environmental-action?gad_source=1&gclid=CjwKCAiAxreqBhAxEiwAfGfndDM_RbrPl9C9og4VhP0OgfRrDt9xpRaC-0VpiXPgpfkgi1zLxayKwRoCoEUQAvD_BwE");
                    },),
      ]
    ),
  );

  static RichText impact = RichText(text: TextSpan(
    children:
    [
       TextSpan(text:   "• The rising presence of antibiotics for human and veterinary use in the environment and food chain has been linked to the obesity epidemic. The veterinary use of diclofenac, an NSAID, has critically endangered three Asian vulture species in the Indian subcontinent.\n\n",style: style.copyWith(color: Colors.grey.shade700)),
       TextSpan(text:  "• Vultures feeding on livestock treated with diclofenac suffer organ failure (visceral gout) and die, disrupting ecosystems. Pharmaceutical contaminants also impact terrestrial and aquatic species, with psychiatric drugs like benzodiazepines causing behavioral changes in fish and their prey. ",style: style.copyWith(color: Colors.grey.shade700)),
        TextSpan(text: " Know More\n\n",style: style.copyWith(color: Colors.grey.shade700,decoration: TextDecoration.underline,decorationThickness: 2),recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchUrl("https://www.researchgate.net/publication/228008880_Diclofenac_Poisoning_as_a_Cause_of_Vulture_Population_Declines_across_the_Indian_Subcontinent");
                    },),
       TextSpan(text: "• The population of the White-rumped vulture Gyps bengalensis fell ",style: style.copyWith(color: Colors.grey.shade700)),
       TextSpan(text:  "96% between 1993 and 2002.\n\n",style: style.copyWith(color: Colors.black)),
       TextSpan(text:  "• The populations of the Indian vulture Gyps indicus and the slender-billed vulture Gyps tenuirostris fell ",style: style.copyWith(color: Colors.grey.shade700)),
       TextSpan(text: "97%. ",style: style.copyWith(color: Colors.black)),
      TextSpan(text: "Know More\n\n",style: style.copyWith(color: Colors.grey.shade700,decoration: TextDecoration.underline,decorationThickness: 2),recognizer: TapGestureRecognizer()
                    ..onTap = () {
                      _launchUrl("https://www.sciencehistory.org/stories/magazine/poison-pill-the-mysterious-die-off-of-indias-vultures/");
                    },),
      TextSpan(text: "• These effects highlight the urgent need to regulate veterinary pharmaceuticals to protect biodiversity and prevent ecological harm.",style: style.copyWith(color: Colors.grey.shade700))
    ]
  ));

  static RichText effect = RichText(text: TextSpan(
    children: [
      TextSpan(text: "• Elevated levels of estrogenic steroids, such as natural estradiol and synthetic ethinyl estradiol, introduced into aquatic environments through sources like wastewater effluents, can disrupt the endocrine systems of fish.\n\n",style: TextStyle(color: Colors.grey.shade700)),
      TextSpan(text: "• This disruption often leads to the feminization of male fish, characterized by the production of vitellogenin a protein typically synthesized only in females for egg yolk development and the development of intersex conditions, where individuals exhibit both male and female reproductive tissues.\n\n",style: style.copyWith(color: Colors.grey.shade700)),
      TextSpan(text: "• Such hormonal imbalances can impair reproductive behaviors and reduce fertility, potentially resulting in population declines and broader ecological consequences.\n\n",style: style.copyWith(color: Colors.grey.shade700))
    ]
  ));
}



TextStyle style = TextStyle(
    letterSpacing: 1,
    fontFamily: "Libre_Regular",
    fontWeight: FontWeight.w600,
    fontSize: 2.001 * SizeConfig.heightMultiplier);

Future<void> _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }
