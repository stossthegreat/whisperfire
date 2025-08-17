// routes/apiRoutes.js

const express = require('express');
const router = express.Router();
const analysisController = require('../controllers/analysisController');

// Routes for analyze requests - matching frontend expectations
router.post('/v1/analyze', analysisController.analyzeScan); // Frontend calls /api/v1/analyze
router.post('/v1/mentor', analysisController.analyzeMentor); // Frontend calls /api/v1/mentor
router.post('/v1/profile', analysisController.updateProfile); // Frontend calls /api/v1/profile
router.get('/v1/profile', analysisController.getProfile); // Frontend calls /api/v1/profile
router.get('/v1/lessons', analysisController.getLessons); // Frontend calls /api/v1/lessons
router.get('/v1/lessons/:worldId/:lessonId', analysisController.getLesson); // Frontend calls /api/v1/lessons/:worldId/:lessonId
router.get('/health', analysisController.healthCheck); // Frontend calls /health

module.exports = router; 