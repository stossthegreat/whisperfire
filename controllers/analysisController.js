// controllers/analysisController.js

const { analyzeWithAI, getMentorResponse } = require('../services/aiService'); // Your AI service
const { saveProgress, getProgress } = require('../services/firebaseService'); // Firebase service for saving user progress 