import 'package:flutter/material.dart';

/// A single occasion shown on the Occasion Entry grid.
class OccasionItem {
  final String id;
  final IconData icon;
  final String emoji;
  final String title;
  final String tamil;
  final Color color;
  final Color bg;

  const OccasionItem({
    required this.id,
    required this.icon,
    required this.emoji,
    required this.title,
    required this.tamil,
    required this.color,
    required this.bg,
  });
}

const List<OccasionItem> occasions = [
  OccasionItem(
    id: 'birthday',
    icon: Icons.cake_outlined,
    emoji: '🎂',
    title: 'Birthday',
    tamil: 'பிறந்தநாள்',
    color: Color(0xFFBF4E17),
    bg: Color(0xFFFFF0E6),
  ),
  OccasionItem(
    id: 'anniversary',
    icon: Icons.favorite_border,
    emoji: '💑',
    title: 'Anniversary',
    tamil: 'திருமண நாள்',
    color: Color(0xFFB5316A),
    bg: Color(0xFFFFF0F5),
  ),
  OccasionItem(
    id: 'wellbeing',
    icon: Icons.health_and_safety_outlined,
    emoji: '🌿',
    title: 'Wellbeing',
    tamil: 'நலமுடன் வாழ',
    color: Color(0xFF2D7A4F),
    bg: Color(0xFFE8F5ED),
  ),
  OccasionItem(
    id: 'business',
    icon: Icons.trending_up,
    emoji: '📈',
    title: 'Business',
    tamil: 'தொழில் வளர்ச்சி',
    color: Color(0xFFC5890A),
    bg: Color(0xFFFFF8E6),
  ),
  OccasionItem(
    id: 'venture',
    icon: Icons.rocket_launch_outlined,
    emoji: '✨',
    title: 'New Venture',
    tamil: 'புதிய முயற்சி',
    color: Color(0xFF6B3FA0),
    bg: Color(0xFFF3EDFF),
  ),
  OccasionItem(
    id: 'vehicle',
    icon: Icons.directions_car_outlined,
    emoji: '🚗',
    title: 'Vehicle Pooja',
    tamil: 'வாகன பூஜை',
    color: Color(0xFF1A6FA0),
    bg: Color(0xFFE6F3FF),
  ),
  OccasionItem(
    id: 'housewarming',
    icon: Icons.home_outlined,
    emoji: '🏠',
    title: 'House Warming',
    tamil: 'கிருஹப்பிரவேசம்',
    color: Color(0xFFC44A1A),
    bg: Color(0xFFFFF0E6),
  ),
  OccasionItem(
    id: 'gratitude',
    icon: Icons.volunteer_activism_outlined,
    emoji: '🙏',
    title: 'Gratitude',
    tamil: 'நன்றி செலுத்துதல்',
    color: Color(0xFFC5890A),
    bg: Color(0xFFFFFBE6),
  ),
];

/// A bookable ritual/service offered for a given occasion.
class Ritual {
  final String id;
  final String emoji;
  final String name;
  final String tamil;
  final String description;
  final String duration;
  final int price;
  final String location;
  final String detail;
  final bool popular;

  const Ritual({
    required this.id,
    required this.emoji,
    required this.name,
    required this.tamil,
    required this.description,
    required this.duration,
    required this.price,
    required this.location,
    required this.detail,
    this.popular = false,
  });
}

const List<Ritual> _defaultRituals = [
  Ritual(
    id: 'default1',
    emoji: '🙏',
    name: 'Vishnu Sahasranamam',
    tamil: 'விஷ்ணு சகஸ்ரநாமம்',
    description: 'Recitation of the 1000 names of Lord Vishnu for all-round blessings.',
    duration: '45 mins',
    price: 1200,
    location: 'Parthasarathy Temple',
    detail: 'A deeply soulful chanting of Vishnu Sahasranamam invoking Lord Vishnu\'s thousand names. Bestows clarity, peace of mind, success in endeavours, and protection for the entire family.',
    popular: true,
  ),
];

