const express = require('express');
const app = express();
const port = 3000;

// Middleware for parsing JSON and enabling CORS (for development)
app.use(express.json());
app.use((req, res, next) => {
  res.header('Access-Control-Allow-Origin', '*'); // Allow all origins for demo purposes
  res.header('Access-Control-Allow-Headers', 'Origin, X-Requested-With, Content-Type, Accept');
  next();
});

// In-memory data storage for demonstration purposes
let providers = [
  {
    id: 1,
    name: 'John\'s Plumbing',
    category: 'Plumbing',
    rating: 4.5,
    description: 'Experienced plumbing services for all your home needs.'
  },
  {
    id: 2,
    name: 'Elite Electricians',
    category: 'Electrical',
    rating: 4.7,
    description: 'Professional electrical services for residential and commercial projects.'
  },
  {
    id: 3,
    name: 'Sparkle Cleaning',
    category: 'Cleaning',
    rating: 4.3,
    description: 'Reliable cleaning services to keep your home or office spotless.'
  }
];

let bookings = [];

// GET /providers - Retrieve all service providers
app.get('/providers', (req, res) => {
  res.json(providers);
});

// POST /bookings - Create a new booking
app.post('/bookings', (req, res) => {
  const { providerId, userName, scheduledDate } = req.body;
  if (!providerId || !userName || !scheduledDate) {
    return res.status(400).json({ error: 'Missing required booking details' });
  }
  const newBooking = {
    id: bookings.length + 1,
    providerId,
    userName,
    scheduledDate
  };
  bookings.push(newBooking);
  res.status(201).json(newBooking);
});

// Optional: GET /bookings - Retrieve all bookings
app.get('/bookings', (req, res) => {
  res.json(bookings);
});

app.listen(port, () => {
  console.log(`Server running on http://localhost:${port}`);
});
