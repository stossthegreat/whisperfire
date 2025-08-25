import 'package:whisperfire/data/models/lesson_models.dart';

const kCategories = ['seduction','gravity','frame','scarcity','deception','coldpower'];

const kCategoryNames = {
  'seduction': 'Magnetic Presence',
  'gravity'  : 'Composed Authority',
  'frame'    : 'Conversation Frames',
  'scarcity' : 'Scarcity & Desire',
  'deception': 'Hidden Dynamics',
  'coldpower': 'Strategic Influence',
};

/// Map<category, Map<world, Map<lessonNum, Lesson>>>
const lessonsCatalog = <String, Map<int, Map<int, Lesson>>>{
  'seduction': {
    1: {
      1: Lesson(
        id: 'seduction_1_1',
        title: 'The First Law — To Withhold is to Possess',
        category: 'seduction',
        world: 1,
        lesson: 1,
        xp: 50,
        content: LessonContent(
          hook: 'Versailles, 1745. The King\'s messenger, breathless, delivers a diamond necklace to Madame de Pompadour. An answer to his proposal is expected. She doesn\'t even lift her eyes from her book. For three hours, she lets the unopened box sit on her escritoire, a silent testament to his anxiety. She knows the most powerful man in Europe is pacing in his chambers, imagining every reason for her delay. When she finally sends a reply, it contains a single, pressed flower. For your patience, the note reads. She did not give him her answer; she gave him an obsession. The art of seduction begins not with what you offer, but with what you deliberately hold back.',
          concept: [
            'Scarcity is an algorithm of the mind. The brain assigns greater value to what is rare or delayed.',
            'Mystery is a vacuum. Nature abhors it; the human psyche craves it.',
            'Power resides in the pause. Anticipation is manufactured in silence, in glance, in delay.'
          ],
          drill: Drill(
            question: 'They reach out with eagerness, seeking instant reassurance. What do you do?',
            options: [
              'Throw your attention into their hands like copper coins.',
              'Let silence gnaw at them. Hours later, carve the wound deeper: "Strange… you\'ve left a shadow I didn\'t expect. It lingers."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this needy message into one that creates scarcity and mystery.',
            input: 'I\'m free all weekend. Please see me.',
            example: 'My weekend is a locked diary. I\'m considering whether to let you write in it.'
          ),
          reflection: 'When was the last time you gave your entire self away in a moment of excitement, only to watch their interest fade? What part of yourself could you have kept veiled?'
        ),
      ),
      2: Lesson(
        id: 'seduction_1_2',
        title: 'The Second Law — Presence is a Physical Spell',
        category: 'seduction',
        world: 1,
        lesson: 2,
        xp: 50,
        content: LessonContent(
          hook: 'Berlin, 1930. A hush falls not when she enters, but a moment after. Marlene Dietrich is already at the center of the room, yet no one saw her arrive. It is her atmosphere that announces her—a cloud of tobacco flower and absolute self-possession. She doesn\'t look at the crowd; she allows the crowd to witness her. A man approaches. She doesn\'t turn her head. She lets him stand there, exposed in his own audacity, until the tension is unbearable. Then, slowly, she lowers her cigarette holder, and her eyes, heavy-lidded and knowing, finally meet his. He shivers. She conquered him before she spoke a word.',
          concept: [
            'You enter a room twice: first with your energy, then with your body.',
            'Eyes are not for looking, they are for being looked into.',
            'Stillness is the loudest sound.'
          ],
          drill: Drill(
            question: 'You enter a gathering. They look for your approach. What do you do?',
            options: [
              'Rush forward with a cheerful smile, desperate to be welcomed.',
              'Occupy a place of power, still and certain. Let your eyes brush theirs too long—then abandon them to wonder why you did not stay.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this desperate greeting into one that commands presence.',
            input: 'Hey! Over here! I saved you a seat!',
            example: '(A gesture only). You catch their eye, then slowly summon them with a tilt of your hand. Not frantic. A command.'
          ),
          reflection: 'When you walk into a room, do you feel like a guest waiting to be acknowledged, or the sovereign of your own energy?'
        ),
      ),
      3: Lesson(
        id: 'seduction_1_3',
        title: 'The Third Law — Language is a Labyrinth',
        category: 'seduction',
        world: 1,
        lesson: 3,
        xp: 50,
        content: LessonContent(
          hook: 'Paris, 1924. A young writer, desperate for her approval, pours his heart out to Gertrude Stein. He speaks of love in clichés, in well-worn phrases he thinks are original. She listens, smiling faintly. Then: "A rose is a rose is a rose." He is bewildered. She has not answered; she has set a riddle. For weeks, he will be haunted, trying to decode her. Literal language informs. Poetic language transforms.',
          concept: [
            'Subtext is the true text.',
            'The unfinished sentence is a hook.',
            'Revelation through concealment.'
          ],
          drill: Drill(
            question: 'They demand: "What are you looking for?" What do you say?',
            options: [
              'Spill your hopes like coins on a tavern table.',
              'Leave them a door half-open: "What I\'m looking for doesn\'t live in words. It only survives in silences. If you can bear those with me, you may know."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this direct statement into one that creates mystery and intrigue.',
            input: 'I can\'t stop thinking about you.',
            example: 'You\'ve become a rather delightful interruption to my otherwise orderly thoughts.'
          ),
          reflection: 'Do you wield words like bricks to build walls of facts, or like stained glass that transforms the light?'
        ),
      ),
      4: Lesson(
        id: 'seduction_1_4',
        title: 'The Fourth Law — Vulnerability is a Calculated Strike',
        category: 'seduction',
        world: 1,
        lesson: 4,
        xp: 50,
        content: LessonContent(
          hook: 'The Roman Forum, 44 BC. Julius Caesar does not show Cleopatra his legions. He shows her his epilepsy. The seizure shakes him, but he allows her to see it. Not a loss of power—an ultimate display of it. He proves he trusts her with the crack in his marble. True power is not the absence of weakness; it is control over which weakness you reveal, and to whom.',
          concept: [
            'Strategic unveiling. Reveal flaws that are strengths in disguise.',
            'The gift of trust. A curated confession forces reciprocity.',
            'The illusion of intimacy. A chosen decoy feels like depth without baring your soul.'
          ],
          drill: Drill(
            question: 'They ask about your scars, hungry for weakness. What do you reveal?',
            options: [
              'Spill your tragedies like spilled wine.',
              'Offer one scar, sharpened into a blade: "I\'ve been broken before. It taught me my passion cuts both ways—beautiful, but never harmless."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this vulnerable confession into one that shows strength through calculated weakness.',
            input: 'I\'m scared of getting hurt again.',
            example: 'My heart doesn\'t break easily, but when it does, it breaks beautifully. I\'m still learning to wield that risk.'
          ),
          reflection: 'What curated vulnerability could you reveal that would make someone lean in closer, not recoil?'
        ),
      ),
      5: Lesson(
        id: 'seduction_1_5',
        title: 'The Fifth Law — You are the Prize',
        category: 'seduction',
        world: 1,
        lesson: 5,
        xp: 50,
        content: LessonContent(
          hook: 'The French Riviera, 1966. Brigitte Bardot is surrounded by suitors—millionaires, heirs, actors. She turns to the poorest man at the table: "And you? What would you offer me that they cannot?" Instantly, the dynamic shifts. The hunters become applicants. Seduction is not winning them over; it is auditioning them for access to you.',
          concept: [
            'The frame is everything: you are the prize.',
            'Assume value, don\'t plead for it.',
            'Their desire is a mirror, not a verdict.'
          ],
          drill: Drill(
            question: 'They compliment you: "You\'re really beautiful." How do you respond?',
            options: [
              'Bow, blush, gush with thanks.',
              'Tilt your head, let a smirk play. "I know. But it\'s refreshing to hear it from someone with refined taste."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this supplicant statement into one that positions you as the prize.',
            input: 'I\'d be lucky to date someone like you.',
            example: 'You strike me as someone who would thrive with me at their side.'
          ),
          reflection: 'Do you carry yourself as a supplicant begging for validation—or as the prize others are privileged to pursue?'
        ),
      ),
    },
    2: {
      6: Lesson(
        id: 'seduction_2_6',
        title: 'The Sixth Law — The Half-Open Door',
        category: 'seduction',
        world: 2,
        lesson: 6,
        xp: 75,
        content: LessonContent(
          hook: 'Venice, 1528. Pietro Aretino, the scandalous poet, never tells the whole tale. His letters are riddles, his plays stop mid-thought. His audiences leave theatres aflame with questions, inventing endings in their own minds. Aretino understood: the seducer never finishes the story—he lets desire write its own sequel. To leave a door ajar is to invite the imagination inside.',
          concept: [
            'Minds crave completion. An unfinished gesture is more haunting than a finished one.',
            'Suggestion breeds obsession; revelation kills it.',
            'The half-open door is more seductive than the throne room wide open.'
          ],
          drill: Drill(
            question: 'They ask: "So what happened next?" What do you do?',
            options: [
              'Finish the tale, tidy and whole.',
              'Leave them suspended in silence. "Some nights shouldn\'t be spoken of. They should be remembered the way they burn."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this complete statement into one that leaves the story unfinished and mysterious.',
            input: 'I once had my heart broken. It was painful.',
            example: 'That summer by the sea… some storms leave you wetter than the rain.'
          ),
          reflection: 'Do you insist on final chapters? Or do you let them wander forever in the corridors of what you might have meant?'
        ),
      ),
      7: Lesson(
        id: 'seduction_2_7',
        title: 'The Seventh Law — The Feather and the Knife',
        category: 'seduction',
        world: 2,
        lesson: 7,
        xp: 75,
        content: LessonContent(
          hook: 'Kyoto, 1776. A geisha pours sake with one hand and slices a glance with the other. Her laughter warms; her silence chills. One samurai suitor leaves with his chest swelling from her praise; the next leaves gutted by her indifference. The power lies not in kindness, nor in cruelty—but in the oscillation between the two. The heart addicted to warmth craves it most when it fears frost.',
          concept: [
            'Desire is thermodynamic—built on contrast, not consistency.',
            'Warmth without the shadow of cold is meaningless.',
            'The seducer designs the climate, not merely reacts to it.'
          ],
          drill: Drill(
            question: 'They text in the morning, glowing from last night\'s connection. What do you do?',
            options: [
              'Mirror the glow, keep the warmth steady.',
              'Withhold. Hours later, offer something oblique. "Saw a crow this morning with eyes too human. It reminded me of you."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this eager statement into one that creates contrast and tension.',
            input: 'Last night was amazing, I want more.',
            example: 'You disrupted my schedule. I\'ll forgive you only if it happens again.'
          ),
          reflection: 'Do you leave them basking in endless sunlight, or do you remind them the night can always fall?'
        ),
      ),
      8: Lesson(
        id: 'seduction_2_8',
        title: 'The Eighth Law — The Mirror in Their Chest',
        category: 'seduction',
        world: 2,
        lesson: 8,
        xp: 75,
        content: LessonContent(
          hook: 'Paris, 1847. Balzac observes: lovers don\'t fall for each other—they fall for themselves, reflected in each other\'s eyes. The master seducer doesn\'t shine light; he becomes a mirror. He listens with predator\'s patience, then offers back a fragment of their soul, polished, brighter, more intoxicating. Nothing binds tighter than being seen—not as you are, but as you wish to be.',
          concept: [
            'People love themselves first. Reflect that image and they\'ll mistake it for love.',
            'Listening is not passive; it is surveillance for leverage.',
            'The mirror is a trap—they are dazzled by their own reflection, not by you.'
          ],
          drill: Drill(
            question: 'They say: "I love how adventurous I am." How do you respond?',
            options: [
              'Yeah, you\'re really adventurous.',
              'Adventurous is too small a word. You move like someone who\'s always one step ahead of the map.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this simple compliment into one that reflects their self-image back to them.',
            input: 'You\'re so funny.',
            example: 'You remind me of a blade wrapped in silk. People laugh, but I know they should be cautious.'
          ),
          reflection: 'Do you impose yourself on them—or do you reflect them so perfectly they drown in their own brilliance?'
        ),
      ),
      9: Lesson(
        id: 'seduction_2_9',
        title: 'The Ninth Law — The Scarcity of Touch',
        category: 'seduction',
        world: 2,
        lesson: 9,
        xp: 75,
        content: LessonContent(
          hook: 'Naples, 1610. Caravaggio paints with shadow, leaving half his canvas in darkness. The light is precious because it is rare. So too with touch. The seducer understands: hands are instruments of worship or devastation, but only when seldom used. Touch too freely and you are a tavern drunk. Touch rarely, and you become a priest of the body.',
          concept: [
            'Scarcity turns a brush of skin into a coronation.',
            'The memory of one touch lasts longer than the indulgence of many.',
            'To withhold is to carve longing into the flesh itself.'
          ],
          drill: Drill(
            question: 'They lean close, expecting your hand on theirs. What do you do?',
            options: [
              'Take it instantly. Gratify the hunger.',
              'Let the moment hang. Then, graze one finger across their wrist—withdraw as if you sinned.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this eager statement into one that creates scarcity around touch.',
            input: 'I want to hold you all night.',
            example: 'Your skin feels like something I shouldn\'t touch twice in one lifetime.'
          ),
          reflection: 'Are your hands cheap merchants, selling themselves everywhere? Or do they deliver relics that people dream of years later?'
        ),
      ),
      10: Lesson(
        id: 'seduction_2_10',
        title: 'The Tenth Law — The Sting in the Honey',
        category: 'seduction',
        world: 2,
        lesson: 10,
        xp: 75,
        content: LessonContent(
          hook: 'Baghdad, 1258. In the court of the Caliph, a concubine sings sweet verses into a poet\'s ear. Then, with a sudden laugh, she mocks his clumsy sandals before vanishing into the harem. He spends the night feverish—was she cruel or kind? Both. He doesn\'t realize: her honey needed the sting. Pure sweetness suffocates; venom revives.',
          concept: [
            'Seduction is not kindness; it is tension.',
            'Praise too much and you bore them. Cut them once, and they bleed into your hands.',
            'Honey without venom is a lullaby. Venom without honey is cruelty. Together—they are addiction.'
          ],
          drill: Drill(
            question: 'They boast: "Everyone loves me." What do you say?',
            options: [
              'Of course they do! You\'re perfect.',
              'Smile slow. "Everyone? Then why are you working so hard for just one pair of eyes?"'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this fawning statement into one that mixes praise with a subtle sting.',
            input: 'You\'re so amazing, I admire you.',
            example: 'You\'re extraordinary—but I can\'t decide if it\'s brilliance or a beautiful disguise.'
          ),
          reflection: 'Do you overdose them with sugar until they forget you, or do you lace it with poison so they never recover?'
        ),
      ),
    },
    3: {
      11: Lesson(
        id: 'seduction_3_11',
        title: 'The Spider\'s Stillness',
        category: 'seduction',
        world: 3,
        lesson: 11,
        xp: 100,
        content: LessonContent(
          hook: 'Istanbul, 1555. Roxelana, once a slave, now queen beside Suleiman the Magnificent, does not storm her rivals. She waits. Her enemies exhaust themselves in gossip and maneuvering, while she sits silent, weaving. By the time they realize the threads surround them, it is too late. Seduction is not only motion—it is the weaponization of stillness.',
          concept: [
            'Patience is a blade sharper than impulse.',
            'Stillness magnifies presence. When you do move, the world shakes.',
            'In silence, others reveal themselves, desperate to fill the void.'
          ],
          drill: Drill(
            question: 'They press you for an answer: "Do you like me or not?" What do you do?',
            options: [
              'Rush to confess.',
              'A pause. A slow smile. "You\'re impatient. That tells me more than any answer could."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this direct confession into one that creates mystery and power.',
            input: 'Yes, I like you.',
            example: 'If I didn\'t, you wouldn\'t be standing this close to the web.'
          ),
          reflection: 'Do you rush to declare yourself—or let others tangle themselves in the silence you spin?'
        ),
      ),
      12: Lesson(
        id: 'seduction_3_12',
        title: 'The Coiled Serpent',
        category: 'seduction',
        world: 3,
        lesson: 12,
        xp: 50,
        content: LessonContent(
          hook: 'Rome, 47 BC. Cleopatra enters rolled in a carpet, unveiled at Caesar\'s feet. She coils around him—not with words, but with timing. She strikes not with constant attention, but sudden, unforgettable gestures. The serpent does not chase—it waits, coils, then strikes once, and the prey never forgets.',
          concept: [
            'A single unforgettable move outweighs a hundred small ones.',
            'Sudden intensity burns deeper than steady affection.',
            'To strike rarely is to strike memorably.'
          ],
          drill: Drill(
            question: 'They expect routine flattery. What do you do?',
            options: [
              'You\'re beautiful every day.',
              'Weeks of restraint. Then, suddenly, in a whisper: "Tonight, you look like you were carved to ruin kings."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this constant compliment into one that creates sudden, memorable impact.',
            input: 'You\'re always gorgeous.',
            example: 'You walked in like a secret I\'ll never forgive myself for keeping.'
          ),
          reflection: 'Are you constant background noise, or the strike that leaves venom in their blood forever?'
        ),
      ),
      13: Lesson(
        id: 'seduction_3_13',
        title: 'The Controlled Burn',
        category: 'seduction',
        world: 3,
        lesson: 13,
        xp: 50,
        content: LessonContent(
          hook: 'London, 1813. Lord Byron seduces not with safety, but with danger. His lovers know he may vanish, betray, destroy—but that danger is the intoxication. Fire is beautiful because it might consume you. Seduction without risk is a hearth; seduction with danger is a wildfire.',
          concept: [
            'Safety comforts, but danger ensnares.',
            'A hint of unpredictability keeps the pulse racing.',
            'Never burn everything—burn just enough to make them fear the flames.'
          ],
          drill: Drill(
            question: 'They ask: "Will you always be here?" What do you say?',
            options: [
              'Of course, forever.',
              'I\'ll be here as long as it\'s worth burning for.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this safe promise into one that creates controlled danger and intrigue.',
            input: 'Don\'t worry, I\'ll never hurt you.',
            example: 'A fire doesn\'t apologize for its heat. It just teaches you how close you\'re willing to stand.'
          ),
          reflection: 'Do you promise safety and lull them to sleep—or do you ignite a fire that keeps them awake at night?'
        ),
      ),
      14: Lesson(
        id: 'seduction_3_14',
        title: 'The Fox\'s Mask',
        category: 'seduction',
        world: 3,
        lesson: 14,
        xp: 50,
        content: LessonContent(
          hook: 'Milan, 1498. Ludovico Sforza\'s mistress does not win him by honesty. She wins him with performance. To one man she is fragile, to another fierce, to another playful. Each swears they know the "real her." None do. The fox survives because it wears a thousand faces. Seduction is not authenticity—it is artistry.',
          concept: [
            'People don\'t want the truth; they want the truth that flatters their fantasy.',
            'To wear a mask is not deception—it is adaptation.',
            'The best mask is the one they beg you to keep wearing.'
          ],
          drill: Drill(
            question: 'They ask: "Who are you, really?" What do you reveal?',
            options: [
              'Spill your unvarnished self.',
              'A low smile. "Whoever you need me to be tonight."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this rigid self-declaration into one that suggests adaptability and mystery.',
            input: 'This is just me, take it or leave it.',
            example: 'I\'ve lived many lives. Which one are you hoping to meet?'
          ),
          reflection: 'Do you cling to a rigid self—or do you shapeshift into the vision they\'re starving for?'
        ),
      ),
      15: Lesson(
        id: 'seduction_3_15',
        title: 'The Oracle\'s Shadow',
        category: 'seduction',
        world: 3,
        lesson: 15,
        xp: 50,
        content: LessonContent(
          hook: 'Delphi, 440 BC. The Pythia breathes vapors, her words half-mad, half-divine. Kings tremble not because she tells the future, but because she speaks in riddles. The power is not in clarity, but in ambiguity that feels prophetic. A seducer who speaks like an oracle forces others to supply meaning—and in supplying it, they bind themselves.',
          concept: [
            'Mystery is more magnetic than certainty.',
            'Ambiguity allows them to project their desires onto you.',
            'Speak like prophecy, and they\'ll remember your words long after forgetting your face.'
          ],
          drill: Drill(
            question: 'They ask: "Do you see a future with me?" What do you say?',
            options: [
              'Yes, I want forever.',
              'The future is a storm. But some storms are worth walking into.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this plain answer into one that speaks like prophecy.',
            input: 'I think we\'ll last.',
            example: 'Some stories aren\'t measured in time, but in how deeply they cut.'
          ),
          reflection: 'Do you answer plainly, and let interest die, or do you answer like prophecy, making them carry your riddle in their chest?'
        ),
      ),
    },
    4: {
      16: Lesson(
        id: 'seduction_4_16',
        title: 'The Black Hole Effect',
        category: 'seduction',
        world: 4,
        lesson: 16,
        xp: 50,
        content: LessonContent(
          hook: 'Vienna, 1895. A salon of intellects debates Freud\'s new theories. At the far end, a woman says nothing. She listens, her gaze unwavering. When she finally speaks, every voice dies. Her silence had already bent the room around her. When she spoke, she was the only one heard. She is the black hole: pulling attention, not by noise, but by gravity.',
          concept: [
            'The most magnetic presence is not loud—it is inevitable.',
            'Silence bends orbit; when you do speak, it feels like revelation.',
            'People are addicted not to your words, but to the force of being pulled toward you.'
          ],
          drill: Drill(
            question: 'In a group, conversation turns chaotic. What do you do?',
            options: [
              'Fight to be heard.',
              'Stay still. Wait. Then speak once. The silence you create is louder than their shouting.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this desperate plea into one that commands attention through presence.',
            input: 'Hey, let me talk, I have a point too.',
            example: 'Strange how everyone missed the obvious. (And then drop your line like prophecy).'
          ),
          reflection: 'Do you chase attention—or do you let attention collapse into you?'
        ),
      ),
      17: Lesson(
        id: 'seduction_4_17',
        title: 'The Undertow',
        category: 'seduction',
        world: 4,
        lesson: 17,
        xp: 50,
        content: LessonContent(
          hook: 'Havana, 1956. Hemingway sits at Floridita with a glass of rum. A woman beside him doesn\'t laugh loudly, doesn\'t flirt openly. She simply listens, eyes steady, letting silence stretch. He finds himself confessing more than he\'s ever told anyone. She never asked—she pulled. Like an undertow, unseen but irresistible, she drags secrets from him without lifting a hand.',
          concept: [
            'Attraction is not only push—it is pull.',
            'A well-timed pause draws more than a thousand questions.',
            'When people give you secrets, they give you pieces of their soul.'
          ],
          drill: Drill(
            question: 'They finish telling you about their day and glance expectantly. What do you do?',
            options: [
              'Cool! What else happened?',
              'Quiet. Let silence stretch. Then softly: "That sounds like it mattered more than you\'re saying."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this surface question into one that pulls deeper revelations.',
            input: 'Tell me more about your work.',
            example: 'I can hear the parts you\'re not saying.'
          ),
          reflection: 'Do you surface-skate across people\'s words—or do you let them drown themselves in the depths of what they reveal to you?'
        ),
      ),
      18: Lesson(
        id: 'seduction_4_18',
        title: 'The Slow Burn of Devotion',
        category: 'seduction',
        world: 4,
        lesson: 18,
        xp: 50,
        content: LessonContent(
          hook: 'Kyoto, 1600. A geisha plays shamisen under dim lantern light. She does not rush, does not overwhelm. Each note lingers, each glance lasts a heartbeat too long. Men leave her house not intoxicated by frenzy, but haunted by slow fire. She does not erupt—she smolders. And the ember she plants burns in their chest long after she is gone.',
          concept: [
            'Seduction is not always lightning—it is ember.',
            'Slow, deliberate attention engraves itself deeper than quick passion.',
            'The long game binds people tighter than a sudden spark.'
          ],
          drill: Drill(
            question: 'They look at you, waiting for a compliment. What do you give?',
            options: [
              'You\'re stunning.',
              'A pause. A low voice: "The longer I look, the harder it gets to look away."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this simple compliment into one that creates lingering, slow-burning desire.',
            input: 'I like your smile.',
            example: 'Your smile doesn\'t leave. Even when you\'re gone, it lingers like smoke.'
          ),
          reflection: 'Are you a firework—brilliant and gone—or an ember that burns in their chest for years?'
        ),
      ),
      19: Lesson(
        id: 'seduction_4_19',
        title: 'The Mirror of Desire',
        category: 'seduction',
        world: 4,
        lesson: 19,
        xp: 50,
        content: LessonContent(
          hook: 'Venice, 1720. Casanova sits with a young noblewoman. He barely speaks of himself. Instead, every time she hints at her desires, he reflects them back—framed, elevated. She leaves convinced he is her soulmate. In truth, she fell in love with her own reflection in his eyes. The greatest seducers don\'t seduce you—they make you seduce yourself.',
          concept: [
            'People are most enchanted when they see themselves reflected beautifully.',
            'To mirror is not to mimic—it is to exalt.',
            'Give them back their own desire, but painted in gold.'
          ],
          drill: Drill(
            question: 'They say: "I want someone adventurous." What do you reflect back?',
            options: [
              'Me too, I love adventure.',
              'I can already tell—your soul doesn\'t belong in safe places.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this simple agreement into one that reflects and elevates their desires.',
            input: 'I like adventurous people.',
            example: 'You look like the kind of person who would kiss lightning if it dared you.'
          ),
          reflection: 'Do you try to impress—or do you reflect their hidden longings until they\'re convinced you are their answer?'
        ),
      ),
      20: Lesson(
        id: 'seduction_4_20',
        title: 'The Gravity Cannot Be Resisted',
        category: 'seduction',
        world: 4,
        lesson: 20,
        xp: 50,
        content: LessonContent(
          hook: 'Pisa, 1589. Galileo drops two spheres from the Leaning Tower. They fall at the same speed, proving gravity spares none. Seduction at its peak is not persuasion. It is inevitability. When the force is real, they cannot resist. They don\'t choose you. They fall.',
          concept: [
            'True seduction does not argue—it makes refusal impossible.',
            'Gravity works in silence. It doesn\'t convince; it compels.',
            'The highest art is to become the force they orbit, the law they cannot break.'
          ],
          drill: Drill(
            question: 'They protest: "I shouldn\'t want this." What do you say?',
            options: [
              'Please, give me a chance.',
              'A quiet murmur. "You already do. Fighting it only proves how strong it is."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Rewrite this begging plea into one that speaks with the authority of natural law.',
            input: 'Please choose me.',
            example: 'This isn\'t choice—it\'s law.'
          ),
          reflection: 'Do you beg to be wanted—or do you become the force of nature they cannot resist, no matter how they try?'
        ),
      ),
    },
  },
  'gravity': {
    1: {
      1: Lesson(
        id: 'gravity_1_1',
        title: 'The Temperature of Authority',
        category: 'gravity',
        world: 1,
        lesson: 1,
        xp: 50,
        content: LessonContent(
          hook: 'Moscow, 1945. Stalin walks into the war room, and though his body is frail, the air freezes. He speaks only once in the meeting. One sentence. Then silence. Generals argue for hours around his absence of words, every man terrified to be the one Stalin finally interrupts. When he does, he does not raise his voice. He only says: "Enough." It lands harder than a firing squad. True authority is not heat — it is temperature control. Composure makes others burn themselves alive trying to melt you.',
          concept: [
            'Heat pleads. Composure commands. The one who stays steady when others beg reveals themselves as the natural center.',
            'Silence is a weapon sharper than interruption. A pause can make others trip over themselves to fill it.',
            'Composed Authority is not suppression. It is restraint. It is an aura that says: "I do not need this moment. You do."'
          ],
          drill: Drill(
            question: 'At your next meeting, social event, or gathering: Do not rush to speak. Let silence fall. Watch who breaks first. When you do speak, deliver half the words you normally would. Measured, slow. Observe how the weight of your voice doubles when it emerges from stillness.',
            options: [
              'Fill every silence immediately to avoid awkwardness.',
              'Let silence fall. Speak only when necessary, with measured words.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "I totally agree, let me explain why." Forge it into something more composed and authoritative.',
            input: 'I totally agree, let me explain why.',
            example: 'That\'s enough. I\'ve heard what I need.'
          ),
          reflection: 'Do you fill silence to ease your discomfort — or do you let it crown you? When was the last time you spoke like every word was a blade?'
        ),
      ),
      2: Lesson(
        id: 'gravity_1_2',
        title: 'The Luxury of Distance',
        category: 'gravity',
        world: 1,
        lesson: 2,
        xp: 50,
        content: LessonContent(
          hook: 'The French Riviera, 1961. Alain Delon leans against the balcony rail, a cigarette loose between his fingers. The party hums behind him, desperate to pull him back into its current. But he doesn\'t chase. He drifts. He lets them orbit him like moons to a planet that doesn\'t even notice its own gravity. Some people attract by attention; Delon attracted by distance. The closer they wanted him, the further he leaned back. Desire is not always heat — sometimes it is the frost on glass you cannot touch.',
          concept: [
            'Rarity = Value. The less of you people can access, the more they crave entry.',
            'Withholding is not rejection. It is invitation sharpened into obsession.',
            'Composed Authority is luxury. You are the silk cord, not the begging hand.'
          ],
          drill: Drill(
            question: 'Leave one message unanswered for 24 hours. At a gathering, step outside alone for five minutes when the energy peaks. Return like you never left. Watch how absence re-ignites their chase.',
            options: [
              'Always respond immediately to maintain connection.',
              'Create strategic distance to increase your value and mystery.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "I miss you so much, when can I see you again?" Forge it into something more composed and distant.',
            input: 'I miss you so much, when can I see you again?',
            example: 'I\'ve been enjoying my quiet. We\'ll see if you\'re worth breaking it.'
          ),
          reflection: 'Are you a firework — dazzling, then gone — or are you the northern star, composed, distant, always craved but never caught?'
        ),
      ),
      3: Lesson(
        id: 'gravity_1_3',
        title: 'The Glacier\'s Pace',
        category: 'gravity',
        world: 1,
        lesson: 3,
        xp: 50,
        content: LessonContent(
          hook: 'Tokyo, 1980s. Yakuza boss Kazuo Taoka is surrounded by chaos. Deals collapse, rivals circle, tempers flare. He sips his tea. No rush. When he finally nods, an entire room of killers breathes again. His timing is glacial, but glaciers carve valleys and crush empires. Power is not shown in speed; it is revealed in patience. The person who never hurries makes the world walk at their pace.',
          concept: [
            'Urgency is weakness. The one who must decide now is already enslaved.',
            'Patience is terror. The longer you wait, the more they imagine the storm you\'re holding back.',
            'Composed Authority is inevitability. Like a glacier, you may be slow — but you are unstoppable.'
          ],
          drill: Drill(
            question: 'When pressured for a quick answer, say: "I\'ll let you know tomorrow." Practice waiting 10 full seconds before replying in tense conversations. Watch how their anxiety grows in your silence.',
            options: [
              'Respond immediately to show efficiency and care.',
              'Take your time. Let others wait and wonder about your decision.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "Yes, yes, fine, let\'s do it." Forge it into something more composed and deliberate.',
            input: 'Yes, yes, fine, let\'s do it.',
            example: 'Not yet. I\'ll decide when it\'s time.'
          ),
          reflection: 'Are you the hunted, panting to keep up? Or are you the glacier — slow, composed, inevitable, carving history while others crumble?'
        ),
      ),
      4: Lesson(
        id: 'gravity_1_4',
        title: 'The Discipline of Composure',
        category: 'gravity',
        world: 1,
        lesson: 4,
        xp: 50,
        content: LessonContent(
          hook: 'Sparta, 480 BC. The Persian envoy mocks Leonidas, offering riches if he kneels. Leonidas doesn\'t move. He doesn\'t shout. He doesn\'t threaten. He only smirks and says: "Come and take them." His men cheer not because of his rage, but because of his unshakable stillness. Composed Authority is discipline made flesh. It is refusing to flinch, even when the blade touches your throat.',
          concept: [
            'Control of the self is control of the room. Panic spreads. So does composure.',
            'A steady face is a weapon. It makes your enemies doubt, your allies believe.',
            'Composed Authority is not suppression — it is sculpted restraint.'
          ],
          drill: Drill(
            question: 'Practice holding a neutral face when insulted. Count to three before responding to any provocation. Never let them see the crack. Let them wonder what\'s behind the composure.',
            options: [
              'React immediately to show you\'re not a pushover.',
              'Maintain composure. Let others wonder what you\'re thinking.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "How dare you say that to me?!" Forge it into something more composed and controlled.',
            input: 'How dare you say that to me?!',
            example: 'Interesting. I\'ll remember you said that.'
          ),
          reflection: 'Do you rule your emotions, or do your emotions rule you? Who has truly mastered the battlefield of the face?'
        ),
      ),
      5: Lesson(
        id: 'gravity_1_5',
        title: 'The Crown of Indifference',
        category: 'gravity',
        world: 1,
        lesson: 5,
        xp: 50,
        content: LessonContent(
          hook: 'Harvard, 1962. A young senator named John F. Kennedy is mobbed after a speech. Dozens shout for his attention. He smiles faintly but never stops walking. He gives no one person his full gaze, yet all feel brushed by his aura. The secret? He wore indifference like a crown. The crowd didn\'t want his words — they wanted to matter to him. Indifference is not neglect. It is throne-room psychology. It makes others kneel just for the hope of recognition.',
          concept: [
            'Attention is oxygen. Starve them, and they suffocate. Grant them a breath, and they worship you.',
            'Composed Authority thrives on selective light. Let them live in shadow until you choose to shine.',
            'Indifference is not cruelty. It is the crown you wear that keeps the masses beneath you.'
          ],
          drill: Drill(
            question: 'Next time you walk into a crowded space, do not rush to greet anyone. Let them approach you first. Give three people less than they want, and one person just enough to feel special. Watch the hierarchy form around you.',
            options: [
              'Greet everyone warmly to show you\'re friendly and approachable.',
              'Let others come to you. Be selective about who gets your full attention.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "It\'s so great to see you! I\'ve missed you!" Forge it into something more composed and indifferent.',
            input: 'It\'s so great to see you! I\'ve missed you!',
            example: 'I noticed you. That\'s enough for tonight.'
          ),
          reflection: 'Do you beg to be remembered, or do you sit so high that memory itself begs to hold you?'
        ),
      ),
    },
    2: {
      6: Lesson(
        id: 'gravity_2_6',
        title: 'The Mask That Freezes Desire',
        category: 'gravity',
        world: 2,
        lesson: 6,
        xp: 75,
        content: LessonContent(
          hook: 'Versailles, 1775. Marie Antoinette enters the ballroom masked. Her smile is hidden. Her eyes unreadable. Every man wonders: is she amused? Bored? Angry? No one knows. That is the trap. The mask creates distance — and distance creates obsession. Composed Authority thrives on uncertainty. What is unseen burns hotter in the mind than what is revealed in the light.',
          concept: [
            'The mask is not deception — it is control. You reveal only what you choose.',
            'Ambiguity enslaves the imagination. What they can\'t know, they must invent.',
            'The unreadable face is stronger than the beautiful face. Beauty fades. Mystery multiplies.'
          ],
          drill: Drill(
            question: 'Next time someone asks you a personal question, answer with something half-true, half-shadow. Practice smiling without showing teeth. Let them wonder what you\'re hiding.',
            options: [
              'Be completely honest and open about your thoughts and feelings.',
              'Maintain some mystery. Let others wonder about your true thoughts.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "I\'m so into you, I can\'t stop thinking about you." Forge it into something more mysterious and composed.',
            input: 'I\'m so into you, I can\'t stop thinking about you.',
            example: 'You\'ll never know exactly what I think when I look at you — and that\'s why you can\'t stop thinking of me.'
          ),
          reflection: 'Are you addicted to being understood — or addicted to being desired? Which one lasts longer?'
        ),
      ),
      7: Lesson(
        id: 'gravity_2_7',
        title: 'The Frost of Absence',
        category: 'gravity',
        world: 2,
        lesson: 7,
        xp: 75,
        content: LessonContent(
          hook: 'Hollywood, 1955. James Dean doesn\'t show up to the party. He\'s the only one missing, yet every conversation circles back to him. "Where is he?" "Did you hear what he\'s doing?" His absence filled the room more than anyone\'s presence. Composed Authority teaches: sometimes not showing up is the loudest appearance you can make.',
          concept: [
            'Absence weaponizes curiosity. The less they see you, the more they imagine you.',
            'Cold withdrawal increases value. Distance makes hearts restless.',
            'Being scarce is more seductive than being available.'
          ],
          drill: Drill(
            question: 'Cancel one non-essential plan this week. Let them feel your absence. Delete one post from your social feed. Let them miss your presence.',
            options: [
              'Always be available and present to maintain strong connections.',
              'Create strategic absences to increase your value and mystery.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "Sorry I couldn\'t make it last night." Forge it into something more composed and distant.',
            input: 'Sorry I couldn\'t make it last night.',
            example: 'I don\'t show up everywhere — only where it matters.'
          ),
          reflection: 'Do you exhaust people by being ever-present, or do you ignite them by being a rare fire they must chase?'
        ),
      ),
      8: Lesson(
        id: 'gravity_2_8',
        title: 'The Gaze of Winter',
        category: 'gravity',
        world: 2,
        lesson: 8,
        xp: 75,
        content: LessonContent(
          hook: 'Berlin, 1936. Leni Riefenstahl stands behind the camera. She doesn\'t shout. She doesn\'t plead. She simply stares through the lens at her crew. The gaze alone commands them — icy, unblinking, eternal. A composed gaze says: "I see you, but I do not bend to you." It is more terrifying than a shout, more intoxicating than a kiss.',
          concept: [
            'The eyes are weapons. Composed Authority sharpens them into blades.',
            'Look less often. But when you do, make it linger.',
            'The gaze is not affection. It is dominion.'
          ],
          drill: Drill(
            question: 'In your next conversation, look away more often than you look at them. When you finally do look at them, hold it a second longer than is comfortable.',
            options: [
              'Maintain constant eye contact to show interest and engagement.',
              'Use strategic eye contact. Look away often, then hold their gaze when you do look.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "You look amazing tonight." Forge it into something more composed and commanding.',
            input: 'You look amazing tonight.',
            example: 'Don\'t move. I want to remember you exactly like this.'
          ),
          reflection: 'Do you scatter your gaze like coins, or do you make it a jewel that others would kill to receive?'
        ),
      ),
      9: Lesson(
        id: 'gravity_2_9',
        title: 'The Cold Shoulder of Kings',
        category: 'gravity',
        world: 2,
        lesson: 9,
        xp: 75,
        content: LessonContent(
          hook: 'Ancient Rome. A general kneels before Caesar, begging forgiveness. Caesar listens, expression unreadable. Then he turns his head and walks away without a word. The man collapses in tears. The cold shoulder is not indifference — it is annihilation. It forces the other to crawl for warmth that may never come.',
          concept: [
            'Cold rejection burns longer than hot anger.',
            'Withdrawal is a verdict. When you deny attention, you deny existence.',
            'Composed Authority doesn\'t scream "no." It whispers "nothing."'
          ],
          drill: Drill(
            question: 'Next time someone offends you, give them no words. Only absence. Respond to minor disrespect with silence instead of defense.',
            options: [
              'Confront disrespect immediately to show you won\'t be pushed around.',
              'Respond with strategic silence. Let your absence speak louder than words.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "I don\'t like what you did." Forge it into something more composed and distant.',
            input: 'I don\'t like what you did.',
            example: 'You no longer have my attention.'
          ),
          reflection: 'Do you waste energy explaining yourself to those beneath you? Or do you let your silence pronounce the final judgment?'
        ),
      ),
      10: Lesson(
        id: 'gravity_2_10',
        title: 'The Throne of Frost',
        category: 'gravity',
        world: 2,
        lesson: 10,
        xp: 75,
        content: LessonContent(
          hook: 'London, 1997. Princess Diana walks into a gala after her divorce. The world expected her broken, weeping. Instead, she is radiant — cool, untouchable, the embodiment of grace turned into defiance. The photographers swarm. The man who left her looks smaller than ever. Composed Authority is not the absence of emotion. It is the throne you sit on when the world wants you crawling.',
          concept: [
            'Composed Authority is elegance under fire. It makes your enemies look petty and your admirers look small.',
            'Control your image — control your narrative. A calm face destroys gossip.',
            'The throne of frost is built on dignity, not fury.'
          ],
          drill: Drill(
            question: 'When someone hopes to see you break, walk in stronger, colder, more radiant. Turn heartbreak into spectacle. Let them see you thrive.',
            options: [
              'Show your vulnerability to build authentic connections.',
              'Maintain composure even in difficult situations. Let your strength speak for itself.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "You hurt me, but I\'ll be okay." Forge it into something more composed and powerful.',
            input: 'You hurt me, but I\'ll be okay.',
            example: 'You expected me shattered. Instead, I became untouchable.'
          ),
          reflection: 'Do you fall when they expect, or do you rise so composed and shining they wish they had never doubted you?'
        ),
      ),
    },
    3: {
      11: Lesson(
        id: 'gravity_3_11',
        title: 'The Pause That Cuts Deeper Than Words',
        category: 'gravity',
        world: 3,
        lesson: 11,
        xp: 100,
        content: LessonContent(
          hook: 'Vienna, 1805. Beethoven is asked why he sometimes pauses for long stretches in his compositions. He smiles, tapping his temple: "Silence is the most powerful note." The audience leans in, desperate, waiting for the next sound. Composed Authority thrives on the pause. A moment of silence in speech or presence creates tension sharper than a blade.',
          concept: [
            'Silence is not absence — it is pressure.',
            'Pauses make others chase your rhythm.',
            'The one who speaks least always speaks loudest.'
          ],
          drill: Drill(
            question: 'When telling a story, insert a deliberate pause before the climax. Watch them lean in. In argument, pause instead of rushing to defend yourself. Let the silence choke them.',
            options: [
              'Always respond immediately to maintain control of the conversation.',
              'Use strategic pauses to create tension and force others to chase your rhythm.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "I love being around you." Forge it into something that uses silence strategically.',
            input: 'I love being around you.',
            example: '…You notice how quiet it feels when you\'re not here?'
          ),
          reflection: 'Do you rush to fill the air, or do you command it so others drown in the silence you create?'
        ),
      ),
      12: Lesson(
        id: 'gravity_3_12',
        title: 'The Icy Smile',
        category: 'gravity',
        world: 3,
        lesson: 12,
        xp: 100,
        content: LessonContent(
          hook: 'Moscow, 1945. Stalin is told of a betrayal. He doesn\'t rage. He doesn\'t shout. He smiles — a smile so calm, so cold, the traitor\'s knees buckle. A hot fury can be dismissed as weakness. A composed smile says: "I already own your fate."',
          concept: [
            'Smiles are not always warmth — they can be tools of control.',
            'A composed smile signals certainty, not kindness.',
            'Fear comes not from what you show, but what you don\'t.'
          ],
          drill: Drill(
            question: 'Next time someone insults you, smile slowly instead of snapping back. In conversation, practice smiling without joy — let it radiate control, not kindness.',
            options: [
              'React immediately to show you won\'t be disrespected.',
              'Respond with a slow, controlled smile that signals your certainty.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "You\'ll regret crossing me." Forge it into something more composed and controlled.',
            input: 'You\'ll regret crossing me.',
            example: 'A slow smile. "We\'ll see."'
          ),
          reflection: 'Does your smile beg for approval, or does it freeze the room into silence?'
        ),
      ),
      13: Lesson(
        id: 'gravity_3_13',
        title: 'The Temperature Drop',
        category: 'gravity',
        world: 3,
        lesson: 13,
        xp: 100,
        content: LessonContent(
          hook: 'Paris, 1920. Hemingway is laughing in a café, animated, alive. Then suddenly — silence. His face falls into stillness. His tone drops. Everyone at the table feels it: the room chills. This shift, sudden and deliberate, forces all attention back to him. Composed Authority knows that sudden stillness is as commanding as thunder.',
          concept: [
            'A change in temperature is more shocking than consistency.',
            'Controlled stillness resets the dynamic.',
            'The more composed you grow in a moment of heat, the more magnetic you become.'
          ],
          drill: Drill(
            question: 'In heated debate, drop your voice instead of raising it. In flirtation, let laughter vanish into silence for one beat too long.',
            options: [
              'Match the energy of others to maintain connection.',
              'Use sudden stillness to reset dynamics and command attention.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "I\'m not joking now." Forge it into something that uses temperature shifts strategically.',
            input: 'I\'m not joking now.',
            example: 'Notice how the air just shifted? That\'s not by accident.'
          ),
          reflection: 'Are you predictable in your energy — or do you shock the room with sudden composure?'
        ),
      ),
      14: Lesson(
        id: 'gravity_3_14',
        title: 'The Untouchable Calm',
        category: 'gravity',
        world: 3,
        lesson: 14,
        xp: 100,
        content: LessonContent(
          hook: 'Tokyo, 1600. A samurai stands surrounded by enemies. He does not unsheathe his blade. He simply breathes — steady, calm, eyes fixed. His stillness unnerves them more than any strike. Composed Authority is serenity in the storm. It makes the furious look foolish, the desperate look weak.',
          concept: [
            'Calm is more frightening than rage.',
            'Composure is armor; it makes others question their own stability.',
            'Composed stillness can unravel the strong faster than aggression.'
          ],
          drill: Drill(
            question: 'Next time someone raises their voice, lower yours. Practice holding eye contact without any reaction, even under insult.',
            options: [
              'Match their intensity to show you\'re not intimidated.',
              'Maintain composure and let your calm unsettle them.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "Stop yelling at me." Forge it into something that uses calm as a weapon.',
            input: 'Stop yelling at me.',
            example: 'Are you finished? (uttered in complete calm).'
          ),
          reflection: 'Do you match the storm of others, or do you make them drown in their own noise?'
        ),
      ),
      15: Lesson(
        id: 'gravity_3_15',
        title: 'The Art of Withdrawal',
        category: 'gravity',
        world: 3,
        lesson: 15,
        xp: 100,
        content: LessonContent(
          hook: 'New York, 1984. Madonna, mid-interview, is pressed with invasive questions. She smirks, stands, and walks away. The cameras keep rolling, but the interview is over. By leaving, she controls the narrative. By absence, she creates myth. Composed Authority is not only knowing when to appear, but when to vanish.',
          concept: [
            'Walking away is stronger than winning the argument.',
            'Withdrawal creates demand. They must chase what they lost.',
            'The exit is a weapon — use it.'
          ],
          drill: Drill(
            question: 'End one conversation before they expect it. Leave them wanting more. In text, stop replying at the high point — let silence echo.',
            options: [
              'Stay engaged until the conversation naturally concludes.',
              'End strategically when interest peaks, leaving them wanting more.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "I\'m done with this." Forge it into something that uses withdrawal strategically.',
            input: 'I\'m done with this.',
            example: 'This conversation no longer interests me. Goodbye.'
          ),
          reflection: 'Do you cling until you lose value, or do you leave while the hunger is strongest?'
        ),
      ),
    },
    4: {
      16: Lesson(
        id: 'gravity_4_16',
        title: 'The Stone Face',
        category: 'gravity',
        world: 4,
        lesson: 16,
        xp: 125,
        content: LessonContent(
          hook: 'London, 1890. Oscar Wilde delivers one of his cutting one-liners in a crowded salon. The room erupts with laughter — except for one man, seated across from him, who does not move, does not smile, does not blink. Wilde falters for the briefest second. Composed Authority thrives in the refusal to give recognition. The stone face unsettles more than any insult.',
          concept: [
            'Laughter, smiles, nods — these are gifts. Withhold them.',
            'Neutrality is power. The less emotion you show, the more others reveal.',
            'Composure forces others to scramble for warmth.'
          ],
          drill: Drill(
            question: 'When someone tries to impress you, resist giving approval. Let silence do the talking. In conflict, master the deadpan stare.',
            options: [
              'Show appreciation to encourage positive behavior.',
              'Withhold approval strategically to maintain power and mystery.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "That\'s funny." Forge it into something that uses the stone face technique.',
            input: 'That\'s funny.',
            example: 'A silent, unreadable look that forces them to question themselves.'
          ),
          reflection: 'Do you hand out validation like coins — or make them earn every flicker of expression?'
        ),
      ),
      17: Lesson(
        id: 'gravity_4_17',
        title: 'The Freeze-Out',
        category: 'gravity',
        world: 4,
        lesson: 17,
        xp: 125,
        content: LessonContent(
          hook: 'Hollywood, 1950. Marilyn Monroe is being hounded at a party. A man won\'t stop trying to charm her. She turns her body away, greets someone else, laughs at another\'s joke. He doesn\'t exist anymore. His desperation grows; the more he fights for her attention, the more invisible she makes him. The freeze-out is the ultimate rejection without a word.',
          concept: [
            'Attention is currency. Cut it off and watch them starve.',
            'Indifference wounds deeper than anger.',
            'Composed Authority denies even the dignity of acknowledgment.'
          ],
          drill: Drill(
            question: 'Next time someone presses too hard, give them nothing. Turn away. Speak to another. On text, leave the desperate unanswered.',
            options: [
              'Give everyone equal attention to be fair and kind.',
              'Use strategic indifference to control who gets your attention.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "Stop bothering me." Forge it into something that uses the freeze-out technique.',
            input: 'Stop bothering me.',
            example: 'The blank silence of someone who no longer even sees them.'
          ),
          reflection: 'Do you give attention to all who beg for it — or do you starve them until they wither?'
        ),
      ),
      18: Lesson(
        id: 'gravity_4_18',
        title: 'The Frosted Compliment',
        category: 'gravity',
        world: 4,
        lesson: 18,
        xp: 125,
        content: LessonContent(
          hook: 'Florence, 1500. Machiavelli, when asked about a rival\'s talents, replies: "Yes, he is clever… for a child." Praise coated in frost burns deeper than insult. It gives with one hand and takes with the other, leaving them confused, insecure, desperate to prove themselves.',
          concept: [
            'Backhanded compliments destabilize more than criticism.',
            'Ambiguity makes them crave clarity.',
            'Composed Authority elevates, then cuts — leaving them hooked.'
          ],
          drill: Drill(
            question: 'Compliment someone, then twist it. "You\'re confident… almost too confident." Offer faint praise with a blade hidden beneath.',
            options: [
              'Give genuine, unqualified compliments to build confidence.',
              'Use strategic ambiguity to create insecurity and dependence.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "You look nice." Forge it into something that uses the frosted compliment technique.',
            input: 'You look nice.',
            example: 'You almost look dangerous like that. Almost.'
          ),
          reflection: 'Do your words flatter — or do they freeze, leaving the other desperate to thaw them?'
        ),
      ),
      19: Lesson(
        id: 'gravity_4_19',
        title: 'The Glacier Pace',
        category: 'gravity',
        world: 4,
        lesson: 19,
        xp: 125,
        content: LessonContent(
          hook: 'New York, 1990. A Wall Street negotiator lets his rival rush through papers, demand answers, flood the room with energy. He speaks slowly, deliberately, checking each clause as though he has all the time in the world. By moving like a glacier, he forces the frantic man to drown in his own urgency. Composed Authority is time used as a weapon.',
          concept: [
            'Slow is terrifying when others are rushing.',
            'Patience is domination disguised.',
            'The slower you go, the more they reveal.'
          ],
          drill: Drill(
            question: 'Next negotiation, don\'t rush to answer. Let seconds pass. Make them sweat. Walk slower into a room than anyone else.',
            options: [
              'Move efficiently to show respect for others\' time.',
              'Use deliberate slowness to control the pace and unsettle others.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "Let\'s finish quickly." Forge it into something that uses glacier pace strategically.',
            input: 'Let\'s finish quickly.',
            example: 'We\'ll finish when I decide it\'s finished.'
          ),
          reflection: 'Do you move at the world\'s pace, or do you make the world crawl at yours?'
        ),
      ),
      20: Lesson(
        id: 'gravity_4_20',
        title: 'The Winter Crown',
        category: 'gravity',
        world: 4,
        lesson: 20,
        xp: 100,
        content: LessonContent(
          hook: 'Constantinople, 1453. As the city falls, the last Byzantine emperor, Constantine XI, removes his imperial regalia and calmly walks into battle, never to return. He dies not with panic, but with icy dignity. His calm became legend. This is the final crown of Composed Authority: to remain untouchable, even in ruin.',
          concept: [
            'Composed dignity is immortal.',
            'Even defeat can be framed as majesty.',
            'The final weapon is poise in the face of collapse.'
          ],
          drill: Drill(
            question: 'Next time you lose — smile, nod, and thank them as if you\'ve given them a gift. In heartbreak, show serenity, not collapse.',
            options: [
              'Show your true emotions to build authentic connections.',
              'Maintain composure even in defeat to preserve your dignity and power.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Take this: "I can\'t live without you." Forge it into something that uses the winter crown technique.',
            input: 'I can\'t live without you.',
            example: 'You\'ll remember how calm I was when you left.'
          ),
          reflection: 'Do you collapse when the ice cracks — or do you wear the crown of composure until the end?'
        ),
      ),
    },
  },
  'frame': {
    1: {
      1: const Lesson(
        id: 'frame_1_1',
        title: 'The Weight of the First Word',
        category: 'frame',
        world: 1,
        lesson: 1,
        xp: 50,
        content: LessonContent(
          hook: 'London, 1953. Winston Churchill is asked at a press conference if he fears losing relevance after stepping down as Prime Minister. The room chuckles, cameras flash. He raises his cigar, exhales deliberately, and only after silence reclaims the hall does he answer: "History will be kind to me—for I intend to write it." The insult collapses. The journalists laugh nervously, aware they are no longer observers but characters in his frame. He didn\'t argue. He didn\'t defend. He defined the reality.',
          concept: [
            'Whoever speaks with composure first sets the tone.',
            'Do not defend your frame; project it as reality.',
            'The crowd instinctively sides with the one who appears to author the script.'
          ],
          drill: Drill(
            question: 'Someone teases you: "Oh, you\'re always late, aren\'t you?" What do you say?',
            options: [
              'I know, sorry, I\'ll do better.',
              'Fashionably late. I\'d hate to arrive before the mood does.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this defensive statement into one that sets the frame.',
            input: 'No, that\'s not true!',
            example: 'Truth seems optional tonight. Shall we begin?'
          ),
          reflection: 'When was the last time you defended yourself instead of defining the room? Whose script are you reciting—and when will you start writing your own?'
        ),
      ),
      2: const Lesson(
        id: 'frame_1_2',
        title: 'The Frame Belongs to the Calm',
        category: 'frame',
        world: 1,
        lesson: 2,
        xp: 50,
        content: LessonContent(
          hook: 'Hollywood, 1973. Marlon Brando walks on stage at the Academy Awards. He has sent a young Native American woman, Sacheen Littlefeather, to decline his Oscar on live television. The audience boos. She does not flinch. She doesn\'t shout back. She simply holds her silence until the room caves into discomfort. Her calm is heavier than their outrage. By the time she leaves, the boos have transformed into applause. Rage burned out; composure endured.',
          concept: [
            'Emotional stillness is a fortress. The one who doesn\'t react defines reality.',
            'Noise always tires itself out. Stillness endures.',
            'A calm frame radiates inevitability—it feels like gravity.'
          ],
          drill: Drill(
            question: 'They accuse: "You\'re lying." How do you respond?',
            options: [
              'I swear I\'m telling the truth!',
              'A pause. A slow smile. "Interesting that\'s where your mind went."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this defensive statement into one that maintains frame control.',
            input: 'Calm down, I didn\'t mean it like that.',
            example: 'You seem passionate. I admire commitment, even when it\'s misplaced.'
          ),
          reflection: 'Do you let other people\'s storms pull you into their weather, or do you remain the climate they must adapt to?'
        ),
      ),
      3: const Lesson(
        id: 'frame_1_3',
        title: 'Delay is Domination',
        category: 'frame',
        world: 1,
        lesson: 3,
        xp: 50,
        content: LessonContent(
          hook: 'Paris, 1927. Josephine Baker is swarmed by admirers after a performance. A wealthy patron demands her attention, insisting on an autograph. She takes the pen, studies him silently, then signs not his notebook, but the back of her own glove. She hands it to him without explanation. He is stunned—waiting for meaning, scrambling to interpret. Her delay in giving clarity turns a trivial signature into an artifact.',
          concept: [
            'He who waits controls. The pause unsettles, stretches anticipation.',
            'Delay magnifies perceived value. Scarcity + time = obsession.',
            'Instant answers feel cheap. Delayed ones feel deliberate.'
          ],
          drill: Drill(
            question: 'They text: "So, do you like me or not?" What do you do?',
            options: [
              'Of course I do!',
              'Wait an hour. Reply: "I\'m still deciding if you\'re my kind of chaos."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this apologetic statement into one that uses delay strategically.',
            input: 'Sorry for the late reply, I was busy.',
            example: 'I respond when the words are worth sending. Tonight they are.'
          ),
          reflection: 'Do you rush to fill silence to ease your anxiety, or do you let others suffer in the suspense of your timing?'
        ),
      ),
      4: const Lesson(
        id: 'frame_1_4',
        title: 'Ridicule is a Mirror',
        category: 'frame',
        world: 1,
        lesson: 4,
        xp: 50,
        content: LessonContent(
          hook: 'New York, 1960. Gore Vidal and Norman Mailer clash on live TV. Mailer mocks Vidal, sneering at his "softness." Vidal doesn\'t rise. He doesn\'t bark back. He tilts his head, sighs theatrically, and says: "Norman, once again you mistake volume for substance." The audience erupts. Mailer has ridiculed himself by swinging at air.',
          concept: [
            'Mockery is not met with defense—it is reflected back.',
            'The fool is the one trying hardest to prove power.',
            'A single elegant turn transforms ridicule into self-exposure.'
          ],
          drill: Drill(
            question: 'They say: "You\'re not as smart as you think." What do you say?',
            options: [
              'Yes I am! Look at my…',
              'And yet, here we are. You still can\'t stop listening.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this defensive statement into one that reflects mockery back.',
            input: 'Don\'t make fun of me.',
            example: 'Careful—you\'re auditioning for my next anecdote.'
          ),
          reflection: 'When mocked, do you become the clown who proves their insult true, or the mirror that makes them choke on their own joke?'
        ),
      ),
      5: const Lesson(
        id: 'frame_1_5',
        title: 'Authority Lives in Story',
        category: 'frame',
        world: 1,
        lesson: 5,
        xp: 50,
        content: LessonContent(
          hook: 'Silicon Valley, 2007. A journalist challenges Steve Jobs on the iPhone launch: "Why should anyone believe Apple can reinvent the phone?" Jobs doesn\'t list specs. He tells a story: "Every once in a while, a revolutionary product comes along that changes everything." Then he holds up the device like a priest lifting a relic. He doesn\'t argue. He narrates destiny. The crowd doesn\'t just listen; they believe.',
          concept: [
            'Authority doesn\'t defend itself with facts—it wraps reality in narrative.',
            'Stories bypass logic; they implant inevitability.',
            'When you tell the story, you own the script.'
          ],
          drill: Drill(
            question: 'They say: "Prove it." What do you do?',
            options: [
              'Rattle off evidence.',
              'Evidence? Once, someone said the same thing to me. They regretted it.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into one that uses narrative authority.',
            input: 'Trust me, I know what I\'m doing.',
            example: 'This isn\'t my first revolution. But it may be yours.'
          ),
          reflection: 'Do you argue in bullet points like a salesman, or do you paint worlds where disbelief cannot survive?'
        ),
      ),
    },
    2: {
      6: const Lesson(
        id: 'frame_2_6',
        title: 'The Shadow Dance',
        category: 'frame',
        world: 2,
        lesson: 6,
        xp: 75,
        content: LessonContent(
          hook: 'Venice, 1720. A masquerade ball. Candlelight flickers on painted masks. Casanova does not reveal himself with declarations; he drifts past her, gaze lingering a heartbeat too long, vanishing into the crowd. She laughs with others but keeps glancing at the doorway, searching for the phantom presence that left a mark without words. Seduction thrives not in possession, but in haunting absence.',
          concept: [
            'Mystery seduces harder than certainty.',
            'Depart at your peak moment of intrigue; absence ignites imagination.',
            'To be unforgettable, you must first be elusive.'
          ],
          drill: Drill(
            question: 'They text: "Where did you disappear to last night?" What do you say?',
            options: [
              'Sorry, I just got tired and went home.',
              'I prefer leaving behind questions rather than answers.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into one that creates mystery and intrigue.',
            input: 'I miss you already.',
            example: 'Your shadow is still in my thoughts, though you\'ve barely left.'
          ),
          reflection: 'Do you make yourself forgettable by always being present, or unforgettable by leaving traces of absence?'
        ),
      ),
      7: const Lesson(
        id: 'frame_2_7',
        title: 'The Slow Burn',
        category: 'frame',
        world: 2,
        lesson: 7,
        xp: 75,
        content: LessonContent(
          hook: 'Kyoto, 11th century. In The Tale of Genji, the prince courts women not with conquest but with patience. A glance one evening, a poem slipped under a door the next, a silent gift of incense the following week. Each layer builds anticipation until longing itself becomes unbearable. The art is not in arrival, but in delay.',
          concept: [
            'Rushed desire collapses. Longing stretches it into obsession.',
            'Anticipation is sweeter than climax.',
            'Every pause is foreplay for the imagination.'
          ],
          drill: Drill(
            question: 'They ask: "Why haven\'t you kissed me yet?" What do you say?',
            options: [
              'Sorry, I didn\'t know if you wanted me to.',
              'Smile. "Because suspense tastes better than certainty."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this direct statement into one that builds anticipation.',
            input: 'I want you now.',
            example: 'Patience makes wanting you a dangerous addiction.'
          ),
          reflection: 'Do you rush to the reward, or do you craft the hunger that makes the reward unforgettable?'
        ),
      ),
      8: const Lesson(
        id: 'frame_2_8',
        title: 'The Puzzle of Desire',
        category: 'frame',
        world: 2,
        lesson: 8,
        xp: 75,
        content: LessonContent(
          hook: 'Paris, 1935. Pablo Picasso sits in a café, sketching on a napkin. A woman leans over, fascinated. He folds it and tucks it away. "May I see it?" she asks. He smirks: "Not yet." She spends the evening desperate for the reveal, only to realize the sketch matters less than the anticipation he orchestrated. Seduction is not the gift itself—it is the unfinished riddle.',
          concept: [
            'Humans crave completion; withholding creates compulsion.',
            'Desire is strongest when it is unresolved.',
            'Seduction is not about answers but about questions left hanging.'
          ],
          drill: Drill(
            question: 'They ask: "What are you thinking right now?" What do you say?',
            options: [
              'Just about how much I like you.',
              'Something that would ruin the fun if I told you.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into one that creates mystery and intrigue.',
            input: 'You\'re perfect.',
            example: 'You\'re a mystery I\'d rather never solve completely.'
          ),
          reflection: 'Do you hand out certainty, or do you plant riddles that keep them chasing?'
        ),
      ),
      9: Lesson(
        id: 'frame_2_9',
        title: 'The Touch of Almost',
        category: 'frame',
        world: 2,
        lesson: 9,
        xp: 75,
        content: LessonContent(
          hook: 'Paris opera house, 1875. A young baron escorts his lover through the gilded hall. His hand hovers just above hers, never touching, never claiming—an almost unbearable closeness. She feels heat without contact, possession without grasp. True seduction lies not in the obvious touch, but in the electricity of almost.',
          concept: [
            'Tension > contact. The moment before the kiss often outweighs the kiss itself.',
            'A whisper beats a shout.',
            'To inflame desire, flirt with proximity but deny the finish.'
          ],
          drill: Drill(
            question: 'They lean close, whisper: "Are you going to kiss me?" What do you do?',
            options: [
              'Rush in and kiss.',
              'Brush your lips near theirs, pause. "Not until you can\'t stand the wait."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into one that creates tension and anticipation.',
            input: 'I can\'t wait to touch you.',
            example: 'Your skin already remembers me, and I haven\'t touched it yet.'
          ),
          reflection: 'Do you rush to possession, or do you command the unbearable ache of the almost?'
        ),
      ),
      10: Lesson(
        id: 'frame_2_10',
        title: 'The Mask of Contradiction',
        category: 'frame',
        world: 2,
        lesson: 10,
        xp: 75,
        content: LessonContent(
          hook: 'Hollywood, 1955. James Dean, equal parts rebel and innocent, enters a party. To some, he\'s danger; to others, he\'s vulnerability. The contradiction multiplies intrigue: the untamed wolf with the boyish grin. True seduction lies in refusing to be one thing—your contradictions force others to crave decoding.',
          concept: [
            'People are addicted to contradictions.',
            'Softness wrapped in danger, cruelty laced with tenderness—such paradoxes ignite obsession.',
            'A single archetype is forgettable; a contradiction is unforgettable.'
          ],
          drill: Drill(
            question: 'They tease: "You\'re trouble, aren\'t you?" What do you say?',
            options: [
              'No, I\'m really nice once you know me.',
              'Danger with a conscience. Which side tempts you more?'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into one that embraces contradiction.',
            input: 'I\'m complicated.',
            example: 'I\'m the contradiction you\'ll never solve, and that\'s why you\'ll stay.'
          ),
          reflection: 'Do you flatten yourself into predictability, or do you weave paradoxes that make people hunger to decode you?'
        ),
      ),
    },
    3: {
      11: Lesson(
        id: 'frame_3_11',
        title: 'The Glance That Burns',
        category: 'frame',
        world: 3,
        lesson: 11,
        xp: 100,
        content: LessonContent(
          hook: 'Cairo, 1920. In the thick air of a jazz club, a woman in emerald silk doesn\'t smile, doesn\'t speak—she only looks. Her gaze lingers, slow and deliberate, as if peeling away every defense. Men who meet it laugh nervously, tug their collars, retreat. One man, however, cannot look away. He feels undressed, claimed, consumed. A glance, wielded correctly, is not observation—it is possession.',
          concept: [
            'The eyes seduce more than words.',
            'A gaze held too long creates tension almost unbearable.',
            'Looking away too soon kills the spark; holding it claims dominance.'
          ],
          drill: Drill(
            question: 'They notice you staring: "Why are you looking at me like that?" What do you say?',
            options: [
              'Sorry, I didn\'t mean to stare.',
              'Because I wanted to see if you\'d be brave enough not to look away.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into one that creates intrigue and mystery.',
            input: 'You\'re really attractive.',
            example: 'You have the kind of face that refuses to be forgotten.'
          ),
          reflection: 'Do you scatter your gaze timidly, or do you brand someone\'s soul with the weight of your attention?'
        ),
      ),
      12: Lesson(
        id: 'frame_3_12',
        title: 'The Silence Between Notes',
        category: 'frame',
        world: 3,
        lesson: 12,
        xp: 100,
        content: LessonContent(
          hook: 'Vienna, 1805. At a private salon, Beethoven plays a sonata. The most devastating moment is not a cascade of notes but a pause, a silence so thick the room holds its breath. Anticipation floods the air—every ear leans into the void. When the music resumes, it lands like thunder. Silence, used deliberately, is the loudest sound in the world.',
          concept: [
            'Speech is cheap; silence is costly.',
            'The unsaid carries more weight than the said.',
            'Pauses make words taste richer, like wine sipped slowly.'
          ],
          drill: Drill(
            question: 'They ask: "Why aren\'t you saying anything?" What do you say?',
            options: [
              'Sorry, I just don\'t know what to say.',
              'Smile faintly. "Because silence makes you lean closer."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into one that uses silence strategically.',
            input: 'I like listening to you.',
            example: 'Your words sound better against the backdrop of my silence.'
          ),
          reflection: 'Do you rush to fill every pause, or do you craft silences that force others to chase your meaning?'
        ),
      ),
      13: Lesson(
        id: 'frame_3_13',
        title: 'The Gift of Withholding',
        category: 'frame',
        world: 3,
        lesson: 13,
        xp: 100,
        content: LessonContent(
          hook: 'Paris, 1958. Yves Saint Laurent unveils a gown, but backstage, the hem is deliberately unfinished. Critics sneer—until weeks later, women across Europe beg for replicas. By withholding perfection, he gave them hunger. Desire is not about giving everything—it\'s about giving almost everything, leaving the soul restless for the missing piece.',
          concept: [
            'Completion satisfies; incompletion enslaves.',
            'The greatest seducers are architects of longing.',
            'What you deny becomes the object of obsession.'
          ],
          drill: Drill(
            question: 'They ask: "So when can I see you again?" What do you say?',
            options: [
              'Tomorrow night, whenever you want!',
              'Soon. But not yet. Anticipation is part of the taste.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into one that creates longing through withholding.',
            input: 'I want to give you everything.',
            example: 'I want to give you almost everything, so you\'ll never stop craving the rest.'
          ),
          reflection: 'Do you try to complete others quickly, or do you leave them restless, dreaming of the piece you\'ve kept back?'
        ),
      ),
      14: Lesson(
        id: 'frame_3_14',
        title: 'The Scent That Stays',
        category: 'frame',
        world: 3,
        lesson: 14,
        xp: 100,
        content: LessonContent(
          hook: 'Istanbul, 1890. A merchant lights oud incense in a narrow alley before leaving. Hours after he\'s gone, the fragrance still lingers—haunting, intoxicating, inseparable from him. People remember him less for his words and more for the trace he left behind. Seduction is not just in presence—it is in the afterglow.',
          concept: [
            'A lingering trace can outlast hours of presence.',
            'Scents, phrases, gestures—anything that echoes after you\'ve left—become signatures of desire.',
            'The most potent seduction begins after the door closes.'
          ],
          drill: Drill(
            question: 'They say: "You\'re leaving already?" What do you say?',
            options: [
              'Yeah, I\'m tired.',
              'I prefer to leave while the air still remembers me.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into one that creates lingering presence.',
            input: 'I\'ll see you later.',
            example: 'Even after I\'m gone, you\'ll keep catching me in the air.'
          ),
          reflection: 'Do you vanish completely when absent, or do you leave behind a haunting trace that keeps you alive in their senses?'
        ),
      ),
      15: Lesson(
        id: 'frame_3_15',
        title: 'The Poisoned Compliment',
        category: 'frame',
        world: 3,
        lesson: 15,
        xp: 100,
        content: LessonContent(
          hook: 'London, 1927. A poet leans across the table to his muse. "Your beauty unsettles me," he murmurs, "but your silence unsettles me more." The line wounds and flatters in equal measure. She cannot dismiss him; his words cling like perfume and venom. True seduction is not in empty praise, but in compliments laced with a sting that forces them to replay it endlessly.',
          concept: [
            'Flattery fades; tension lingers.',
            'A poisoned compliment binds desire with doubt, making them crave more for resolution.',
            'To seduce is to disturb equilibrium.'
          ],
          drill: Drill(
            question: 'They ask: "Do you think I\'m attractive?" What do you say?',
            options: [
              'Yes, you\'re gorgeous.',
              'Yes, dangerously so. But beauty that reckless usually leaves scars.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into one that creates tension and intrigue.',
            input: 'You\'re perfect.',
            example: 'You\'re nearly perfect—the kind of flaw that makes perfection unbearable.'
          ),
          reflection: 'Do you hand out cheap validation, or do you craft words that live inside them, sweet and sharp at once?'
        ),
      ),
    },
    4: {
      16: Lesson(
        id: 'frame_4_16',
        title: 'The Dangerous Secret',
        category: 'frame',
        world: 4,
        lesson: 16,
        xp: 125,
        content: LessonContent(
          hook: 'Venice, 1703. A masked courtesan whispers to a nobleman in the candlelit shadows of Carnival: "If I told you the truth, you\'d never sleep again." Then she laughs and disappears into the crowd. He spends years recalling that one line, haunted by the mystery of a secret never revealed. A hint of danger intoxicates far more than confession.',
          concept: [
            'The promise of revelation seduces more than the revelation itself.',
            'People desire what they cannot fully know.',
            'Secrets are not walls—they are invitations.'
          ],
          drill: Drill(
            question: 'They ask: "So what are you hiding?" What do you say?',
            options: [
              'Nothing really, I\'m an open book.',
              'Enough to keep you awake tonight.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into one that maintains mystery and intrigue.',
            input: 'I\'ll tell you everything about me.',
            example: 'If I told you everything, I\'d be less interesting tomorrow.'
          ),
          reflection: 'Do you trade all your mystery for cheap intimacy, or do you guard secrets so others dream of unlocking you?'
        ),
      ),
      17: Lesson(
        id: 'frame_4_17',
        title: 'The Feather and the Blade',
        category: 'frame',
        world: 4,
        lesson: 17,
        xp: 125,
        content: LessonContent(
          hook: 'Kyoto, 1650. A geisha entertains a samurai with gentle teasing. She praises his haiku, then with a sly smile adds: "It is beautiful… in its simplicity." He laughs, stung and charmed at once. She strokes his pride, then nicks it with a blade. He leaves restless, desperate to win her unqualified admiration. Seduction thrives on duality—pleasure followed by the faintest cut.',
          concept: [
            'Praise alone dulls desire; tension sharpens it.',
            'To tease is to balance kindness with the faintest cruelty.',
            'A feather softens, a blade awakens.'
          ],
          drill: Drill(
            question: 'They boast: "I\'m really good at this." What do you say?',
            options: [
              'Yes, you\'re amazing!',
              'Good, yes. But greatness makes me harder to impress.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into one that creates tension through duality.',
            input: 'You\'re perfect.',
            example: 'You\'re the most perfect imperfection I\'ve ever wanted.'
          ),
          reflection: 'Do you hand out unconditional flattery, or do you lace desire with the sting that keeps them addicted?'
        ),
      ),
      18: Lesson(
        id: 'frame_4_18',
        title: 'The Disappearing Act',
        category: 'frame',
        world: 4,
        lesson: 18,
        xp: 125,
        content: LessonContent(
          hook: 'New York, 1982. At Studio 54, a man holds the entire dance floor in thrall—until he suddenly vanishes. No word, no goodbye. Whispers ripple through the crowd: "Where did he go?" His absence becomes larger than his presence. The next night, all eyes search for him. Seduction is not only in showing up—it is in leaving when the desire peaks.',
          concept: [
            'Timing your exit is more powerful than timing your entrance.',
            'To vanish at the height of attention creates hunger.',
            'Absence plants obsession deeper than presence ever could.'
          ],
          drill: Drill(
            question: 'The night is electric. They ask: "Stay a little longer?" What do you say?',
            options: [
              'Of course, as long as you want.',
              'Not tonight. It\'s better to leave you wanting.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into one that uses strategic exit.',
            input: 'I\'ll stay until the end.',
            example: 'The ending is stronger when it arrives too soon.'
          ),
          reflection: 'Do you cling until desire fades, or do you vanish at the crest of the wave, leaving them gasping in your wake?'
        ),
      ),
      19: Lesson(
        id: 'frame_4_19',
        title: 'The Unreachable Kiss',
        category: 'frame',
        world: 4,
        lesson: 19,
        xp: 125,
        content: LessonContent(
          hook: 'Madrid, 1901. On a balcony, two lovers lean close. Lips nearly touch—then she withdraws, smiling. The kiss never lands. The man is left drunk on what almost was. Denial is not rejection—it is an acceleration. What is withheld burns hotter than what is consumed.',
          concept: [
            'Fulfillment is an end; deferral is a chain.',
            'To offer and withdraw is to multiply desire.',
            'The unreachable kiss is more dangerous than the kiss given freely.'
          ],
          drill: Drill(
            question: 'They lean in. What do you do?',
            options: [
              'Rush forward eagerly, sealing the moment.',
              'Brush their cheek, pause, whisper: "Not yet. Patience is part of the taste."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into one that creates anticipation through restraint.',
            input: 'Kiss me now.',
            example: 'You\'ll think about this kiss longer if I don\'t give it yet.'
          ),
          reflection: 'Do you satisfy immediately, or do you chain their hunger with restraint so the fire grows unbearable?'
        ),
      ),
      20: Lesson(
        id: 'frame_4_20',
        title: 'The Frame of Fire',
        category: 'frame',
        world: 4,
        lesson: 20,
        xp: 125,
        content: LessonContent(
          hook: 'Berlin, 1932. In a smoke-choked café, a poet tells a woman: "Every man here wants you. But I am the only one who dares admit I don\'t." She laughs, unsettled. He has shattered the frame—no longer a pursuer, but the pursued. Frame control is the alchemy of seduction: whoever defines reality owns the game.',
          concept: [
            'Desire follows the frame. If you act as if they are chasing you, they will.',
            'Reversing roles unsettles and excites.',
            'Seduction is not begging—it is dictating the script.'
          ],
          drill: Drill(
            question: 'They tease: "You like me, don\'t you?" What do you say?',
            options: [
              'Of course, I do!',
              'Smile. "You\'d like to think so, wouldn\'t you?"'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into one that controls the frame.',
            input: 'I really want you.',
            example: 'The question is not whether I want you. It\'s whether you\'re bold enough to handle being wanted.'
          ),
          reflection: 'Do you play inside the frame they hand you, or do you redraw the borders so they\'re trapped inside your design?'
        ),
      ),
    },
  },
  'scarcity': {
    1: {
      1: Lesson(
        id: 'scarcity_1_1',
        title: 'The First Law — To Withhold is to Possess',
        category: 'scarcity',
        world: 1,
        lesson: 1,
        xp: 50,
        content: LessonContent(
          hook: 'Versailles, 1745. The King\'s messenger delivers a necklace to Madame de Pompadour. She doesn\'t touch it. For hours, the unopened box sits untouched as the King paces, his mind devoured by uncertainty. When she finally replies, she sends not words, not consent — but a pressed flower. His obsession is no accident. She understood: what you hold back is stronger than what you give.',
          concept: [
            'Scarcity fuels obsession.',
            'Mystery is a vacuum the mind can\'t leave alone.',
            'The pause, the delay, the withheld word — these are the pressure points of desire.'
          ],
          drill: Drill(
            question: 'They text: "I had the best night with you." What do you respond?',
            options: [
              'Me too! Can\'t wait to see you again.',
              'Hours later: "Still unravelling last night. You surprised me."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this desperate plea into one that creates scarcity.',
            input: 'I\'m free all weekend. Please see me.',
            example: 'My weekend is a locked diary. I may let you write a page.'
          ),
          reflection: 'Do you rush to give all of yourself, or do you create the ache of waiting?'
        ),
      ),
      2: Lesson(
        id: 'scarcity_1_2',
        title: 'The Second Law — Presence is a Physical Spell',
        category: 'scarcity',
        world: 1,
        lesson: 2,
        xp: 50,
        content: LessonContent(
          hook: 'Berlin, 1930. A club freezes not when Marlene Dietrich enters, but seconds later, when people realize she\'s already there. She doesn\'t demand attention. Her stillness, her scent, her silence announce her. A man approaches. She does not look at him. She lets him burn in the quiet until she finally lowers her eyes like a guillotine. He is conquered before words.',
          concept: [
            'Your energy enters a room before your body.',
            'The eyes aren\'t for looking — they\'re for holding.',
            'Stillness screams louder than noise.'
          ],
          drill: Drill(
            question: 'At a party, you see someone you want. What do you do?',
            options: [
              'Rush over, smiling brightly.',
              'Anchor yourself, catch their eye, let it linger a beat too long, then drift away.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this desperate greeting into one that commands presence.',
            input: 'Hey! Over here, I saved you a seat!',
            example: 'A slow gesture to the empty chair beside you. Not a wave. A summons.'
          ),
          reflection: 'Do you enter rooms hoping to be welcomed, or do you let the room rearrange itself around you?'
        ),
      ),
      3: Lesson(
        id: 'scarcity_1_3',
        title: 'The Third Law — Language is a Labyrinth',
        category: 'scarcity',
        world: 1,
        lesson: 3,
        xp: 50,
        content: LessonContent(
          hook: 'Paris, 1924. A young writer pours clichés of love at Gertrude Stein\'s feet. When he\'s finished, she says only: "A rose is a rose is a rose." He is bewildered, but hooked. She gave him no answer, only a riddle. He will spend weeks lost in her words. Literal language informs. Poetic language transforms.',
          concept: [
            'Subtext is stronger than plain text.',
            'Unfinished sentences are irresistible.',
            'Secrets don\'t need to exist — only the suggestion of them.'
          ],
          drill: Drill(
            question: 'They ask: "What are you looking for?" What do you say?',
            options: [
              'A real connection, someone kind and honest.',
              'Someone who understands that silence can be louder than words.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this direct statement into one that creates intrigue.',
            input: 'I can\'t stop thinking about you.',
            example: 'You\'ve become a delightful interruption in my thoughts.'
          ),
          reflection: 'Do you speak like a manual, or like a maze? Which of your words leave people thinking long after you\'ve left?'
        ),
      ),
      4: Lesson(
        id: 'scarcity_1_4',
        title: 'The Fourth Law — Vulnerability is a Calculated Strike',
        category: 'scarcity',
        world: 1,
        lesson: 4,
        xp: 50,
        content: LessonContent(
          hook: 'Rome, 44 BC. Julius Caesar does not show Cleopatra his armies. He shows her his seizures. The most powerful man alive, trembling in her presence. It is not weakness. It is intimacy disguised as surrender. By revealing a fracture, he created a bond stronger than steel.',
          concept: [
            'Vulnerability, when chosen, is power.',
            'The gift of trust forces reciprocity.',
            'A curated flaw seduces more than perfection ever could.'
          ],
          drill: Drill(
            question: 'On a date, they ask about your past. What do you reveal?',
            options: [
              'Spill everything: the heartbreaks, the scars.',
              'Offer one gem: "Once, I trusted someone with too much of me. It taught me to guard the fire."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this fearful statement into one that shows strength through vulnerability.',
            input: 'I\'m scared of getting hurt.',
            example: 'My heart doesn\'t break easily — but when it does, it breaks beautifully.'
          ),
          reflection: 'Do you smother with oversharing or bore with perfection? What one curated scar could make you unforgettable?'
        ),
      ),
      5: Lesson(
        id: 'scarcity_1_5',
        title: 'The Fifth Law — You Are the Prize',
        category: 'scarcity',
        world: 1,
        lesson: 5,
        xp: 50,
        content: LessonContent(
          hook: 'The Riviera, 1966. Brigitte Bardot is drowned in jewels and yachts by admirers. She doesn\'t flinch. She turns to the poorest man at the table and asks, "And you? What will you offer me that they cannot?" The power shifts. They are auditioning. She is the prize.',
          concept: [
            'The frame decides the game. Set it: they audition, you select.',
            'Assume value. Never beg for it.',
            'Their desire reflects their taste, not your worth.'
          ],
          drill: Drill(
            question: 'They say: "You\'re so beautiful." How do you respond?',
            options: [
              'Oh thank you, that\'s so sweet!',
              'A smirk. "I know. But it\'s rare to hear it from someone with good taste."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this supplicant statement into one that positions you as the prize.',
            input: 'I\'d be lucky to have you.',
            example: 'Someone like you might thrive with me at their side.'
          ),
          reflection: 'Do you beg to be chosen, or do you demand the world prove worthy of you?'
        ),
      ),
    },
    2: {
      6: Lesson(
        id: 'scarcity_2_6',
        title: 'The Art of the Unfinished (Weaving Incomplete Narratives)',
        category: 'scarcity',
        world: 2,
        lesson: 6,
        xp: 50,
        content: LessonContent(
          hook: 'Paris, 1922. Marcel Proust does not simply tell a story; he builds a labyrinth of memory, leaving corridors unexplored and doors locked forever. A single description — a madeleine dipped in tea — detonates an entire universe of memory. Yet he never maps the universe; he gives you only a fragment, a hint. The rest you must chase inside your own mind. His genius is in the unfinished. The reader becomes the co-creator, forever haunted by what they cannot complete.',
          concept: [
            'The Mind Hates a Vacuum: When you leave something incomplete, the psyche rushes to fill it.',
            'You Are the Architect, Not the Tenant: Do not furnish the whole room. Leave it bare, let them decorate it with their own fantasies.',
            'Closure is Death: The final word, the neat ending, ends desire. Always leave a thread undone.'
          ],
          drill: Drill(
            question: 'They ask: "Have you ever been in love?" What do you say?',
            options: [
              'Yes, once. It was tough, but I learned a lot.',
              'There was someone who taught me storms don\'t always announce themselves… but I\'ll leave that story unfinished.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this complete story into one that leaves them wanting more.',
            input: 'I had my heart broken once. It was terrible.',
            example: 'I gave someone a key to a hidden room inside me. They locked it on their way out. Sometimes I wonder if I even want it opened again.'
          ),
          reflection: 'Do you tell tidy stories to be understood, or do you drop fragments that turn into obsessions? Which of your stories could you leave open-ended — so it grows inside them like ivy?'
        ),
      ),
      7: Lesson(
        id: 'scarcity_2_7',
        title: 'The Thermodynamics of Desire (Hot-Cold Calculus)',
        category: 'scarcity',
        world: 2,
        lesson: 7,
        xp: 50,
        content: LessonContent(
          hook: 'Berlin, 1929. Marlene Dietrich, all smoke and contradictions, pulls a man in with her eyes — molten, unflinching. He leans in, hungry. Suddenly, she turns cold, her attention gone, her posture steel. The heat evaporates, leaving him shivering in its absence. By night\'s end, he is addicted, desperate to recreate the warmth she gave and snatched away.',
          concept: [
            'Addiction is Born in Contrast: Heat means nothing without cold.',
            'Warmth Without Withdrawal is Cheap: To give without taking away is to breed complacency.',
            'You Must Be the Weather, Not the Forecast: You control the climate. They dress according to your storms.'
          ],
          drill: Drill(
            question: 'After a night of intimacy, they text: "Last night was perfect." What do you do?',
            options: [
              'Yes! I can\'t wait to see you again!',
              'Wait. Let silence stretch. Hours later: "You made my schedule pleasantly inconvenient. I may need to rearrange everything."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this eager statement into one that creates hot-cold contrast.',
            input: 'I can\'t stop thinking about last night.',
            example: 'You became a distraction I hadn\'t accounted for. I\'m still recalculating the damage.'
          ),
          reflection: 'Are you a constant flame, burning evenly, or do you let them freeze so your warmth becomes divine when it returns?'
        ),
      ),
      8: Lesson(
        id: 'scarcity_2_8',
        title: 'The Economy of Access (Rarity as Worth)',
        category: 'scarcity',
        world: 2,
        lesson: 8,
        xp: 50,
        content: LessonContent(
          hook: 'Fifth Avenue, 1961. Tiffany\'s windows are mostly empty. A single necklace lies in velvet darkness, and it feels like a holy relic. Audrey Hepburn does not beg for it — she gazes, detached, elevating both herself and the object. Scarcity isn\'t real; it\'s engineered. The rare is worshiped.',
          concept: [
            'Commonness is Death: Abundant affection becomes invisible.',
            'Levels of Access: Not everyone gets the same you. Some earn only your public face, others your secrets.',
            'You Auction, They Bid: You do not prove yourself. They must prove themselves worthy of your time.'
          ],
          drill: Drill(
            question: 'They ask you to meet last-minute. What do you say?',
            options: [
              'Sure, I\'ll drop everything for you!',
              'My time\'s already claimed. Convince me yours should take its place.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this available statement into one that creates scarcity around your time.',
            input: 'I\'m free whenever you want me.',
            example: 'I guard my solitude like treasure. Convince me why I should give it to you.'
          ),
          reflection: 'Do you hand out your time like a free sample, or do you make them bleed a little to earn it?'
        ),
      ),
      9: Lesson(
        id: 'scarcity_2_9',
        title: 'The Architecture of Longing (Designing the Void)',
        category: 'scarcity',
        world: 2,
        lesson: 9,
        xp: 50,
        content: LessonContent(
          hook: 'Florence, 1501. Michelangelo does not create David by adding — he removes. Chip by chip, absence becomes form. The masterpiece is not what he built, but what he took away. Longing is carved the same way — not by piling on affection, but by deliberate subtraction.',
          concept: [
            'Creation by Subtraction: Stop filling silence. Let absence echo.',
            'Longing is Space: Desire only grows when you step away.',
            'The Withdrawal is the Offering: By leaving, you give them the ache of wanting you back.'
          ],
          drill: Drill(
            question: 'A conversation reaches its peak. What do you do?',
            options: [
              'Keep talking, filling silence until it dies.',
              'End it yourself: "I\'ll leave the echo of that last thing you said hanging between us."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this clingy statement into one that creates longing through withdrawal.',
            input: 'Don\'t go, stay a little longer.',
            example: 'I want to leave this moment untouched, before it loses its beauty.'
          ),
          reflection: 'Do you pile clay until your statue is bloated, or do you carve absence until the masterpiece appears?'
        ),
      ),
      10: Lesson(
        id: 'scarcity_2_10',
        title: 'The Haunting (Becoming the Lingering Thought)',
        category: 'scarcity',
        world: 2,
        lesson: 10,
        xp: 75,
        content: LessonContent(
          hook: 'Venice, 1580. Casanova leaves women not just in pleasure, but in torment. He was gone days ago, yet his words, gestures, and silences replay endlessly in their minds. To haunt is the highest form of seduction. It is not the kiss they crave again — it is the echo of the kiss, the phantom that refuses to die.',
          concept: [
            'Memory is the Drug: It\'s not about now. It\'s about after.',
            'Small, Strange Details Stick: A whispered phrase, a touch in an unexpected place, an unfinished look.',
            'Presence Fades. Echoes Remain: Seduction that ends with the night dies. Seduction that lingers owns them.'
          ],
          drill: Drill(
            question: 'After the first kiss, what do you say?',
            options: [
              'That was amazing. You\'re incredible.',
              'Whisper something oblique: "I\'ll remember the taste of this moment when the world is quiet."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this direct statement into one that creates a haunting echo.',
            input: 'I miss you already.',
            example: 'It\'s not you I miss — it\'s the silence you left behind.'
          ),
          reflection: 'Do you vanish like smoke the moment you leave, or do you become the ghost they carry with them, whispering in every quiet room?'
        ),
      ),
    },
    3: {
      11: Lesson(
        id: 'scarcity_3_11',
        title: 'The Hot–Cold Calculus',
        category: 'scarcity',
        world: 3,
        lesson: 11,
        xp: 100,
        content: LessonContent(
          hook: 'Berlin, 1929. Marlene Dietrich takes a man\'s hand, whispers a compliment so soft it trembles in his chest. He leans closer—just as she turns away, laughing at another\'s joke. His warmth collapses into frost. He spends days replaying the moment, addicted to the memory of her sun. Seduction is not constant heat—it is the plunge between fire and ice.',
          concept: [
            'Emotion lives in contrast, not consistency.',
            'Warmth means nothing without the threat of cold.',
            'The addict doesn\'t chase the high; he chases the memory of it.'
          ],
          drill: Drill(
            question: 'They text: "Last night with you was amazing." What do you do?',
            options: [
              'Reply instantly with equal warmth.',
              'Wait. Hours later: "It was… disruptive. I\'m still adjusting."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this eager statement into one that creates hot-cold contrast.',
            input: 'I can\'t wait to see you again.',
            example: 'You left me recalculating my schedule.'
          ),
          reflection: 'Do you give steady comfort, or orchestrate storms that make your warmth unforgettable?'
        ),
      ),
      12: Lesson(
        id: 'scarcity_3_12',
        title: 'The Rhythm of Approach and Retreat',
        category: 'scarcity',
        world: 3,
        lesson: 12,
        xp: 100,
        content: LessonContent(
          hook: 'Venice, 1510. A masked courtesan leans forward, her breath grazing a nobleman\'s ear. Just as he opens his mouth to speak, she drifts away across the ballroom floor, swallowed by the crowd. He spends the night chasing her shadow. Seduction is not pursuit—it is choreography.',
          concept: [
            'Desire thrives on rhythm: advance, retreat, return.',
            'Constant pursuit signals neediness. Constant distance kills connection. The dance lives in between.',
            'The art is to be almost theirs, then vanish.'
          ],
          drill: Drill(
            question: 'At dinner, conversation flows. What do you do?',
            options: [
              'Stay locked on them, hanging on every word.',
              'Mid-laughter, excuse yourself, touch their shoulder lightly, and disappear for a while. Let them notice your absence.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this clingy statement into one that creates rhythm and mystery.',
            input: 'I could listen to you all night.',
            example: 'Don\'t tempt me to disappear just to see if you\'d notice.'
          ),
          reflection: 'Do you smother until interest dies, or vanish until they ache for your return?'
        ),
      ),
      13: Lesson(
        id: 'scarcity_3_13',
        title: 'The Bitter-Sweet Alchemy',
        category: 'scarcity',
        world: 3,
        lesson: 13,
        xp: 100,
        content: LessonContent(
          hook: 'Mughal India, 1620. Nur Jahan gifts her lover a rose laced with saffron. Sweet on the tongue, bitter on the breath. He never forgets it. Pleasure alone fades. Pain alone repels. But a blend—honey laced with steel—creates memory that burns forever.',
          concept: [
            'Pure sweetness breeds boredom.',
            'A touch of sting—sarcasm, a withheld smile, a challenge—sharpens attraction.',
            'Seduction is an elixir: sugar, then salt, then sugar again.'
          ],
          drill: Drill(
            question: 'They say: "You\'re perfect." How do you respond?',
            options: [
              'Thank you! That\'s so sweet.',
              'A slow smirk: "Perfect? Don\'t ruin the fun with exaggeration."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this simple compliment into one that creates bitter-sweet tension.',
            input: 'You\'re amazing.',
            example: 'Dangerous of you to notice.'
          ),
          reflection: 'Do you give only comfort and fade from memory, or lace your sweetness with a taste they can\'t wash away?'
        ),
      ),
      14: Lesson(
        id: 'scarcity_3_14',
        title: 'The Crescendo and the Pause',
        category: 'scarcity',
        world: 3,
        lesson: 14,
        xp: 100,
        content: LessonContent(
          hook: 'Vienna, 1805. Beethoven slams his fingers on the keys, flooding the hall with thunder. Just as the audience leans forward, desperate, he halts. Silence. That pause—the aching gap—rings louder than the music itself. The audience sits on edge, begging for release. Seduction is music. Without silence, noise is nothing.',
          concept: [
            'Build energy like a symphony, then stop.',
            'The pause heightens desire more than the action.',
            'Silence is not emptiness; it is a weapon.'
          ],
          drill: Drill(
            question: 'They lean in close, waiting for your kiss. What do you do?',
            options: [
              'Kiss them immediately.',
              'Hold their gaze. Smile faintly. Whisper: "Not yet." Then step back.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this direct statement into one that creates tension through pause.',
            input: 'I couldn\'t resist kissing you.',
            example: 'I almost kissed you, but I prefer to let the tension breathe.'
          ),
          reflection: 'Do you rush to climax and lose the moment, or do you wield the pause as your sharpest blade?'
        ),
      ),
      15: Lesson(
        id: 'scarcity_3_15',
        title: 'The Furnace of Jealousy',
        category: 'scarcity',
        world: 3,
        lesson: 15,
        xp: 100,
        content: LessonContent(
          hook: 'Hollywood, 1955. Marilyn Monroe doesn\'t cling to her date at a party. She laughs with others, lets her hand rest a second too long on another man\'s arm. Her companion watches, half in rage, half in hunger. Jealousy is gasoline. A dangerous fuel—but in measured doses, it burns hotter than devotion.',
          concept: [
            'Possession kills desire. Rivalry feeds it.',
            'Subtle suggestion of competition sharpens your value.',
            'But too much fire burns the house down.'
          ],
          drill: Drill(
            question: 'At an event, they cling to you. What do you do?',
            options: [
              'Stay glued to their side.',
              'Break away, engage someone else, laugh warmly. Return later: "You looked like you missed me."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this possessive statement into one that creates subtle competition.',
            input: 'I only want you.',
            example: 'I enjoy others, but you… you\'re the one who unsettles me.'
          ),
          reflection: 'Do you guard them so tightly they suffocate, or let them taste the fear of losing you—and thus value you more?'
        ),
      ),
    },
    4: {
      16: Lesson(
        id: 'scarcity_4_16',
        title: 'The Mask is the Magnet',
        category: 'scarcity',
        world: 4,
        lesson: 16,
        xp: 100,
        content: LessonContent(
          hook: 'Venice, 1725. At the masquerade, Casanova enters behind a porcelain mask. His identity is unknown, but his movements are deliberate—fluid, enigmatic. A woman leans in, whispering, "Who are you really?" He does not answer. That single question haunts her the entire night. Seduction begins not with revelation, but with concealment.',
          concept: [
            'The unknown is more magnetic than the known.',
            'A mask—literal or metaphorical—invites pursuit.',
            'Remove your mask too soon, and the game collapses.'
          ],
          drill: Drill(
            question: 'They ask: "So tell me, who are you really?" What do you say?',
            options: [
              'Pour out your life story.',
              'Smile faintly. "That depends which version of me you\'re ready to handle."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this revealing statement into one that maintains mystery.',
            input: 'I\'m just a normal person.',
            example: 'I wear masks for a reason. Guess which one I\'m showing you.'
          ),
          reflection: 'Do you rush to prove your authenticity, or let them ache to unmask you?'
        ),
      ),
      17: Lesson(
        id: 'scarcity_4_17',
        title: 'The Glamour of Storytelling',
        category: 'scarcity',
        world: 4,
        lesson: 17,
        xp: 100,
        content: LessonContent(
          hook: 'Cairo, 1001 nights. Scheherazade spins tales that end on a cliff\'s edge. The Sultan cannot kill her—he must know what happens next. Each unfinished story buys her another dawn. Seduction is no different: the story you leave unfinished will hold them captive long after your words fade.',
          concept: [
            'A good story is bait; an unfinished one is a shackle.',
            'Speak in vignettes, fragments, cliffhangers.',
            'Let them be desperate for the next chapter.'
          ],
          drill: Drill(
            question: 'They ask about your past. What do you reveal?',
            options: [
              'Tell the whole story.',
              'Offer only the edge. "I once walked away from something priceless. I\'ll tell you why… another time."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this complete story into one that creates intrigue and mystery.',
            input: 'Yeah, my ex broke my heart.',
            example: 'I once gave someone a part of me I didn\'t know existed. They left it behind. Strange how some rooms stay locked forever.'
          ),
          reflection: 'Do your stories satisfy quickly, or do they haunt like unfinished music?'
        ),
      ),
      18: Lesson(
        id: 'scarcity_4_18',
        title: 'The Shadow and the Spotlight',
        category: 'scarcity',
        world: 4,
        lesson: 18,
        xp: 100,
        content: LessonContent(
          hook: 'Paris, 1890. In the cabaret, Sarah Bernhardt doesn\'t speak first. She lets the spotlight warm her profile, waiting until the silence swells. The audience leans forward, begging for her voice. Only then does she deliver a single line, and the room collapses in applause. True seduction is theater: light and shadow. You decide when to step into view.',
          concept: [
            'People notice what you choose to illuminate.',
            'Hold yourself in shadow until the moment burns brightest.',
            'Anticipation is applause waiting to erupt.'
          ],
          drill: Drill(
            question: 'In a group conversation, someone asks your opinion. What do you do?',
            options: [
              'Answer immediately.',
              'Pause. Sip your drink. Then: "I was waiting to see who asked the right question."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this simple response into one that creates anticipation and drama.',
            input: 'Sure, I think it\'s fine.',
            example: 'My silence was the real answer. But since you insisted…'
          ),
          reflection: 'Do you rush into every spotlight, or wait until your absence has primed the stage for you?'
        ),
      ),
      19: Lesson(
        id: 'scarcity_4_19',
        title: 'The Serpent\'s Mirror',
        category: 'scarcity',
        world: 4,
        lesson: 19,
        xp: 100,
        content: LessonContent(
          hook: 'Alexandria, Cleopatra receives Roman envoys. She studies each gesture, each word, then reflects it back like polished glass. To the serious one, she is grave. To the playful one, she is mischief. Each leaves convinced she is uniquely aligned with him. But none have seen the real Cleopatra. Seduction thrives not in authenticity, but in reflection.',
          concept: [
            'People fall in love with their reflection in you.',
            'Mirror their tone, their rhythm, their energy—until they believe you are the missing half of themselves.',
            'True power is not showing yourself, but reflecting them more beautifully than they imagined.'
          ],
          drill: Drill(
            question: 'They confess: "I feel like I\'m too intense." What do you say?',
            options: [
              'No, you\'re fine!',
              'A sly smile. "Intensity recognizes intensity. It\'s why you found me."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this simple agreement into one that creates mirroring and connection.',
            input: 'I like you too.',
            example: 'Strange… you sound exactly like my own thoughts, only out loud.'
          ),
          reflection: 'Are you showing your true face, or are you their mirror polished into gold?'
        ),
      ),
      20: Lesson(
        id: 'scarcity_4_20',
        title: 'The Art of Vanishing',
        category: 'scarcity',
        world: 4,
        lesson: 20,
        xp: 100,
        content: LessonContent(
          hook: 'Tokyo, 1923. A geisha spends weeks captivating a wealthy merchant—smiles, music, tea ceremonies. Just as he thinks he has secured her, she vanishes. No explanation. For months, he burns incense at the teahouse door, desperate for her return. When she reappears, her worth has tripled. The most seductive act is sometimes disappearance.',
          concept: [
            'Presence intoxicates. Absence addicts.',
            'To vanish is to engrave your outline in their memory.',
            'A strategic disappearance turns you from a person into a myth.'
          ],
          drill: Drill(
            question: 'They expect your constant presence. What do you do?',
            options: [
              'Stay available, always replying fast.',
              'Withdraw for days, reappear with a smile: "I had to miss you properly."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this apologetic statement into one that makes absence strategic.',
            input: 'Sorry I was busy.',
            example: 'Some absences are necessary. Otherwise you\'d forget how good the return feels.'
          ),
          reflection: 'Do you flood them until they drown, or vanish until thirst carves your shape into their soul?'
        ),
      ),
    },
  },
  'deception': {
    1: {
      1: Lesson(
        id: 'deception_1_1',
        title: 'The Mask of Virtue (Machiavelli Reforged)',
        category: 'deception',
        world: 1,
        lesson: 1,
        xp: 50,
        content: LessonContent(
          hook: 'Florence, 1513. A candlelit banquet. Cesare Borgia lifts a golden chalice, blessing God in front of noblemen and priests. By morning, the rivals who toasted with him are dead, poisoned with the wine he sanctified. The city praises his piety. Machiavelli, watching from the shadows, writes in despair: "Everyone sees what you appear to be, few feel what you are." The deadliest predator doesn\'t roar like a beast—it prays like a saint.',
          concept: [
            'Virtue as Armor: People weaponize morality as the ultimate disguise.',
            'Public Image vs Private Reality: The louder the virtue signal, the deeper the rot might run.',
            'Modern Application: When someone is obsessed with telling you who they are, pay more attention to what they do when nobody is watching.'
          ],
          drill: Drill(
            question: 'Someone constantly speaks of honesty, integrity, and loyalty—yet keeps being "caught" in contradictions. This suggests:',
            options: [
              'They\'re trying to live up to high ideals',
              'They\'re using virtue as camouflage'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this virtue claim into a recognition of the mask.',
            input: 'I\'m always honest, you can trust me.',
            example: 'Those who insist on their honesty often wear it like a mask to hide what they fear you\'ll see.'
          ),
          reflection: 'Who around you is obsessed with appearing good? What cracks show through their mask?'
        ),
      ),
      2: Lesson(
        id: 'deception_1_2',
        title: 'Half-Truths as Weapons (Sharper Edition)',
        category: 'deception',
        world: 1,
        lesson: 2,
        xp: 50,
        content: LessonContent(
          hook: 'Berlin, 1943. A radio crackles. Goebbels\' voice fills the air: "The Allies bomb women and children." True—but stripped of context, it becomes poison. He crafts lies from fragments of truth, knowing that a half-truth is harder to fight than a blatant falsehood. The audience believes because pieces are real. Like a glass of wine with a drop of cyanide—the drink is mostly pure, but death hides in the dilution.',
          concept: [
            'The Half-Truth: Lies anchored in reality.',
            'Weaponized Context: The truth is twisted by what is omitted.',
            'Modern Application: News, gossip, and even personal conflicts thrive on this tactic.'
          ],
          drill: Drill(
            question: 'A friend whispers: "She was talking about you last night." They omit it was praise. This is:',
            options: [
              'Neutral sharing',
              'A half-truth designed to seed doubt'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this half-truth into a recognition of the weapon.',
            input: 'Coffee is dangerous.',
            example: 'Yes, coffee can harm—if you drink twenty cups a day. The truth is meaningless without the missing frame.'
          ),
          reflection: 'When were you last manipulated by something that was true, but not the whole truth?'
        ),
      ),
      3: Lesson(
        id: 'deception_1_3',
        title: 'Hiding in Plain Sight (Turned Legendary)',
        category: 'deception',
        world: 1,
        lesson: 3,
        xp: 50,
        content: LessonContent(
          hook: 'Moscow, 1967. Apartment #42, third floor, same routine for 20 years. A man feeds pigeons at dawn, lends sugar to neighbors, reads Pushkin quietly by lamp. Nobody suspects the librarian is a KGB ghost courier—carrying messages that decide wars. His invisibility comes not from shadows but from banality. He is the wallpaper. He is the chair in the room nobody notices. True power doesn\'t need mystery—it thrives in ordinariness.',
          concept: [
            'Blandness as Weapon: To hide, become boring.',
            'Camouflage of the Ordinary: Predictability breeds trust.',
            'Modern Application: Scammers, spies, and manipulators are rarely flamboyant—they\'re the ones who look like everybody else.'
          ],
          drill: Drill(
            question: 'Who is more dangerous?',
            options: [
              'The loud, secretive neighbor with dark glasses.',
              'The friendly neighbor who seems normal, but owns items they shouldn\'t afford.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this observation into a recognition of camouflage.',
            input: 'He\'s just a nice, quiet guy.',
            example: 'Sometimes the quietest man in the room holds the loudest secrets.'
          ),
          reflection: 'What "ordinary" people in your life don\'t quite add up?'
        ),
      ),
      4: Lesson(
        id: 'deception_1_4',
        title: 'Feigned Weakness (Amplified)',
        category: 'deception',
        world: 1,
        lesson: 4,
        xp: 50,
        content: LessonContent(
          hook: 'Ancient China, 200 BC. A battlefield littered with broken banners. Han Xin retreats, leaving supplies and weapons scattered. The enemy surges forward, laughing at his weakness. But the laughter dies as ambush horns echo from the mountains—Han Xin\'s "defeated" army crashes down from the hills, annihilating the overconfident pursuers. What looked like collapse was bait. Weakness was camouflage for the kill.',
          concept: [
            'Weaponized Helplessness: Pretend to be beaten to bait overconfidence.',
            'Strategic Collapse: Appear smaller so your strike feels bigger.',
            'Modern Application: People sometimes crumble right before victory—or pretend to.'
          ],
          drill: Drill(
            question: 'In a heated negotiation, someone suddenly sighs and says: "Fine, you win." This is:',
            options: [
              'Genuine surrender',
              'Feigned weakness to make you careless'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this surrender into a recognition of feigned weakness.',
            input: 'I give up.',
            example: 'When someone surrenders too easily, it\'s rarely the end—it\'s the opening move.'
          ),
          reflection: 'Who has played weak in your life, only to strike harder later?'
        ),
      ),
      5: Lesson(
        id: 'deception_1_5',
        title: 'The Noble Lie (Sharpened)',
        category: 'deception',
        world: 1,
        lesson: 5,
        xp: 50,
        content: LessonContent(
          hook: 'Athens, 380 BC. Plato writes by lamplight: "Sometimes rulers must lie for the greater good." A mother tells her child medicine tastes sweet. A king withholds news of an invasion to prevent panic. A doctor tells a patient, "You\'ll be fine" to summon hope. These are noble lies. But the shadow creeps in: who decides what is noble? Who guards the guardians? The same excuse—"it\'s for your own good"—is used by tyrants and caretakers alike.',
          concept: [
            'The Noble Lie: Deception wrapped in love.',
            'Weaponized Care: Claiming to protect while controlling.',
            'Modern Application: The line between care and manipulation is razor-thin.'
          ],
          drill: Drill(
            question: 'Someone says: "I didn\'t tell you because I didn\'t want you to worry." This is:',
            options: [
              'Protection',
              'Noble lie to control your choices'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this claim into a recognition of the noble lie.',
            input: 'I kept it from you to spare your feelings.',
            example: 'You weren\'t spared—you were controlled under the mask of kindness.'
          ),
          reflection: 'Who has claimed to protect you when they were really deciding for you?'
        ),
      ),
    },
    2: {
      6: Lesson(
        id: 'deception_2_6',
        title: 'The Double Cross',
        category: 'deception',
        world: 2,
        lesson: 6,
        xp: 100,
        content: LessonContent(
          hook: 'Normandy, 1944. A Spaniard named Garbo sends false reports to Hitler: "The invasion will be at Calais." His intel is so convincing the Fuhrer diverts Panzer divisions away from Normandy. On D-Day, thousands of Allied soldiers live because of one man\'s betrayal. The greatest lies don\'t hide—they redirect. The double cross works because the victim believes they are the one being trusted.',
          concept: [
            'Trust is the Bait: The deeper the trust, the sharper the betrayal.',
            'False Loyalty: Pretend allegiance to misdirect the enemy.',
            'Modern Edge: Fake alliances are the deadliest shields.'
          ],
          drill: Drill(
            question: 'Your coworker leaks "confidential info" that later proves false. They claim they were "just misinformed." Was this:',
            options: [
              'A mistake',
              'A planted lie to steer you'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this trust into a recognition of the double cross.',
            input: 'I trust you completely.',
            example: 'The surest way to betray someone is first to make them believe you never could.'
          ),
          reflection: 'Who benefits most when you believe in their loyalty?'
        ),
      ),
      7: Lesson(
        id: 'deception_2_7',
        title: 'Owning the Narrative',
        category: 'deception',
        world: 2,
        lesson: 7,
        xp: 100,
        content: LessonContent(
          hook: 'Baghdad, 1258. The Mongols breach the city walls. Instead of hiding, Caliph Al-Mustaʿsim parades through the streets in silk, declaring calm. The citizens hesitate to flee—believing him. By the time they realize the truth, escape is impossible. The city burns. Whoever owns the story owns reality itself.',
          concept: [
            'The First Story Wins: Once a narrative is believed, it\'s hard to uproot.',
            'Silence is Dangerous: If you don\'t tell the story, someone else will.',
            'Modern Edge: PR, gossip, politics—control the frame before your rival does.'
          ],
          drill: Drill(
            question: 'A rumor spreads: "You\'re difficult to work with." Do you:',
            options: [
              'Stay silent, hope it dies down.',
              'Create your own counter-story: "I\'m selective because I value excellence."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this denial into a narrative takeover.',
            input: 'That\'s not true.',
            example: 'Here\'s what really happened. (Seize the frame, don\'t defend—replace).'
          ),
          reflection: 'Are you living your own narrative, or someone else\'s version of you?'
        ),
      ),
      8: Lesson(
        id: 'deception_2_8',
        title: 'The Honey Trap',
        category: 'deception',
        world: 2,
        lesson: 8,
        xp: 100,
        content: LessonContent(
          hook: 'Cold War, Moscow. A diplomat meets a beautiful stranger in a hotel bar. She laughs at his jokes, leans close, makes him feel like the most interesting man alive. By dawn, there are photos of him in bed, and the KGB owns him. He thought he was seducing—he was being seduced. The honey trap weaponizes desire, turning passion into chains.',
          concept: [
            'Desire is Leverage: People reveal more when they want something.',
            'The Illusion of Control: Believing you\'re the hunter makes you the prey.',
            'Modern Edge: Honey traps aren\'t just sexual—they can be money, fame, validation.'
          ],
          drill: Drill(
            question: 'You\'re offered an "exclusive opportunity" that feels too flattering. Is it:',
            options: [
              'Genuine admiration',
              'A baited hook'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this flattery into a recognition of the honey trap.',
            input: 'They really like me.',
            example: 'Sometimes the warmth you feel is just the web tightening.'
          ),
          reflection: 'Where in your life are you most vulnerable to honey traps—sex, validation, or ambition?'
        ),
      ),
      9: Lesson(
        id: 'deception_2_9',
        title: 'The False Choice',
        category: 'deception',
        world: 2,
        lesson: 9,
        xp: 100,
        content: LessonContent(
          hook: 'Ancient Greece. A general captures rebels. Instead of threatening them, he offers two "choices": execution now, or lifelong service in his army. They believe they\'ve chosen freedom by choosing servitude. The trick: both options lead to the same destination. The false choice is control disguised as liberty.',
          concept: [
            'Choice as Illusion: Offer two paths, both ending where you want.',
            'Perceived Autonomy: People defend decisions they think they made.',
            'Modern Edge: "Do you want the deluxe or the premium package?" Either way, they buy.'
          ],
          drill: Drill(
            question: 'Your boss says: "Would you rather work late tonight or come in early tomorrow?" That\'s:',
            options: [
              'Genuine flexibility',
              'False choice—both serve their needs, not yours'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this choice into a recognition of the false option.',
            input: 'You have two options.',
            example: 'Sometimes both doors lead to the same cage.'
          ),
          reflection: 'Where are you mistaking an illusion of choice for real freedom?'
        ),
      ),
      10: Lesson(
        id: 'deception_2_10',
        title: 'The Invisible Hand',
        category: 'deception',
        world: 2,
        lesson: 10,
        xp: 100,
        content: LessonContent(
          hook: 'Venice, 1500s. Merchants rise and fall in mysterious patterns. Prices soar, rumors swirl, guild wars erupt—yet behind it all is one banker pulling invisible strings, funding both sides, whispering in both ears. He is never seen. His name is never spoken. Yet every outcome traces back to his hand. The greatest deceiver is not the actor—it\'s the director who writes the script from the wings.',
          concept: [
            'Power in Shadows: Directing outcomes without appearing present.',
            'Hands-Off Influence: If they don\'t see you, they can\'t blame you.',
            'Modern Edge: Anonymous leaks, silent investors, shadow puppeteers.'
          ],
          drill: Drill(
            question: 'Two rivals destroy each other while a third party "stays out of it." Later, he\'s the only one left standing. Was he uninvolved?',
            options: [
              'Yes, he was uninvolved',
              'No, that\'s the invisible hand'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this claim into a recognition of the invisible hand.',
            input: 'I had nothing to do with it.',
            example: 'The best deceivers are invisible—they leave no fingerprints, only outcomes.'
          ),
          reflection: 'Where in your life might someone unseen be shaping the events you think are random?'
        ),
      ),
    },
    3: {
      11: Lesson(
        id: 'deception_3_11',
        title: 'The Gray Man Principle',
        category: 'deception',
        world: 3,
        lesson: 11,
        xp: 100,
        content: LessonContent(
          hook: 'Occupied Paris, 1942. Resistance fighters walk among German patrols unnoticed—not by hiding, but by blending. No fancy hats, no flashy gestures, no eye contact. Just quiet conformity. The soldiers see them every day but never once notice them. The perfect camouflage is not the disguise—it\'s invisibility by ordinariness.',
          concept: [
            'Stand Out Strategically: Be memorable only when you choose.',
            'Blend as Default: In hostile terrain, neutrality is armor.',
            'Modern Edge: In offices, negotiations, or conflicts—sometimes the safest move is to be unseen until it matters.'
          ],
          drill: Drill(
            question: 'You enter a room of strangers. Do you:',
            options: [
              'Assert yourself loudly, grabbing attention.',
              'Blend in quietly, letting the room forget you until you strike.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this observation into a recognition of the gray man principle.',
            input: 'No one noticed me.',
            example: 'The most dangerous place to be is invisible by design.'
          ),
          reflection: 'Do you always crave attention—or do you know how to wield invisibility as a weapon?'
        ),
      ),
      12: Lesson(
        id: 'deception_3_12',
        title: 'Predator\'s Patience',
        category: 'deception',
        world: 3,
        lesson: 12,
        xp: 100,
        content: LessonContent(
          hook: 'A tiger in the tall grass waits, unmoving, as deer graze inches away. Its hunger gnaws, but it does not flinch. The prey relaxes, convinced there is no danger. Then, with terrifying precision, the tiger strikes. Camouflage is not just appearance—it\'s timing. The longer you wait, the deadlier your strike.',
          concept: [
            'Patience is Camouflage: Waiting disarms suspicion.',
            'The Strike Must Be Swift: Delay long enough to relax them, then move before they can react.',
            'Modern Edge: In business or love, let them underestimate you until the reveal.'
          ],
          drill: Drill(
            question: 'A rival underestimates you for months. Do you:',
            options: [
              'Correct them early, showing your hand.',
              'Let them stay blind until their weakness is total.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into a recognition of predator\'s patience.',
            input: 'I\'ll act when I\'m ready.',
            example: 'Every moment of silence is the tightening of the snare.'
          ),
          reflection: 'Are you striking too soon—out of hunger—or waiting until the moment of inevitability?'
        ),
      ),
      13: Lesson(
        id: 'deception_3_13',
        title: 'Chameleon Mindset',
        category: 'deception',
        world: 3,
        lesson: 13,
        xp: 100,
        content: LessonContent(
          hook: 'Tokyo, 1600s. A spy infiltrates a rival clan by mirroring their dialect, their rituals, even their drinking games. Within weeks, they treat him like family. When he disappears with their secrets, they cannot comprehend how he was ever a stranger. True camouflage is not about clothes—it\'s about psychology.',
          concept: [
            'Mirroring Builds Trust: Subtle mimicry creates unconscious acceptance.',
            'Adopt Their Colors: Dress, speak, move like them until suspicion dissolves.',
            'Modern Edge: In social groups, teams, or negotiations—matching tempo gains entry.'
          ],
          drill: Drill(
            question: 'At a new job, colleagues joke in slang. Do you:',
            options: [
              'Correct them with your own style.',
              'Absorb their rhythm, then introduce your difference later.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into a recognition of chameleon mindset.',
            input: 'I fit in quickly.',
            example: 'I learned their colors so well they mistook me for one of their own.'
          ),
          reflection: 'Do you resist mirroring because of pride—or do you weaponize it as entry?'
        ),
      ),
      14: Lesson(
        id: 'deception_3_14',
        title: 'The Mask of Authority',
        category: 'deception',
        world: 3,
        lesson: 14,
        xp: 100,
        content: LessonContent(
          hook: 'Berlin, 1945. A Soviet officer in a stolen German uniform marches straight into enemy command posts, issuing false orders. Soldiers obey without question—not because they know him, but because the mask of rank commands reflexive obedience. Authority, real or not, is its own camouflage.',
          concept: [
            'Uniforms Are Shortcuts: Symbols override skepticism.',
            'Confidence Sells the Mask: Authority collapses if you hesitate.',
            'Modern Edge: A title, a tone, a costume—people rarely check the credentials behind the mask.'
          ],
          drill: Drill(
            question: 'You want entry to an exclusive event. Do you:',
            options: [
              'Plead your case as yourself.',
              'Adopt the language, dress, and tone of someone who obviously belongs.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into a recognition of the mask of authority.',
            input: 'I\'m just like you.',
            example: 'I don\'t need to belong—I only need to look like I do.'
          ),
          reflection: 'Do you underestimate how quickly people obey the costume rather than the person?'
        ),
      ),
      15: Lesson(
        id: 'deception_3_15',
        title: 'Shadows Speak Loudest',
        category: 'deception',
        world: 3,
        lesson: 15,
        xp: 100,
        content: LessonContent(
          hook: 'Medieval castles built secret passages where lords could watch feasts from hidden slits in the walls. Guests laughed, flirted, schemed—never realizing eyes observed them. The unseen presence shapes behavior more than the seen. Camouflage is not only blending in—it\'s hiding where no one even thinks to look.',
          concept: [
            'Unseen Influence is Strongest: People reveal their truth when they believe no one watches.',
            'Silence is Camouflage: Words announce presence; silence conceals it.',
            'Modern Edge: Observe unnoticed—knowing the game before you play it.'
          ],
          drill: Drill(
            question: 'You\'re in a group chat where rivals boast. Do you:',
            options: [
              'Respond, correcting them.',
              'Say nothing, watching their egos expose weakness.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into a recognition of shadows speaking loudest.',
            input: 'I kept quiet.',
            example: 'Shadows don\'t need to speak—they let the light betray the foolish.'
          ),
          reflection: 'Do you waste energy proving you\'re in the room—or do you let invisibility hand you their secrets?'
        ),
      ),
    },
    4: {
      16: Lesson(
        id: 'deception_4_16',
        title: 'The Power of Silence',
        category: 'deception',
        world: 4,
        lesson: 16,
        xp: 100,
        content: LessonContent(
          hook: 'Cold War, 1962. During a tense negotiation, one diplomat speaks endlessly, trying to dominate the room. His counterpart sits in silence, his gaze steady, saying nothing. The silence grows unbearable. The speaker reveals too much, desperate to fill the void. Silence was not weakness—it was the loudest move in the room.',
          concept: [
            'Noise Reveals, Silence Conceals: The quiet one forces others to expose themselves.',
            'Mystery is Power: Words limit you. Silence suggests infinite depth.',
            'Defense Today: When silence pressures you—pause. Don\'t rush to fill it.'
          ],
          drill: Drill(
            question: 'Someone stares at you after you confess something. What do you do?',
            options: [
              'Keep explaining, trying to win them.',
              'Let the silence rest. Their reaction is theirs to own.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into a recognition of the power of silence.',
            input: 'I had to explain myself.',
            example: 'My silence is explanation enough.'
          ),
          reflection: 'Do you treat silence as emptiness—or as a weapon?'
        ),
      ),
      17: Lesson(
        id: 'deception_4_17',
        title: 'The Mirror Trick',
        category: 'deception',
        world: 4,
        lesson: 17,
        xp: 100,
        content: LessonContent(
          hook: 'Tokyo, 1800s. A thief is suspected in a gambling house. When accused, he simply mirrors his accuser\'s outrage: "How dare you insult me like this!" His anger is identical, his body language copied, his tone echoed. The crowd believes him, because we trust our own reflection. The real thief walks out untouched.',
          concept: [
            'Mirroring Disarms: People see themselves in you and drop suspicion.',
            'Imitation as Invisibility: Blend so well, no one suspects you.',
            'Defense Today: Beware those who agree too perfectly.'
          ],
          drill: Drill(
            question: 'A date repeats your phrases, mirrors your posture, copies your laugh. What do you think?',
            options: [
              'Think they\'re your "soulmate."',
              'Realize you\'re being mirrored—chemistry manufactured.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into a recognition of the mirror trick.',
            input: 'We have so much in common!',
            example: 'We have so much in common—or they\'re showing me myself.'
          ),
          reflection: 'Do you fall for your own reflection?'
        ),
      ),
      18: Lesson(
        id: 'deception_4_18',
        title: 'The Delayed Truth',
        category: 'deception',
        world: 4,
        lesson: 18,
        xp: 100,
        content: LessonContent(
          hook: 'London, 1890s. A banker accused of fraud admits nothing… until months later. By then, evidence has faded, emotions cooled. When he finally "confesses," it feels like closure, not crime. Timing reshapes truth. Delay is camouflage—the crime is remembered faintly, the confession feels refreshing.',
          concept: [
            'Delay Dissolves Emotion: Time weakens outrage.',
            'Late Confession Feels Like Honesty: Too late to punish, just soon enough to forgive.',
            'Defense Today: When someone waits too long to "come clean," ask—why now?'
          ],
          drill: Drill(
            question: 'A partner reveals a secret only years later. What do you do?',
            options: [
              'Praise their "bravery."',
              'Question the timing—what do they gain by waiting?'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into a recognition of the delayed truth.',
            input: 'At least they finally told me.',
            example: 'They told me only when the cost was safe.'
          ),
          reflection: 'Are you comforted by closure—or blinded by delay?'
        ),
      ),
      19: Lesson(
        id: 'deception_4_19',
        title: 'The Fog of Complexity',
        category: 'deception',
        world: 4,
        lesson: 19,
        xp: 100,
        content: LessonContent(
          hook: 'Wall Street, 2008. Investors are sold financial products so complex that even experts can\'t explain them. The fog of jargon hides the rot beneath. Complexity isn\'t always brilliance. Sometimes it is camouflage. The thicker the fog, the easier the theft.',
          concept: [
            'Obscurity Protects Lies: Confuse them, and they stop asking.',
            'Simplicity Threatens Liars: Clear words cut fog.',
            'Defense Today: If you can\'t explain it simply, it\'s either genius—or deceit.'
          ],
          drill: Drill(
            question: 'A consultant uses endless jargon. What do you think?',
            options: [
              'Assume they\'re an expert.',
              'Realize fog may hide emptiness or corruption.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into a recognition of the fog of complexity.',
            input: 'I don\'t understand, so they must be smart.',
            example: 'I don\'t understand—so maybe they don\'t want me to.'
          ),
          reflection: 'How often do you confuse confusion for wisdom?'
        ),
      ),
      20: Lesson(
        id: 'deception_4_20',
        title: 'The Ghost Exit',
        category: 'deception',
        world: 4,
        lesson: 20,
        xp: 100,
        content: LessonContent(
          hook: 'Istanbul, 1600s. A spy is cornered, accused, surrounded. That night, guards find his room empty—yet the door was locked from the outside. He had already set up a false trail: decoys, rumors of escape routes, forged letters. By the time they realized, he was gone. True mastery of deception is not the lie itself—it\'s leaving no trace of ever being there.',
          concept: [
            'Pre-planned Disappearance: Escape is created before danger arrives.',
            'False Trails Protect: Give them clues to chase while you vanish.',
            'Defense Today: When someone disappears without explanation—look for the trails they left behind.'
          ],
          drill: Drill(
            question: 'A business partner ghosts you suddenly. What do you think?',
            options: [
              'Assume they panicked.',
              'Consider the ghost exit—was it planned long before?'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into a recognition of the ghost exit.',
            input: 'They just vanished.',
            example: 'They vanished—but only after paving the road for it.'
          ),
          reflection: 'Do you notice the trail ghosts leave behind—or just the absence they create?'
        ),
      ),
    },
  },
  'coldpower': {
    1: {
      1: Lesson(
        id: 'coldpower_1_1',
        title: 'The Marble Face (Law of Detachment)',
        category: 'coldpower',
        world: 1,
        lesson: 1,
        xp: 125,
        content: LessonContent(
          hook: 'Rome, 180 AD. A senator, trembling, delivers news to Marcus Aurelius: his most trusted general has been cut down in battle. The Senate chamber expects grief, rage, perhaps madness. Instead, Aurelius turns his head slowly, his expression carved from stone. He writes in his journal without looking up: "The universe is change; our mind is choice." His enemies are chilled to the bone. They realize: no one can move a man who does not allow himself to be moved.',
          concept: [
            'Cold power begins with detachment—your emotions are yours, never theirs.',
            'Reaction is surrender. Non-reaction is domination.',
            'The man who cannot be provoked is the man who cannot be controlled.'
          ],
          drill: Drill(
            question: 'They spit venom at you. Which proves you\'re untouchable?',
            options: [
              'Argue your worth.',
              'A calm nod. "Noted."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this attack into a display of cold detachment.',
            input: 'You\'re pathetic.',
            example: 'Curious. [Nothing more.]'
          ),
          reflection: 'What would your enemies do if they realized they could no longer make you feel?'
        ),
      ),
      2: Lesson(
        id: 'coldpower_1_2',
        title: 'The Glacier Gaze (Law of Indifference)',
        category: 'coldpower',
        world: 1,
        lesson: 2,
        xp: 125,
        content: LessonContent(
          hook: 'Cannes, 1960s. Brigitte Bardot sits among billionaires and kings. One brags of his yachts, another of his fame. She studies her nails. They escalate—diamonds, castles, armies. She stirs her coffee, unmoved. By midnight, the wealthiest men alive are begging for a single smile. Her indifference stripped them of everything money could buy. Desire burns hottest against the ice.',
          concept: [
            'Indifference weaponizes status.',
            'What others flaunt, you render meaningless.',
            'The glacier gaze: you do not react. They melt to please you.'
          ],
          drill: Drill(
            question: 'They brag: "I drive a Lamborghini." What do you do?',
            options: [
              '"Wow, that\'s amazing!"',
              '"Hm." Then silence.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this boast into a display of cold indifference.',
            input: 'I bought a \$50,000 watch.',
            example: 'Time still passes the same.'
          ),
          reflection: 'What would happen if nothing impressed you ever again?'
        ),
      ),
      3: Lesson(
        id: 'coldpower_1_3',
        title: 'The Black Silence (Law of Absence)',
        category: 'coldpower',
        world: 1,
        lesson: 3,
        xp: 125,
        content: LessonContent(
          hook: 'Cuban Missile Crisis, 1962. Khrushchev shouts, slams, pounds. Kennedy sits in abyssal silence. Thirty seconds. A minute. Khrushchev grows frantic, his rage now desperate. When Kennedy finally says, "Are you finished?"—the room dies. Silence won the war before weapons could.',
          concept: [
            'Silence is not absence. Silence is a weapon.',
            'The void forces others to expose themselves.',
            'The one who fills silence loses; the one who wields it rules.'
          ],
          drill: Drill(
            question: 'They scream: "You\'re worthless!" What do you do?',
            options: [
              'Defend.',
              'Stare. Say nothing.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this attack into a display of black silence.',
            input: 'You ruin everything!',
            example: '[Silence. Then softly:] "Done?"'
          ),
          reflection: 'How many wars could you win if you stopped speaking?'
        ),
      ),
      4: Lesson(
        id: 'coldpower_1_4',
        title: 'The Porcelain Mask (Law of Unreadability)',
        category: 'coldpower',
        world: 1,
        lesson: 4,
        xp: 125,
        content: LessonContent(
          hook: 'Las Vegas, 1978. A poker master holds garbage cards. His opponents search his eyes, his breath, his hands. His face is porcelain, blank, inhuman. They fold aces out of fear of ghosts. He wins empires holding nothing. The porcelain mask turns their need to read into their own undoing.',
          concept: [
            'Unreadability is armor.',
            'Never show joy, fear, anger, desire.',
            'While they bleed emotion, you remain sculpture.'
          ],
          drill: Drill(
            question: 'They tell you scandalous news, watching for your reaction. What do you do?',
            options: [
              'Laugh, frown, or show surprise.',
              '"Noted. Continue."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this gossip into a display of porcelain mask.',
            input: 'Did you hear what they said about you?',
            example: '[Blank expression] "Words float. I remain."'
          ),
          reflection: 'Do you feed your enemies with expressions, or starve them with silence?'
        ),
      ),
      5: Lesson(
        id: 'coldpower_1_5',
        title: 'The Executioner\'s Pause (Law of Delay)',
        category: 'coldpower',
        world: 1,
        lesson: 5,
        xp: 125,
        content: LessonContent(
          hook: 'Supreme Court, 1950s. A lawyer delivers weak arguments. Justice Frankfurter leans back. He does not interrupt. He does not scold. He waits. Ten seconds. Twenty. The courtroom suffocates. The lawyer collapses under the silence. When the Justice finally says: "Proceed."—it feels like a sentence. The pause destroyed him more than thunder could.',
          concept: [
            'Pauses are daggers.',
            'A delayed word carries ten times the weight.',
            'Let silence hang like a blade above the guilty.'
          ],
          drill: Drill(
            question: 'Someone makes a crude joke in your presence. What do you do?',
            options: [
              'Correct them instantly.',
              'Pause. Stare. Resume.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this insult into a display of executioner\'s pause.',
            input: 'Haha, you\'re so soft.',
            example: '[5-second pause. Cold gaze.] "As I was saying…"'
          ),
          reflection: 'What could your enemies confess if you punished them only with pauses?'
        ),
      ),
    },
    2: {
      6: Lesson(
        id: 'coldpower_2_6',
        title: 'The Crown You Don\'t Ask For (Law of Assumed Value)',
        category: 'coldpower',
        world: 2,
        lesson: 6,
        xp: 125,
        content: LessonContent(
          hook: 'Versailles, 1700s. The courtiers bow as Louis XIV enters—not because he commands it, but because he radiates it. He never asks for respect; he exists as if he was born entitled to it. When a duke dares to withhold his bow, the king\'s silence and slight glance at the guards ends the rebellion. His frame is reality itself. The Sun King does not beg the planets to orbit—he assumes they will.',
          concept: [
            'Value is never requested. It is embodied.',
            'Asking, pleading, or proving fractures the illusion.',
            'The highest throne is occupied by the one who never competes for it.'
          ],
          drill: Drill(
            question: 'They ask: "Why should I respect you?" What do you do?',
            options: [
              'List your achievements.',
              '"Because you already do."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this question into a display of assumed value.',
            input: 'So what makes you special?',
            example: 'I don\'t answer questions already written in your eyes.'
          ),
          reflection: 'Do you live like a supplicant—or like someone born crowned?'
        ),
      ),
      7: Lesson(
        id: 'coldpower_2_7',
        title: 'The Gaze That Grants Existence (Law of Selective Attention)',
        category: 'coldpower',
        world: 2,
        lesson: 7,
        xp: 125,
        content: LessonContent(
          hook: 'Andy Warhol, Studio 54. Celebrities fight for his eyes. He scans the crowd, blank. Then, for three seconds, he rests his gaze on one nobody. The club freezes. By dawn, that nobody is famous. Warhol\'s attention turned dust into gold. To be looked at by him was to be made real. To be ignored was to be erased.',
          concept: [
            'Attention is a currency more powerful than money.',
            'To look at someone is to grant them existence; to withdraw it is annihilation.',
            'Your gaze must be a gift.'
          ],
          drill: Drill(
            question: 'They whine: "You\'re not listening to me!" What do you do?',
            options: [
              'Apologize and overcompensate.',
              'Turn your gaze slowly, hold for two seconds, and then return to your task.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this complaint into a display of selective attention.',
            input: 'Why are you ignoring me?',
            example: 'Not ignoring. Deciding.'
          ),
          reflection: 'When was the last time you weaponized your gaze like a king\'s decree?'
        ),
      ),
      8: Lesson(
        id: 'coldpower_2_8',
        title: 'The Throne of Absence (Law of Scarcity)',
        category: 'coldpower',
        world: 2,
        lesson: 8,
        xp: 125,
        content: LessonContent(
          hook: 'Greta Garbo retires at the height of her fame. The world screams for her return. Her absence makes her immortal. Decades later, her silence is more seductive than all the actresses still begging for attention. Presence creates familiarity; absence creates myth.',
          concept: [
            'Scarcity is the highest luxury.',
            'Too available = invisible. Rare = priceless.',
            'To vanish at your peak is to be eternal.'
          ],
          drill: Drill(
            question: 'They text you three times in a row. What do you do?',
            options: [
              'Reply instantly, explaining yourself.',
              'Leave them with silence for a day, then return with presence like thunder.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this complaint into a display of scarcity.',
            input: 'Why don\'t you ever reply fast?',
            example: 'Because I\'m not meant to be consumed like fast food.'
          ),
          reflection: 'What would you become if your presence were a rare event instead of a constant supply?'
        ),
      ),
      9: Lesson(
        id: 'coldpower_2_9',
        title: 'The Shadow Play (Law of Perception)',
        category: 'coldpower',
        world: 2,
        lesson: 9,
        xp: 125,
        content: LessonContent(
          hook: '1940s Hollywood. Orson Welles steps into a room, not with facts, but with shadows. His voice suggests secrets, his posture hints at empires unseen. He never proves; he implies. The less he shows, the more people imagine. And what they imagine is always greater than what you could confess.',
          concept: [
            'Perception is more powerful than reality.',
            'People seduce themselves with the story you let them invent.',
            'Never clarify. Suggest. Hint. Let the mystery grow wild.'
          ],
          drill: Drill(
            question: 'They demand: "Are you serious about me or not?" What do you do?',
            options: [
              'Answer directly, ending the tension.',
              'A half-smile: "Depends how serious you want me to be."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this demand into a display of shadow play.',
            input: 'Tell me exactly how you feel.',
            example: 'If I said it plain, you\'d stop wondering. And I\'d never forgive myself for that.'
          ),
          reflection: 'Do you control perception, or do you reveal so much you let them cage you in their definition?'
        ),
      ),
      10: Lesson(
        id: 'coldpower_2_10',
        title: 'The Summit Effect (Law of Distance)',
        category: 'coldpower',
        world: 2,
        lesson: 10,
        xp: 125,
        content: LessonContent(
          hook: 'Mount Everest, 1953. Few reach its peak, fewer still survive. Its very difficulty makes it divine. The mountain never descends; it forces men to die climbing. The summit seduces not by approach—but by demanding others ascend. The higher you remain, the more they crave the climb.',
          concept: [
            'Power is maintained by distance, not proximity.',
            'When you make yourself hard to reach, your worth multiplies.',
            'Make them climb. Make them sweat for your presence.'
          ],
          drill: Drill(
            question: 'They say: "Why don\'t you make more effort for me?" What do you do?',
            options: [
              'Apologize, chase harder.',
              '"Because the climb is the proof you\'re worthy of the view."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this complaint into a display of summit effect.',
            input: 'Why do you make things difficult?',
            example: 'Everything valuable is.'
          ),
          reflection: 'Would they worship you more if you were Everest instead of a hillside?'
        ),
      ),
    },
    3: {
      11: Lesson(
        id: 'coldpower_3_11',
        title: 'The Poisoned Chalice (Law of Craving & Withdrawal)',
        category: 'coldpower',
        world: 3,
        lesson: 11,
        xp: 125,
        content: LessonContent(
          hook: 'Venice, 16th century. Casanova did not seduce by constant presence. He intoxicated, then vanished. A night of wine, poetry, and touch—and then nothing. Days later, the women grew frantic, their minds replaying every detail. He had poured the sweetest wine into their veins, then pulled the cup away. Desire is not born from indulgence—it is born from denial.',
          concept: [
            'Obsession thrives on withdrawal.',
            'To give continuously is to numb. To give, then withhold, is to addict.',
            'Every high must be followed by silence, to make them chase the echo.'
          ],
          drill: Drill(
            question: 'They say: "I miss you, why don\'t you come around more?" What do you do?',
            options: [
              'Apologize, rush to see them.',
              '"Missing is the sweetest part. Don\'t ruin it by ending it too soon."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this desire into a display of poisoned chalice.',
            input: 'I want to see you every day.',
            example: 'If you had me every day, you\'d stop dreaming of me.'
          ),
          reflection: 'Are you a steady supply… or the rare, dangerous wine they can never drink enough of?'
        ),
      ),
      12: Lesson(
        id: 'coldpower_3_12',
        title: 'The Candle & The Moth (Law of Dangerous Contrast)',
        category: 'coldpower',
        world: 3,
        lesson: 12,
        xp: 125,
        content: LessonContent(
          hook: 'Paris, 1920s. Josephine Baker dances, laughter bursting like champagne. Her lovers drown in joy. Then, abruptly, she grows cold—her gaze distant, her laughter gone. They panic, desperate to bring the fire back. It is the dance of flame and frost: one moment intoxicating warmth, the next a deathly chill. The moth never loves the candle\'s flame—it loves the risk of being burned.',
          concept: [
            'Obsession is fueled by contrast.',
            'Warmth without cold loses edge. Cold without warmth loses hope.',
            'To keep them addicted, you must alternate between feast and famine.'
          ],
          drill: Drill(
            question: 'They say: "Sometimes I don\'t know if you even like me." What do you do?',
            options: [
              'Reassure them endlessly.',
              '"If you never wondered, you\'d never feel the thrill of knowing."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this confusion into a display of dangerous contrast.',
            input: 'Why are you so hot and cold?',
            example: 'Because straight lines never intoxicate. Only curves do.'
          ),
          reflection: 'Are you consistent and safe—or dangerous enough to burn their wings?'
        ),
      ),
      13: Lesson(
        id: 'coldpower_3_13',
        title: 'The Hourglass Effect (Law of Waiting)',
        category: 'coldpower',
        world: 3,
        lesson: 13,
        xp: 125,
        content: LessonContent(
          hook: 'Napoleon at Josephine\'s door. He writes feverishly, begging for her. She delays. Hours, then days. Each minute stretches into eternity. His empire bends under his command, but in her silence, he crumbles. By the time she appears, his hunger is not desire—it is desperation. Waiting did what power could not: it enslaved him.',
          concept: [
            'The longer the wait, the deeper the hook.',
            'Quick satisfaction dissolves; delayed gratification engraves.',
            'The hourglass turns longing into chains.'
          ],
          drill: Drill(
            question: 'They text: "Why didn\'t you reply sooner?" What do you do?',
            options: [
              'Apologize.',
              '"Because hunger sharpens the taste. And you were worth sharpening."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this impatience into a display of hourglass effect.',
            input: 'I hate waiting for you.',
            example: 'And yet you wait. That tells me everything.'
          ),
          reflection: 'Are you easy to reach—or worth every hour of hunger?'
        ),
      ),
      14: Lesson(
        id: 'coldpower_3_14',
        title: 'The Sting of Jealousy (Law of Rivalry)',
        category: 'coldpower',
        world: 3,
        lesson: 14,
        xp: 125,
        content: LessonContent(
          hook: 'Cleopatra sails the Nile, flanked by two Roman titans—Caesar and Antony. Each believes he is her chosen. Each feels the other\'s shadow. She feeds both, never choosing, never closing the wound. Their jealousy is her crown. Men who conquered worlds now clawed at each other for her smile. To spark rivalry is to forge obsession sharper than steel.',
          concept: [
            'A rival makes desire burn brighter.',
            'Monopolies bore. Competition enslaves.',
            'Jealousy transforms affection into addiction.'
          ],
          drill: Drill(
            question: 'They ask: "Are you seeing anyone else?" What do you do?',
            options: [
              'Deny, soothe them.',
              '"I don\'t compete. But I don\'t stop others from trying."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this jealousy into a display of rivalry law.',
            input: 'I don\'t like when others look at you.',
            example: 'And yet they do. Perhaps you should hold me closer.'
          ),
          reflection: 'Do you leave them safe in monopoly—or restless in rivalry?'
        ),
      ),
      15: Lesson(
        id: 'coldpower_3_15',
        title: 'The Web That Tightens (Law of Intermittent Reward)',
        category: 'coldpower',
        world: 3,
        lesson: 15,
        xp: 125,
        content: LessonContent(
          hook: 'Las Vegas, 1960s. The slot machine doesn\'t pay every time. It pays unpredictably. That\'s why gamblers lose fortunes—because the reward might come this spin. Lovers work the same way. If you respond every time, the game dies. If you reward randomly, unpredictably, they cannot stop pulling your lever. Intermittence is the secret of every addiction in history.',
          concept: [
            'Predictability breeds comfort.',
            'Randomness breeds obsession.',
            'The strongest chains are woven from uncertainty.'
          ],
          drill: Drill(
            question: 'They ask: "Why are you so unpredictable?" What do you do?',
            options: [
              'Apologize, promise stability.',
              '"Because certainty kills thrill. And I prefer you addicted."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this confusion into a display of intermittent reward.',
            input: 'You confuse me.',
            example: 'Confusion is just curiosity refusing to let go.'
          ),
          reflection: 'Do you reward predictably like a loyal dog—or unpredictably like a casino god?'
        ),
      ),
    },
    4: {
      16: Lesson(
        id: 'coldpower_4_16',
        title: 'The Law of Unattainable Fire',
        category: 'coldpower',
        world: 4,
        lesson: 16,
        xp: 125,
        content: LessonContent(
          hook: 'Spain, 1930s. Federico García Lorca, the poet, sat with lovers who adored him. He gave them glances, words, fragments—but never himself whole. His allure was not in what he gave, but in what he withheld. He was the fire no one could fully hold, and so they burned themselves trying.',
          concept: [
            'Desire dies when fulfilled completely.',
            'To remain unattainable, you must give pieces, never the whole.',
            'The spell is in the absence, not the abundance.'
          ],
          drill: Drill(
            question: 'They beg: "I want all of you." What do you do?',
            options: [
              'Give everything.',
              '"Even the gods never give themselves entirely. Why should I?"'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this demand into a display of unattainable fire.',
            input: 'Tell me everything about you.',
            example: 'If you knew it all, there\'d be nothing left to discover.'
          ),
          reflection: 'Do you let yourself be consumed—or do you keep enough mystery to keep them starving?'
        ),
      ),
      17: Lesson(
        id: 'coldpower_4_17',
        title: 'The Eclipse Effect (Law of Vanishing)',
        category: 'coldpower',
        world: 4,
        lesson: 17,
        xp: 125,
        content: LessonContent(
          hook: 'Hollywood, 1950s. Marilyn Monroe laughed, dazzled, consumed every gaze in the room. Then she disappeared for weeks. When she returned, demand for her doubled. Her absence was her sharpest performance. An eclipse always returns more dazzling because it leaves. Seduction demands you vanish, so they ache for your return.',
          concept: [
            'To vanish is to increase value.',
            'The heart grows addicted in absence.',
            'Your silence is as powerful as your voice.'
          ],
          drill: Drill(
            question: 'They text: "Where have you been?" What do you do?',
            options: [
              'Apologize profusely.',
              '"Some stars shine brightest after a little darkness."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this complaint into a display of eclipse effect.',
            input: 'You ghosted me.',
            example: 'No, I eclipsed. And now you see me brighter.'
          ),
          reflection: 'Do you fear absence—or do you wield it as your deadliest weapon?'
        ),
      ),
      18: Lesson(
        id: 'coldpower_4_18',
        title: 'The Law of Sweet Poison',
        category: 'coldpower',
        world: 4,
        lesson: 18,
        xp: 125,
        content: LessonContent(
          hook: 'The Medici courts of Florence. A courtesan serves sugared almonds laced with opium. The men who eat them never forget her—they crave her touch as much as the drug. Seduction works the same: lace sweetness with danger. They must feel that you are both cure and curse, pleasure and poison.',
          concept: [
            'Pure sweetness fades. Sweetness laced with venom lingers.',
            'The duality—pleasure entwined with risk—is what enslaves the heart.',
            'Fear sharpens attraction.'
          ],
          drill: Drill(
            question: 'They confess: "I think you\'re dangerous." What do you do?',
            options: [
              'Deny it, reassure.',
              '"Danger tastes sweeter when you survive it."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this fear into a display of sweet poison.',
            input: 'You\'re too much for me.',
            example: 'Too much is the perfect dose when nothing else is enough.'
          ),
          reflection: 'Do you present yourself as harmless honey—or the nectar spiked with poison?'
        ),
      ),
      19: Lesson(
        id: 'coldpower_4_19',
        title: 'The Mirror of Madness',
        category: 'coldpower',
        world: 4,
        lesson: 19,
        xp: 125,
        content: LessonContent(
          hook: 'Vienna, 1900s. Freud listened as his patient became obsessed with him. Why? Because he reflected her deepest thoughts back to her, amplifying them. She didn\'t love him—she loved her own reflection in his mirror. The cruel truth: people don\'t fall for you. They fall for the parts of themselves you reflect back.',
          concept: [
            'To obsess someone, reflect their hidden self.',
            'Become the mirror of their unspoken desires.',
            'They won\'t know if it\'s you they love—or themselves through you.'
          ],
          drill: Drill(
            question: 'They say: "It\'s like you understand me better than I do." What do you do?',
            options: [
              'Laugh it off.',
              '"Maybe I\'m just the mirror you\'ve been avoiding."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this recognition into a display of mirror madness.',
            input: 'You know me too well.',
            example: 'I only show you what you\'ve always known.'
          ),
          reflection: 'Are you demanding to be loved—or are you making them fall for their own reflection in your eyes?'
        ),
      ),
      20: Lesson(
        id: 'coldpower_4_20',
        title: 'The Final Chain (Law of Irreversibility)',
        category: 'coldpower',
        world: 4,
        lesson: 20,
        xp: 125,
        content: LessonContent(
          hook: 'The myth of Circe. She enchanted men not with spells, but with transformation. Once you drank from her cup, you could never return unchanged. This is the ultimate law: seduction must leave scars. When they leave you, they must never be the same. The memory of you must haunt every future lover. That is how you win eternity.',
          concept: [
            'True seduction is irreversible.',
            'Once touched by your fire, they can never feel warmth in lesser flames.',
            'The goal is not to win them now—but to live rent-free in their soul forever.'
          ],
          drill: Drill(
            question: 'They whisper: "I\'ll never forget you." What do you do?',
            options: [
              'Blush, say something sweet.',
              '"Good. That was the plan all along."'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this promise into a display of final chain.',
            input: 'I\'ll get over you.',
            example: 'You may leave me, but you\'ll never leave me behind.'
          ),
          reflection: 'Do you chase fleeting victories—or do you etch yourself into their very being?'
        ),
      ),
    },
  },
  'psychwar': {
    1: {
      1: Lesson(
        id: 'psychwar_1_1',
        title: 'The Invisible Battlefield (Sun Tzu\'s Mind War)',
        category: 'psychwar',
        world: 1,
        lesson: 1,
        xp: 50,
        content: LessonContent(
          hook: 'China, 500 BC. The armies gather. Spears gleam. But Sun Tzu doesn\'t unleash soldiers—he unleashes whispers. Fires are lit in random hills at night to suggest phantom armies. Drums echo in empty valleys to mimic battalions. Rumors of plague spread through enemy camps. By dawn, the enemy commander trembles before shadows that don\'t exist. When Sun Tzu advances, the enemy has already surrendered—beaten not by swords, but by their own imagination. The first true battlefield is not the land—it is the mind.',
          concept: [
            'War of Perceptions: Make them see what isn\'t there.',
            'Mental Disruption: Fear and confusion weaken more than blades.',
            'Defense Today: Be wary of signals, rumors, and "facts" designed to rattle your mind.'
          ],
          drill: Drill(
            question: 'Someone insists: "Everyone\'s against you—it\'s pointless to resist." What do you do?',
            options: [
              'Accept their claim and lose hope.',
              'Question the source—are they describing reality, or trying to shape it?'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this statement into a recognition of invisible battlefield tactics.',
            input: 'The enemy is strong.',
            example: 'The enemy wants you to think they\'re strong—that\'s their first weapon.'
          ),
          reflection: 'Who controls your perception—your eyes, or someone else\'s whispers?'
        ),
      ),
      2: Lesson(
        id: 'psychwar_1_2',
        title: 'Fear as a Blade',
        category: 'psychwar',
        world: 1,
        lesson: 2,
        xp: 50,
        content: LessonContent(
          hook: 'Salem, 1692. A girl points her trembling hand: "She\'s with the Devil." No evidence. No proof. Just a spark. Fear spreads like fire through dry grass. Fathers betray daughters. Neighbors turn executioner. No army was needed—terror itself held the sword. The lesson? Fear is the cheapest, most devastating weapon. Once it spreads, it doesn\'t need to be true. It only needs to be believed.',
          concept: [
            'Fear Overrides Reason: Panic erases logic.',
            'Contagion Effect: One spark can consume whole crowds.',
            'Defense Today: Ask—is this fear based on fact, or is it manufactured?'
          ],
          drill: Drill(
            question: 'You hear: "If you don\'t follow me, everything will collapse." What do you do?',
            options: [
              'Panic and comply.',
              'Ask: collapse how, collapse why, collapse when?'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this fear into a recognition of manufactured terror.',
            input: 'This is dangerous.',
            example: 'This feels dangerous because someone wants me afraid.'
          ),
          reflection: 'Which of your fears are real—and which were planted in you?'
        ),
      ),
      3: Lesson(
        id: 'psychwar_1_3',
        title: 'Planting Doubt, Harvesting Paranoia',
        category: 'psychwar',
        world: 1,
        lesson: 3,
        xp: 50,
        content: LessonContent(
          hook: 'Cold War Berlin. An American diplomat receives a quiet remark at dinner: "Strange, your secretary takes a lot of late-night calls." That\'s it. Just a seed. Days later, another whisper: "She lingers near the phones too long, doesn\'t she?" Soon the diplomat distrusts everyone. He checks shadows, eyes his friends like enemies. No chains are needed—the KGB turned his own mind into his prison. Doubt is the cheapest poison. Once planted, it grows itself.',
          concept: [
            'Seeds Over Swords: Suggestion beats confrontation.',
            'Paranoia Multiplies Alone: A whisper today becomes obsession tomorrow.',
            'Defense Today: When suspicion feels planted, check—did it come from evidence, or someone else\'s hint?'
          ],
          drill: Drill(
            question: 'A colleague says: "Funny, your partner\'s been smiling at that new coworker a lot." What do you do?',
            options: [
              'Get suspicious immediately.',
              'Ask yourself: is this observation fact, or manipulation?'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this doubt into a recognition of planted paranoia.',
            input: 'Maybe I can\'t trust them.',
            example: 'Maybe someone wants me to doubt them without reason.'
          ),
          reflection: 'Whose seeds of doubt are you watering?'
        ),
      ),
      4: Lesson(
        id: 'psychwar_1_4',
        title: 'The Mirror Weapon',
        category: 'psychwar',
        world: 1,
        lesson: 4,
        xp: 50,
        content: LessonContent(
          hook: 'France, 1680. Court whispers accuse Madame de Montespan of poison plots. Instead of defending herself, she turns the blade back: "How curious you think of poison. Why so detailed? Unless…" The room shifts. Her accuser begins defending themselves, sweating under suspicion. The mirror trick is perfect reversal: you accuse me? I make you the guilty one. No evidence needed—just reflection turned sharp.',
          concept: [
            'Accusation Reversal: Mirror suspicion back at attacker.',
            'Confusion As Defense: Make them defend instead of you.',
            'Defense Today: Notice when your valid concerns are flipped into questions about you.'
          ],
          drill: Drill(
            question: 'You say: "I don\'t like how you\'ve hidden this from me." They reply: "Why are you always paranoid?" What do you recognize?',
            options: [
              'Get defensive about being "paranoid."',
              'Recognize the mirror—they dodged your point.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this self-doubt into a recognition of the mirror weapon.',
            input: 'Maybe I\'m too suspicious.',
            example: 'They\'re reflecting my concern to silence me.'
          ),
          reflection: 'When arguments flip back onto you—ask: am I being mirrored?'
        ),
      ),
      5: Lesson(
        id: 'psychwar_1_5',
        title: 'The Silence That Crushes',
        category: 'psychwar',
        world: 1,
        lesson: 5,
        xp: 50,
        content: LessonContent(
          hook: 'Stanford, 1971. In Zimbardo\'s infamous experiment, some "guards" scream. Others… say nothing. Just stare. Just wait. The prisoners fear the quiet ones most. A silence that stretches becomes unbearable—every second whispers: you are beneath me. Words can be challenged. Silence is unanswerable. In psychological warfare, silence is not absence. It is dominance distilled.',
          concept: [
            'Implied Authority: The less you say, the more they imagine.',
            'Silence as Pressure: Pauses make others fill the void.',
            'Defense Today: Don\'t mistake silence for superiority—it\'s a tactic, not truth.'
          ],
          drill: Drill(
            question: 'They give you long pauses, forcing you to babble explanations. Do you:',
            options: [
              'Rush to fill the silence.',
              'Sit calmly—their silence doesn\'t define you.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this panic into a recognition of weaponized silence.',
            input: 'They said nothing—I panicked.',
            example: 'Their silence was a tactic. My calm is my armor.'
          ),
          reflection: 'Who in your life uses silence as a leash?'
        ),
      ),
    },
    2: {
      6: Lesson(
        id: 'psychwar_2_6',
        title: 'The Web of Half-Truths',
        category: 'psychwar',
        world: 2,
        lesson: 6,
        xp: 50,
        content: LessonContent(
          hook: 'Venice, 1500. A merchant is accused of smuggling. In court, he admits: "Yes, I did send ships without full duty. But only to feed orphans in winter." He weaves fact with virtue, lie with charity. By the end, the judges argue for him. The genius? He didn\'t deny guilt. He bent it into a half-truth wrapped in nobility. A pure lie risks collapse. A half-truth survives.',
          concept: [
            'Best Lies Hold Truth: A shard of reality makes poison drinkable.',
            'Emotional Justification: Cloak deception in moral clothing.',
            'Defense Today: When something feels "mostly true," ask: which part is the bait?'
          ],
          drill: Drill(
            question: 'A politician says: "Yes, I made mistakes—but only because I cared too much." What do you think?',
            options: [
              'Admire their "honesty."',
              'Notice how truth is wrapped around misdirection.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this acceptance into a recognition of half-truth tactics.',
            input: 'They admitted guilt—it must be true.',
            example: 'They admitted guilt—but did they frame it to gain sympathy?'
          ),
          reflection: 'Are you swallowing lies easier when sweetened with honesty?'
        ),
      ),
      7: Lesson(
        id: 'psychwar_2_7',
        title: 'Masks Within Masks',
        category: 'psychwar',
        world: 2,
        lesson: 7,
        xp: 50,
        content: LessonContent(
          hook: 'Paris, 1770. An aristocrat hosts salons where he mocks the king. But when guards arrive, he dons another mask: loyal servant, hand over heart. When spies listen, he wears yet another: bumbling fool, harmless. The truth? He is all and none. He survives by shifting masks faster than others can pin him down. If you cannot read the mask, you cannot touch the man beneath.',
          concept: [
            'Multiple Personae: One face for friends, another for enemies.',
            'Confusion as Shield: If they can\'t place you, they can\'t control you.',
            'Defense Today: Notice when someone is too many people at once—it may not be charm, but camouflage.'
          ],
          drill: Drill(
            question: 'A new partner acts romantic with you, stoic with friends, humble with elders. Do you:',
            options: [
              'See this as versatility.',
              'Realize they may have no "real" self—only masks.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this admiration into a recognition of multiple masks.',
            input: 'They\'re complicated.',
            example: 'They are skilled at masks—complication is camouflage.'
          ),
          reflection: 'Do you know the person, or the mask they chose for you?'
        ),
      ),
      8: Lesson(
        id: 'psychwar_2_8',
        title: 'The Trap of Agreement',
        category: 'psychwar',
        world: 2,
        lesson: 8,
        xp: 50,
        content: LessonContent(
          hook: 'Berlin, 1933. A young officer is tested. His superior says: "We agree loyalty is everything, yes?" The officer nods. Next: "And loyalty requires obedience, yes?" Another nod. Soon he finds himself agreeing to betray his own conscience—all from a chain of small yeses. Agreement is not always alignment. It can be a trap set one nod at a time.',
          concept: [
            'Incremental Consent: Each small "yes" leads to bigger concessions.',
            'Loyalty as Weapon: "If you agree on X, then surely Y…"',
            'Defense Today: Pause before automatic agreement—where does this path lead?'
          ],
          drill: Drill(
            question: 'Your boss says: "You agree teamwork matters, right?" (harmless). Then: "So you\'ll stay late every night, right?" What do you do?',
            options: [
              'Feel trapped by your first "yes."',
              'Recognize the leap from small truth to big exploitation.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this trap into a recognition of incremental consent.',
            input: 'I said yes, so now I must continue.',
            example: 'Each yes stands alone. One agreement doesn\'t enslave me.'
          ),
          reflection: 'Where have your nods led you into cages?'
        ),
      ),
      9: Lesson(
        id: 'psychwar_2_9',
        title: 'The Serpent\'s Compliment',
        category: 'psychwar',
        world: 2,
        lesson: 9,
        xp: 50,
        content: LessonContent(
          hook: 'Hollywood, 1950s. An actress is told: "You\'re far too brilliant for this role—it\'s beneath you." She blushes at the praise… then quits. Months later, she realizes the role went to another star. The compliment wasn\'t praise—it was poison. The serpent\'s compliment inflates ego while steering you away from power. Not every sweet word is meant to lift you—some are designed to move you.',
          concept: [
            'Flattery as Leash: People follow where their ego is stroked.',
            'Praise as Redirection: Compliment what removes them from opportunity.',
            'Defense Today: Ask—what do they gain by complimenting me?'
          ],
          drill: Drill(
            question: 'A rival says: "You\'re too good for that job—you deserve better." What do you think?',
            options: [
              'Glow with pride and step aside.',
              'Pause. Why would they encourage you to quit?'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this flattery into a recognition of the serpent\'s compliment.',
            input: 'They praised me—it must be sincere.',
            example: 'They praised me—but does it lead me away from power?'
          ),
          reflection: 'Do you chase the sugar of praise, or the substance of truth?'
        ),
      ),
      10: Lesson(
        id: 'psychwar_2_10',
        title: 'The Vanishing Act',
        category: 'psychwar',
        world: 2,
        lesson: 10,
        xp: 50,
        content: LessonContent(
          hook: 'Naples, 1600s. A gambler owes debts he cannot pay. Instead of running, he throws a feast. Wine flows, women laugh, music drowns the night. By morning, the creditors awake to empty halls—he has vanished while they were distracted. Distraction is the purest camouflage. Make them look here, while you slip away there. Magic is not sorcery. It is control of attention.',
          concept: [
            'Distraction Equals Freedom: Attention is a leash. Break it, you escape.',
            'Spectacle as Smoke: Loud colors, big gestures, shiny surfaces hide the move.',
            'Defense Today: Ask—what am I not looking at while dazzled?'
          ],
          drill: Drill(
            question: 'An ad flashes: "LIMITED TIME! BUY NOW!" What do you do?',
            options: [
              'Focus only on the countdown timer.',
              'Ask: what are they hiding while I panic about the clock?'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this distraction into a recognition of the vanishing act.',
            input: 'It caught my eye—it must matter.',
            example: 'It caught my eye—so what did it pull me away from?'
          ),
          reflection: 'Where are you being dazzled into blindness?'
        ),
      ),
    },
    3: {
      11: Lesson(
        id: 'psychwar_3_11',
        title: 'Divide and Rule',
        category: 'psychwar',
        world: 3,
        lesson: 11,
        xp: 100,
        content: LessonContent(
          hook: 'Ancient Rome. Senators whisper rebellion. Caesar doesn\'t confront them directly. Instead, he spreads subtle rumors—this one mocked you in private, that one plans to betray you first. Unity fractures into suspicion. Soon, his enemies fight one another, too busy to unite against him. He never drew a sword—he simply split their trust.',
          concept: [
            'Suspicion Destroys Unity: A divided enemy cannot stand.',
            'Whispers Are Sharper Than Swords: Rumors fight battles for you.',
            'Defense Today: When groups suddenly splinter, look for the invisible hand fanning distrust.'
          ],
          drill: Drill(
            question: 'Your workplace suddenly turns hostile—colleagues mistrust each other. What do you do?',
            options: [
              'Assume it\'s just stress.',
              'Ask: Who benefits from us fighting each other?'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this observation into a recognition of divide and rule tactics.',
            input: 'They\'re fighting each other.',
            example: 'They\'re fighting each other—while someone else wins.'
          ),
          reflection: 'Do you see conflict at face value—or trace the hidden architect?'
        ),
      ),
      12: Lesson(
        id: 'psychwar_3_12',
        title: 'The Poisoned Gift',
        category: 'psychwar',
        world: 3,
        lesson: 12,
        xp: 100,
        content: LessonContent(
          hook: 'Medieval France. A rival lord presents his enemy with a lavish horse, adorned in silk. Days later, the animal collapses, diseased. The lord accepts the gift, and with it, ruin. Not every offering is kindness. Sometimes generosity is a weapon wrapped in velvet.',
          concept: [
            'A Gift Can Carry Chains: The more generous the act, the more careful you must be.',
            'Obligation Weakens Freedom: Accepting creates invisible debt.',
            'Defense Today: Ask what strings are tied to every gift.'
          ],
          drill: Drill(
            question: 'A new "friend" showers you with favors early on. What do you think?',
            options: [
              'Accept freely—it\'s generosity.',
              'Pause. Realize every gift carries expectation.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this acceptance into a recognition of the poisoned gift.',
            input: 'They gave it to me for free.',
            example: 'They gave it to me—but freedom rarely comes free.'
          ),
          reflection: 'Do you measure kindness—or do you count the chains behind it?'
        ),
      ),
      13: Lesson(
        id: 'psychwar_3_13',
        title: 'The Serpent\'s Compliment',
        category: 'psychwar',
        world: 3,
        lesson: 13,
        xp: 100,
        content: LessonContent(
          hook: 'Renaissance Italy. A courtier flatters a duke: "No man alive is as wise as you." The duke beams, but over time, the words poison him. He stops listening to counsel, believing he already knows best. Flattery sharpens pride into blindness, and blindness into downfall.',
          concept: [
            'Flattery is a Cage: Praise lulls you into weakness.',
            'The Compliment is a Blade: It cuts your awareness if you lean on it.',
            'Defense Today: When words of praise feel too perfect, ask what action follows them.'
          ],
          drill: Drill(
            question: 'A partner says: "You\'re perfect—you never make mistakes." What do you think?',
            options: [
              'Smile and accept.',
              'Recognize it as either shallow—or manipulation.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this flattery into a recognition of the serpent\'s compliment.',
            input: 'They said I was flawless.',
            example: 'They said I was flawless—so they must want me blind.'
          ),
          reflection: 'Do you crave sweet words—or cut through them for truth?'
        ),
      ),
      14: Lesson(
        id: 'psychwar_3_14',
        title: 'Confusion as a Weapon',
        category: 'psychwar',
        world: 3,
        lesson: 14,
        xp: 100,
        content: LessonContent(
          hook: 'Cold War interrogation rooms. Some prisoners were not beaten—they were drowned in contradiction. Guards would praise them one hour, insult them the next. They\'d be promised release, then threatened with life sentences. The goal wasn\'t answers—it was disorientation. Confusion breaks the mind faster than cruelty.',
          concept: [
            'Mixed Signals Corrode Trust: Uncertainty leaves people clinging to the abuser.',
            'The Fog of Contradiction: If nothing makes sense, people surrender control.',
            'Defense Today: When someone constantly shifts, it may not be chaos—it may be strategy.'
          ],
          drill: Drill(
            question: 'A partner alternates between adoration and cruelty. What do you recognize?',
            options: [
              'Believe their love is just "complicated."',
              'Recognize it as control through confusion.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this confusion into a recognition of weaponized chaos.',
            input: 'They\'re unpredictable.',
            example: 'They\'re unpredictable—because predictability would free me.'
          ),
          reflection: 'Do you accept chaos—or see the hidden hand scripting it?'
        ),
      ),
      15: Lesson(
        id: 'psychwar_3_15',
        title: 'The Burnt Bridge Strategy',
        category: 'psychwar',
        world: 3,
        lesson: 15,
        xp: 100,
        content: LessonContent(
          hook: 'Hannibal, 3rd century BC. After crossing into enemy territory, he burned the ships behind him. His soldiers had no path home but victory. By destroying retreat, he left them only one road: forward. A ruthless tactic—sometimes the absence of escape creates the fiercest resolve.',
          concept: [
            'No Retreat, No Weakness: Remove options, and resolve hardens.',
            'Desperation Can Be Engineered: Forced scarcity amplifies commitment.',
            'Defense Today: If someone cuts off your alternatives, ask who benefits from your cornering.'
          ],
          drill: Drill(
            question: 'A boss insists: "You either stay late every night—or you\'ll lose your spot." What do you realize?',
            options: [
              'Feel you have no choice.',
              'Realize they\'re burning your bridges for control.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this helplessness into a recognition of the burnt bridge strategy.',
            input: 'I had no choice.',
            example: 'They burned the bridges so I\'d believe I had no choice.'
          ),
          reflection: 'When do you fight hardest—when you\'re free, or when cornered?'
        ),
      ),
    },
    4: {
      16: Lesson(
        id: 'psychwar_4_16',
        title: 'The Web of Silence',
        category: 'psychwar',
        world: 4,
        lesson: 16,
        xp: 125,
        content: LessonContent(
          hook: 'Mafia New York, 1970s. A man under suspicion is invited to a meeting. He speaks nervously, filling the room with explanations, excuses, reassurances. His words betray his fear. Across the table, his boss says nothing. Just silence. The man keeps talking—until he reveals everything. Silence, weaponized, is louder than any shout.',
          concept: [
            'Speech Reveals, Silence Conceals: The less you speak, the more others expose.',
            'The Pressure of the Void: Humans rush to fill silence, often with secrets.',
            'Defense Today: When someone stays quiet, don\'t spill your truth to break the tension.'
          ],
          drill: Drill(
            question: 'You confess too much during an awkward pause. What do you do?',
            options: [
              'Keep explaining until they nod.',
              'Breathe, own the silence, and say nothing.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this confession into a recognition of the web of silence.',
            input: 'I kept talking because it was awkward.',
            example: 'They used silence as a net—and I walked straight in.'
          ),
          reflection: 'Do you panic in silence—or use it as your battlefield?'
        ),
      ),
      17: Lesson(
        id: 'psychwar_4_17',
        title: 'The Mask of Agreement',
        category: 'psychwar',
        world: 4,
        lesson: 17,
        xp: 125,
        content: LessonContent(
          hook: 'Feudal Japan. A samurai bows deeply to his enemy lord, agreeing to every command. He never resists, never argues. Months later, when trust is won, he strikes at the moment least expected. Submission was not weakness—it was camouflage. Agreement became his sharpest disguise.',
          concept: [
            'Agree to Disarm: Agreement removes suspicion.',
            'Yielding Can Be Power: By bending, you position yourself to strike.',
            'Defense Today: Beware of those who nod too easily—they may not be allies, just waiting.'
          ],
          drill: Drill(
            question: 'A coworker always agrees, never challenges. What do you consider?',
            options: [
              'Assume loyalty.',
              'Consider they may be waiting for leverage.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this trust into a recognition of the mask of agreement.',
            input: 'They never disagreed with me.',
            example: 'They never disagreed—because silence was their weapon.'
          ),
          reflection: 'Do you equate agreement with loyalty—or do you see the trap in compliance?'
        ),
      ),
      18: Lesson(
        id: 'psychwar_4_18',
        title: 'Reflection Warfare',
        category: 'psychwar',
        world: 4,
        lesson: 18,
        xp: 125,
        content: LessonContent(
          hook: 'Cold War diplomacy. A negotiator never offers an opinion. Instead, he mirrors the desires of his opponent: "That\'s an interesting thought." "I can see why you\'d feel that way." The opponent mistakes reflection for rapport, slowly lowering his guard. By the end, he has revealed his full playbook—while the mirror never once showed its own face.',
          concept: [
            'Mirroring Creates Illusion: People trust themselves when reflected back.',
            'The Danger of False Rapport: A mirror can extract secrets without ever giving one.',
            'Defense Today: Ask: are they truly sharing themselves, or just echoing you?'
          ],
          drill: Drill(
            question: 'A date mirrors your every word and passion. What do you think?',
            options: [
              'Feel instantly connected.',
              'Pause—true connection has differences too.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this connection into a recognition of reflection warfare.',
            input: 'They seemed just like me.',
            example: 'They seemed just like me—because they never showed who they really were.'
          ),
          reflection: 'Do you fall for your own reflection—or demand substance behind the mirror?'
        ),
      ),
      19: Lesson(
        id: 'psychwar_4_19',
        title: 'The Trap of False Choice',
        category: 'psychwar',
        world: 4,
        lesson: 19,
        xp: 125,
        content: LessonContent(
          hook: '1930s Chicago. A gangster corners a shop owner: "Do you want to pay for protection monthly—or in one big sum right now?" The choice is an illusion. Both roads lead to surrender. The man never realizes he could refuse the game altogether. This is the art of the false choice: framing captivity as freedom.',
          concept: [
            'Two Doors, Same Prison: An enemy narrows your vision to options that serve them.',
            'The Illusion of Agency: Being allowed to "choose" means nothing if the choices are rigged.',
            'Defense Today: Always look for the hidden third option.'
          ],
          drill: Drill(
            question: 'A boss says: "You can stay late or take a pay cut—your choice." What do you do?',
            options: [
              'Pick the "less bad" option.',
              'Recognize the false frame—and challenge it.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this choice into a recognition of the false choice trap.',
            input: 'They gave me two choices.',
            example: 'They gave me two choices—but both were chains.'
          ),
          reflection: 'Do you see choice—or the cage disguised as one?'
        ),
      ),
      20: Lesson(
        id: 'psychwar_4_20',
        title: 'The Predator\'s Patience',
        category: 'psychwar',
        world: 4,
        lesson: 20,
        xp: 125,
        content: LessonContent(
          hook: 'Ancient Mongolia. A hunter watches the herd for days. He does not chase the strongest animal. He does not rush. He waits for the one that lingers at the edges, limping, distracted. When he strikes, it looks inevitable. The kill was not in the attack—it was in the patience before it.',
          concept: [
            'Patience is a Weapon: Time weakens enemies more than force.',
            'The Watcher Always Wins: Observation reveals the inevitable opening.',
            'Defense Today: If someone lingers quietly, don\'t mistake them for absent—they may be calculating.'
          ],
          drill: Drill(
            question: 'An opponent stays silent, watching for weeks before acting. What do you recognize?',
            options: [
              'Dismiss them as irrelevant.',
              'Recognize they may be studying your weaknesses.'
            ],
            answerIndex: 1
          ),
          rewrite: RewriteTask(
            prompt: 'Transform this surprise into a recognition of the predator\'s patience.',
            input: 'They struck out of nowhere.',
            example: 'They struck after waiting until I weakened myself.'
          ),
          reflection: 'Do you rush for the prize—or have the discipline to let time kill for you?'
        ),
      ),
    },
  },
}; 