/// Rituals offered per occasion, keyed by [OccasionItem.id].
final Map<String, List<Ritual>> ritualsByOccasion = {
  'birthday': const [
    Ritual(
      id: 'ayush',
      emoji: '🕯️',
      name: 'Ayush Homam',
      tamil: 'ஆயுஷ் ஹோமம்',
      description: 'Focused on longevity, health, and pacifying planetary alignments for the new year of life.',
      duration: '60 mins',
      price: 1500,
      location: 'Kapaleeshwarar Temple',
      detail: 'A powerful Vedic fire ritual dedicated to Ayur Devata (deity of longevity). The priest invokes blessings for long life, good health, and prosperity.',
      popular: true,
    ),
    Ritual(
      id: 'pal',
      emoji: '🥛',
      name: 'Pal (Milk) Abishekam',
      tamil: 'பால் அபிஷேகம்',
      description: 'Sacred milk offering for purity and peace.',
      duration: '30 mins',
      price: 800,
      location: 'Marundeeswarar Temple',
      detail: 'Bathing the deity with pure milk, a traditional offering to bring peace of mind, cooling of the body and mind, and overall wellbeing.',
    ),
    Ritual(
      id: 'navagraha',
      emoji: '⭐',
      name: 'Navagraha Shanti',
      tamil: 'நவகிரக சாந்தி',
      description: 'Pacifying the nine planetary deities.',
      duration: '45 mins',
      price: 1100,
      location: 'Vadapalani Temple',
      detail: 'A ritual meant to appease the Navagrahas (nine planets) to ensure any malefic planetary effects are mitigated as you step into a new year of life.',
    ),
  ],
  'anniversary': const [
    Ritual(
      id: 'swayamvara',
      emoji: '💑',
      name: 'Swayamvara Parvathi Homa',
      tamil: 'சுயம்வர பார்வதி ஹோமம்',
      description: 'Dedicated to marital harmony, unity, and seeking the combined blessings of Shiva and Parvati.',
      duration: '90 mins',
      price: 2100,
      location: 'Kapaleeshwarar Temple',
      detail: 'An elaborate fire ritual invoking Goddess Parvati and Lord Shiva together. It is considered highly auspicious for removing misunderstandings and strengthening the marital bond.',
      popular: true,
    ),
    Ritual(
      id: 'panchamirtha',
      emoji: '🍯',
      name: 'Panchamirtha Abishekam',
      tamil: 'பஞ்சாமிர்த அபிஷேகம்',
      description: 'Sweet offering representing the sweetness of marital life.',
      duration: '45 mins',
      price: 1200,
      location: 'Murugan Temple',
      detail: 'Bathing the deity in a sacred mixture of five sweet ingredients. This beautiful ritual signifies and invokes sweetness, joy, and harmony in married life.',
    ),
    Ritual(
      id: 'kalyana',
      emoji: '🌺',
      name: 'Kalyana Utsavam',
      tamil: 'கல்யாண உற்சவம்',
      description: 'Divine wedding ceremony of the deities.',
      duration: '120 mins',
      price: 3500,
      location: 'Parthasarathy Temple',
      detail: 'Participating in or sponsoring the divine marriage ceremony of the temple deities. This supreme act of devotion is believed to cement the devotees\' own marital bliss.',
    ),
  ],
  'wellbeing': const [
    Ritual(
      id: 'mrityunjaya',
      emoji: '🔱',
      name: 'Mrityunjaya Homa',
      tamil: 'மிருத்யுஞ்சய ஹோமம்',
      description: 'Centered around physical healing, vitality, and removing negative physical ailments.',
      duration: '90 mins',
      price: 2500,
      location: 'Kapaleeshwarar Temple',
      detail: 'An intense fire ritual utilizing the Maha Mrityunjaya Mantra. Highly recommended for overcoming severe health issues and ensuring a robust, long life.',
      popular: true,
    ),
    Ritual(
      id: 'honey',
      emoji: '🍯',
      name: 'Honey Abishekam',
      tamil: 'தேன் அபிஷேகம்',
      description: 'Sweet nectar offering for voice and vitality.',
      duration: '30 mins',
      price: 900,
      location: 'Vadapalani Temple',
      detail: 'Bathing the deity with pure honey. This ritual is traditionally associated with physical vitality, vocal strength, and a sweet, healthy life.',
    ),
    Ritual(
      id: 'dhanvantari',
      emoji: '🌿',
      name: 'Dhanvantari Pooja',
      tamil: 'தன்வந்திரி பூஜை',
      description: 'Invoking the divine physician for recovery.',
      duration: '45 mins',
      price: 1100,
      location: 'Marundeeswarar Temple',
      detail: 'A specialized pooja directed to Lord Dhanvantari, the cosmic healer. It is performed for quick recovery from illnesses and general immunity.',
    ),
  ],
  'business': const [
    Ritual(
      id: 'kubera',
      emoji: '💰',
      name: 'Lakshmi Kubera Homa',
      tamil: 'லட்சுமி குபேர ஹோமம்',
      description: 'Targeted at removing financial obstacles, attracting wealth, and ensuring commercial success.',
      duration: '90 mins',
      price: 2500,
      location: 'Kapaleeshwarar Temple',
      detail: 'A grand fire ritual invoking Goddess Lakshmi (wealth) and Lord Kubera (treasurer). Entrepreneurs perform this for opening new revenue streams and massive financial growth.',
      popular: true,
    ),
    Ritual(
      id: 'ganesha_arch',
      emoji: '🐘',
      name: 'Ganesha Archana',
      tamil: 'கணேச அர்ச்சனை',
      description: 'Seeking the remover of obstacles for smooth business operations.',
      duration: '30 mins',
      price: 500,
      location: 'Vadapalani Temple',
      detail: 'A focused offering of flowers and chants to Lord Ganesha, ensuring that any hurdles or roadblocks in business dealings are swiftly removed.',
    ),
    Ritual(
      id: 'navagraha_ab',
      emoji: '⭐',
      name: 'Navagraha Abishekam',
      tamil: 'நவகிரக அபிஷேகம்',
      description: 'Aligning planetary forces for business luck.',
      duration: '60 mins',
      price: 1500,
      location: 'Navagraha Shrine',
      detail: 'Bathing the nine planetary deities to ensure favorable cosmic timing for launches, deals, and daily business activities.',
    ),
  ],
  'venture': const [
    Ritual(
      id: 'ganapathi',
      emoji: '🐘',
      name: 'Ganapathi Homa',
      tamil: 'கணபதி ஹோமம்',
      description: 'The absolute prerequisite for new beginnings, focused on removing roadblocks and granting strategic wisdom.',
      duration: '60 mins',
      price: 1800,
      location: 'Vadapalani Temple',
      detail: 'No new venture begins without invoking Lord Ganesha. This foundational fire ritual clears out all unseen obstacles and sets a blessed trajectory for your startup.',
      popular: true,
    ),
    Ritual(
      id: 'saraswati',
      emoji: '📚',
      name: 'Saraswati Pooja',
      tamil: 'சரஸ்வதி பூஜை',
      description: 'Invoking the goddess of knowledge for innovative ideas.',
      duration: '45 mins',
      price: 900,
      location: 'Kapaleeshwarar Temple',
      detail: 'A pooja dedicated to Goddess Saraswati to bestow clarity of thought, innovation, and strategic brilliance upon the founders and their team.',
    ),
    Ritual(
      id: 'pal_venture',
      emoji: '🥛',
      name: 'Pal (Milk) Abishekam',
      tamil: 'பால் அபிஷேகம்',
      description: 'Purity of intention and smooth execution.',
      duration: '30 mins',
      price: 800,
      location: 'Marundeeswarar Temple',
      detail: 'Offering milk to ensure the new venture operates with purity, transparency, and experiences a smooth, unhindered growth curve.',
    ),
  ],
  'vehicle': const [
    Ritual(
      id: 'vahana',
      emoji: '🚗',
      name: 'Vahana Pooja',
      tamil: 'வாகன பூஜை',
      description: 'Traditional blessing of vehicles to ensure safe travel and ward off the "evil eye".',
      duration: '30 mins',
      price: 600,
      location: 'Vadapalani Temple',
      detail: 'A specialized pooja performed on your new vehicle. The priest blesses the steering, tires, and engine to invoke divine protection against accidents and mechanical failures.',
      popular: true,
    ),
    Ritual(
      id: 'ganesha_ash',
      emoji: '🐘',
      name: 'Ganesha Ashtothram',
      tamil: 'கணேச அஷ்டோத்திரம்',
      description: '108 names of Ganesha for safe journeys.',
      duration: '20 mins',
      price: 400,
      location: 'Vadapalani Temple',
      detail: 'Quick and powerful chanting of Ganesha\'s 108 names, specifically praying for safe, unhindered travels every time you start the ignition.',
    ),
    Ritual(
      id: 'drishti',
      emoji: '🧿',
      name: 'Drishti Durga Homam',
      tamil: 'திருஷ்டி துர்கா ஹோமம்',
      description: 'Fierce protection against jealousy and the evil eye.',
      duration: '60 mins',
      price: 1500,
      location: 'Durga Shrine',
      detail: 'A potent fire ritual dedicated to Goddess Durga to completely burn away negative energy, jealousy (drishti), and psychic attacks directed at your new asset.',
    ),
  ],
  'housewarming': const [
    Ritual(
      id: 'vastu',
      emoji: '🏠',
      name: 'Vastu Shanti Homam',
      tamil: 'வாஸ்து சாந்தி ஹோமம்',
      description: 'Purifies the new physical space, aligns cosmic energies, and invites prosperity.',
      duration: '120 mins',
      price: 3000,
      location: 'Your New Home',
      detail: 'A comprehensive fire ritual performed within the new house. It appeases the Vastu Purusha (deity of the building) and corrects any architectural energetic flaws.',
      popular: true,
    ),
    Ritual(
      id: 'ganapathi_hw',
      emoji: '🐘',
      name: 'Ganapathi Homa',
      tamil: 'கணபதி ஹோமம்',
      description: 'Removing all obstacles before moving into a new space.',
      duration: '60 mins',
      price: 1800,
      location: 'Your New Home',
      detail: 'The first fire lit in a new home should always be for Lord Ganesha, ensuring that life in the new residence is peaceful and free of sudden hurdles.',
    ),
    Ritual(
      id: 'satyanarayana',
      emoji: '🙏',
      name: 'Satyanarayana Swamy Pooja',
      tamil: 'சத்யநாராயண ஸ்வாமி பூஜை',
      description: 'A grand storytelling pooja for truth, wealth, and family joy.',
      duration: '120 mins',
      price: 2500,
      location: 'Your New Home',
      detail: 'A deeply traditional community pooja dedicated to Lord Vishnu. Gathering family and friends to hear the Katha (story) brings immense blessings and abundance to the new household.',
    ),
  ],
  'gratitude': const [
    Ritual(
      id: 'sahasranama_grat',
      emoji: '🌸',
      name: 'Sahasranama Abishekam',
      tamil: 'சகஸ்ரநாம அபிஷேகம்',
      description: 'High-tier, elaborate offerings meant purely to thank the deity without asking for a specific material outcome.',
      duration: '90 mins',
      price: 2000,
      location: 'Parthasarathy Temple',
      detail: 'The ultimate expression of thanks. An extensive bathing ritual coupled with 1000 names, surrendering completely to the divine will in sheer gratitude.',
      popular: true,
    ),
    Ritual(
      id: 'rudra_grat',
      emoji: '🔱',
      name: 'Rudra Abishekam',
      tamil: 'ருத்ர அபிஷேகம்',
      description: 'A grand offering to Shiva for unmerited grace received.',
      duration: '60 mins',
      price: 1500,
      location: 'Kapaleeshwarar Temple',
      detail: 'Thanking Lord Shiva for his protection and grace by bathing the lingam while chanting Vedic hymns of praise.',
    ),
    Ritual(
      id: 'panchamirtha_grat',
      emoji: '🍯',
      name: 'Panchamirtha Abishekam',
      tamil: 'பஞ்சாமிர்த அபிஷேகம்',
      description: 'Offering the five nectars as a sweet "thank you".',
      duration: '45 mins',
      price: 1200,
      location: 'Marundeeswarar Temple',
      detail: 'A joyful, sweet offering given simply because life is sweet, acknowledging that all good things come from the divine.',
    ),
  ],
};

/// Returns the rituals for [occasionId], falling back to a generic list.
List<Ritual> ritualsFor(String occasionId) =>
    ritualsByOccasion[occasionId] ?? _defaultRituals;
