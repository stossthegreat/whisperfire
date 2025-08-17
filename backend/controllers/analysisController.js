// controllers/analysisController.js

const { analyzeWithAI } = require('../services/aiService'); // Your AI service
const { saveProgress, getProgress } = require('../services/firebaseService'); // Firebase service for saving user progress

// Handle scan analysis (frontend calls /api/v1/analyze)
async function analyzeScan(req, res) {
  try {
    const { message, tone, userId, relationship, contentType, subjectName } = req.body;

    // Process the scan using AI
    const aiResult = await analyzeWithAI(message, tone); // Call AI service for scan

    // Create proper WhisperfireResponse structure that matches frontend models
    const whisperfireResponse = {
      context: {
        relationship: relationship || 'Partner',
        tone: tone || 'clinical',
        contentType: contentType || 'dm',
        subjectName: subjectName || null
      },
      headline: aiResult.analysis || 'Analysis of your message',
      core_take: aiResult.analysis || 'Core analysis of the communication',
      tactic: {
        name: 'Communication Analysis',
        description: 'Strategic communication breakdown'
      },
      motives: aiResult.suggestions?.[0] || 'Understanding underlying intentions',
      targeting: aiResult.suggestions?.[1] || 'Identifying communication targets',
      power_play: 'Analyzing power dynamics in communication',
      receipts: aiResult.suggestions || ['Consider tone', 'Focus on clarity'],
      next_moves: 'Strategic next steps for effective communication',
      suggested_reply: {
        text: 'Suggested response based on analysis',
        tone: tone || 'clinical'
      },
      safety: {
        level: 'safe',
        concerns: [],
        recommendations: ['Maintain professional tone']
      },
      metrics: {
        clarity: 8,
        effectiveness: 7,
        impact: 6
      }
    };

    // Save the progress in the database if userId provided
    if (userId) {
      await saveProgress(userId, { scanResult: whisperfireResponse, timestamp: new Date() });
    }

    res.json({ success: true, data: whisperfireResponse });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}

// Handle mentor chat (frontend calls /api/v1/mentor)
async function analyzeMentor(req, res) {
  try {
    const { mentor, userText, preset, options, userId } = req.body;

    // Call AI service to get mentor response
    const mentorResponse = await analyzeWithAI(`Mentor: ${mentor}, User: ${userText}, Preset: ${preset}`, 'mentor');

    // Save mentor interaction if userId provided
    if (userId) {
      await saveProgress(userId, { mentorInteraction: mentorResponse, timestamp: new Date() });
    }

    res.json({ success: true, data: mentorResponse });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}

// Handle profile update (frontend calls POST /api/v1/profile)
async function updateProfile(req, res) {
  try {
    const { userId, ...updates } = req.body;
    
    if (!userId) {
      return res.status(400).json({ error: 'userId is required' });
    }

    await saveProgress(userId, { profile: updates, timestamp: new Date() });
    res.json({ success: true, data: { profile: updates } });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}

// Handle profile get (frontend calls GET /api/v1/profile)
async function getProfile(req, res) {
  try {
    const { userId } = req.query;
    
    if (!userId) {
      return res.status(400).json({ error: 'userId is required' });
    }

    const profile = await getProgress(userId);
    res.json({ success: true, data: profile });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}

// Handle lessons get (frontend calls GET /api/v1/lessons)
async function getLessons(req, res) {
  try {
    // Mock lessons data for now
    const lessons = [
      { id: '1', title: 'Communication Basics', worldId: 'communication' },
      { id: '2', title: 'Advanced Patterns', worldId: 'patterns' }
    ];
    
    res.json({ success: true, data: lessons });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}

// Handle specific lesson get (frontend calls GET /api/v1/lessons/:worldId/:lessonId)
async function getLesson(req, res) {
  try {
    const { worldId, lessonId } = req.params;
    
    // Mock lesson data for now
    const lesson = {
      id: lessonId,
      worldId: worldId,
      title: `Lesson ${lessonId} in ${worldId}`,
      content: 'Lesson content here...'
    };
    
    res.json({ success: true, data: lesson });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}

// Handle health check (frontend calls GET /health)
async function healthCheck(req, res) {
  try {
    res.json({ success: true, status: 'healthy', timestamp: new Date() });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
}

module.exports = {
  analyzeScan,
  analyzeMentor,
  updateProfile,
  getProfile,
  getLessons,
  getLesson,
  healthCheck
}; 