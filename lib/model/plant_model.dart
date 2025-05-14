class Plant {
  final int price;
  final String size;
  final String category;
  final String plantName;
  final String imageURL;
  bool isFavorite;
  final String description;
  final double rating;
  final int humidity;
  final String temperature;

  Plant({
    required this.rating,
    required this.humidity,
    required this.temperature,
    required this.price,
    required this.category,
    required this.plantName,
    required this.size,
    required this.imageURL,
    required this.isFavorite,
    required this.description,
  });

  static List<Plant> plantList = [
    Plant(
      price: 22,
      category: 'Indoor',
      plantName: 'Sanseviera',
      size: 'Small',
      imageURL: 'assets/plant-one.png',
      isFavorite: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      rating: 4.5,
      humidity: 34,
      temperature: '23 - 34',
    ),
    Plant(
      price: 11,
      category: 'Outdoor',
      plantName: 'Philodendron',
      size: 'Medium',
      imageURL: 'assets/plant-two.png',
      isFavorite: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      rating: 4.8,
      humidity: 56,
      temperature: '19 - 22',
    ),
    Plant(
      price: 18,
      category: 'Indoor',
      plantName: 'Beach Daisy',
      size: 'Large',
      imageURL: 'assets/plant-three.png',
      isFavorite: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      rating: 4.7,
      humidity: 34,
      temperature: '22 - 25',
    ),
    Plant(
      price: 30,
      category: 'Outdoor',
      plantName: 'Big Bluestem',
      size: 'Small',
      imageURL: 'assets/plant-one.png',
      isFavorite: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      rating: 4.5,
      humidity: 35,
      temperature: '23 - 28',
    ),
    Plant(
      price: 24,
      category: 'Recommended',
      plantName: 'Big Bluestem',
      size: 'Large',
      imageURL: 'assets/plant-four.png',
      isFavorite: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      rating: 4.1,
      humidity: 66,
      temperature: '12 - 16',
    ),
    Plant(
      price: 24,
      category: 'Outdoor',
      plantName: 'Meadow Sage',
      size: 'Medium',
      imageURL: 'assets/plant-five.png',
      isFavorite: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      rating: 4.4,
      humidity: 36,
      temperature: '15 - 18',
    ),
    Plant(
      price: 19,
      category: 'Garden',
      plantName: 'Plumbago',
      size: 'Small',
      imageURL: 'assets/plant-six.png',
      isFavorite: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      rating: 4.2,
      humidity: 46,
      temperature: '23 - 26',
    ),
    Plant(
      price: 23,
      category: 'Garden',
      plantName: 'Tritonia',
      size: 'Medium',
      imageURL: 'assets/plant-seven.png',
      isFavorite: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      rating: 4.5,
      humidity: 34,
      temperature: '21 - 24',
    ),
    Plant(
      price: 46,
      category: 'Recommended',
      plantName: 'Tritonia',
      size: 'Medium',
      imageURL: 'assets/plant-eight.png',
      isFavorite: false,
      description:
          'This plant is one of the best plant. It grows in most of the regions in the world and can survive'
          'even the harshest weather condition.',
      rating: 4.7,
      humidity: 46,
      temperature: '21 - 25',
    ),
  ];
}
