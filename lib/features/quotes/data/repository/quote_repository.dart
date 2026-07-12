import 'dart:math';

import '../models/quote.dart';

class QuoteRepository {
  QuoteRepository({Random? random}) : _random = random ?? Random();

  final Random _random;

  List<Quote> get quotes => _quotes;

  Quote getRandomQuote({Quote? currentQuote}) {
    if (_quotes.isEmpty) {
      return const Quote(
        text: 'Inspiration is currently resting. Please try again soon.',
        author: 'QuoteFlow',
      );
    }

    if (_quotes.length == 1) {
      return _quotes.first;
    }

    Quote nextQuote;
    do {
      nextQuote = _quotes[_random.nextInt(_quotes.length)];
    } while (currentQuote != null && nextQuote.text == currentQuote.text);

    return nextQuote;
  }
}

const List<Quote> _quotes = [
  Quote(
    text: 'Act as if what you do makes a difference. It does.',
    author: 'William James',
  ),
  Quote(
    text:
        'Success is not final, failure is not fatal: it is the courage to continue that counts.',
    author: 'Winston Churchill',
  ),
  Quote(
    text: 'Believe you can and you are halfway there.',
    author: 'Theodore Roosevelt',
  ),
  Quote(text: 'Your limitation is only your imagination.', author: 'Unknown'),
  Quote(text: 'Great things never come from comfort zones.', author: 'Unknown'),
  Quote(text: 'Dream it. Wish it. Do it.', author: 'Unknown'),
  Quote(
    text: 'Success does not just find you. You have to go out and get it.',
    author: 'Unknown',
  ),
  Quote(
    text:
        'The harder you work for something, the greater you will feel when you achieve it.',
    author: 'Unknown',
  ),
  Quote(text: 'Dream bigger. Do bigger.', author: 'Unknown'),
  Quote(
    text: 'Do not stop when you are tired. Stop when you are done.',
    author: 'Unknown',
  ),
  Quote(
    text: 'Wake up with determination. Go to bed with satisfaction.',
    author: 'Unknown',
  ),
  Quote(
    text: 'Do something today that your future self will thank you for.',
    author: 'Unknown',
  ),
  Quote(text: 'Little things make big days.', author: 'Unknown'),
  Quote(
    text: 'It is going to be hard, but hard does not mean impossible.',
    author: 'Unknown',
  ),
  Quote(text: 'Do not wait for opportunity. Create it.', author: 'Unknown'),
  Quote(
    text:
        'Sometimes we are tested not to show our weaknesses, but to discover our strengths.',
    author: 'Unknown',
  ),
  Quote(
    text: 'The key to success is to focus on goals, not obstacles.',
    author: 'Unknown',
  ),
  Quote(text: 'Dream it, believe it, build it.', author: 'Unknown'),
  Quote(text: 'Everything you can imagine is real.', author: 'Pablo Picasso'),
  Quote(text: 'Whatever you are, be a good one.', author: 'Abraham Lincoln'),
  Quote(text: 'Turn your wounds into wisdom.', author: 'Oprah Winfrey'),
  Quote(text: 'Wherever you go, go with all your heart.', author: 'Confucius'),
  Quote(text: 'Make each day your masterpiece.', author: 'John Wooden'),
  Quote(text: 'The best way out is always through.', author: 'Robert Frost'),
  Quote(
    text: 'Energy and persistence conquer all things.',
    author: 'Benjamin Franklin',
  ),
  Quote(
    text: 'With the new day comes new strength and new thoughts.',
    author: 'Eleanor Roosevelt',
  ),
  Quote(text: 'Quality is not an act, it is a habit.', author: 'Aristotle'),
  Quote(text: 'What we think, we become.', author: 'Buddha'),
  Quote(text: 'Every moment is a fresh beginning.', author: 'T. S. Eliot'),
  Quote(
    text: 'Everything has beauty, but not everyone sees it.',
    author: 'Confucius',
  ),
  Quote(text: 'The purpose of our lives is to be happy.', author: 'Dalai Lama'),
  Quote(
    text: 'Life is what happens when you are busy making other plans.',
    author: 'John Lennon',
  ),
  Quote(text: 'Get busy living or get busy dying.', author: 'Stephen King'),
  Quote(
    text: 'You only live once, but if you do it right, once is enough.',
    author: 'Mae West',
  ),
  Quote(
    text:
        'Many of life failures are people who did not realize how close they were to success.',
    author: 'Thomas Edison',
  ),
  Quote(
    text:
        'If life were predictable it would cease to be life, and be without flavor.',
    author: 'Eleanor Roosevelt',
  ),
  Quote(
    text: 'The only impossible journey is the one you never begin.',
    author: 'Tony Robbins',
  ),
  Quote(
    text: 'In the middle of every difficulty lies opportunity.',
    author: 'Albert Einstein',
  ),
  Quote(
    text: 'Life is really simple, but we insist on making it complicated.',
    author: 'Confucius',
  ),
  Quote(text: 'May you live every day of your life.', author: 'Jonathan Swift'),
  Quote(
    text: 'Life itself is the most wonderful fairy tale.',
    author: 'Hans Christian Andersen',
  ),
  Quote(
    text: 'Do not let yesterday take up too much of today.',
    author: 'Will Rogers',
  ),
  Quote(
    text: 'You learn more from failure than from success.',
    author: 'Unknown',
  ),
  Quote(
    text:
        'If you are working on something exciting, it will keep you motivated.',
    author: 'Steve Jobs',
  ),
  Quote(
    text: 'Experience is a hard teacher because she gives the test first.',
    author: 'Vernon Sanders Law',
  ),
  Quote(
    text:
        'To know how much there is to know is the beginning of learning to live.',
    author: 'Dorothy West',
  ),
  Quote(
    text: 'Goal setting is the secret to a compelling future.',
    author: 'Tony Robbins',
  ),
  Quote(
    text: 'Concentrate all your thoughts upon the work in hand.',
    author: 'Alexander Graham Bell',
  ),
  Quote(
    text: 'Either you run the day or the day runs you.',
    author: 'Jim Rohn',
  ),
  Quote(
    text:
        'I am not a product of my circumstances. I am a product of my decisions.',
    author: 'Stephen Covey',
  ),
  Quote(
    text:
        'When we strive to become better than we are, everything around us becomes better too.',
    author: 'Paulo Coelho',
  ),
  Quote(
    text:
        'Opportunity is missed by most people because it is dressed in overalls and looks like work.',
    author: 'Thomas Edison',
  ),
  Quote(
    text:
        'Setting goals is the first step in turning the invisible into the visible.',
    author: 'Tony Robbins',
  ),
  Quote(
    text: 'Learn as if you will live forever, live like you will die tomorrow.',
    author: 'Mahatma Gandhi',
  ),
  Quote(
    text: 'Stay away from those people who try to disparage your ambitions.',
    author: 'Mark Twain',
  ),
  Quote(
    text: 'When you give joy to other people, you get more joy in return.',
    author: 'Eleanor Roosevelt',
  ),
  Quote(
    text: 'It is never too late to be what you might have been.',
    author: 'George Eliot',
  ),
  Quote(text: 'Develop success from failures.', author: 'Dale Carnegie'),
  Quote(
    text: 'Success usually comes to those who are too busy looking for it.',
    author: 'Henry David Thoreau',
  ),
  Quote(
    text:
        'The road to success and the road to failure are almost exactly the same.',
    author: 'Colin R. Davis',
  ),
  Quote(
    text:
        'Success is getting what you want; happiness is wanting what you get.',
    author: 'W. P. Kinsella',
  ),
  Quote(
    text:
        'The pessimist sees difficulty in every opportunity. The optimist sees opportunity in every difficulty.',
    author: 'Winston Churchill',
  ),
  Quote(
    text:
        'Do not let the fear of losing be greater than the excitement of winning.',
    author: 'Robert Kiyosaki',
  ),
  Quote(
    text: 'You miss one hundred percent of the shots you do not take.',
    author: 'Wayne Gretzky',
  ),
  Quote(
    text: 'Whether you think you can or you think you cannot, you are right.',
    author: 'Henry Ford',
  ),
  Quote(
    text: 'I never dreamed about success. I worked for it.',
    author: 'Estee Lauder',
  ),
  Quote(text: 'A goal is a dream with a deadline.', author: 'Napoleon Hill'),
  Quote(
    text: 'The secret of getting ahead is getting started.',
    author: 'Mark Twain',
  ),
  Quote(
    text: 'Only those who dare to fail greatly can ever achieve greatly.',
    author: 'Robert F. Kennedy',
  ),
  Quote(
    text:
        'The future belongs to those who believe in the beauty of their dreams.',
    author: 'Eleanor Roosevelt',
  ),
  Quote(
    text: 'It always seems impossible until it is done.',
    author: 'Nelson Mandela',
  ),
  Quote(
    text: 'Start where you are. Use what you have. Do what you can.',
    author: 'Arthur Ashe',
  ),
  Quote(text: 'If you can dream it, you can do it.', author: 'Walt Disney'),
  Quote(text: 'The best revenge is massive success.', author: 'Frank Sinatra'),
  Quote(
    text:
        'What you get by achieving your goals is not as important as what you become.',
    author: 'Zig Ziglar',
  ),
  Quote(
    text: 'The only way to do great work is to love what you do.',
    author: 'Steve Jobs',
  ),
  Quote(
    text:
        'Hardships often prepare ordinary people for an extraordinary destiny.',
    author: 'C. S. Lewis',
  ),
  Quote(
    text:
        'Keep your face always toward the sunshine and shadows will fall behind you.',
    author: 'Walt Whitman',
  ),
  Quote(
    text:
        'Perfection is not attainable, but if we chase perfection we can catch excellence.',
    author: 'Vince Lombardi',
  ),
  Quote(
    text: 'The mind is everything. What you think you become.',
    author: 'Buddha',
  ),
  Quote(
    text:
        'Happiness is not something ready made. It comes from your own actions.',
    author: 'Dalai Lama',
  ),
  Quote(
    text: 'The journey of a thousand miles begins with one step.',
    author: 'Lao Tzu',
  ),
  Quote(
    text: 'Do what you can, with what you have, where you are.',
    author: 'Theodore Roosevelt',
  ),
  Quote(
    text: 'A person who never made a mistake never tried anything new.',
    author: 'Albert Einstein',
  ),
  Quote(
    text: 'Creativity is intelligence having fun.',
    author: 'Albert Einstein',
  ),
  Quote(
    text:
        'The only limit to our realization of tomorrow is our doubts of today.',
    author: 'Franklin D. Roosevelt',
  ),
  Quote(
    text:
        'Do not go where the path may lead, go instead where there is no path and leave a trail.',
    author: 'Ralph Waldo Emerson',
  ),
  Quote(
    text: 'The power of imagination makes us infinite.',
    author: 'John Muir',
  ),
  Quote(text: 'Nothing will work unless you do.', author: 'Maya Angelou'),
  Quote(
    text: 'Try to be a rainbow in someone else cloud.',
    author: 'Maya Angelou',
  ),
  Quote(
    text: 'If there is no struggle, there is no progress.',
    author: 'Frederick Douglass',
  ),
  Quote(text: 'Courage is grace under pressure.', author: 'Ernest Hemingway'),
  Quote(
    text: 'No act of kindness, no matter how small, is ever wasted.',
    author: 'Aesop',
  ),
  Quote(
    text: 'The best preparation for tomorrow is doing your best today.',
    author: 'H. Jackson Brown Jr.',
  ),
  Quote(
    text: 'You are never too old to set another goal or to dream a new dream.',
    author: 'C. S. Lewis',
  ),
  Quote(
    text:
        'What lies behind us and what lies before us are tiny matters compared to what lies within us.',
    author: 'Ralph Waldo Emerson',
  ),
  Quote(
    text: 'Believe in yourself and all that you are.',
    author: 'Christian D. Larson',
  ),
  Quote(
    text: 'A champion is defined by the adversity they overcome.',
    author: 'Anderson Silva',
  ),
  Quote(
    text:
        'The beautiful thing about learning is that nobody can take it away from you.',
    author: 'B. B. King',
  ),
  Quote(
    text: 'Success is the sum of small efforts repeated day in and day out.',
    author: 'Robert Collier',
  ),
  Quote(
    text: 'Action is the foundational key to all success.',
    author: 'Pablo Picasso',
  ),
  Quote(
    text:
        'Do the best you can until you know better. Then when you know better, do better.',
    author: 'Maya Angelou',
  ),
  Quote(
    text: 'The way to get started is to quit talking and begin doing.',
    author: 'Walt Disney',
  ),
];
