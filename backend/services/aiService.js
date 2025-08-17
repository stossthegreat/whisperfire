// services/aiService.js

const axios = require('axios');

// Function to analyze with Together AI (or any AI service)
async function analyzeWithAI(message, tone) {
  try {
    // For now, return mock responses until you set up your AI service
    if (process.env.TOGETHER_AI_KEY && process.env.TOGETHER_AI_KEY !== 'your-together-ai-key') {
      // Real AI call would go here
      const response = await axios.post('https://your-ai-endpoint', {
        message,
        tone,
        apiKey: process.env.TOGETHER_AI_KEY
      });
      return response.data;
    } else {
      // Mock response for testing
      return generateMockResponse(message, tone);
    }
  } catch (error) {
    console.error('AI service error:', error);
    return generateMockResponse(message, tone);
  }
}

// Generate mock responses for testing
function generateMockResponse(message, tone) {
  const responses = {
    'clinical': {
      analysis: 'Clinical analysis of the message content',
      tone: 'Professional and objective',
      suggestions: ['Consider more direct communication', 'Focus on facts']
    },
    'casual': {
      analysis: 'Casual conversation analysis',
      tone: 'Friendly and relaxed',
      suggestions: ['Keep it light and engaging', 'Use more conversational language']
    },
    'mentor': {
      analysis: 'Mentor guidance analysis',
      tone: 'Wise and supportive',
      suggestions: ['Consider the long-term perspective', 'Focus on growth and learning']
    }
  };

  const defaultResponse = responses[tone] || responses['casual'];
  
  return {
    message: message,
    analysis: defaultResponse.analysis,
    tone: defaultResponse.tone,
    suggestions: defaultResponse.suggestions,
    timestamp: new Date().toISOString()
  };
}

module.exports = {
  analyzeWithAI
}; 