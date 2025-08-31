import 'package:whisperfire/data/models/lesson_models.dart';

const kCategories = [
  'magnetic_presence',
  'composed_authority',
  'conversation_frames',
  'scarcity_desire',
  'hidden_dynamics',
  'strategic_influence'
];

const kCategoryNames = {
  'magnetic_presence': 'Magnetic Presence',
  'composed_authority': 'Emotional Alchemy',
  'conversation_frames': 'Conversation Frames',
  'scarcity_desire': 'Scarcity & Desire',
  'hidden_dynamics': 'Hidden Dynamics',
  'strategic_influence': 'Psychological Gravity',
};

/// Map<category, Map<world, Map<lessonNum, Lesson>>>
const lessonsCatalog = <String, Map<int, Map<int, Lesson>>>{
  'magnetic_presence': {
    1: {
      1: Lesson(
        id: 'magnetic_presence_1_1',
        title: 'The Power of Mystery',
        category: 'magnetic_presence',
        world: 1,
        lesson: 1,
        xp: 50,
        content: LessonContent(
            hook:
                'Rome shook beneath Caesar\'s legions, but it was undone by silk. Cleopatra did not rush him with beauty or gifts. She arrived rolled in a carpet, unwrapped like a secret the world was not meant to see. She spoke little. She revealed less. Yet the conqueror of empires became her captive. Mystery was her throne.',
            concept: [
              'Mystery is oxygen. Without it, attraction suffocates.',
              'Answers close doors; questions open captivation.',
              'What you deny binds tighter than what you give.',
              'A veil holds more power than a confession.'
            ],
            teaching:
                'The mind does not loop on what it already knows — it replays what it cannot solve. Mystery hijacks imagination, forcing the other to replay you in their head long after you leave. The unanswered text, the unspoken thought, the pause before a kiss — these are not gaps. They are hooks that pull endlessly.',
            drill: Drill(
                question: 'They ask: "Do you even like me?"',
                options: [
                  'Of course I do.',
                  'You\'ll have to decide for yourself.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates mystery.',
                input: 'I was just home last night.',
                example:
                    'I didn\'t sleep much — but not for the reason you think.'),
            reflection:
                'When have you smothered interest with too much certainty? What veil could you leave in place so curiosity never stops clawing at them?'),
      ),
      2: Lesson(
        id: 'magnetic_presence_1_2',
        title: 'Scarcity is a Crown',
        category: 'magnetic_presence',
        world: 1,
        lesson: 2,
        xp: 50,
        content: LessonContent(
            hook:
                'Paris, 1889. La Goulue, queen of the Moulin Rouge, danced once and refused every encore. Dukes and princes begged. Bankers offered fortunes. She simply shook her head. They left with her image burned into their minds — not because of what they saw, but because of what she denied.',
            concept: [
              'Abundance is invisible. Scarcity is sacred.',
              'The denied "yes" haunts longer than a hundred given.',
              'Flood attention and it drowns. Withhold it and it shines.',
              'Your time is the crown; wear it high.'
            ],
            teaching:
                'The human mind inflates rarity into value. When you are too available, you become background noise. When your time is rationed, your "yes" becomes mythic. Scarcity forces others to compete, and competition multiplies attraction. Your absence becomes louder than others\' presence.',
            drill: Drill(
                question: 'They ask: "When are you free?"',
                options: [
                  'Anytime, just say when.',
                  'Thursday, maybe. If you tempt me enough to cancel my plans.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates scarcity.',
                input: 'Yes, I\'m free whenever.',
                example:
                    'Thursday\'s possible — but only if you give me a reason worth it.'),
            reflection:
                'Where are you giving yourself away like a common coin? What would change if your presence felt like a rare jewel, glimpsed but never owned?'),
      ),
      3: Lesson(
        id: 'magnetic_presence_1_3',
        title: 'Presence is a Spell',
        category: 'magnetic_presence',
        world: 1,
        lesson: 3,
        xp: 50,
        content: LessonContent(
            hook:
                'New York, 1977. Studio 54 blazed with noise and glitter. Then Grace Jones entered. She didn\'t rush. She didn\'t speak. Her heels struck the floor like drums of war. Her perfume cut through smoke. Heads turned before she even looked up. By the time she opened her mouth, the room was already hers. Presence had cast its spell.',
            concept: [
              'Presence precedes words. You are felt before you are heard.',
              'Stillness intoxicates more than frenzy.',
              'Aura is not decoration; it is domination.',
              'When the senses are captured, the mind follows.'
            ],
            teaching:
                'Humans read presence in seconds: posture, rhythm, silence, eyes. Before logic has a chance, instinct decides. The one who moves deliberately, who commands space, who radiates calm intensity — they enslave attention without effort. Presence is not what you say. It is what you emanate.',
            drill: Drill(
                question: 'First meeting:',
                options: ['Hi, nice to meet you.', 'At last… we meet.'],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that commands presence.',
                input: 'Call me back later.',
                example:
                    'Call me when you\'re ready for something unforgettable.'),
            reflection:
                'What enters the room before your words? How could you sculpt a presence that intoxicates before you even speak?'),
      ),
      4: Lesson(
        id: 'magnetic_presence_1_4',
        title: 'The Haunting Memory',
        category: 'magnetic_presence',
        world: 1,
        lesson: 4,
        xp: 50,
        content: LessonContent(
            hook:
                'Monte Carlo, 1963. A tycoon boasted to Brigitte Bardot of yachts and jewels. She leaned in, whispered: "Money buys many things… but not the one I\'m thinking of." Then she vanished. Months later, he was still obsessed — not with her presence, but with the ghost she left behind.',
            concept: [
              'Captivation is an unfinished story.',
              'Absence carves deeper than presence.',
              'The half-said line lives longer than the speech.',
              'Ghosts linger longer than flesh.'
            ],
            teaching:
                'Humans cannot release the unresolved. An unanswered question, a door left ajar, a line cut short — these haunt endlessly. Closure kills attraction. The haunting is born in what never fully resolves. The strongest pull thrives not in the kiss, but in the echo left after.',
            drill: Drill(
                question: 'At the end of the night:',
                options: [
                  'That was fun, let\'s do it again.',
                  'Tonight reminded me of something I swore I\'d never repeat… maybe I\'ll tell you next time.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates haunting mystery.',
                input: 'Thanks for coffee, see you soon.',
                example:
                    'Dangerous coffee… you woke up something I thought was buried.'),
            reflection:
                'Do you close every encounter neatly? Or could you leave behind a ghost — a whisper that lingers long after you\'re gone?'),
      ),
      5: Lesson(
        id: 'magnetic_presence_1_5',
        title: 'The Mirror of Desire',
        category: 'magnetic_presence',
        world: 1,
        lesson: 5,
        xp: 50,
        content: LessonContent(
            hook:
                'Venice, 18th century. Casanova never conquered with declarations of self. He captured hearts by reflecting others. To one woman, he was a poet who "understood her soul." To another, a savior. To another, a danger. They swore he knew them better than they knew themselves. In truth, he showed them their own fantasies, perfectly mirrored.',
            concept: [
              'People don\'t fall for you — they fall for themselves, seen through you.',
              'The mirror pulls deeper than the spotlight.',
              'To be unforgettable, reflect their hidden longing.',
              'The greatest allure is not seen — it is reflected.'
            ],
            teaching:
                'People ache to be understood, but their deepest ache is to have their secret desires reflected back without judgment. Casanova knew: give them not you, but themselves. They will swear you are their soulmate, when in truth they are in love with their own reflection. This is the mirror\'s most intoxicating trick.',
            drill: Drill(
                question:
                    'They say: "I\'ve always wanted someone who understands me."',
                options: [
                  'I understand you.',
                  'Strange… I was about to say the same about you.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that mirrors their desire.',
                input: 'You\'re beautiful.',
                example:
                    'It\'s eerie… you feel like the person I\'ve been searching for without knowing it.'),
            reflection:
                'Do you try to impress with your identity, or mirror theirs? What would happen if you became the reflection of their deepest unspoken desire?'),
      ),
    },
    2: {
      6: Lesson(
        id: 'magnetic_presence_2_6',
        title: 'The Ice Mask',
        category: 'magnetic_presence',
        world: 2,
        lesson: 6,
        xp: 75,
        content: LessonContent(
            hook:
                'Vienna, 1815. At the Congress of Vienna, Metternich sits among kings. He smiles politely, never warmly. He answers questions, but reveals nothing. The French rage, the Prussians boast, the Russians plot. Metternich listens with a mask of calm neutrality. Days later, every faction has exposed its secrets trying to break his silence. The man who gave nothing gained everything.',
            concept: [
              'The blank mask provokes projection.',
              'What you don\'t reveal cannot be attacked.',
              'Social neutrality is misread as superiority.',
              'The less you show, the more others show.'
            ],
            teaching:
                'Humans cannot bear a void. When you reveal nothing, others project, confess, and compete to break your neutrality. They give themselves away. The one who speaks least often controls the most. The Ice Mask is not coldness — it is the throne built from restraint.',
            drill: Drill(
                question: 'At a party, asked: "So, what do you do?"',
                options: [
                  'Spill details.',
                  'Enough to keep life interesting. What about you?'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that maintains mystery.',
                input: 'I love talking about myself.',
                example: 'Guess. I\'m curious what picture I give off.'),
            reflection:
                'Do you rush to reveal yourself? Or could you let silence do the revealing for you?'),
      ),
      7: Lesson(
        id: 'magnetic_presence_2_7',
        title: 'Deliberate Distance',
        category: 'magnetic_presence',
        world: 2,
        lesson: 7,
        xp: 75,
        content: LessonContent(
            hook:
                'Fashion Week, 1995. Anna Wintour never roams the room. She sits still, sunglasses on. Others orbit her like moons. She offers three minutes of attention, then turns away. The distance is deliberate. The effort required to reach her makes her presence gravitational.',
            concept: [
              'Chasing lowers status; being sought creates it.',
              'Distance is gravity.',
              'The pursued always controls the pursuit.',
              'Access becomes value when it is earned, not offered.'
            ],
            teaching:
                'We crave what we must work for. The one who approaches less forces others to approach more. By setting deliberate distance, you make every step toward you feel like an achievement. You don\'t have to chase — gravity pulls.',
            drill: Drill(
                question: 'At an event:',
                options: [
                  'Rush to meet everyone.',
                  'Stand still, observing. Let them come to you.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates distance.',
                input: 'I just had to come talk to you!',
                example: 'You looked like the only person worth meeting here.'),
            reflection: 'Do you chase attention, or let gravity work for you?'),
      ),
      8: Lesson(
        id: 'magnetic_presence_2_8',
        title: 'Rare Attention',
        category: 'magnetic_presence',
        world: 2,
        lesson: 8,
        xp: 75,
        content: LessonContent(
            hook:
                'Florence, 1500s. Michelangelo kept popes waiting. He denied commissions from princes. His rare "yes" was worth more than a hundred other men\'s work. By rationing his attention, he transformed from artisan into untouchable genius. His absence built demand stronger than his presence ever could.',
            concept: [
              'What everyone gets is worthless; what few get is priceless.',
              'Scarcity multiplies interest.',
              'Attention is a throne — give it rarely, and it rules.',
              'The rarest "yes" is remembered longer than countless approvals.'
            ],
            teaching:
                'Humans inflate the value of rarity. If your attention is always available, it cheapens. But when you ration your presence, people fight for it, exaggerate it, and worship it. Scarcity forces imagination to do your work for you.',
            drill: Drill(
                question: 'They text: "Want to hang out?"',
                options: [
                  'Sure, I\'m free anytime.',
                  'Possibly. Thursday\'s the only window.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates scarcity.',
                input: 'Yes, I\'m always around.',
                example: 'One window this week. Make it count.'),
            reflection:
                'Where do you flood your attention until it\'s invisible? How could making it rare transform it into gold?'),
      ),
      9: Lesson(
        id: 'magnetic_presence_2_9',
        title: 'Social Freezing',
        category: 'magnetic_presence',
        world: 2,
        lesson: 9,
        xp: 75,
        content: LessonContent(
            hook:
                'London, 1980s. A courtier jokes out of turn to Queen Elizabeth II. She does not scold. She simply cools. Her smile fades to politeness, her replies shorten, her eyes harden. The offender feels the temperature drop. They crave her warmth again, desperate to repair what they broke. The freeze was punishment enough.',
            concept: [
              'Warmth is addictive; its removal is torture.',
              'Silence punishes deeper than correction.',
              'Withholding warmth bends behavior faster than lectures.',
              'The chill forces craving for heat.'
            ],
            teaching:
                'Humans are wired to chase social warmth. When it vanishes without explanation, the brain panics, replaying the mistake. This discomfort is sharper than argument. Freezing someone out forces them to self-correct to thaw the ice.',
            drill: Drill(
                question: 'They make a crude joke.',
                options: [
                  'Laugh nervously, explain.',
                  'Fall silent. Cold glance. Turn away.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses social freezing.',
                input: 'Don\'t say that.',
                example:
                    'Pause. Neutral look. Continue as if it wasn\'t said.'),
            reflection:
                'Do you waste energy correcting when coldness would punish deeper?'),
      ),
      10: Lesson(
        id: 'magnetic_presence_2_10',
        title: 'Cold Humor',
        category: 'magnetic_presence',
        world: 2,
        lesson: 10,
        xp: 75,
        content: LessonContent(
            hook:
                'Parliament, 1980s. An opponent sneers: "The Right Honourable Lady is heartless." Margaret Thatcher doesn\'t argue. She cuts: "Interesting… someone who\'s never created a job presumes to lecture me on caring for workers." The chamber erupts. He is finished. Cold humor destroyed him more than fury ever could.',
            concept: [
              'Warm humor bonds; cold humor dominates.',
              'Wit is a scalpel — cut with precision.',
              'Ridicule silences faster than logic.',
              'A sharp tongue is sharper than a sword.'
            ],
            teaching:
                'Humans fear humiliation more than pain. Cold humor makes the attacker their own punchline. Unlike warm jokes, it doesn\'t unite — it divides, it wounds, it establishes hierarchy. One cutting line can end an argument forever.',
            drill: Drill(
                question: 'They mock: "You think you\'re so smart."',
                options: [
                  'Laugh it off.',
                  'I don\'t think it. I just notice the contrast.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses cold humor.',
                input: 'Stop making fun of me.',
                example:
                    'I\'d answer, but I don\'t spar beneath my weight class.'),
            reflection:
                'Do you use humor to please, or to rule? Where could a scalpel of wit replace defense with dominance?'),
      ),
    },
    3: {
      11: Lesson(
        id: 'magnetic_presence_3_11',
        title: 'The Freeze-Out',
        category: 'magnetic_presence',
        world: 3,
        lesson: 11,
        xp: 100,
        content: LessonContent(
            hook:
                'Hollywood, 1950s. A studio chief didn\'t scream at actors who betrayed him. He erased them. Their names disappeared from call sheets. Invitations dried up. Rooms fell silent when they entered. Alive, but socially gone. They begged for anger, for a fight, anything but the suffocating void. Nothing is more terrifying than absence.',
            concept: [
              'Conflict feeds connection; absence severs it.',
              'Attention, even negative, is nourishment.',
              'Silence is starvation.',
              'Absence is exile without words.'
            ],
            teaching:
                'People will fight, argue, even accept punishment — as long as it keeps them in your orbit. But when you remove yourself entirely, you deny them the oxygen of recognition. No argument, no closure, no catharsis — just absence. The freeze-out is annihilation disguised as silence.',
            drill: Drill(
                question: 'They betray your trust.',
                options: ['Confront, argue, demand.', 'Remove. Block. Erase.'],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the freeze-out technique.',
                input: 'I\'m done with you.',
                example: 'No response at all — the void speaks louder.'),
            reflection:
                'Do you keep feeding people with attention? Where could absence cut deeper than confrontation?'),
      ),
      12: Lesson(
        id: 'magnetic_presence_3_12',
        title: 'Selective Engagement',
        category: 'magnetic_presence',
        world: 3,
        lesson: 12,
        xp: 100,
        content: LessonContent(
            hook:
                'Silicon Valley, 2000s. A CEO scans ten executives. One receives her full gaze, another a clipped nod, the rest — nothing. The ignored fidget, stumble, overcompensate. Her selective attention rearranges the room\'s hierarchy more brutally than any org chart. Those she anoints rise. Those she withholds from fade.',
            concept: [
              'Attention is a crown. Not all deserve it.',
              'Unequal focus creates invisible ranks.',
              'A glance can knight or exile.',
              'The one who decides who matters becomes the axis of the room.'
            ],
            teaching:
                'Humans crave recognition more than wealth. Selective engagement weaponizes this craving. Equal attention makes you ordinary. But when your focus is rationed — when some bask in it while others are starved — you create a living hierarchy. People stop seeking truth. They seek your gaze.',
            drill: Drill(
                question: 'In a group setting:',
                options: [
                  'Thanks everyone, great input.',
                  'Lock eyes with one: "That\'s sharp. Keep talking."'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses selective engagement.',
                input: 'I value everyone here.',
                example: 'You — stay. The rest, we\'re done.'),
            reflection:
                'Do you spread your attention like crumbs? Or do you crown selectively, forcing others to fight for it?'),
      ),
      13: Lesson(
        id: 'magnetic_presence_3_13',
        title: 'Strategic Mystery',
        category: 'magnetic_presence',
        world: 3,
        lesson: 13,
        xp: 100,
        content: LessonContent(
            hook:
                'Banksy sells art for millions yet walks unseen. No interviews, no face, no story. The less he reveals, the larger he becomes. Critics invent mythologies. Collectors fight for fragments. His invisibility is his aura. Concealment turned a street painter into a legend.',
            concept: [
              'The unknown expands; the known shrinks.',
              'Revealed men are men; concealed men are myths.',
              'Mystery multiplies presence.',
              'The shadow is larger than the figure.'
            ],
            teaching:
                'The human mind cannot resist filling blanks. Conceal one piece, and others will build you palaces of imagination. Reveal everything, and you collapse into the ordinary. Strategic mystery makes you more than human — it makes you legend. The concealed detail haunts longer than the revealed confession.',
            drill: Drill(
                question: 'They press: "Tell me everything about you."',
                options: ['Overshare.', 'Not everything is for today.'],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates strategic mystery.',
                input: 'Here\'s my whole life.',
                example: 'Some chapters aren\'t for every reader.'),
            reflection:
                'Where are you shrinking by revealing too much? What part of yourself should remain legend, not explanation?'),
      ),
      14: Lesson(
        id: 'magnetic_presence_3_14',
        title: 'Cold Command',
        category: 'magnetic_presence',
        world: 3,
        lesson: 14,
        xp: 100,
        content: LessonContent(
            hook:
                'WWII. General George S. Patton never begged men to follow. He didn\'t soften commands with smiles. His words were steel: direct, absolute, final. Soldiers didn\'t love him — but they obeyed him without hesitation. Cold clarity delivered victories where warm persuasion would have bred hesitation.',
            concept: [
              'Authority diluted by affection is no authority at all.',
              'Clarity is colder than charisma — and more feared.',
              'Leaders who need love cannot rule.',
              'Command creates obedience faster than suggestion.'
            ],
            teaching:
                'When leaders crave affection, they erode authority. People obey the one who speaks as if disobedience isn\'t possible. Cold command doesn\'t shout or cajole. It simply states reality so firmly that no other version exists. It is clarity carved into stone.',
            drill: Drill(
                question: 'Your team misses a deadline.',
                options: [
                  'Guys, can we try to focus?',
                  'This is delivered tomorrow. No debate.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses cold command.',
                input: 'Please finish this.',
                example:
                    'By morning, this is finished. Questions only about execution.'),
            reflection:
                'Do you lead to be liked, or to be obeyed? Where could cold clarity replace soft persuasion?'),
      ),
      15: Lesson(
        id: 'magnetic_presence_3_15',
        title: 'The Predator\'s Calm',
        category: 'magnetic_presence',
        world: 3,
        lesson: 15,
        xp: 100,
        content: LessonContent(
            hook:
                'The snow leopard waits. Hours. Days. Still, patient, inevitable. It does not chase frantically. It knows it will strike once, perfectly. Prey sense the calm — not hunger, but destiny. When the leopard finally moves, the hunt ends before it begins. Stillness is more terrifying than rage.',
            concept: [
              'Desperation chases; power waits.',
              'Stillness radiates inevitability.',
              'Calm is louder than frenzy.',
              'The predator\'s silence wins before the strike.'
            ],
            teaching:
                'Humans sense desperation like prey smell fear. The overeager suitor, the frantic salesman — both betray weakness. But the one who waits with calm, who radiates inevitability, terrifies. Calmness signals: I already know I will win. That certainty enslaves others long before the strike.',
            drill: Drill(
                question: 'In negotiation:',
                options: [
                  'Rush, pile on concessions.',
                  'State terms once. Wait. Silence does the rest.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the predator\'s calm.',
                input: 'Please let\'s make this deal today.',
                example: 'This is the deal. Time decides, not me.'),
            reflection:
                'Where do you bleed strength by rushing? What would change if you moved like the predator — inevitable, still, patient?'),
      ),
    },
    4: {
      16: Lesson(
        id: 'magnetic_presence_4_16',
        title: 'The High Throne',
        category: 'magnetic_presence',
        world: 4,
        lesson: 16,
        xp: 125,
        content: LessonContent(
            hook:
                'Versailles, 1685. Louis XIV rises with the dawn. Courtiers line up for hours just to watch him put on his shoes. They fight for the honor of pouring his wine. His true power wasn\'t the rituals, but the belief that he was untouchable. He acted as if majesty itself flowed through him — and others enforced that belief on his behalf.',
            concept: [
              'Majesty is belief enforced by others.',
              'When you sit high, others kneel low.',
              'Distance creates divinity.',
              'Conviction crowns itself.'
            ],
            teaching:
                'People accept whatever reality you embody consistently. If you act as if your time, your presence, your space is sacred — others will enforce that sacredness for you. The High Throne isn\'t built of gold. It is built of unbreakable conviction.',
            drill: Drill(
                question: 'They treat you casually.',
                options: [
                  'Laugh along, lower yourself.',
                  'Calmly: "Let\'s keep this professional."'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that commands the high throne.',
                input: 'Don\'t disrespect me.',
                example:
                    'My time is reserved for those who respect it. Are you one of them?'),
            reflection:
                'Where do you let others treat you as ordinary? What would change if you sat on your own throne?'),
      ),
      17: Lesson(
        id: 'magnetic_presence_4_17',
        title: 'Silent Punishment',
        category: 'magnetic_presence',
        world: 4,
        lesson: 17,
        xp: 125,
        content: LessonContent(
            hook:
                'Tokyo, 1980s. An employee disrupts harmony. He isn\'t scolded. He isn\'t fired. He is ignored. Conversations close when he enters. Invitations evaporate. The silence gnaws until he begs for inclusion. The absence hurts worse than public humiliation. He punishes himself — trying to claw his way back into warmth.',
            concept: [
              'Words can be resisted. Silence cannot.',
              'Exile is sharper than explanation.',
              'The freeze makes them discipline themselves.',
              'Absence is judgment no defense can fight.'
            ],
            teaching:
                'A lecture invites argument. Silence gives none. When warmth disappears, the brain spirals endlessly, replaying what went wrong. The ignored become their own jailers, punishing themselves harder than you ever could. Silent Punishment is power without risk.',
            drill: Drill(
                question: 'They interrupt you.',
                options: [
                  'Stop cutting me off.',
                  'Withhold warmth. Short answers. Look elsewhere.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses silent punishment.',
                input: 'Don\'t do that.',
                example: 'Silence. Neutral stare. Return to your point.'),
            reflection:
                'Where do you explain when silence would wound deeper?'),
      ),
      18: Lesson(
        id: 'magnetic_presence_4_18',
        title: 'Indifference to Praise & Insult',
        category: 'magnetic_presence',
        world: 4,
        lesson: 18,
        xp: 125,
        content: LessonContent(
            hook:
                'Rome, 161 AD. Marcus Aurelius receives news of victory and harsh criticism on the same day. He reacts to both identically: calm acknowledgment, then back to his journal. His advisors are baffled. Shouldn\'t he celebrate? Shouldn\'t he rage? But Marcus had transcended. Neither flattery nor insult could touch him. That indifference was his armor.',
            concept: [
              'Praise and insult are chains of the same metal.',
              'He who reacts is ruled.',
              'Emotional independence is the final shield.',
              'Indifference is invincibility.'
            ],
            teaching:
                'Most people are puppets pulled by words. Compliments inflate them, insults deflate them. But the one who treats both as irrelevant terrifies — because they cannot be bribed, baited, or broken. Indifference severs every string.',
            drill: Drill(
                question: 'They praise, then insult.',
                options: [
                  'Glow at praise, bristle at insult.',
                  'Same calm tone → "Thank you for sharing."'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that shows indifference.',
                input: 'That means a lot! / That\'s unfair!',
                example: 'Your words say more about you than about me.'),
            reflection:
                'Do you still dance for praise or flinch at insult? What would change if both became meaningless noise?'),
      ),
      19: Lesson(
        id: 'magnetic_presence_4_19',
        title: 'Calculated Precision',
        category: 'magnetic_presence',
        world: 4,
        lesson: 19,
        xp: 125,
        content: LessonContent(
            hook:
                'Versailles, 1670s. A courtier betrays Madame de Maintenon. At the next gathering, she remarks, "How curious that some mistake private conversations for public entertainment." She names no one, but everyone knows. His reputation shatters. Her response was surgical: calm, precise, impossible to accuse.',
            concept: [
              'Hot revenge exposes weakness; calm precision terrifies.',
              'Precision is more feared than rage.',
              'Damage that looks rational cannot be punished.',
              'The scalpel cuts deeper than the axe.'
            ],
            teaching:
                'People expect rage. They brace for shouting. But calm consequences, dressed as reason, cut deeper. The target cannot protest without exposing themselves. Precision wounds reputation, not just feelings. It is judgment disguised as fairness.',
            drill: Drill(
                question: 'They betray you.',
                options: [
                  'Explode with rage.',
                  'Coolly: "Trust is rarer than gold. Some spend it too cheaply."'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses calculated precision.',
                input: 'How dare you do this to me!',
                example:
                    'I should\'ve known you\'d trade loyalty for attention.'),
            reflection:
                'Do you punish with emotion, or with precision? Where could subtle consequence cut sharper than fury?'),
      ),
      20: Lesson(
        id: 'magnetic_presence_4_20',
        title: 'Cold Majesty',
        category: 'magnetic_presence',
        world: 4,
        lesson: 20,
        xp: 125,
        content: LessonContent(
            hook:
                'Mountains do not argue with storms. They remain, immovable. The rare person who reaches Cold Majesty is the same: they do not punish, they do not chase, they do not explain. Their presence alone bends the room. People defer without knowing why. Majesty is not acted — it radiates.',
            concept: [
              'True power is effortless.',
              'Majesty is gravity, not motion.',
              'The highest throne requires no defense.',
              'Final dominance is not forced — it is accepted as law.'
            ],
            teaching:
                'At the final stage, presence stops being strategy. It becomes aura. Others lower their voices, adjust their behavior, offer respect without you lifting a finger. This is Cold Majesty: influence so natural it feels like physics. A mountain does not move. It makes others move around it.',
            drill: Drill(
                question: 'You enter a hostile room.',
                options: [
                  'Argue, prove yourself.',
                  'Sit calm, silent. Speak once. The room bends.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that commands cold majesty.',
                input: 'Please respect me.',
                example: 'Respect is not requested. It happens.'),
            reflection:
                'What would it feel like to carry yourself as inevitable? How would people orbit you differently if your presence alone was law?'),
      ),
    },
  },
  'conversation_frames': {
    1: {
      1: Lesson(
        id: 'conversation_frames_1_1',
        title: 'The Frame is Reality',
        category: 'conversation_frames',
        world: 1,
        lesson: 1,
        xp: 50,
        content: LessonContent(
            hook:
                'Nuremberg Trials, 1946. Hermann Göring is accused of murder. The prosecutor calls him a criminal. Göring leans back: "Criminal? I was defending my nation. History is written by interpreters." For a moment, the room tilts. He is no longer defendant — he is narrator. Reality bent because he seized the frame.',
            concept: [
              'Reality is not fact — it\'s interpretation.',
              'Whoever defines the frame, defines the truth.',
              'Accepting their frame is defeat before the fight.',
              'A frame is the invisible lens through which words are judged.'
            ],
            teaching:
                'A frame is the invisible lens through which words are judged. If they call you "late," the frame is irresponsibility. If you reframe it as "I value depth over clocks," the same fact becomes power. People don\'t fight events; they fight meanings. See the frame — and redraw it.',
            drill: Drill(
                question: 'They say: "You\'re being difficult."',
                options: [
                  'No, I\'m not.',
                  'I\'m being thorough. Excellence always feels difficult to the impatient.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that reframes the situation.',
                input: 'You\'re always late.',
                example:
                    'No — I arrive exactly when the conversation becomes worth having.'),
            reflection:
                'When did you last defend yourself inside someone else\'s story? How would life shift if you always rewrote the script instead?'),
      ),
      2: Lesson(
        id: 'conversation_frames_1_2',
        title: 'Wit Jujitsu (Flipping Insults)',
        category: 'conversation_frames',
        world: 1,
        lesson: 2,
        xp: 50,
        content: LessonContent(
            hook:
                'Parliament, 1946. Churchill is told: "You\'re drunk!" He raises his glass: "And you, madam, are ugly. But I shall be sober in the morning." The chamber erupts. The insult evaporates. He didn\'t defend — he inverted.',
            concept: [
              'Insults are traps: defense keeps you inside them.',
              'Wit is jujitsu: their momentum becomes your strike.',
              'The crowd remembers the laugh, not the attack.',
              'To deny is to kneel. To reframe is to rise.'
            ],
            teaching:
                'To deny is to kneel. To reframe is to rise. A sharp line — humorous, ironic, absurd — destroys the sting and flips attention. The master never absorbs an insult; he redirects it into spectacle.',
            drill: Drill(
                question: 'They sneer: "You think you\'re clever."',
                options: [
                  'No, I don\'t.',
                  'Thank you. I was worried it wasn\'t obvious.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses wit jujitsu.',
                input: 'You\'re arrogant.',
                example: 'Confidently accurate. Easy to confuse the two.'),
            reflection:
                'Do you collapse into defense when mocked — or do you turn mockery into the stage for your dominance?'),
      ),
      3: Lesson(
        id: 'conversation_frames_1_3',
        title: 'The Higher Ground',
        category: 'conversation_frames',
        world: 1,
        lesson: 3,
        xp: 50,
        content: LessonContent(
            hook:
                'Versailles, 1783. Marie Antoinette is accused of draining France with her spending. She smiles serenely: "I don\'t waste — I remind the nation of its glory. Perhaps the true poverty lies not in my feasts, but in your failure to inspire celebration." She doesn\'t grovel — she ascends. The accusers shrink.',
            concept: [
              'Fight in the mud and you\'re muddy, even if you win.',
              'The higher ground makes critics look small.',
              'Superiority is quiet, not loud.',
              'Status is perception. Engaging petty attacks validates them.'
            ],
            teaching:
                'Status is perception. Engaging petty attacks validates them. Rising above — framing yourself as above the squabble — turns attackers into beggars. The higher ground is calm disdain dressed as elegance.',
            drill: Drill(
                question: 'They accuse: "You\'re selfish."',
                options: [
                  'No, I\'m not!',
                  'If refusing gossip makes me selfish, I\'ll carry that crown.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that takes the higher ground.',
                input: 'You\'re petty.',
                example: 'Petty is fighting this. I prefer the higher ground.'),
            reflection:
                'Where do you let small conflicts drag you down? What would it feel like to make others climb to reach you instead?'),
      ),
      4: Lesson(
        id: 'conversation_frames_1_4',
        title: 'Humor as Armor',
        category: 'conversation_frames',
        world: 1,
        lesson: 4,
        xp: 50,
        content: LessonContent(
            hook:
                'Tonight Show, 1962. Johnny Carson bombs a joke. The crowd freezes. He grins: "Well, that went over like a pregnant pole-vaulter." The room explodes. Failure turns to legend. Humor became armor.',
            concept: [
              'Self-deprecation steals enemies\' weapons.',
              'The joker is untouchable — flaws become punchlines.',
              'Humor reframes weakness as charisma.',
              'Laughter makes people forgive, trust, and admire.'
            ],
            teaching:
                'Laughter makes people forgive, trust, and admire. The moment you laugh at yourself, you become invincible — because no one can wound what you already claimed. Humor is the most elegant shield.',
            drill: Drill(
                question: 'They say: "You never take anything seriously!"',
                options: [
                  'Yes, I do.',
                  'Correct. I\'ve been practicing for my clown audition all week.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses humor as armor.',
                input: 'You\'re weird.',
                example:
                    'Thank you. It takes effort to stand out in a world obsessed with blending in.'),
            reflection:
                'When do you armor yourself with defensiveness instead of laughter? How could humor turn pressure into magnetism?'),
      ),
      5: Lesson(
        id: 'conversation_frames_1_5',
        title: 'Silence as a Weapon',
        category: 'conversation_frames',
        world: 1,
        lesson: 5,
        xp: 50,
        content: LessonContent(
            hook:
                'Senate Hearings, 1954. McCarthy hurls accusations. The witness says nothing. Ten seconds. Thirty. The silence grows unbearable. McCarthy stumbles, voice cracks, rage looks desperate. Finally, the witness whispers: "Are you finished?" Silence destroyed him more than argument ever could.',
            concept: [
              'Silence is not absence — it\'s dominance.',
              'The one who holds silence controls rhythm.',
              'Words fill space; silence makes others drown in it.',
              'Most people fear silence. They rush to fill it, exposing their nerves.'
            ],
            teaching:
                'Most people fear silence. They rush to fill it, exposing their nerves. But if you master silence, you radiate unshakable authority. Every pause adds gravity to your words. Silence is the heaviest sound in any room.',
            drill: Drill(
                question: 'They demand: "Explain yourself now!"',
                options: [
                  'I can explain—',
                  '[5-second pause. Calm gaze.] "When you\'re ready to listen, I\'ll speak."'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses silence as a weapon.',
                input: 'You don\'t care.',
                example: '[Steady pause.] "Done?"'),
            reflection:
                'Do you rush to fill gaps with nervous words — or do you let silence and calmness destroy them instead?'),
      ),
    },
    2: {
      6: Lesson(
        id: 'conversation_frames_2_6',
        title: 'The Reframe Blade (Turning Attacks Into Assets)',
        category: 'conversation_frames',
        world: 2,
        lesson: 6,
        xp: 75,
        content: LessonContent(
            hook:
                'Apple Town Hall, 1997. A heckler shouts: "You don\'t know what you\'re talking about!" The room stiffens. Steve Jobs smiles: "You\'re right. I don\'t know everything. But I know users don\'t care about code — they care about experience. That\'s why this matters." The crowd erupts. Weakness became vision.',
            concept: [
              'Attacks are traps. Reframe and they collapse.',
              'Weakness + spin = strength.',
              'Never deny. Redefine.',
              'Every insult is an attempt to force you inside their frame.'
            ],
            teaching:
                'Every insult is an attempt to force you inside their frame. If you defend, you\'re already beaten. But if you reframe, you don\'t fight — you shift meaning until the blade they threw becomes your sword.',
            drill: Drill(
                question: 'They sneer: "You\'ve got no experience."',
                options: [
                  'I do, actually—',
                  'Exactly. No baggage. Fresh eyes see what stale ones miss.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the reframe blade.',
                input: 'You\'re too young.',
                example:
                    'Youth is an advantage — you haven\'t realized how expensive energy is yet.'),
            reflection:
                'Do you defend against attacks? Or do you bend them until they crown you instead?'),
      ),
      7: Lesson(
        id: 'conversation_frames_2_7',
        title: 'The Authority Frame (Commanding Respect Without Asking)',
        category: 'conversation_frames',
        world: 2,
        lesson: 7,
        xp: 75,
        content: LessonContent(
            hook:
                'Boston hospital, 1970s. A young female doctor is dismissed by senior surgeons. She cuts them off: "While you debate me, a patient in room 3 is bleeding out. We can save him — or we can argue. Choose." Authority wasn\'t granted — it was seized.',
            concept: [
              'Authority isn\'t requested — it\'s assumed.',
              'Respect follows certainty, not explanations.',
              'Speak like the crown is already on your head.',
              'People hesitate, explain, seek permission. Masters don\'t.'
            ],
            teaching:
                'People hesitate, explain, seek permission. Masters don\'t. They project certainty, define urgency, act as if respect is a fact. Authority is gravity — others fall into orbit automatically.',
            drill: Drill(
                question: 'They ask: "Why should we listen to you?"',
                options: [
                  'Because I studied this…',
                  'Because while you\'re asking, I\'m already solving.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the authority frame.',
                input: 'Maybe we could try this?',
                example: 'We\'re doing this. The old way failed. Let\'s move.'),
            reflection:
                'Do you wait for crowns to be placed — or do you wear them before anyone dares object?'),
      ),
      8: Lesson(
        id: 'conversation_frames_2_8',
        title: 'The Status Trap Detector (Spotting Hidden Power Games)',
        category: 'conversation_frames',
        world: 2,
        lesson: 8,
        xp: 75,
        content: LessonContent(
            hook:
                'Hollywood, 1960s. A producer tests Clint Eastwood: arrives 20 minutes late, takes calls mid-meeting, moves him to a worse chair. Each is a trap: will he submit? Eastwood stands: "When you\'re ready for a real conversation, you know where to find me." He leaves. Minutes later, the producer chases him down. Clint won by refusing the game.',
            concept: [
              'Status traps = subtle dominance tests.',
              'Lateness, interruptions, "jokes that sting."',
              'Recognize → refuse → reset.',
              'Most lose because they don\'t see the game.'
            ],
            teaching:
                'Most lose because they don\'t see the game. They explain, they appease, they laugh nervously. But once you spot the trap, calm refusal flips the script. The test reveals you, not them.',
            drill: Drill(
                question: 'They keep you waiting 20 minutes.',
                options: [
                  'It\'s fine.',
                  'Let\'s reschedule when you\'re ready for full focus.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses status trap detection.',
                input: 'Relax, I was just joking.',
                example:
                    'If that was a joke, the punchline still hasn\'t landed.'),
            reflection:
                'What hidden traps have you been failing? How would life change if you spotted and neutralized every test?'),
      ),
      9: Lesson(
        id: 'conversation_frames_2_9',
        title: 'Agree & Amplify (Absurdity as Defense)',
        category: 'conversation_frames',
        world: 2,
        lesson: 9,
        xp: 75,
        content: LessonContent(
            hook:
                'Late Night TV, 1980s. A guest sneers: "Letterman, you\'re weird and unprofessional." Letterman beams: "Weird? Oh, you haven\'t seen me play xylophone with my teeth during commercial breaks." The crowd howls. The attack disintegrates.',
            concept: [
              'Arguing validates.',
              'Agree + exaggerate = ridicule.',
              'Absurdity flips venom into comedy.',
              'The fastest way to kill hostility is laughter.'
            ],
            teaching:
                'The fastest way to kill hostility is laughter. By amplifying their insult into absurdity, you don\'t just survive — you entertain. The attacker looks petty. You look untouchable.',
            drill: Drill(
                question: 'They snarl: "You\'re too sensitive."',
                options: [
                  'No, I\'m not!',
                  'Sensitive? I cry during dog food commercials. It\'s exhausting.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses agree & amplify.',
                input: 'You\'re lazy.',
                example:
                    'Correct. I\'m auditioning for world champion napper. Almost at gold medal level.'),
            reflection:
                'Do you waste energy defending — or do you turn attacks into comedy so sharp the attacker becomes your clown?'),
      ),
      10: Lesson(
        id: 'conversation_frames_2_10',
        title: 'The Frame Breaker (Resetting the Game)',
        category: 'conversation_frames',
        world: 2,
        lesson: 10,
        xp: 75,
        content: LessonContent(
            hook:
                'UN, 1962. Soviet ambassador floods the chamber with rhetoric. Stevenson slams the table: "Do you deny placing missiles in Cuba? Yes or no. Don\'t wait for translation." The room freezes. Rhetoric dies. Frame broken.',
            concept: [
              'When trapped, break the script.',
              'New rules = new reality.',
              'The boldest power move isn\'t arguing harder — it\'s changing the game.',
              'Frames trap you in endless loops.'
            ],
            teaching:
                'Frames trap you in endless loops. Break them by stepping outside: ask meta-questions, force clarity, reset stakes. You move from player to referee. Everyone must follow.',
            drill: Drill(
                question: 'They blame endlessly.',
                options: [
                  'It wasn\'t my fault.',
                  'Pause. Do we want to solve this, or keep trading blame?'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the frame breaker.',
                input: 'Why are you so defensive?',
                example:
                    'Better question — are we here to attack or to understand?'),
            reflection:
                'Where are you trapped in someone else\'s script? What single question could slice it in half?'),
      ),
    },
    3: {
      11: Lesson(
        id: 'conversation_frames_3_11',
        title: 'Irony & Mockery (Twin Blades of Disarmament)',
        category: 'conversation_frames',
        world: 3,
        lesson: 11,
        xp: 100,
        content: LessonContent(
            hook:
                'Roman Senate, 63 BC. Cicero faces Catiline, accused of treason. Instead of a direct attack, Cicero smiles: "O most loyal Catiline, how fortunate Rome is that you grace us today — plotting by night, pretending patriot by day." The senators laugh. Catiline burns. He is destroyed not by facts, but by irony that cuts deeper than insults.',
            concept: [
              'Mockery humiliates publicly.',
              'Irony corrodes privately.',
              'The master knows which blade to draw.',
              'Mockery wins the crowd; irony kills from the inside.'
            ],
            teaching:
                'Mockery wins the crowd; irony kills from the inside. Mockery makes them look foolish; irony makes them feel foolish. Use mockery for spectacle, irony for scars.',
            drill: Drill(
                question: 'They brag: "Everyone listens to me."',
                options: [
                  'Not really.',
                  'Celebrity in the room! / Amazing how much you admire yourself.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses irony & mockery.',
                input: 'You\'re obsessed with yourself.',
                example: 'And yet you\'re studying me like scripture.'),
            reflection:
                'Do you settle for cheap mockery — or do you carve with irony that leaves echoes?'),
      ),
      12: Lesson(
        id: 'conversation_frames_3_12',
        title: 'The Unreactive Shield (Never Taking the Bait)',
        category: 'conversation_frames',
        world: 3,
        lesson: 12,
        xp: 100,
        content: LessonContent(
            hook:
                'Wimbledon, 1980. McEnroe rages, smashes rackets, screams. Björn Borg stands still, calm as stone. The crowd turns — McEnroe looks childish, Borg godlike. Borg wins not just the match, but the aura.',
            concept: [
              'Provocation is bait. Reaction is the bite.',
              'Stillness reframes chaos as weakness.',
              'The louder they shout, the smaller they look.',
              'Every outburst is an invitation into their frame.'
            ],
            teaching:
                'Every outburst is an invitation into their frame. If you react, you lose. If you stay unshaken, their energy boomerangs back. Calm is terrifying because it cannot be moved.',
            drill: Drill(
                question: 'They scream: "You\'re pathetic!"',
                options: ['No, I\'m not!', '[Pause. Calm smile.] "Finished?"'],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the unreactive shield.',
                input: 'You\'re full of yourself.',
                example: 'Strange… yet you\'re fuller of me than I am.'),
            reflection:
                'Do you bite when provoked — or can you let silence and calmness destroy them instead?'),
      ),
      13: Lesson(
        id: 'conversation_frames_3_13',
        title: 'The Reality Flip (Hunter Becomes Hunted)',
        category: 'conversation_frames',
        world: 3,
        lesson: 13,
        xp: 100,
        content: LessonContent(
            hook:
                'Oxford, 1940. A journalist presses Churchill: "Aren\'t you terrified of Hitler invading?" Churchill exhales his cigar: "I pity Hitler. He is about to learn what it means to wake a lion." The frame flips — England isn\'t fearful, Hitler is doomed.',
            concept: [
              'Attacks are lenses. Flip the lens, own the view.',
              'The accuser becomes the accused.',
              'Reality bends to the boldest definition.',
              'Accusations trap you in their reality.'
            ],
            teaching:
                'Accusations trap you in their reality. By flipping — asking why they need that story, or redefining terms — you turn the spotlight back. The hunter becomes prey.',
            drill: Drill(
                question: 'They say: "You overreact to everything."',
                options: [
                  'No, I don\'t!',
                  'Interesting how much my reactions control you. Why does it unsettle you so?'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the reality flip.',
                input: 'You\'re insecure.',
                example: 'And yet you keep pointing it out… curious.'),
            reflection:
                'Whose frames are you still trapped in? When was the last time you flipped the lens instead of defending?'),
      ),
      14: Lesson(
        id: 'conversation_frames_3_14',
        title: 'Escalating Control (Stacking Frames)',
        category: 'conversation_frames',
        world: 3,
        lesson: 14,
        xp: 100,
        content: LessonContent(
            hook:
                'Chicago, 1925. Clarence Darrow defends a man accused of murder. He doesn\'t just argue the case. He stacks frames: Frame 1: "This boy is no monster." Frame 2: "The greater monster is poverty." Frame 3: "And the true verdict is about America itself." The jury isn\'t deciding one life — they\'re deciding their nation\'s soul.',
            concept: [
              'Petty frames = petty outcomes.',
              'Stacked frames = cosmic stakes.',
              'The higher the frame, the heavier the gravity.',
              'Small fights trap you. Escalation reframes them into higher ground.'
            ],
            teaching:
                'Small fights trap you. Escalation reframes them into higher ground. The quarrel becomes a principle. The insult becomes a social mirror. When you raise the altitude, everyone else looks small.',
            drill: Drill(
                question: 'They snap: "You were late!"',
                options: [
                  'Traffic was bad.',
                  'Late is one thing. Wasting our time together is worse. Let\'s not waste more now.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses escalating control.',
                input: 'You\'re not serious.',
                example: 'I\'m serious enough to challenge mediocrity.'),
            reflection:
                'Do you let yourself fight small battles — or do you stack frames until the argument becomes history itself?'),
      ),
      15: Lesson(
        id: 'conversation_frames_3_15',
        title: 'Anchoring Reality (Locking the Frame)',
        category: 'conversation_frames',
        world: 3,
        lesson: 15,
        xp: 100,
        content: LessonContent(
            hook:
                'New York, 1980s. A tycoon enters a lease negotiation: "I could buy the whole block." Hours later, he "settles" for one floor. The landlord feels relief. The anchor worked — the modest ask now feels generous.',
            concept: [
              'First impression = anchor.',
              'Anchor sets gravity.',
              'Everything after feels small compared to the anchor.',
              'Humans judge value by comparison, not truth.'
            ],
            teaching:
                'Humans judge value by comparison, not truth. If you set the first number, tone, or standard, everything else is pulled into orbit. Anchoring reality is locking reality.',
            drill: Drill(
                question: 'They ask: "Stay an hour late?"',
                options: [
                  'Sure.',
                  'I might need you all evening. But one hour will do.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses anchoring reality.',
                input: 'Can we lower the price?',
                example: 'Of course — we can adjust from \$10,000.'),
            reflection:
                'Do you let others set the first number, or do you drop anchors so heavy the world bends around them?'),
      ),
    },
    4: {
      16: Lesson(
        id: 'conversation_frames_4_16',
        title: 'The Celebrity Frame (Owning Attention)',
        category: 'conversation_frames',
        world: 4,
        lesson: 16,
        xp: 150,
        content: LessonContent(
            hook:
                'Hollywood, 1955. James Dean strolls into a diner. He doesn\'t speak, doesn\'t even order food. Yet every head turns. The waitress pours coffee like serving royalty. He isn\'t famous yet — but he carries himself like the room already belongs to him. Within months, the world agrees.',
            concept: [
              'Attention isn\'t begged for — it\'s assumed.',
              'Confidence creates gravity.',
              'People orbit certainty like planets around suns.',
              'Humans follow status cues.'
            ],
            teaching:
                'Humans follow status cues. If you carry yourself like the main character, the world unconsciously writes you into that role. The celebrity frame isn\'t arrogance — it\'s relaxed inevitability.',
            drill: Drill(
                question: 'They say: "Who do you think you are?"',
                options: [
                  'Sorry, I didn\'t mean—',
                  'Strange… the same question I was going to ask you.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the celebrity frame.',
                input: 'Can I join this group?',
                example:
                    'Looks like you all needed someone interesting to show up.'),
            reflection:
                'Do you wait for permission — or do you walk in like the story already centers on you?'),
      ),
      17: Lesson(
        id: 'conversation_frames_4_17',
        title: 'The Meaning Flip (Gaslight Frame)',
        category: 'conversation_frames',
        world: 4,
        lesson: 17,
        xp: 150,
        content: LessonContent(
            hook:
                'Boardroom, 1990s. A CEO accused: "You\'re cutting corners." He smiles: "Interesting you call efficiency by another name. Some people fear progress." The room laughs. The accusation is still technically true — but now it feels like praise.',
            concept: [
              'Facts don\'t matter — meaning does.',
              'Accusation reframed becomes compliment.',
              'Reality is interpretation, not evidence.',
              'Humans don\'t react to events, only meanings.'
            ],
            teaching:
                'Humans don\'t react to events, only meanings. Redefine the meaning, and the attack collapses. You didn\'t "fail" — you "experimented." You weren\'t "selfish" — you "valued focus." The world bends to interpreters, not observers.',
            drill: Drill(
                question: 'They say: "You\'re stubborn."',
                options: [
                  'I\'m not.',
                  'Consistency is rare these days. Guilty as charged.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the meaning flip.',
                input: 'You forgot me.',
                example: 'I gave you space — I respect independence.'),
            reflection:
                'Do you let others define meaning — or do you own the dictionary every time you speak?'),
      ),
      18: Lesson(
        id: 'conversation_frames_4_18',
        title: 'The Group Frame (Commanding the Many)',
        category: 'conversation_frames',
        world: 4,
        lesson: 18,
        xp: 150,
        content: LessonContent(
            hook:
                'Apple, 2007. Steve Jobs doesn\'t present specs. He says: "Today Apple reinvents the phone." Suddenly, this isn\'t a product demo — it\'s a historical event. By defining what the moment means, Jobs controls not individuals, but the entire room.',
            concept: [
              'Individuals argue. Crowds unite.',
              'Whoever defines the group story rules the group.',
              'Collective frames crush private doubts.',
              'In groups, people surrender private skepticism to collective story.'
            ],
            teaching:
                'In groups, people surrender private skepticism to collective story. If you set the group\'s meaning — "This isn\'t a debate, it\'s a turning point" — you dissolve opposition before it speaks.',
            drill: Drill(
                question: 'The team complains: "We\'re arguing too much."',
                options: [
                  'Let\'s calm down.',
                  'This tension proves we care. That\'s why we\'ll win.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the group frame.',
                input: 'This meeting is a waste of time.',
                example: 'Then let\'s make it the meeting everyone remembers.'),
            reflection:
                'Do you get lost in group chaos — or seize the pen that writes what the group is really doing?'),
      ),
      19: Lesson(
        id: 'conversation_frames_4_19',
        title: 'The Debate Duel (Choosing the Arena)',
        category: 'conversation_frames',
        world: 4,
        lesson: 19,
        xp: 175,
        content: LessonContent(
            hook:
                'Oxford Union, 1965. A rival floods the floor with data. William F. Buckley smiles: "The real question isn\'t numbers. It\'s freedom. Do you believe in liberty — or in control?" Instantly the audience shifts. His opponent keeps arguing facts — but the duel has moved. Now it\'s identity, not data. And Buckley already won.',
            concept: [
              'The first rule of combat: pick the battlefield.',
              'Whoever defines the arena defines victory.',
              'Identity frames beat evidence every time.',
              'Arguments inside their frame are unwinnable.'
            ],
            teaching:
                'Arguments inside their frame are unwinnable. Shift the frame: move the duel to values, to identity, to higher ground. Their facts drown when the river itself belongs to you.',
            drill: Drill(
                question: 'They say: "Your plan costs too much."',
                options: [
                  'Here are the numbers.',
                  'The bigger cost is doing nothing. Stagnation bankrupts faster.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the debate duel.',
                input: 'Your idea won\'t work.',
                example:
                    'Depends if you define \'work\' as repeating the past, or as progress.'),
            reflection:
                'Do you fight inside their arena — or do you choose your own and drag them onto your field?'),
      ),
      20: Lesson(
        id: 'conversation_frames_4_20',
        title: 'Frame Immunity (Becoming Untouchable)',
        category: 'conversation_frames',
        world: 4,
        lesson: 20,
        xp: 200,
        content: LessonContent(
            hook:
                'India, 1930. Gandhi faces British soldiers who shove, mock, even strike him. He doesn\'t flinch. He doesn\'t argue. He just walks. Reporters capture the scene. Soldiers look savage; Gandhi looks immortal. He is untouchable — not because he won the fight, but because no attack could define him.',
            concept: [
              'The final mastery is not fighting frames — it\'s dissolving them.',
              'No insult, no attack, no lie can stick.',
              'The one who cannot be framed becomes myth.',
              'Every attack needs fuel.'
            ],
            teaching:
                'Every attack needs fuel. If you argue, resist, or even mock, you keep it alive. If you\'re immune — if nothing defines you but yourself — the attacker collapses under their own noise. Frame immunity is the inner fortress.',
            drill: Drill(
                question: 'They shout: "Everyone thinks you\'re a joke!"',
                options: [
                  'No, they don\'t!',
                  '[Calm smile.] "And yet, here you are repeating me."'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that shows frame immunity.',
                input: 'You\'re pathetic.',
                example: 'Strange how invested you are in me.'),
            reflection:
                'Do you scramble to fight every attack — or have you built the unshakable center no frame can pierce?'),
      ),
    },
  },
  'scarcity_desire': {
    1: {
      1: Lesson(
        id: 'scarcity_desire_1_1',
        title: 'The Power of Absence',
        category: 'scarcity_desire',
        world: 1,
        lesson: 1,
        xp: 50,
        content: LessonContent(
            hook:
                'Versailles, 1682. Nobles rise at dawn just to wait outside Louis XIV\'s door. Hours pass. When the King finally appears, he may give a glance, a nod, or nothing at all. That second of attention becomes priceless. His absence ruled harder than his presence ever could.',
            concept: [
              'Presence satisfies; absence enslaves.',
              'What is rare rules the mind.',
              'Silence burns louder than noise.',
              'A glimpse is worth more than constant sight.'
            ],
            teaching:
                'The brain cannot stop circling around what is missing. Constant presence dulls desire. But when you withdraw, you create a vacuum — one they fill with memory, fantasy, and hunger. Scarcity isn\'t distance; it\'s magnetism through absence.',
            drill: Drill(
                question: 'They ask: "Why didn\'t you text me back?"',
                options: [
                  'Sorry, I was busy.',
                  'Sometimes I like to leave room for you to miss me.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates scarcity through absence.',
                input: 'I\'m always around.',
                example: 'I come and go.'),
            reflection:
                'Where are you flooding people with too much of yourself? What hunger could you create if you let absence speak for you?'),
      ),
      2: Lesson(
        id: 'scarcity_desire_1_2',
        title: 'The Hourglass of Anticipation',
        category: 'scarcity_desire',
        world: 1,
        lesson: 2,
        xp: 50,
        content: LessonContent(
            hook:
                'San Francisco, 2007. Steve Jobs paces the stage. He shows an iPod. A phone. An internet device. The crowd frowns. Then he repeats it — three times. The pause stretches. Then he smiles: "These are not three devices. They are one." He pulls out the iPhone. History changes. The wait made it divine.',
            concept: [
              'Delay multiplies desire.',
              'What comes too fast is consumed and forgotten.',
              'The pause sharpens appetite.',
              'Time is seasoning.'
            ],
            teaching:
                'Dopamine isn\'t released at the moment of reward, but during anticipation of it. Draw out the reveal. Stretch the silence. Desire grows in the waiting more than the having.',
            drill: Drill(
                question: 'They demand: "Tell me now!"',
                options: [
                  'Spill it instantly.',
                  'Smile. "Patience makes it unforgettable."'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates anticipation.',
                input: 'I like you.',
                example: 'You\'ll know soon.'),
            reflection:
                'Do you rush to satisfy — or do you let hunger grow until your presence feels like a feast?'),
      ),
      3: Lesson(
        id: 'scarcity_desire_1_3',
        title: 'Push & Pull Tension',
        category: 'scarcity_desire',
        world: 1,
        lesson: 3,
        xp: 50,
        content: LessonContent(
            hook:
                'Hollywood, 1955. James Dean leans in close, whispering until she feels like the only woman alive. Then, mid-sentence, he turns, lights a cigarette, and drifts away. She chases, desperate to close the gap. The fire was never constant — it was rhythm, pull then push, warmth then frost.',
            concept: [
              'Contrast creates craving.',
              'Heat without cold numbs; cold without heat kills.',
              'The dance between approach and retreat is the hook.',
              'Predictability is the enemy of desire.'
            ],
            teaching:
                'Addiction is born not from steady supply, but unpredictable rhythm. Push–pull keeps them off balance, always chasing the next spark.',
            drill: Drill(
                question: 'They say: "You\'re confusing."',
                options: [
                  'Sorry, I\'ll explain better.',
                  '[Half-smile] "Confusion is curiosity in disguise."'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates push & pull tension.',
                input: 'I missed you.',
                example: 'I wasn\'t sure I\'d miss you.'),
            reflection:
                'Are you predictable comfort — or are you the storm that keeps them guessing, addicted to your rhythm?'),
      ),
      4: Lesson(
        id: 'scarcity_desire_1_4',
        title: 'The Rare Gift',
        category: 'scarcity_desire',
        world: 1,
        lesson: 4,
        xp: 50,
        content: LessonContent(
            hook:
                'New York, 1961. Tiffany\'s display window: three jewels in a vast sea of empty space. Crowds stop, breathless. Not because of what\'s shown, but because of what\'s withheld. The rarity made them sacred.',
            concept: [
              'Commonness kills value.',
              'Space frames worth.',
              'The rare becomes ritual.',
              'Too much access makes you cheap.'
            ],
            teaching:
                'Your time, attention, and energy are the rarest currency. Spend them everywhere, and they depreciate. Withhold them, and they inflate. Scarcity turns you from background noise into a crown jewel.',
            drill: Drill(
                question: 'They ask: "When are you free?"',
                options: [
                  'Anytime.',
                  'One night next week. Maybe. Make it worth it.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates rarity.',
                input: 'I\'m available.',
                example: 'I\'ll see.'),
            reflection:
                'Do people treat you like spare change — or like treasure they must fight to earn?'),
      ),
      5: Lesson(
        id: 'scarcity_desire_1_5',
        title: 'The Longing Withdrawal',
        category: 'scarcity_desire',
        world: 1,
        lesson: 5,
        xp: 50,
        content: LessonContent(
            hook:
                'Paris, 1920s. Coco Chanel never cut ties with drama. She withdrew piece by piece. A missing letter. A delayed visit. A perfume she once wore, now absent. The men around her grew frantic, chasing not her presence, but the ghost of what she used to give.',
            concept: [
              'Sudden endings break; gradual fading enslaves.',
              'Longing grows in inches, not miles.',
              'Small withdrawals carve deeper hunger.',
              'Constancy kills fire; subtraction fuels it.'
            ],
            teaching:
                'The mind adapts to consistency. But when presence fades slowly, the brain panics — searching for what\'s lost, clinging tighter. The gradual withdrawal is sharper than the clean break.',
            drill: Drill(
                question: 'They say: "Why do you feel different lately?"',
                options: [
                  'I\'m not.',
                  'Maybe I don\'t give everything at once anymore.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates longing withdrawal.',
                input: 'I miss you.',
                example: 'I kind of miss you.'),
            reflection:
                'Do you let people consume you endlessly — or do you take away in small cuts, forcing them to hunger for your return?'),
      ),
    },
    2: {
      6: Lesson(
        id: 'scarcity_desire_2_6',
        title: 'The Intrusive Thought',
        category: 'scarcity_desire',
        world: 2,
        lesson: 6,
        xp: 75,
        content: LessonContent(
            hook:
                'New York, 1970s. Andy Warhol leans to a model: "You\'re beautiful… but unfinished." He leaves before she can ask what he means. For weeks, every mirror whispers his voice back. He isn\'t in her room — he\'s in her mind.',
            concept: [
              'Unfinished sentences replay forever.',
              'What is incomplete, the brain completes.',
              'Desire grows where clarity is denied.',
              'The mind cannot bear incompletion.'
            ],
            teaching:
                'The mind cannot bear incompletion — psychologists call this the Zeigarnik Effect. Leave a phrase hanging, a glance unexplained, and they\'ll replay you endlessly.',
            drill: Drill(
                question: 'They ask: "What did you mean by that?"',
                options: [
                  'Explain it all.',
                  'If I told you, you\'d stop thinking about it.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates intrusive thoughts.',
                input: 'You\'re pretty.',
                example:
                    'There\'s something about you no mirror could ever show.'),
            reflection:
                'When was the last time someone\'s words haunted you? How can you plant that same echo?'),
      ),
      7: Lesson(
        id: 'scarcity_desire_2_7',
        title: 'The Puzzle of Mixed Signals',
        category: 'scarcity_desire',
        world: 2,
        lesson: 7,
        xp: 75,
        content: LessonContent(
            hook:
                'Berlin, Cold War. A spy sends tender notes one week, then turns distant the next. Her contact burns himself alive trying to decode her contradictions. He doesn\'t chase her — he chases clarity.',
            concept: [
              'Clear signals end the chase; mixed ones extend it.',
              'Confusion enslaves attention.',
              'Riddles replay longer than answers.',
              'Contradiction hijacks the brain.'
            ],
            teaching:
                'Contradiction hijacks the brain. When warmth flips cold, people don\'t walk away — they analyze harder. That analysis is the chain.',
            drill: Drill(
                question: 'They ask: "Do you like me or not?"',
                options: [
                  'Yes, of course.',
                  '[Half-smile] "Depends on the day."'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates mixed signals.',
                input: 'I\'m into you.',
                example: 'Sometimes.'),
            reflection:
                'Do you present yourself as solved, or as a puzzle that refuses to end?'),
      ),
      8: Lesson(
        id: 'scarcity_desire_2_8',
        title: 'The Chase Dynamic',
        category: 'scarcity_desire',
        world: 2,
        lesson: 8,
        xp: 75,
        content: LessonContent(
            hook:
                'Riviera, 1950s. Grace Kelly never pursued Prince Rainier. She floated — always slightly out of reach. By the time he proposed, he believed he had conquered the rarest jewel alive. In truth, she never stopped running just a step ahead.',
            concept: [
              'What runs is chased.',
              'What chases is cheapened.',
              'Effort crowns the prize.',
              'Humans inflate the value of what they fight for.'
            ],
            teaching:
                'Humans inflate the value of what they fight for. If they must earn you, they treasure you. Scarcity is not denial — it\'s distance.',
            drill: Drill(
                question: 'They sigh: "Why are you hard to get?"',
                options: [
                  'I\'m not.',
                  'Because anything worth having takes sweat.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates chase dynamics.',
                input: 'Yes, I\'ll see you.',
                example: 'Maybe.'),
            reflection: 'Do you run just enough for the chase to never end?'),
      ),
      9: Lesson(
        id: 'scarcity_desire_2_9',
        title: 'The High-Point Exit',
        category: 'scarcity_desire',
        world: 2,
        lesson: 9,
        xp: 75,
        content: LessonContent(
            hook:
                'Woodstock, 1969. Hendrix ends with "Purple Haze." The crowd begs for more — but he never returns. No encore. No decline. Just eternal fire, frozen at its peak.',
            concept: [
              'Leave at climax, not the fade.',
              'Endings weigh more than beginnings.',
              'Depart hungry, not full.',
              'The brain remembers peaks and ends, not middles.'
            ],
            teaching:
                'The brain remembers peaks and ends, not middles. Leave at the height, and you\'re immortal. Stay too long, and you decay.',
            drill: Drill(
                question: 'They plead: "Stay a bit longer."',
                options: [
                  'Stay until boredom.',
                  'Better to leave you starving than stuffed.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates high-point exits.',
                input: 'Bye.',
                example: 'This was perfect — that\'s why I\'m ending it here.'),
            reflection:
                'Do you end too late — or do you leave so high they ache forever?'),
      ),
      10: Lesson(
        id: 'scarcity_desire_2_10',
        title: 'The Long Wait',
        category: 'scarcity_desire',
        world: 2,
        lesson: 10,
        xp: 75,
        content: LessonContent(
            hook:
                'Rome, 1508. Pope Julius begs to see Michelangelo\'s progress. Four years he waits. When the Sistine ceiling is unveiled, the anticipation itself has made it divine.',
            concept: [
              'What\'s instant is disposable.',
              'Waiting sanctifies.',
              'Hunger deepens in time\'s furnace.',
              'Effort + patience = ownership.'
            ],
            teaching:
                'Effort + patience = ownership. The longer they invest, the more they must believe you\'re worth it. Waiting doesn\'t weaken desire — it cements it.',
            drill: Drill(
                question: 'They snap: "Why make me wait?"',
                options: [
                  'Sorry, I was busy.',
                  'Because waiting makes it burn brighter.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates anticipation through waiting.',
                input: 'See you soon.',
                example:
                    'If you can wait, you\'ll understand why it mattered.'),
            reflection:
                'Do you rush to deliver — or do you let time carve you into treasure?'),
      ),
    },
    3: {
      11: Lesson(
        id: 'scarcity_desire_3_11',
        title: 'Obsession Triggers',
        category: 'scarcity_desire',
        world: 3,
        lesson: 11,
        xp: 100,
        content: LessonContent(
            hook:
                'Paris, 1920s. Marcel Proust whispers: "Every time you laugh like that, I feel history shift." From then on, his lover can\'t laugh without hearing his voice in her head. He didn\'t claim her once — he lived inside her daily habits.',
            concept: [
              'Anchor yourself to their involuntary gestures.',
              'Habits become shrines to memory.',
              'Obsession is repetition infected with you.',
              'By tying yourself to gestures they can\'t control.'
            ],
            teaching:
                'By tying yourself to gestures they can\'t control (smiling, sighs, nervous habits), you embed yourself in their routine. Every time they move, you reappear.',
            drill: Drill(
                question: 'They laugh nervously.',
                options: [
                  'Cute.',
                  'That laugh feels like you\'re hiding something dangerous.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates obsession triggers.',
                input: 'You\'re funny.',
                example:
                    'Every time you laugh, I feel like I\'m hearing a secret the world isn\'t ready for.'),
            reflection:
                'Which habits could you haunt — so they can\'t escape you even in their own body?'),
      ),
      12: Lesson(
        id: 'scarcity_desire_3_12',
        title: 'Scarcity in Social Proof',
        category: 'scarcity_desire',
        world: 3,
        lesson: 12,
        xp: 100,
        content: LessonContent(
            hook:
                'Studio 54, 1978. Bianca Jagger arrives on a white horse. She doesn\'t have to chase — the crowd\'s hunger makes her priceless. Everyone wanted her because everyone else wanted her.',
            concept: [
              'Desire multiplies when witnessed.',
              'Social proof crowns rarity.',
              'Scarcity amplified by demand becomes spectacle.',
              'When many want you, each feels they\'re battling for treasure.'
            ],
            teaching:
                'Scarcity isn\'t only private absence — it\'s public demand. When many want you, each feels they\'re battling for treasure. Competition sharpens obsession.',
            drill: Drill(
                question: 'They say: "You seem popular."',
                options: ['Not really.', 'People try. Few succeed.'],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates social proof scarcity.',
                input: 'Lots of people talk to me.',
                example: 'Attention\'s cheap. My focus isn\'t.'),
            reflection: 'Do you hide demand — or let it crown you?'),
      ),
      13: Lesson(
        id: 'scarcity_desire_3_13',
        title: 'The Forbidden Fruit',
        category: 'scarcity_desire',
        world: 3,
        lesson: 13,
        xp: 100,
        content: LessonContent(
            hook:
                'Havana, 1950s. An American businessman kisses a revolutionary\'s daughter. Each touch feels like treason. The risk fuels the fire — not the kiss itself.',
            concept: [
              'Prohibition inflames passion.',
              'Obstacles multiply value.',
              'Every "no" turns into a deeper "yes."',
              'Humans crave the off-limits.'
            ],
            teaching:
                'Humans crave the off-limits. What is forbidden becomes irresistible because it feels stolen, secret, rare. Scarcity is magnified by boundary.',
            drill: Drill(
                question: 'They whisper: "This feels wrong."',
                options: [
                  'No, it\'s fine.',
                  'That\'s why you\'ll never forget it.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates forbidden fruit desire.',
                input: 'We shouldn\'t.',
                example:
                    'The best stories are the ones we\'re not supposed to tell.'),
            reflection:
                'What boundaries, framed carefully, could make your presence burn hotter?'),
      ),
      14: Lesson(
        id: 'scarcity_desire_3_14',
        title: 'The Fantasy Anchor',
        category: 'scarcity_desire',
        world: 3,
        lesson: 14,
        xp: 100,
        content: LessonContent(
            hook:
                'WWII. Soldiers pin photos of Rita Hayworth in their barracks. They don\'t know her — but in their minds, she\'s perfect. She isn\'t flesh to them; she\'s fantasy, and fantasy survives longer than presence.',
            concept: [
              'Reality fades; fantasy endures.',
              'Imagination outlives experience.',
              'Anchor yourself in dreams, not diaries.',
              'Give fragments, not the whole.'
            ],
            teaching:
                'Give fragments, not the whole. A sentence, an image, a glance — enough to seed fantasy. They\'ll build the rest themselves, and in doing so, crown you immortal in their imagination.',
            drill: Drill(
                question: 'They press: "Tell me everything about you."',
                options: [
                  'Overshare.',
                  'If I told you everything, what would be left to dream about?'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates fantasy anchors.',
                input: 'I like to travel.',
                example:
                    'I belong more to places I haven\'t reached than the ones I\'ve seen.'),
            reflection:
                'Are you feeding fantasy — or killing it with too much truth?'),
      ),
      15: Lesson(
        id: 'scarcity_desire_3_15',
        title: 'Obsession by Interruption',
        category: 'scarcity_desire',
        world: 3,
        lesson: 15,
        xp: 100,
        content: LessonContent(
            hook:
                'Los Angeles, 1975. Joni Mitchell is halfway through a perfect set when the power cuts. Silence. No encore. Decades later, the unfinished night is remembered as her most haunting performance.',
            concept: [
              'Closure kills memory.',
              'The cut-off replays endlessly.',
              'Endings unfinished become eternal.',
              'Humans crave resolution.'
            ],
            teaching:
                'Humans crave resolution. Deny it, and they\'ll replay you endlessly in search of it. The sharpest obsession isn\'t built in fulfillment — it\'s built in interruption.',
            drill: Drill(
                question: 'They beg: "Stay a little longer."',
                options: [
                  'Okay.',
                  'Better to leave with hunger than with regret.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates obsession through interruption.',
                input: 'I had fun.',
                example:
                    'I\'m leaving now — before this moment becomes ordinary.'),
            reflection:
                'Do you linger until boredom, or cut off at the peak so you\'re replayed forever?'),
      ),
    },
    4: {
      16: Lesson(
        id: 'scarcity_desire_4_16',
        title: 'The Intermittent Flame',
        category: 'scarcity_desire',
        world: 4,
        lesson: 16,
        xp: 150,
        content: LessonContent(
            hook:
                'Las Vegas, 1970s. Psychologists study slot machines. People don\'t get addicted to steady wins — they get addicted to uncertainty. The jackpot that comes after 20 losses is irresistible. Lovers fall the same way: not from consistency, but flickers of warmth and withdrawal.',
            concept: [
              'Predictable = comfort.',
              'Unpredictable = compulsion.',
              'Desire lives in the maybe.',
              'The brain is wired for intermittent rewards.'
            ],
            teaching:
                'The brain is wired for intermittent rewards. By mixing presence and absence, affection and withdrawal, you create the strongest loop of all: addiction through uncertainty.',
            drill: Drill(
                question: 'They say: "You\'re inconsistent."',
                options: [
                  'Sorry, I\'ll fix it.',
                  'Consistency comforts. I prefer you addicted.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates intermittent flame addiction.',
                input: 'I like you.',
                example:
                    'Some days I drown in you. Others I disappear. That\'s what makes it dangerous.'),
            reflection:
                'Are you a steady flame—or the flicker that keeps them pulling the lever?'),
      ),
      17: Lesson(
        id: 'scarcity_desire_4_17',
        title: 'The Long Silence',
        category: 'scarcity_desire',
        world: 4,
        lesson: 17,
        xp: 150,
        content: LessonContent(
            hook:
                'Hollywood, 1950s. Marilyn Monroe vanishes from the spotlight. Months of silence. When she returns, the world is ravenous. Her absence didn\'t weaken her—it fermented her into myth.',
            concept: [
              'Silence grows louder with time.',
              'Absence multiplies presence.',
              'The pause engraves the return.',
              'Silence is not empty. It\'s fermentation.'
            ],
            teaching:
                'Silence is not empty. It\'s fermentation. When you retreat, imaginations work overtime. By the time you return, you\'ve grown larger than life.',
            drill: Drill(
                question: 'They ask: "Why did you disappear?"',
                options: [
                  'Sorry, I was busy.',
                  'Stars vanish, then burn brighter.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates long silence desire.',
                input: 'I didn\'t mean to ghost you.',
                example:
                    'Eclipses end. That\'s why the sun feels hotter when it returns.'),
            reflection:
                'Do you fear silence — or wield it as your sharpest weapon?'),
      ),
      18: Lesson(
        id: 'scarcity_desire_4_18',
        title: 'The Invisible Chain',
        category: 'scarcity_desire',
        world: 4,
        lesson: 18,
        xp: 150,
        content: LessonContent(
            hook:
                '1950s Beat Generation. Jack Kerouac told lovers: "Go, see whoever you want." They left — but always came back. Freedom was the chain. Because they weren\'t trapped by his rules — they were trapped by their memory of him.',
            concept: [
              'Chains made visible are broken.',
              'Freedom disguised as permission binds deeper.',
              'They don\'t stay because you forbid—they stay because they can\'t escape.',
              'The strongest bonds aren\'t forced. They\'re felt.'
            ],
            teaching:
                'The strongest bonds aren\'t forced. They\'re felt. When you give freedom, and they still orbit you, the chain is invisible — and unbreakable.',
            drill: Drill(
                question: 'They ask: "Can I see other people?"',
                options: ['No.', 'Of course. Compare all you want.'],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates invisible chains.',
                input: 'I don\'t want you seeing others.',
                example: 'Freedom only reminds you where you belong.'),
            reflection:
                'Do you demand loyalty — or let them discover they are already bound?'),
      ),
      19: Lesson(
        id: 'scarcity_desire_4_19',
        title: 'The Withdrawal Test',
        category: 'scarcity_desire',
        world: 4,
        lesson: 19,
        xp: 175,
        content: LessonContent(
            hook:
                '2010s. Facebook engineers secretly hid a user\'s posts for a week. Friends grew restless, searching, messaging, refreshing. The silence revealed importance. The absence was the test.',
            concept: [
              'Withdrawal exposes attachment.',
              'Silence measures gravity.',
              'If absence hurts, you matter.',
              'If they don\'t notice your absence, you had no hold.'
            ],
            teaching:
                'If they don\'t notice your absence, you had no hold. But if they search, wonder, check — then your absence revealed your power. Withdrawal is the clearest mirror.',
            drill: Drill(
                question: 'They say: "I missed you."',
                options: ['I missed you too.', 'Good. That proves I matter.'],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates withdrawal tests.',
                input: 'Sorry I was gone.',
                example: 'Now you know what life without me feels like.'),
            reflection:
                'Do you measure your worth by presence — or by how hard they chase your absence?'),
      ),
      20: Lesson(
        id: 'scarcity_desire_4_20',
        title: 'The Endless Chase',
        category: 'scarcity_desire',
        world: 4,
        lesson: 20,
        xp: 200,
        content: LessonContent(
            hook:
                'Paris, 1970s. Françoise Sagan gave glimpses, never the whole. A flicker of pain, a laugh, a fragment of her novel. Each time someone thought they knew her, another layer appeared. They never caught her. The chase was endless.',
            concept: [
              'Final possession kills desire.',
              'Mystery stretched eternal creates devotion.',
              'The chase must never end.',
              'Desire doesn\'t live in the having — it lives in the almost.'
            ],
            teaching:
                'The final secret of scarcity: never be fully possessed. Always leave something undiscovered. Desire doesn\'t live in the having — it lives in the almost.',
            drill: Drill(
                question: 'They beg: "Tell me everything about you."',
                options: [
                  'Here\'s all of me.',
                  'Every time you think you\'ve found me, another layer opens.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates endless chase dynamics.',
                input: 'You know me now.',
                example:
                    'You\'ve only read the first chapter. The story runs deeper.'),
            reflection:
                'Do you let yourself be fully owned — or do you design a chase that has no finish line?'),
      ),
    },
  },
  'hidden_dynamics': {
    1: {
      1: Lesson(
        id: 'hidden_dynamics_1_1',
        title: 'The Mask of Mystery',
        category: 'hidden_dynamics',
        world: 1,
        lesson: 1,
        xp: 50,
        content: LessonContent(
            hook:
                'Venice, 17th century. At the masquerade ball, dukes and princes hide behind painted masks. A merchant, usually invisible, now draws whispers and stares. A veiled glance feels sharper than a crown. The mask doesn\'t conceal—it transforms. What is hidden becomes more magnetic than what is shown.',
            concept: [
              'What\'s unseen lingers longer than what\'s revealed.',
              'Uncertainty sharpens desire; certainty dulls it.',
              'A mask is not deception—it\'s amplification.',
              'Slow revelation is stronger than instant truth.'
            ],
            teaching:
                'The brain is addicted to unfinished puzzles. A pause, a veil, an unanswered question sparks imagination to fill in the blanks—usually with something more powerful than reality. Mystery magnifies. Clarity closes.',
            drill: Drill(
                question: 'They press: "Tell me everything about you."',
                options: [
                  'Sure, here\'s my story.',
                  'Better to read the book in chapters, don\'t you think?'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates mystery through veiling.',
                input: 'I was just home last night.',
                example:
                    'I didn\'t sleep much—but not for the reason you think.'),
            reflection:
                'Where are you giving away too much, too fast? What veil could you keep, so imagination does the work for you?'),
      ),
      2: Lesson(
        id: 'hidden_dynamics_1_2',
        title: 'The Rule of Three',
        category: 'hidden_dynamics',
        world: 1,
        lesson: 2,
        xp: 50,
        content: LessonContent(
            hook:
                'Rome, ancient days. Orators knew: once is forgettable, twice is uncertain, thrice becomes eternal. "Veni, vidi, vici." Three beats—immortalized forever. Across cultures, stories, jokes, and charms repeat in threes. Three isn\'t number—it\'s spell.',
            concept: [
              'The mind craves rhythm more than reason.',
              'One is chance. Two is pattern. Three is law.',
              'Triads echo longer than speeches.',
              'Brains encode threes naturally.'
            ],
            teaching:
                'Brains encode threes naturally: fairy tales, rituals, comedy, even persuasion. Three is completion. Less feels weak, more feels forced. The third beat feels inevitable—destiny disguised as structure.',
            drill: Drill(
                question: 'First meeting:',
                options: [
                  'You\'re attractive.',
                  'Your walk, your voice, your timing—dangerous.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the rule of three.',
                input: 'I like your smile.',
                example:
                    'Your smile, your eyes, your pause—it\'s a dangerous equation.'),
            reflection:
                'Where can you use the rhythm of three—in words, gestures, pauses—to make your presence unforgettable?'),
      ),
      3: Lesson(
        id: 'hidden_dynamics_1_3',
        title: 'The Mirror Illusion',
        category: 'hidden_dynamics',
        world: 1,
        lesson: 3,
        xp: 50,
        content: LessonContent(
            hook:
                'Paris, 18th century. Casanova sits with a countess. He doesn\'t reveal himself—he reflects her. "Men praise your beauty, but they miss your wit." Her eyes light up. She feels seen for the first time. He isn\'t showing his truth—he\'s holding up her dream.',
            concept: [
              'People fall for their reflection, not for you.',
              'The mirror binds deeper than the spotlight.',
              'To reflect desire is to possess it.',
              'Every person carries a hidden vision of how they long to be seen.'
            ],
            teaching:
                'Every person carries a hidden vision of how they long to be seen. Mirror it back, and they fall into the illusion that you "understand" them like no one else. In truth—they are in love with themselves through you.',
            drill: Drill(
                question: 'They say: "No one understands me."',
                options: [
                  'I do.',
                  'Strange… I was about to say the same about you.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates mirror illusions.',
                input: 'You\'re beautiful.',
                example:
                    'It\'s eerie—you feel like the answer I didn\'t know I was searching for.'),
            reflection:
                'Do you try to impress—or do you mirror what others most crave to believe about themselves?'),
      ),
      4: Lesson(
        id: 'hidden_dynamics_1_4',
        title: 'The Balance Trick (Symmetry)',
        category: 'hidden_dynamics',
        world: 1,
        lesson: 4,
        xp: 50,
        content: LessonContent(
            hook:
                'Florence, 1500s. Artists carve symmetry into cathedrals and portraits. A balanced face feels more beautiful. A mirrored sentence feels more true. Symmetry is not truth—but the brain mistakes it for truth every time.',
            concept: [
              'Balance feels like truth, even if false.',
              'Symmetry seduces the senses before logic wakes.',
              'Pattern is proof in disguise.',
              'Our ancestors trusted balance—it meant health, safety, survival.'
            ],
            teaching:
                'Our ancestors trusted balance—it meant health, safety, survival. That instinct still rules us. A phrase balanced in rhythm convinces without evidence. People believe form as if it were fact.',
            drill: Drill(
                question: 'They challenge: "Prove it\'s true."',
                options: [
                  'Rattle off evidence.',
                  'If it begins in silence, it ends in silence.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses balance and symmetry.',
                input: 'I\'ll always care for you.',
                example: 'If you rise, I rise. If you fall, I fall.'),
            reflection:
                'When have you mistaken balance for proof? Where are you moved more by beauty than truth?'),
      ),
      5: Lesson(
        id: 'hidden_dynamics_1_5',
        title: 'The Gap Effect (Power of Pauses)',
        category: 'hidden_dynamics',
        world: 1,
        lesson: 5,
        xp: 50,
        content: LessonContent(
            hook:
                'Cold War, 1962. Khrushchev pounds the table. Kennedy doesn\'t shout—he waits. Thirty seconds of silence bend the room until his calm voice cuts: "Is that everything?" The pause outweighed the threats.',
            concept: [
              'Silence costs more than words.',
              'Pauses weigh heavier than paragraphs.',
              'Absence speaks louder than noise.',
              'Humans fear silence—they rush to fill it.'
            ],
            teaching:
                'Humans fear silence—they rush to fill it. The one who waits controls. In rooms, speeches, relationships—the pause flips power. It turns discomfort into gravity.',
            drill: Drill(
                question: 'They ask: "What do you think?"',
                options: [
                  'Answer instantly.',
                  'Let silence ache. "…I think you already know."'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the gap effect.',
                input: 'I missed you.',
                example:
                    '[Pause] "…Strange how silence can feel louder than words."'),
            reflection:
                'When do you fear the pause? How could stillness itself become your sharpest weapon?'),
      ),
    },
    2: {
      6: Lesson(
        id: 'hidden_dynamics_2_6',
        title: 'The Scarcity Equation',
        category: 'hidden_dynamics',
        world: 2,
        lesson: 6,
        xp: 75,
        content: LessonContent(
            hook:
                'Amsterdam, 1637. Tulip bulbs were everywhere—but a single striped bulb sold for the price of a house. Not beauty, but scarcity made it priceless. For a season, entire fortunes bent to flowers. The frenzy collapsed, but the lesson endured: rarity rules perception.',
            concept: [
              'What is rare feels priceless.',
              'Abundance blinds; scarcity burns.',
              'Value expands when access shrinks.',
              'The brain confuses rarity with importance.'
            ],
            teaching:
                'The brain confuses rarity with importance. Time-limits, limited editions, exclusivity—all hijack survival instincts. Scarcity doesn\'t change the thing—it changes its story.',
            drill: Drill(
                question: 'They ask: "When are you free?"',
                options: [
                  'Anytime.',
                  'Thursday, maybe—if you make it worth the reshuffle.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates scarcity.',
                input: 'I\'m always available.',
                example:
                    'One window this week. Convince me it should be yours.'),
            reflection:
                'Where do you flood access? What would shift if your time became rare currency?'),
      ),
      7: Lesson(
        id: 'hidden_dynamics_2_7',
        title: 'The Illusion of Choice',
        category: 'hidden_dynamics',
        world: 2,
        lesson: 7,
        xp: 75,
        content: LessonContent(
            hook:
                'Paris, 19th century. A waiter offers tart or custard. Most choose tart. Add a second tart—slightly worse—and suddenly everyone picks the first tart. The custard never stood a chance. The third option wasn\'t real—it was a frame.',
            concept: [
              'Control isn\'t in the options—it\'s in the frame.',
              'People feel free inside invisible walls.',
              'The one who sets the menu decides the choice.',
              'Humans crave freedom but don\'t notice pre-shaped choices.'
            ],
            teaching:
                'Humans crave freedom but don\'t notice pre-shaped choices. Politicians, stores, even conversations use this trick: offer options that lead to the same outcome. The illusion of choice hides the leash.',
            drill: Drill(
                question: 'They ask: "Tonight or tomorrow?"',
                options: [
                  'Pick one.',
                  'Or maybe we invent a third option neither of us expected.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates the illusion of choice.',
                input: 'Yes, I\'ll do that one.',
                example: 'Interesting… but maybe I\'ll redraw the menu.'),
            reflection: 'When did you last mistake options for freedom?'),
      ),
      8: Lesson(
        id: 'hidden_dynamics_2_8',
        title: 'The Framing Lens',
        category: 'hidden_dynamics',
        world: 2,
        lesson: 8,
        xp: 75,
        content: LessonContent(
            hook:
                'WWII, Britain. Rationing looms. Officials warn: "We\'ve lost half our butter." Churchill reframes: "We\'ve doubled our steel for tanks." Same fact—new lens. The people cheered. The war effort surged. The numbers never changed, only the story.',
            concept: [
              'Facts don\'t move people—frames do.',
              'The wrapper changes the taste.',
              'Numbers mean nothing until the lens defines them.',
              'The mind is emotional before rational.'
            ],
            teaching:
                'The mind is emotional before rational. A problem framed as a gain inspires; framed as a loss, it paralyzes. To control the lens is to control the feeling of truth itself.',
            drill: Drill(
                question: 'They ask: "Are you nervous?"',
                options: ['Yes.', 'Excited—same feeling, different name.'],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses framing to change perception.',
                input: 'This is hard.',
                example: 'This is the test sharpening me.'),
            reflection:
                'What in your life feels heavy only because of its frame?'),
      ),
      9: Lesson(
        id: 'hidden_dynamics_2_9',
        title: 'Anchoring Bias',
        category: 'hidden_dynamics',
        world: 2,
        lesson: 9,
        xp: 75,
        content: LessonContent(
            hook:
                'Las Vegas, 1970s. A dealer warns: "Careful, the last three rolls were sixes." Dice don\'t remember—but gamblers still adjust. The anchor works. Merchants use the same trick: show the \$1000 watch first, then the \$200 one feels cheap. Anchors warp value more than reality does.',
            concept: [
              'First numbers drag the mind.',
              'Anchors pull even when false.',
              'Comparison defines value, not the thing itself.',
              'Humans cling to the first reference point.'
            ],
            teaching:
                'Humans cling to the first reference point. A fake "before price," a high "first ask," even random numbers—all tilt perception. Anchors don\'t reveal truth—they set gravity.',
            drill: Drill(
                question: 'They ask: "How serious is this?"',
                options: ['Not too bad.', 'On a scale of ten, it\'s a three.'],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses anchoring bias.',
                input: 'I\'ll do it fast.',
                example: 'Compared to most, I\'ll do it in half the time.'),
            reflection:
                'What anchors control your view of money, love, or time—without you realizing?'),
      ),
      10: Lesson(
        id: 'hidden_dynamics_2_10',
        title: 'The Mock Retreat',
        category: 'hidden_dynamics',
        world: 2,
        lesson: 10,
        xp: 75,
        content: LessonContent(
            hook:
                'Battle of Hastings, 1066. Norman cavalry charge, then flee. The English break ranks to chase. Suddenly, the Normans wheel back and crush them. The retreat was the trap. Weakness turned to strike.',
            concept: [
              'Weakness can be armor.',
              'Retreat can be advance in disguise.',
              'Not every collapse is real.',
              'Humans relax when they sense surrender.'
            ],
            teaching:
                'Humans relax when they sense surrender. That\'s why a retreat or apology often disarms. But if staged, it lures people into overstepping. Awareness means pausing before chasing a sudden collapse.',
            drill: Drill(
                question: 'They say: "You\'re right, I give up."',
                options: [
                  'Forgive instantly.',
                  'Maybe. But let\'s see what follows that surrender.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses mock retreat tactics.',
                input: 'Okay, all forgiven.',
                example: 'Weakness is easy. Consistency is proof.'),
            reflection:
                'Where have you mistaken retreat for truth? How could patience save you from the trap?'),
      ),
    },
    3: {
      11: Lesson(
        id: 'hidden_dynamics_3_11',
        title: 'The Mask Within the Mask',
        category: 'hidden_dynamics',
        world: 3,
        lesson: 11,
        xp: 100,
        content: LessonContent(
            hook:
                'Florence, Renaissance courts. A courtier accused of betrayal laughs off the charge. "Me? I\'m harmless." His enemies believe it. Later, he dazzles with sudden brilliance. What they didn\'t see: the "harmless" mask was the outer disguise, hiding the inner mask of calculation. Masks stacked upon masks—they never touched his true face.',
            concept: [
              'One mask hides; two masks rule.',
              'People stop searching after the first illusion.',
              'The outer mask protects; the inner one directs.',
              'Humans expect only one layer of disguise.'
            ],
            teaching:
                'Humans expect only one layer of disguise. If you feign simplicity, no one imagines it\'s staged. Layering masks forces miscalculation. Recognition means always asking: what\'s beneath the mask I already see?',
            drill: Drill(
                question: 'They ask: "So you\'re really not ambitious?"',
                options: [
                  'Not really.',
                  'Strange how people only notice what I let them notice.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses layered masks.',
                input: 'I\'m clever.',
                example: 'I only reveal what I want remembered.'),
            reflection:
                'What mask do people already accept from you? What deeper truth does it shield?'),
      ),
      12: Lesson(
        id: 'hidden_dynamics_3_12',
        title: 'The Paradox Effect',
        category: 'hidden_dynamics',
        world: 3,
        lesson: 12,
        xp: 100,
        content: LessonContent(
            hook:
                'Ancient Greece. Diogenes lives in a barrel. Alexander the Great offers him riches, armies, anything. Diogenes only replies: "Stand out of my sunlight." The world\'s most powerful man looks smaller than a beggar. Paradox reversed the throne.',
            concept: [
              'Contradiction unsettles more than logic.',
              'Rejecting value creates higher value.',
              'Paradox makes the ordinary unforgettable.',
              'The human brain hates contradiction—it lingers, searching for resolution.'
            ],
            teaching:
                'The human brain hates contradiction—it lingers, searching for resolution. A paradox spoken with confidence bends perception: weakness appears like strength, lack appears like luxury. Recognition means spotting when contradictions are staged illusions.',
            drill: Drill(
                question: 'They ask: "Don\'t you care about winning?"',
                options: [
                  'Of course.',
                  'Winning is nothing—unless I decide it matters.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates paradox effects.',
                input: 'I like you.',
                example: 'Strange—wanting you feels freer than having you.'),
            reflection:
                'When has a paradox held your attention? Where might you use contradiction to unsettle and reshape perception?'),
      ),
      13: Lesson(
        id: 'hidden_dynamics_3_13',
        title: 'The Echo Chamber',
        category: 'hidden_dynamics',
        world: 3,
        lesson: 13,
        xp: 100,
        content: LessonContent(
            hook:
                'Berlin, 1930s. A simple phrase is repeated until mockery turns to belief. By the tenth time, nods. By the fiftieth, obedience. Repetition was not truth—but it felt like truth. The echo carved grooves in minds deeper than evidence ever could.',
            concept: [
              'Repetition makes the unreal feel real.',
              'Familiarity disguises itself as truth.',
              'Echoes carve grooves thought can\'t escape.',
              'The brain equates repetition with reliability.'
            ],
            teaching:
                'The brain equates repetition with reliability. Advertisers, leaders, even inner doubts use this trick: repeat, and it sticks. Awareness means asking: does this feel true because it is—or because I\'ve heard it too many times?',
            drill: Drill(
                question: 'They insist: "Everyone says this."',
                options: ['Maybe.', 'Echoes aren\'t evidence.'],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that exposes echo chamber effects.',
                input: 'It\'s true.',
                example: 'Funny how repetition can dress up as truth.'),
            reflection:
                'What do you "believe" only because you\'ve heard it echoed endlessly?'),
      ),
      14: Lesson(
        id: 'hidden_dynamics_3_14',
        title: 'The False Balance',
        category: 'hidden_dynamics',
        world: 3,
        lesson: 14,
        xp: 100,
        content: LessonContent(
            hook:
                'Victorian newspapers. A scientist proves germs exist. Editors still give equal space to skeptics with no evidence. Readers think: "Both sides must be valid." Balance felt fair—but it was illusion. The scales looked equal while carrying nothing.',
            concept: [
              'Equal airtime doesn\'t equal truth.',
              'False balance makes weakness look like strength.',
              'Fairness itself can be an illusion.',
              'Humans equate symmetry with fairness.'
            ],
            teaching:
                'Humans equate symmetry with fairness. If both sides appear equal, we assume legitimacy. Illusionists exploit this bias—giving nonsense the mask of balance. Recognition means asking: does one side actually hold weight?',
            drill: Drill(
                question: 'They argue: "Both are equally valid."',
                options: [
                  'Yes, maybe.',
                  'Balance looks fair, but weight decides truth.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that exposes false balance.',
                input: 'Both matter.',
                example:
                    'One is echo, one is evidence. Balance isn\'t always real.'),
            reflection:
                'When did false fairness sway you into giving weight to emptiness?'),
      ),
      15: Lesson(
        id: 'hidden_dynamics_3_15',
        title: 'The Phantom Authority',
        category: 'hidden_dynamics',
        world: 3,
        lesson: 15,
        xp: 100,
        content: LessonContent(
            hook:
                '1920s advertising. A man in a white coat promotes cigarettes. He isn\'t a doctor—but the costume convinces millions. Authority wasn\'t earned—it was borrowed from a symbol. The illusion sold more than proof ever could.',
            concept: [
              'Authority wears robes, not proof.',
              'Symbols enslave faster than evidence.',
              'A costume can command obedience longer than truth.',
              'Humans shortcut trust through signals: uniforms, titles, platforms.'
            ],
            teaching:
                'Humans shortcut trust through signals: uniforms, titles, platforms. The costume feels safer than the content. This is efficient, but dangerous. Phantom authority means asking: does the symbol match reality?',
            drill: Drill(
                question: 'They claim: "I\'m an expert, trust me."',
                options: [
                  'Okay.',
                  'The symbol is convincing—but where\'s the substance?'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that exposes phantom authority.',
                input: 'You know best.',
                example: 'Symbols impress. Truth stands without them.'),
            reflection:
                'What robes of authority do you obey without questioning the proof beneath?'),
      ),
    },
    4: {
      16: Lesson(
        id: 'hidden_dynamics_4_16',
        title: 'The Invisible Hand',
        category: 'hidden_dynamics',
        world: 4,
        lesson: 16,
        xp: 125,
        content: LessonContent(
            hook:
                'Paris, early 1800s. Napoleon enters a salon. He doesn\'t speak, doesn\'t push. Yet conversations tilt toward him, decisions rearrange themselves around him. No command was given—but the room moved as if by gravity. His power wasn\'t loud. It was invisible orchestration.',
            concept: [
              'The greatest control leaves no fingerprints.',
              'Guidance disguised as coincidence feels like fate.',
              'Power works best when it looks like free choice.',
              'People resist visible pressure but embrace invisible nudges.'
            ],
            teaching:
                'People resist visible pressure but embrace invisible nudges. If it feels like their own idea, they hold it tighter. The Invisible Hand doesn\'t push—it arranges. It doesn\'t claim control—it lets others believe they chose.',
            drill: Drill(
                question: 'They ask: "Was this your idea?"',
                options: [
                  'Yes, I suggested it.',
                  'I only asked a question—you chose the rest.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the invisible hand technique.',
                input: 'Do this.',
                example:
                    'Curious—if you chose this path, what might it open for you?'),
            reflection:
                'Where might you be guided right now, mistaking influence for your own decision?'),
      ),
      17: Lesson(
        id: 'hidden_dynamics_4_17',
        title: 'The Mirror Labyrinth',
        category: 'hidden_dynamics',
        world: 4,
        lesson: 17,
        xp: 125,
        content: LessonContent(
            hook:
                'Versailles, Hall of Mirrors. Diplomats enter, dazzled by endless reflections. No matter where they turn, their own image confronts them, multiplied. Louis XIV needed no debate—the architecture itself confused, then awed. Surrounded by illusions of self, they bent to his magnificence.',
            concept: [
              'Confusion makes guidance irresistible.',
              'Endless reflections exhaust the mind.',
              'In a maze, the calm guide becomes king.',
              'Humans crave clarity.'
            ],
            teaching:
                'Humans crave clarity. Overwhelm them with mirrored options, narratives, or paths, and they\'ll grasp for direction. The illusion isn\'t in lying—it\'s in multiplying truths until surrender feels like relief.',
            drill: Drill(
                question: 'They say: "This is too complicated."',
                options: [
                  'Yes, it\'s messy.',
                  'Exactly—too many mirrors. Let\'s find the one that matters.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates mirror labyrinth effects.',
                input: 'It\'s complicated.',
                example:
                    'Illusions multiply… but truth hides in a single reflection.'),
            reflection:
                'When were you lost in too many mirrors? Who offered you "clarity"—and what did it cost?'),
      ),
      18: Lesson(
        id: 'hidden_dynamics_4_18',
        title: 'The Time Distortion',
        category: 'hidden_dynamics',
        world: 4,
        lesson: 18,
        xp: 125,
        content: LessonContent(
            hook:
                'Las Vegas casinos hide clocks and windows. Hours vanish. Gamblers swear it\'s still night as dawn breaks outside. The trick isn\'t money—it\'s time. When people lose track of time, they lose track of resistance.',
            concept: [
              'Control time, control choice.',
              'Slow feels eternal, fast feels urgent.',
              'The moment that bends time bends memory.',
              'Time is perception, not numbers.'
            ],
            teaching:
                'Time is perception, not numbers. Stretch it, and a moment feels eternal. Compress it, and decisions rush forward. Encounters that feel "timeless" etch themselves deeper than ones measured by hours. To bend time is to bend attachment.',
            drill: Drill(
                question: 'They say: "It\'s too soon."',
                options: [
                  'You\'re right, let\'s wait.',
                  'Strange how the right moment feels shorter than the clock says.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates time distortion effects.',
                input: 'We\'ve known each other a long time.',
                example:
                    'We just met—yet it feels like years folded into minutes.'),
            reflection:
                'When has time vanished for you? When was urgency created to move you faster than you realized?'),
      ),
      19: Lesson(
        id: 'hidden_dynamics_4_19',
        title: 'The Ghost Effect',
        category: 'hidden_dynamics',
        world: 4,
        lesson: 19,
        xp: 125,
        content: LessonContent(
            hook:
                'Edo Japan. Haiku masters end poems with fragments: unfinished, echoing. The silence after the verse becomes the meaning. Readers fill the void with their own longing. The ghost wasn\'t in the words—it was in what was left unsaid.',
            concept: [
              'Absence haunts longer than presence.',
              'The unfinished lingers stronger than the complete.',
              'Closure kills obsession—echo keeps it alive.',
              'Humans can\'t leave gaps alone.'
            ],
            teaching:
                'Humans can\'t leave gaps alone. An unanswered question, an unfinished story, an unresolved gesture—these loop in the mind, replaying endlessly. The Ghost Effect works by withholding the ending so they keep writing it themselves.',
            drill: Drill(
                question: 'At the end of a meeting:',
                options: [
                  'That\'s everything.',
                  '…That\'s a story for next time.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that creates ghost effects.',
                input: 'Goodbye.',
                example:
                    'Careful—you\'ll be thinking about this long after I\'m gone.'),
            reflection:
                'Where in your life do you close too neatly? What ghost could you leave behind?'),
      ),
      20: Lesson(
        id: 'hidden_dynamics_4_20',
        title: 'The Grand Illusion',
        category: 'hidden_dynamics',
        world: 4,
        lesson: 20,
        xp: 125,
        content: LessonContent(
            hook:
                '1920s New York. Houdini escapes chains underwater. The crowd gasps, certain they witnessed impossible strength. Yet the true trick wasn\'t escape—it was attention. While eyes locked on one hand, the other set him free. Reality bent, not by magic, but by focus.',
            concept: [
              'Attention defines reality.',
              'What they don\'t see decides what they believe.',
              'The greatest illusion isn\'t hiding truth—it\'s redirecting sight.',
              'The mind can\'t watch everything at once.'
            ],
            teaching:
                'The mind can\'t watch everything at once. Whoever controls the spotlight controls the story. The Grand Illusion isn\'t deception—it\'s mastery of attention. You don\'t hide. You redirect. And reality reshapes itself around the focus you control.',
            drill: Drill(
                question: 'They say: "How did you do that?"',
                options: [
                  'It\'s a trick.',
                  'You saw everything… except what mattered.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses grand illusion techniques.',
                input: 'It\'s practice.',
                example:
                    'Illusion isn\'t hiding—it\'s guiding your eyes away.'),
            reflection:
                'Where is your attention being pulled right now—and what truth is hidden just outside your focus?'),
      ),
    },
  },
  'strategic_influence': {
    1: {
      1: Lesson(
        id: 'strategic_influence_1_1',
        title: 'The Silent Magnet',
        category: 'strategic_influence',
        world: 1,
        lesson: 1,
        xp: 50,
        content: LessonContent(
            hook:
                'Kyoto, 1582. A warlord enters the teahouse. He says nothing. He doesn\'t demand tea, doesn\'t raise his voice. He simply sits. Within moments, the room quiets. Samurai who moments ago boasted loudly now whisper. Servants trip over themselves to serve him. His silence weighs more than their noise.',
            concept: [
              'Stillness attracts more than motion.',
              'The loud chase attention; the quiet pull it.',
              'Silence radiates weight that noise cannot.',
              'Most people seek attention by pushing: louder, faster, bigger.'
            ],
            teaching:
                'Most people seek attention by pushing: louder, faster, bigger. But true gravity is pull. Humans instinctively focus on what is still, composed, unbothered. The silent magnet works because it makes others lean in to fill the void.',
            drill: Drill(
                question: 'They ask: "Why are you so quiet?"',
                options: [
                  'I don\'t know.',
                  '[Calm smile] "Because silence makes you listen harder."'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the silent magnet technique.',
                input: 'I don\'t talk much.',
                example: 'Words are expensive. I spend them wisely.'),
            reflection:
                'When do you chase with noise? What would shift if you let silence do the work for you?'),
      ),
      2: Lesson(
        id: 'strategic_influence_1_2',
        title: 'The Center of the Room',
        category: 'strategic_influence',
        world: 1,
        lesson: 2,
        xp: 50,
        content: LessonContent(
            hook:
                'New York, 1929. Wall Street crashes. In the stock exchange chaos, J.P. Morgan enters calmly, hands behind his back. He doesn\'t shout orders. He simply stands in the center, unshaken. Traders who minutes ago panicked now watch him instead of the numbers. By holding the center of the room, he became the anchor in the storm.',
            concept: [
              'The center is claimed, not requested.',
              'Calmness in chaos makes others orbit.',
              'Attention flows to stability.',
              'In groups, most fight for scraps of attention.'
            ],
            teaching:
                'In groups, most fight for scraps of attention. Gravity means taking the center—not by demand, but by composure. Humans subconsciously gather around what feels immovable. To stand firm when others wobble is to control the room.',
            drill: Drill(
                question:
                    'They ask: "Why aren\'t you worried like everyone else?"',
                options: [
                  'I am worried.',
                  'Storms are loud. Anchors are quiet.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the center of the room technique.',
                input: 'I\'m fine.',
                example:
                    'Chaos swirls. I stay centered. That\'s why they come to me.'),
            reflection:
                'Do you scatter with the crowd—or stand so firm that the crowd bends toward you?'),
      ),
      3: Lesson(
        id: 'strategic_influence_1_3',
        title: 'The Gaze Anchor',
        category: 'strategic_influence',
        world: 1,
        lesson: 3,
        xp: 50,
        content: LessonContent(
            hook:
                'London, 1815. At the Congress of Vienna, diplomats argue for hours. Then, Prince Metternich locks eyes with a rival and holds the gaze calmly—longer than polite, not aggressive, just unbroken. The rival stumbles mid-sentence. The room shifts. Words lost to history, but the gaze remembered. The anchor of eye contact can sink even the strongest speech.',
            concept: [
              'Eyes anchor more than arguments.',
              'A steady gaze shakes shaky words.',
              'To look without flinching is to own the frame.',
              'Most people glance away quickly, signaling submission.'
            ],
            teaching:
                'Most people glance away quickly, signaling submission. A calm, grounded gaze communicates certainty without a word. It doesn\'t mean staring aggressively; it means unbroken attention that makes others feel examined, measured, weighed.',
            drill: Drill(
                question: 'They ask: "Why are you staring?"',
                options: [
                  'Sorry.',
                  'I\'m just making sure you believe what you\'re saying.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the gaze anchor technique.',
                input: 'I\'m listening.',
                example: 'I see you—and that matters more than hearing.'),
            reflection:
                'Do your eyes dart and scatter, or do you let your gaze hold others until they break away first?'),
      ),
      4: Lesson(
        id: 'strategic_influence_1_4',
        title: 'The Slow Pulse',
        category: 'strategic_influence',
        world: 1,
        lesson: 4,
        xp: 50,
        content: LessonContent(
            hook:
                'Rome, 44 BC. Julius Caesar moves through the Senate with unhurried steps. His enemies plot his death, yet he doesn\'t rush, doesn\'t speak fast, doesn\'t seem concerned. His movements are deliberate, his words slow, as though time itself bends to his pace. Even his assassins tremble before they strike—the slow pulse makes a man untouchable.',
            concept: [
              'Slow pace signals control.',
              'The rushed are ruled; the calm rule.',
              'Time bends to those who walk unhurried.',
              'Anxiety speeds you up. Authority slows you down.'
            ],
            teaching:
                'Anxiety speeds you up. Authority slows you down. Humans read pace as power: fast equals nervous, slow equals sovereign. By moving, speaking, and reacting at your own tempo, you signal that the world must adjust to you—not the other way around.',
            drill: Drill(
                question: 'They ask: "Why are you so slow to answer?"',
                options: [
                  'Sorry, I\'m thinking.',
                  'Because speed is panic. I prefer precision.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the slow pulse technique.',
                input: 'Here\'s my answer.',
                example: '[Pause] "Here\'s the answer that matters."'),
            reflection:
                'Are you rushed by the tempo of others, or do you slow the room until they match your rhythm?'),
      ),
      5: Lesson(
        id: 'strategic_influence_1_5',
        title: 'The Aura of Certainty',
        category: 'strategic_influence',
        world: 1,
        lesson: 5,
        xp: 50,
        content: LessonContent(
            hook:
                'Jerusalem, 33 AD. Pontius Pilate asks Jesus: "What is truth?" Jesus doesn\'t argue, doesn\'t explain, doesn\'t debate philosophy. He simply stands silent. The crowd screams, leaders demand answers, yet his composure makes him larger than all of them. Certainty doesn\'t always speak—it radiates.',
            concept: [
              'Doubt argues. Certainty just stands.',
              'Confidence is quiet; insecurity is loud.',
              'Belief projected becomes belief received.',
              'People don\'t follow the one with the best logic—they follow the one who seems most certain.'
            ],
            teaching:
                'People don\'t follow the one with the best logic—they follow the one who seems most certain. Certainty spreads like fire. If you radiate unshakable conviction, others bend to your story, even if it\'s unproven.',
            drill: Drill(
                question: 'They press: "But what if you\'re wrong?"',
                options: [
                  'Maybe I am.',
                  'Then I\'ll still carry it with conviction.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the aura of certainty technique.',
                input: 'I think so.',
                example:
                    'Whether you believe me or not—I\'ve already decided.'),
            reflection:
                'Do you leak doubt in your words and tone—or do you project certainty so strong others can\'t help but believe?'),
      ),
    },
    2: {
      6: Lesson(
        id: 'strategic_influence_2_6',
        title: 'The Vacuum Effect',
        category: 'strategic_influence',
        world: 2,
        lesson: 6,
        xp: 75,
        content: LessonContent(
            hook:
                'Paris, 1920s. Picasso enters a café, sketchbook closed. He doesn\'t announce himself. He sits, orders wine, and waits. Within minutes, artists and patrons swivel in their chairs, whispering: What is he thinking? What is he drawing? He hasn\'t lifted a pencil — but the vacuum he creates sucks all attention toward him.',
            concept: [
              'Attention rushes to fill silence.',
              'The less you reveal, the more others project.',
              'A vacuum is gravity disguised as absence.',
              'Most people try to impress by filling space with chatter and proof.'
            ],
            teaching:
                'Most people try to impress by filling space with chatter and proof. But emptiness is magnetic. A pause, a withheld answer, an unfinished sentence makes the mind lean in, desperate to complete the picture.',
            drill: Drill(
                question: 'They ask: "Why aren\'t you saying anything?"',
                options: [
                  'I don\'t have anything to say.',
                  'I was seeing how long it\'d take for you to notice.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the vacuum effect technique.',
                input: 'I forgot to reply.',
                example: 'Sometimes silence says more than words ever could.'),
            reflection:
                'Do you rush to fill every gap — or let others trip over themselves to fill the vacuum you create?'),
      ),
      7: Lesson(
        id: 'strategic_influence_2_7',
        title: 'The Role Giver',
        category: 'strategic_influence',
        world: 2,
        lesson: 7,
        xp: 75,
        content: LessonContent(
            hook:
                'Florence, 1500s. In Medici courts, minor nobles bicker for status. Cosimo de\' Medici never competes. Instead, he says: "You — tell the story. You — pour the wine. You — sit beside me." By giving roles, he frames the hierarchy. They leave believing they mattered, when in truth, they were cast in his play.',
            concept: [
              'The one who assigns roles owns the script.',
              'Give someone a part, and they rarely question the play.',
              'Authority is subtle when disguised as generosity.',
              'Instead of competing for roles, hand them out.'
            ],
            teaching:
                'Instead of competing for roles, hand them out. By framing others as helpers, advisors, challengers, or allies, you define the structure of interaction. People feel valued while bending to your script.',
            drill: Drill(
                question: 'They ask: "Why me?"',
                options: [
                  'No reason.',
                  'Because you\'re the only one who could pull it off.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the role giver technique.',
                input: 'Do this for me.',
                example: 'You\'re perfect for this role — no one else fits.'),
            reflection:
                'Do you scramble for parts in someone else\'s story — or hand out roles in the play of your own making?'),
      ),
      8: Lesson(
        id: 'strategic_influence_2_8',
        title: 'The Selective Spotlight',
        category: 'strategic_influence',
        world: 2,
        lesson: 8,
        xp: 75,
        content: LessonContent(
            hook:
                'Hollywood, 1930s. A producer at a party ignores the crowd. He laughs only at one actress\'s joke, nods only at her story. By midnight, she feels like the brightest star in the room. Others fade. His selective spotlight made her shine — and made him the man who decides who shines.',
            concept: [
              'Attention is currency; spend it strategically.',
              'Whoever you spotlight becomes brighter — and you become the sun.',
              'To elevate one is to diminish others without a word.',
              'Instead of trying to please everyone, shine selectively.'
            ],
            teaching:
                'Instead of trying to please everyone, shine selectively. Attention is scarce — by rationing it, you magnify its weight. The chosen feel special; the ignored feel small. Either way, you control the balance.',
            drill: Drill(
                question: 'They ask: "Why are you ignoring the others?"',
                options: [
                  'I wasn\'t paying attention.',
                  'Because I prefer focusing on what matters.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the selective spotlight technique.',
                input: 'Good job.',
                example:
                    'Of everyone here — you\'re the only one who caught me.'),
            reflection:
                'Do you scatter your spotlight across the crowd — or make someone burn because your light chose them?'),
      ),
      9: Lesson(
        id: 'strategic_influence_2_9',
        title: 'The Reflective Echo',
        category: 'strategic_influence',
        world: 2,
        lesson: 9,
        xp: 75,
        content: LessonContent(
            hook:
                'Paris salon, 18th century. Madame de Staël listens more than she speaks. When others talk, she mirrors their gestures, echoes their words, sharpens their phrasing slightly. Guests leave saying: "She understood me like no one else." She hardly revealed herself — but everyone felt she was their reflection.',
            concept: [
              'Reflection flatters more than compliments.',
              'People love themselves most when seen in you.',
              'Echoing is influence in disguise.',
              'Instead of asserting, reflect.'
            ],
            teaching:
                'Instead of asserting, reflect. By subtly mirroring posture, tone, or words, you create resonance. People interpret it as deep connection, though you\'ve revealed little of yourself. The reflective echo pulls others into orbit effortlessly.',
            drill: Drill(
                question: 'They say: "No one gets me."',
                options: [
                  'I do.',
                  'Strange — I was about to say the same about you.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the reflective echo technique.',
                input: 'You\'re right.',
                example:
                    'You put into words what I didn\'t know I was feeling.'),
            reflection:
                'Do you try to impress people with your brilliance — or do you let them fall in love with their reflection in you?'),
      ),
      10: Lesson(
        id: 'strategic_influence_2_10',
        title: 'The Waited Word',
        category: 'strategic_influence',
        world: 2,
        lesson: 10,
        xp: 75,
        content: LessonContent(
            hook:
                'Berlin, 1936. Einstein is asked for comment on a rival\'s new theory. Reporters lean forward, pens ready. Einstein adjusts his coat, takes a long pause, then finally says one sentence: "It is… interesting." The word lands heavier than volumes. Because he made them wait, his words became scripture.',
            concept: [
              'Delay amplifies weight.',
              'Words given too easily lose value.',
              'One phrase, well-timed, outweighs paragraphs.',
              'Scarcity applies to speech.'
            ],
            teaching:
                'Scarcity applies to speech. If you talk constantly, words depreciate. If you ration them, each becomes currency. The waited word creates silence first, then fills it with gold.',
            drill: Drill(
                question: 'They demand: "Well? What do you think?"',
                options: ['I like it.', '[Pause] "It has potential."'],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the waited word technique.',
                input: 'That\'s good.',
                example: '[Pause] "That… matters."'),
            reflection:
                'Do you spill words instantly — or do you let silence build until your sentence feels like a verdict?'),
      ),
    },
    3: {
      11: Lesson(
        id: 'strategic_influence_3_11',
        title: 'The Golden Chain (Consistency Trap)',
        category: 'strategic_influence',
        world: 3,
        lesson: 11,
        xp: 100,
        content: LessonContent(
            hook:
                'Tokyo, 1800s. A tea master gifts a nobleman a tiny porcelain cup. The nobleman treasures it. Each time the master visits, he asks: "Did you use the cup?" Soon the nobleman cannot host tea without it. The small gift became a chain — one porcelain handle tying him to its giver forever.',
            concept: [
              'What begins small becomes habit.',
              'A ritual repeated is a chain disguised as comfort.',
              'People defend what they\'ve invested in.',
              'Humans crave consistency.'
            ],
            teaching:
                'Humans crave consistency. Once they\'ve begun a ritual with you, their brain resists breaking it. By creating small traditions — shared jokes, regular calls, familiar gestures — you bind them without command.',
            drill: Drill(
                question: 'They say: "We always talk at this time."',
                options: [
                  'Yeah, I guess.',
                  'Exactly. Imagine breaking tradition now.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the golden chain technique.',
                input: 'I remembered you.',
                example:
                    'Strange how this little ritual already feels eternal.'),
            reflection:
                'What rituals have you accidentally created? Which ones could you craft deliberately as golden chains?'),
      ),
      12: Lesson(
        id: 'strategic_influence_3_12',
        title: 'The Mirror Cage',
        category: 'strategic_influence',
        world: 3,
        lesson: 12,
        xp: 100,
        content: LessonContent(
            hook:
                'Vienna, 1890s. Freud listens as patients speak. He repeats their words back — but sharper, cleaner. They feel seen in ways they\'ve never been seen. Soon, they can\'t stop confessing. Freud didn\'t give them truth; he trapped them in their own reflection.',
            concept: [
              'Reflection flatters — but too much binds.',
              'To echo someone is to make them addicted to being heard.',
              'The mirror can become a cage.',
              'Humans chase those who mirror them because it feels like validation.'
            ],
            teaching:
                'Humans chase those who mirror them because it feels like validation. By echoing back their values, feelings, or phrasing, you lock them inside a cage of recognition. They don\'t love you — they love themselves through you, and can\'t let go.',
            drill: Drill(
                question: 'They sigh: "No one understands me."',
                options: [
                  'I do.',
                  'Funny… I thought the same thing about you.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the mirror cage technique.',
                input: 'I get you.',
                example: 'I understand you in ways you\'ve never dared admit.'),
            reflection:
                'Do you reflect others just enough to bond — or deeply enough to trap?'),
      ),
      13: Lesson(
        id: 'strategic_influence_3_13',
        title: 'The Commitment Hook',
        category: 'strategic_influence',
        world: 3,
        lesson: 13,
        xp: 100,
        content: LessonContent(
            hook:
                'Chicago, 1960s. A salesman asks: "Would you like to help children learn to read?" Parents nod. Later, he asks them to buy encyclopedias. They can\'t say no — they already said yes to the idea. The first small agreement shackled them to the second.',
            concept: [
              'One "yes" breeds another.',
              'The hook isn\'t the sale — it\'s the principle.',
              'Agreement once = obligation forever.',
              'People seek to appear consistent.'
            ],
            teaching:
                'People seek to appear consistent. If they commit to something small, they\'ll defend it with bigger commitments later. Frame conversations to win small "yeses" first — the chain tightens without them noticing.',
            drill: Drill(
                question: 'They say: "I don\'t know if I want this."',
                options: [
                  'Okay, no worries.',
                  'But you do want growth, don\'t you?'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the commitment hook technique.',
                input: 'Will you support me?',
                example:
                    'If you already believe this matters, this next step is obvious.'),
            reflection:
                'Do you fight for the big win first — or seed small yeses that grow into chains?'),
      ),
      14: Lesson(
        id: 'strategic_influence_3_14',
        title: 'The Magnetic Contrast',
        category: 'strategic_influence',
        world: 3,
        lesson: 14,
        xp: 100,
        content: LessonContent(
            hook:
                'Hollywood, 1950s. Marlon Brando shifts mid-scene — one moment gentle, the next volcanic. Directors called it "magnetic chaos." Co-stars never knew which Brando they\'d face. But that unpredictability chained them — they leaned closer, desperate to decode him.',
            concept: [
              'Contrast binds tighter than consistency.',
              'The mix of warmth and distance, fire and ice, enslaves attention.',
              'Predictable = forgettable.',
              'The human brain is wired to notice shifts.'
            ],
            teaching:
                'The human brain is wired to notice shifts. If you\'re always calm, they adjust. But if you\'re calm one moment, fiery the next, they obsessively track you. Contrast creates a magnetic pull that feels inescapable.',
            drill: Drill(
                question: 'They ask: "Why are you hot and cold?"',
                options: [
                  'Sorry, I\'ll be consistent.',
                  'Maybe consistency is boring.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the magnetic contrast technique.',
                input: 'I missed you.',
                example:
                    'I miss you… and then I don\'t. That\'s why it matters.'),
            reflection:
                'Do you keep people comfortable — or chain them by making them crave your unpredictable contrasts?'),
      ),
      15: Lesson(
        id: 'strategic_influence_3_15',
        title: 'The Invisible Thread',
        category: 'strategic_influence',
        world: 3,
        lesson: 15,
        xp: 100,
        content: LessonContent(
            hook:
                'Ancient China. A poet tells his lover: "Wherever you walk, imagine a red thread tied to your wrist, tied to mine. Even oceans can\'t cut it." She spends years believing in the invisible bond. Even when apart, she feels pulled. The poet isn\'t there — but his thread binds her soul.',
            concept: [
              'Invisible bonds outlast visible ones.',
              'Suggestion is stronger than presence.',
              'What can\'t be seen can\'t be broken.',
              'Symbolism is the deepest chain.'
            ],
            teaching:
                'Symbolism is the deepest chain. A word, image, song, or idea can act as an invisible thread. Whenever they encounter it, they feel you pulling them back. Unlike visible chains, invisible ones are unbreakable because they live in the mind.',
            drill: Drill(
                question: 'They say: "Why do I keep thinking of you?"',
                options: [
                  'Because you miss me.',
                  'Because the thread pulls, even when I don\'t.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the invisible thread technique.',
                input: 'Don\'t forget me.',
                example: 'When you hear that song, you\'ll feel me near.'),
            reflection:
                'Do you build visible ties that can be cut — or invisible ones that live forever in memory?'),
      ),
    },
    4: {
      16: Lesson(
        id: 'strategic_influence_4_16',
        title: 'The Throne Effect',
        category: 'strategic_influence',
        world: 4,
        lesson: 16,
        xp: 150,
        content: LessonContent(
            hook:
                'Moscow, 1945. Stalin speaks fewer words than anyone in the Politburo. Yet when he leans back, silent, every general argues in circles until someone "guesses" his stance. Stalin doesn\'t need to command — his mere seat shapes reality. His presence is the throne.',
            concept: [
              'The throne doesn\'t move — others circle it.',
              'Stillness outweighs motion.',
              'Presence itself is policy.',
              'When you establish yourself as the center, others orient around you without orders.'
            ],
            teaching:
                'When you establish yourself as the center, others orient around you without orders. The throne effect is gravity by posture: you don\'t chase, you don\'t scramble — you let orbit form around your stillness.',
            drill: Drill(
                question: 'They ask: "So what\'s your decision?"',
                options: [
                  'I don\'t know yet.',
                  '[Pause] "I\'ll let you know when the answer arrives."'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the throne effect technique.',
                input: 'I want you.',
                example:
                    'The throne doesn\'t move — it chooses who approaches.'),
            reflection:
                'Do you chase approval — or sit so firmly that others move just to be near you?'),
      ),
      17: Lesson(
        id: 'strategic_influence_4_17',
        title: 'The Gravitational Aura',
        category: 'strategic_influence',
        world: 4,
        lesson: 17,
        xp: 150,
        content: LessonContent(
            hook:
                'Mecca, 632 AD. The Prophet Muhammad passes, yet his followers continue his rituals as if he were still alive. His presence outlives him — not because of orders, but because of aura. The rituals orbit the man, even when the man is gone.',
            concept: [
              'Presence that outlives presence is aura.',
              'Aura is not explained — it\'s felt.',
              'To carry aura is to become eternal in absence.',
              'Aura is forged by consistency of essence.'
            ],
            teaching:
                'Aura is forged by consistency of essence. Not every word matters — but the impression of you must remain the same. Aura makes people reference you when you\'re not there, defend you when you\'re silent, miss you even when you\'re near.',
            drill: Drill(
                question: 'They whisper: "Why do you always stand out?"',
                options: ['I don\'t.', 'Because aura can\'t be hidden.'],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the gravitational aura technique.',
                input: 'I\'m just me.',
                example: 'Even when I\'m gone, you\'ll feel me in the room.'),
            reflection:
                'Do people only feel you in presence — or do they carry your echo everywhere?'),
      ),
      18: Lesson(
        id: 'strategic_influence_4_18',
        title: 'Timelessness',
        category: 'strategic_influence',
        world: 4,
        lesson: 18,
        xp: 175,
        content: LessonContent(
            hook:
                'Mahatma Gandhi in prison, 1930s. Asked why he does not fear death, he replies: "Time is not my master. My work is already immortal." Suddenly, the guards feel smaller. Gandhi has stepped outside the cage of clocks. His presence is timeless — therefore unbreakable.',
            concept: [
              'Time chains mortals; the timeless command them.',
              'Those who act without urgency bend urgency itself.',
              'The eternal swallows the temporary.',
              'When you detach from rushing, others feel it.'
            ],
            teaching:
                'When you detach from rushing, others feel it. The person who seems timeless creates timelessness in others. Urgency collapses around them, decisions orbit their calm. They win because they cannot be hurried.',
            drill: Drill(
                question: 'They push: "Answer now!"',
                options: [
                  'Okay, fine.',
                  '[Slow breath] "Time bends to me. I\'ll answer when it matters."'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the timelessness technique.',
                input: 'We\'re late.',
                example: 'I don\'t run on clocks. Clocks run on me.'),
            reflection:
                'Do you live enslaved by time — or do you create the illusion you own eternity?'),
      ),
      19: Lesson(
        id: 'strategic_influence_4_19',
        title: 'The Event Horizon',
        category: 'strategic_influence',
        world: 4,
        lesson: 19,
        xp: 175,
        content: LessonContent(
            hook:
                '1960s, Hollywood. Marilyn Monroe walks through Times Square with no makeup. Few notice. Then she adjusts her scarf, changes her walk — suddenly, the air changes. People turn, cars stop, cameras flash. She flips her aura on like a switch. In that moment she becomes an event horizon: nothing around her escapes her pull.',
            concept: [
              'The event horizon = the point of no escape.',
              'When you choose to shine, no one looks away.',
              'Gravity activated at will is irresistible.',
              'The event horizon isn\'t constant glow — it\'s selective radiance.'
            ],
            teaching:
                'The event horizon isn\'t constant glow — it\'s selective radiance. By learning to "switch on" your magnetism, you trap attention. People who enter your field cannot leave unchanged.',
            drill: Drill(
                question: 'They murmur: "Why is everyone looking at you?"',
                options: [
                  'I don\'t know.',
                  'Because right now, I decided to be seen.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the event horizon technique.',
                input: 'I\'m noticed.',
                example:
                    'When I switch on, the world has no choice but to orbit.'),
            reflection:
                'Do you glow by accident — or can you control when the world bends toward you?'),
      ),
      20: Lesson(
        id: 'strategic_influence_4_20',
        title: 'The Crown Principle',
        category: 'strategic_influence',
        world: 4,
        lesson: 20,
        xp: 200,
        content: LessonContent(
            hook:
                'England, 1953. Queen Elizabeth walks into Westminster Abbey. She says little, but the crown is placed on her head. The crown itself changes nothing physically — yet everyone kneels. Why? Because symbols are stronger than strength. The crown is a principle: once worn, reality reorders itself.',
            concept: [
              'Symbols outlive flesh.',
              'The crown is authority made eternal.',
              'When you wear the crown, resistance is impossible.',
              'At the final stage, gravity is no longer action or absence — it\'s identity.'
            ],
            teaching:
                'At the final stage, gravity is no longer action or absence — it\'s identity. When people accept your "crown" (a role, symbol, title, legend), they don\'t question it. The crown principle makes your presence law.',
            drill: Drill(
                question: 'They say: "Who made you king?"',
                options: [
                  'No one.',
                  'The crown is not given. It is recognized.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the crown principle technique.',
                input: 'I lead.',
                example:
                    'The crown doesn\'t ask permission — it makes permission irrelevant.'),
            reflection:
                'Do you chase authority — or have you built a symbol that crowns you without words?'),
      ),
    },
  },
  'composed_authority': {
    1: {
      1: Lesson(
        id: 'composed_authority_1_1',
        title: 'Naming the Flame',
        category: 'composed_authority',
        world: 1,
        lesson: 1,
        xp: 50,
        content: LessonContent(
            hook:
                'Harvard, 1983. Psychologist Daniel Goleman watches as a student storms into office hours, fists clenched. The professor doesn\'t argue. He says calmly: "You\'re not angry. You\'re frustrated because you expected more." The student freezes, shocked. With a single word swap, the storm dissolves. Naming the flame tamed the fire.',
            concept: [
              'What you name, you control.',
              'Undefined emotion controls you; defined emotion bends to you.',
              'The first alchemy is language.',
              'Emotions feel like chaos until you name them.'
            ],
            teaching:
                'Emotions feel like chaos until you name them. Neuroscience shows labeling reduces intensity by half. Saying "I\'m furious" shifts the brain from raw limbic fire into logical control. Alchemists of emotion don\'t drown in feelings — they rename them into metals they can forge.',
            drill: Drill(
                question: 'They shout: "I\'m so angry at you!"',
                options: [
                  'Don\'t be mad.',
                  'You\'re not angry — you\'re disappointed. That\'s a lighter fire to work with.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the naming the flame technique.',
                input: 'I\'m angry.',
                example: 'I\'m challenged — which means I\'m growing.'),
            reflection:
                'When did you last let an emotion stay nameless and wild? How could naming it have given you the handle to wield it?'),
      ),
      2: Lesson(
        id: 'composed_authority_1_2',
        title: 'Cooling the Storm',
        category: 'composed_authority',
        world: 1,
        lesson: 2,
        xp: 50,
        content: LessonContent(
            hook:
                'Tokyo, 1600s. A samurai faces an enemy hurling insults. He doesn\'t flinch. He sips tea, silent, until the man tires himself out. The crowd whispers: "His calm drowned the storm." That warrior won before the swords left their sheaths.',
            concept: [
              'Anger burns out when it finds no fuel.',
              'Calm is contagious.',
              'The cooler you are, the hotter they look.',
              'Anger is fire seeking fire.'
            ],
            teaching:
                'Anger is fire seeking fire. But if you meet it with water — stillness, calm tone, slow pace — the other burns themselves out. Emotional alchemy is not fighting rage with rage, but smothering it with serenity.',
            drill: Drill(
                question: 'They snap: "You never listen!"',
                options: [
                  'Yes I do!',
                  '[Pause, soft voice] "I hear you. Say it again."'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the cooling the storm technique.',
                input: 'Stop yelling.',
                example: 'I want to hear you clearly — not loudly.'),
            reflection:
                'When have you poured fuel on fire by reacting? What would shift if your silence became water instead?'),
      ),
      3: Lesson(
        id: 'composed_authority_1_3',
        title: 'Turning Fear into Focus',
        category: 'composed_authority',
        world: 1,
        lesson: 3,
        xp: 50,
        content: LessonContent(
            hook:
                'Apollo 13, 1970. Astronauts face death: oxygen failing, systems collapsing. Panic could kill them faster than space. Mission control reframes: "This is the greatest engineering challenge of our lives." Fear becomes focus. That shift saves the crew.',
            concept: [
              'Fear is energy. Focus is fear disciplined.',
              'Anxiety is fuel waiting for direction.',
              'Reframe threat as challenge — the body obeys.',
              'Fear quickens breath, raises heartbeat, sharpens senses.'
            ],
            teaching:
                'Fear quickens breath, raises heartbeat, sharpens senses. It feels like danger, but physiologically, it\'s readiness. The alchemist doesn\'t suppress fear — they redirect it into alertness and presence.',
            drill: Drill(
                question: 'They say: "I\'m terrified to speak."',
                options: [
                  'Calm down.',
                  'That\'s not fear — that\'s energy saying, "use me."'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the turning fear into focus technique.',
                input: 'I\'m scared.',
                example: 'I\'m electric with energy.'),
            reflection:
                'Do you run from fear, or do you forge it into sharpness?'),
      ),
      4: Lesson(
        id: 'composed_authority_1_4',
        title: 'Shifting Sadness into Connection',
        category: 'composed_authority',
        world: 1,
        lesson: 4,
        xp: 50,
        content: LessonContent(
            hook:
                'Vienna, 1930s. Viktor Frankl loses family in the camps. In despair, he decides: "If suffering is unavoidable, it must have meaning." He turns grief into purpose — helping millions through Man\'s Search for Meaning. Sadness became connection to all humanity.',
            concept: [
              'Sadness is heavy — but shared, it becomes bond.',
              'Vulnerability isn\'t weakness, it\'s glue.',
              'Pain, when spoken, forges trust.',
              'Sadness isolates if hidden.'
            ],
            teaching:
                'Sadness isolates if hidden. But voiced honestly, it forges deep bonds. When you reveal your hurt without drowning in it, people lean closer, not away. Emotional alchemists turn sorrow into connection.',
            drill: Drill(
                question: 'They ask: "Are you okay?"',
                options: [
                  'I\'m fine.',
                  'Not really — but I want to share it, not hide it.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the shifting sadness into connection technique.',
                input: 'I\'m sad.',
                example: 'I\'m human, and this moment reminds me of it.'),
            reflection:
                'Do you hide your lows — or do you let them forge intimacy?'),
      ),
      5: Lesson(
        id: 'composed_authority_1_5',
        title: 'The Spark of Humor',
        category: 'composed_authority',
        world: 1,
        lesson: 5,
        xp: 50,
        content: LessonContent(
            hook:
                'Apollo 11, 1969. As the Eagle prepares to land, alarms blare. Neil Armstrong stays calm. Buzz Aldrin cracks a joke: "Program alarm. We\'re inventing new problems now." Laughter lightens fear, steadies the crew. Humor was not escape — it was oxygen.',
            concept: [
              'Humor turns fear into play.',
              'Laughter short-circuits tension.',
              'The one who jokes controls the mood.',
              'Humor isn\'t distraction — it\'s a reset button.'
            ],
            teaching:
                'Humor isn\'t distraction — it\'s a reset button. A laugh cuts through panic, tension, or awkwardness. Emotional alchemists use humor not to avoid seriousness, but to make people strong enough to face it.',
            drill: Drill(
                question: 'They mutter: "This is hopeless."',
                options: [
                  'It\'s serious, yeah.',
                  'At least we\'ll have a great tragedy-comedy to tell.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the spark of humor technique.',
                input: 'Don\'t worry.',
                example:
                    'If this goes wrong, at least my stand-up career starts tomorrow.'),
            reflection:
                'Do you treat humor as frivolous — or as fire that melts fear into joy?'),
      ),
    },
    2: {
      6: Lesson(
        id: 'composed_authority_2_6',
        title: 'Turning Anger into Power',
        category: 'composed_authority',
        world: 2,
        lesson: 6,
        xp: 75,
        content: LessonContent(
            hook:
                'Harlem, 1963. Martin Luther King Jr. is arrested. Reporters expect rage. Instead, he writes: "Injustice anywhere is a threat to justice everywhere." His fury doesn\'t erupt — it crystallizes into words that ignite nations. He turned anger into immortal fuel.',
            concept: [
              'Anger is wasted in fire. Refined, it becomes steel.',
              'Rage burns bridges; focus builds empires.',
              'The hottest flame hardens the strongest sword.',
              'Anger is raw energy.'
            ],
            teaching:
                'Anger is raw energy. Most spill it recklessly. The alchemist channels it — into speeches, creation, change. By naming the injustice and redirecting the heat, anger becomes precision power.',
            drill: Drill(
                question: 'They bark: "You\'re pissing me off!"',
                options: [
                  'Sorry!',
                  'Good. Energy\'s awake. Let\'s use it to fix this.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the turning anger into power technique.',
                input: 'I\'m mad.',
                example: 'I\'m a storm — and storms carve mountains.'),
            reflection:
                'When did you last waste anger as heat? How could you transmute it into light?'),
      ),
      7: Lesson(
        id: 'composed_authority_2_7',
        title: 'Turning Envy into Aspiration',
        category: 'composed_authority',
        world: 2,
        lesson: 7,
        xp: 75,
        content: LessonContent(
            hook:
                'Florence, 1500s. Michelangelo sees Da Vinci\'s sketches — graceful, perfect, untouchable. He feels envy, a poison in the gut. Instead of drowning, he obsesses. That envy pushes him to carve David from stone, eclipsing even his rival. The envy became a ladder.',
            concept: [
              'Envy shows you what you secretly desire.',
              'Poison, when distilled, becomes medicine.',
              'Envy ignored rots; envy harnessed climbs.',
              'Envy is not shameful — it\'s a compass.'
            ],
            teaching:
                'Envy is not shameful — it\'s a compass. It reveals what you crave. The trick is not resenting the one above you, but using their shadow as your staircase.',
            drill: Drill(
                question: 'They mutter: "I hate how successful she is."',
                options: [
                  'Yeah, it sucks.',
                  'Then she\'s showing you your next mountain.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the turning envy into aspiration technique.',
                input: 'I\'m jealous.',
                example: 'Her success is my map, not my prison.'),
            reflection:
                'Who triggers your envy — and what if they were just your secret teacher?'),
      ),
      8: Lesson(
        id: 'composed_authority_2_8',
        title: 'Transmuting Fear into Excitement',
        category: 'composed_authority',
        world: 2,
        lesson: 8,
        xp: 75,
        content: LessonContent(
            hook:
                'New Zealand, 1953. Edmund Hillary stands at the foot of Everest. Terrified. Each gust of wind could kill him. But he reframes: fear means the climb matters. He climbs anyway. At the summit, his fear is indistinguishable from exhilaration.',
            concept: [
              'Fear and excitement are twins with different names.',
              'The body doesn\'t know the difference — only the mind does.',
              'Rename fear, and you flip terror into thrill.',
              'Physiologically, fear = excitement: pounding heart, adrenaline, sweaty palms.'
            ],
            teaching:
                'Physiologically, fear = excitement: pounding heart, adrenaline, sweaty palms. The alchemist\'s trick is relabeling. "I\'m scared" → "I\'m thrilled." With a single word, the storm becomes a rocket.',
            drill: Drill(
                question: 'They say: "I\'m so nervous."',
                options: [
                  'Relax.',
                  'That\'s excitement disguised. Feel it — it means you\'re alive.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the transmuting fear into excitement technique.',
                input: 'I\'m afraid.',
                example: 'I\'m thrilled — fear is just excitement in costume.'),
            reflection: 'When was fear secretly your compass to adventure?'),
      ),
      9: Lesson(
        id: 'composed_authority_2_9',
        title: 'Transmuting Doubt into Curiosity',
        category: 'composed_authority',
        world: 2,
        lesson: 9,
        xp: 75,
        content: LessonContent(
            hook:
                'Athens, 399 BC. Socrates stands trial. They accuse him of corrupting youth. He doesn\'t fight doubt — he multiplies it. "I know that I know nothing." Instead of fear, he turns doubt into eternal curiosity. The question outlives the accusation.',
            concept: [
              'Doubt destroys the timid, but fuels the wise.',
              'Questions are stronger than certainty.',
              'Curiosity is doubt refined into progress.',
              'Doubt feels like weakness.'
            ],
            teaching:
                'Doubt feels like weakness. But if you see it as hunger — a sign there\'s more to know — it becomes strength. The alchemist doesn\'t silence doubt; he sharpens it into questions that move him forward.',
            drill: Drill(
                question: 'They groan: "I don\'t know if I\'m good enough."',
                options: [
                  'Don\'t doubt yourself.',
                  'Good. Now ask — what would make you great?'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the transmuting doubt into curiosity technique.',
                input: 'I doubt myself.',
                example: 'My doubt is my compass toward mastery.'),
            reflection:
                'Do you see doubt as weakness — or as the spark that drives exploration?'),
      ),
      10: Lesson(
        id: 'composed_authority_2_10',
        title: 'Turning Pain into Art',
        category: 'composed_authority',
        world: 2,
        lesson: 10,
        xp: 75,
        content: LessonContent(
            hook:
                'Vienna, 1824. Beethoven, deaf, broken, isolated. He cannot hear a single note. Instead of surrendering, he pours his agony into the Ninth Symphony — music that shakes the world. His pain became cathedral sound.',
            concept: [
              'Pain is raw ore. Art is forged metal.',
              'Suffering wastes you if you bury it — saves you if you shape it.',
              'The deepest wounds create the deepest echoes.',
              'Pain can drown or elevate.'
            ],
            teaching:
                'Pain can drown or elevate. The alchemist transmutes it — writing, painting, creating, speaking. By expressing it, pain becomes beauty, purpose, connection.',
            drill: Drill(
                question: 'They confess: "This hurts too much."',
                options: [
                  'Don\'t think about it.',
                  'Good. Now use it — bleed it into something others can touch.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the turning pain into art technique.',
                input: 'I\'m in pain.',
                example: 'I\'m building something from my wounds.'),
            reflection:
                'What pain of yours could be turned into creation that outlives you?'),
      ),
    },
    3: {
      11: Lesson(
        id: 'composed_authority_3_11',
        title: 'The Fusion of Fear & Desire',
        category: 'composed_authority',
        world: 3,
        lesson: 11,
        xp: 100,
        content: LessonContent(
            hook:
                'Seville, 1904. A matador faces the bull. He trembles, but the crowd doesn\'t see fear — they see fire. Fear sharpens his senses; desire drives his strike. The two blend into electricity. If he had only fear, he\'d freeze. Only desire, he\'d rush blindly. But together — he dances with death and becomes immortal.',
            concept: [
              'Fear alone = paralysis.',
              'Desire alone = recklessness.',
              'Fear + Desire = charged vitality.',
              'The alchemist uses fear as brakes, desire as engine.'
            ],
            teaching:
                'The alchemist uses fear as brakes, desire as engine. Together they create perfect speed. Blend the two and you move with precision: bold, but not blind.',
            drill: Drill(
                question: 'They whisper: "I\'m scared to want this."',
                options: [
                  'Don\'t be scared.',
                  'Good — if it scares and excites you, it means you\'re alive.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the fusion of fear & desire technique.',
                input: 'I\'m nervous.',
                example:
                    'I\'m trembling with fire — exactly where greatness begins.'),
            reflection:
                'Where have you split fear and desire? What could you do if you fused them instead?'),
      ),
      12: Lesson(
        id: 'composed_authority_3_12',
        title: 'Blending Anger with Love',
        category: 'composed_authority',
        world: 3,
        lesson: 12,
        xp: 100,
        content: LessonContent(
            hook:
                'South Africa, 1990. Nelson Mandela walks free after 27 years. He feels fury at injustice, but he doesn\'t unleash it. He welds his anger to love of his people. That alloy becomes forgiveness stronger than steel. It dissolves war into reconciliation.',
            concept: [
              'Anger alone = destruction.',
              'Love alone = weakness.',
              'Anger + Love = justice with compassion.',
              'Raw anger smashes. Pure love submits.'
            ],
            teaching:
                'Raw anger smashes. Pure love submits. But together, they form righteous fire: love strong enough to fight, anger softened enough to heal. Alchemy lies in refusing to choose — instead, fusing both.',
            drill: Drill(
                question: 'They spit: "Don\'t you hate them?"',
                options: ['Yes.', 'I hate what they did. I love us more.'],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the blending anger with love technique.',
                input: 'I forgive.',
                example: 'My love is fierce enough to carry my anger.'),
            reflection:
                'Where could your fury be softened by love — or your love sharpened by anger?'),
      ),
      13: Lesson(
        id: 'composed_authority_3_13',
        title: 'Merging Doubt with Faith',
        category: 'composed_authority',
        world: 3,
        lesson: 13,
        xp: 100,
        content: LessonContent(
            hook:
                'Florence, 1500s. Galileo looks through his telescope. Doubt whispers: "What if I\'m wrong?" Faith answers: "Look again." That tension drives him past comfort into truth. His doubt tested, his faith fortified. Without doubt, faith is blind. Without faith, doubt is paralysis. Together — they became science.',
            concept: [
              'Doubt checks.',
              'Faith drives.',
              'Doubt + Faith = wisdom tested by fire.',
              'Faith without doubt is fanaticism.'
            ],
            teaching:
                'Faith without doubt is fanaticism. Doubt without faith is despair. But together, they forge confidence that is flexible, resilient, unbreakable.',
            drill: Drill(
                question: 'They sigh: "I don\'t know if I can trust myself."',
                options: [
                  'Just believe.',
                  'Good — doubt means you\'re alive. Now let faith carry you past it.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the merging doubt with faith technique.',
                input: 'I believe.',
                example:
                    'My doubt hammers my faith into something unshakable.'),
            reflection:
                'Do you flee doubt, or do you let it strengthen your faith?'),
      ),
      14: Lesson(
        id: 'composed_authority_3_14',
        title: 'Mixing Sorrow with Joy',
        category: 'composed_authority',
        world: 3,
        lesson: 14,
        xp: 100,
        content: LessonContent(
            hook:
                'Japan, 1680s. A poet watches cherry blossoms fall. He weeps — beauty dying so quickly. Yet he smiles — because its fragility makes it divine. Sorrow and joy mix into mono no aware, the Japanese sense of bittersweet beauty. The ache is the gift.',
            concept: [
              'Pure joy is shallow.',
              'Pure sorrow is despair.',
              'Joy + Sorrow = depth, poignancy, sacredness.',
              'The most moving moments are never pure.'
            ],
            teaching:
                'The most moving moments are never pure. Weddings carry tears. Endings carry laughter. The alchemist sees beauty not in choosing joy or sorrow, but in holding both at once.',
            drill: Drill(
                question:
                    'They say: "Why do I feel happy and sad at the same time?"',
                options: ['That\'s weird.', 'That\'s real. That\'s beauty.'],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the mixing sorrow with joy technique.',
                input: 'I\'m sad.',
                example: 'My sorrow makes my joy burn brighter.'),
            reflection:
                'What memories cut and comfort you at once? That\'s emotional alchemy already at work.'),
      ),
      15: Lesson(
        id: 'composed_authority_3_15',
        title: 'Converting Loneliness into Vision',
        category: 'composed_authority',
        world: 3,
        lesson: 15,
        xp: 100,
        content: LessonContent(
            hook:
                'Patmos, 1st century AD. Exiled and alone, John writes Revelation. Isolation drives most to despair. He uses it as canvas, birthing visions that outlast empires. His loneliness became prophecy.',
            concept: [
              'Loneliness empties the cup.',
              'Vision fills it.',
              'The cave of exile can become the cathedral of revelation.',
              'Isolation is raw hunger for connection.'
            ],
            teaching:
                'Isolation is raw hunger for connection. The alchemist feeds it not with distraction but with imagination. Alone, you can hear whispers too faint for crowded rooms. Loneliness is space for vision.',
            drill: Drill(
                question: 'They sigh: "I hate being alone."',
                options: [
                  'You\'ll be fine.',
                  'Good. That means you have room for something new to arrive.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the converting loneliness into vision technique.',
                input: 'I\'m lonely.',
                example: 'Alone is where vision finds me.'),
            reflection:
                'Do you escape your solitude, or let it shape revelation?'),
      ),
    },
    4: {
      16: Lesson(
        id: 'composed_authority_4_16',
        title: 'Transmuting Fear into Awe',
        category: 'composed_authority',
        world: 4,
        lesson: 16,
        xp: 150,
        content: LessonContent(
            hook:
                'Florence, 1501. Crowds gather to see Michelangelo\'s David. At first, they fear its size, its glare, its almost living intensity. But the fear bends into awe — a collective hush. Michelangelo didn\'t kill fear — he redirected it into reverence.',
            concept: [
              'Fear contracts, awe expands.',
              'Both are born of the unknown.',
              'Redirect fear → elevate it into wonder.',
              'When people tremble before you (or a situation), you can crush them with it — or lift them.'
            ],
            teaching:
                'When people tremble before you (or a situation), you can crush them with it — or lift them. Fear becomes awe when you frame it as sacred, as rare. The difference between terror and transcendence is your guidance.',
            drill: Drill(
                question: 'They say: "You scare me."',
                options: [
                  'Sorry.',
                  'Good. It means you feel the weight of what matters.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the transmuting fear into awe technique.',
                input: 'Don\'t be afraid.',
                example: 'That fear? It\'s awe in disguise.'),
            reflection:
                'Do you inspire panic — or reverence? What could shift if you reframed fear as wonder?'),
      ),
      17: Lesson(
        id: 'composed_authority_4_17',
        title: 'Turning Anger into Loyalty',
        category: 'composed_authority',
        world: 4,
        lesson: 17,
        xp: 150,
        content: LessonContent(
            hook:
                'Rome, 44 BC. Julius Caesar\'s soldiers grumble at a brutal march. He doesn\'t silence them — he walks barefoot beside them, bleeding. Their anger dissolves into fierce loyalty. They fight harder, not because the march softened, but because Caesar transmuted fury into devotion.',
            concept: [
              'Anger isolates. Loyalty binds.',
              'Shared struggle turns resentment into unity.',
              'The alchemist absorbs heat and releases it as fire for the cause.',
              'When anger rises, most leaders fight it.'
            ],
            teaching:
                'When anger rises, most leaders fight it. But if you acknowledge it, share it, even carry it yourself, you flip it into loyalty. Rage is not destroyed — it\'s recycled.',
            drill: Drill(
                question: 'They growl: "You\'ve made this hard."',
                options: ['No I didn\'t!', 'Yes. And I walk it with you.'],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the turning anger into loyalty technique.',
                input: 'Stop being mad.',
                example:
                    'Your anger proves you care — let\'s turn that into something worth fighting for.'),
            reflection:
                'When faced with anger, do you resist it — or transform it into the glue of loyalty?'),
      ),
      18: Lesson(
        id: 'composed_authority_4_18',
        title: 'Shaping Envy into Aspiration',
        category: 'composed_authority',
        world: 4,
        lesson: 18,
        xp: 150,
        content: LessonContent(
            hook:
                'Harlem, 1920s. Young musicians envy Duke Ellington\'s genius. Instead of letting envy poison, Ellington opens his rehearsals, tells them: "Learn from me, then outplay me." Their envy mutates into hunger, and Harlem\'s jazz scene explodes into golden age.',
            concept: [
              'Envy poisons downward.',
              'Aspiration rises upward.',
              'Same root: wanting what another has.',
              'You can\'t erase envy — but you can redirect it.'
            ],
            teaching:
                'You can\'t erase envy — but you can redirect it. By framing yourself as a model, you make others\' envy fuel their climb instead of their resentment.',
            drill: Drill(
                question: 'They mutter: "I wish I had what you do."',
                options: [
                  'Don\'t be jealous.',
                  'Good — it means you\'re close. Take it. Make it yours.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the shaping envy into aspiration technique.',
                input: 'Don\'t envy me.',
                example:
                    'If you\'re envying me, it means you already feel it in yourself.'),
            reflection:
                'Do others envy you secretly — or do you guide that envy into admiration and growth?'),
      ),
      19: Lesson(
        id: 'composed_authority_4_19',
        title: 'Converting Doubt into Devotion',
        category: 'composed_authority',
        world: 4,
        lesson: 19,
        xp: 175,
        content: LessonContent(
            hook:
                'India, 1930. Gandhi is doubted by his own followers: "How can spinning cloth defeat an empire?" Gandhi spins anyway. Day after day. The doubt itself becomes fuel — until the act is no longer questioned, but worshipped. What was once skepticism becomes religious devotion.',
            concept: [
              'Doubt is energy without anchor.',
              'Anchor it with consistency → devotion forms.',
              'Faith is born not in the absence of doubt, but its transformation.',
              'You don\'t erase doubt by arguing.'
            ],
            teaching:
                'You don\'t erase doubt by arguing. You erase it by embodying consistency so unwavering that doubt is forced to bend into belief.',
            drill: Drill(
                question: 'They sneer: "This will never work."',
                options: [
                  'Yes it will!',
                  'You may be right. Keep watching anyway.'
                ],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the converting doubt into devotion technique.',
                input: 'Trust me.',
                example:
                    'Doubt if you must. I\'ll still be here when doubt becomes belief.'),
            reflection:
                'Do you argue with skeptics — or stand so consistently that their doubt becomes your altar?'),
      ),
      20: Lesson(
        id: 'composed_authority_4_20',
        title: 'Turning Mortality into Legacy',
        category: 'composed_authority',
        world: 4,
        lesson: 20,
        xp: 200,
        content: LessonContent(
            hook:
                'Egypt, 2500 BC. Pharaoh Khufu knows he will die. But he bends mortality into eternity through the Great Pyramid. He cannot live forever — but his name, his story, his frame of godhood does. Death itself becomes devotion.',
            concept: [
              'Mortality terrifies.',
              'Legacy sanctifies.',
              'Death is the raw material; meaning is the transmutation.',
              'The greatest alchemy isn\'t about moods — it\'s about mortality.'
            ],
            teaching:
                'The greatest alchemy isn\'t about moods — it\'s about mortality. By embracing death, you create works, stories, and presences that outlast life. Mortality bends into myth.',
            drill: Drill(
                question: 'They whisper: "Everything ends."',
                options: ['That\'s sad.', 'Yes — which is why it matters.'],
                answerIndex: 1),
            rewrite: RewriteTask(
                prompt:
                    'Transform this statement into one that uses the turning mortality into legacy technique.',
                input: 'I don\'t want it to end.',
                example: 'Death is the ink. Legacy is the story it writes.'),
            reflection:
                'Do you shrink from endings — or transmute them into beginnings others will worship long after you\'re gone?'),
      ),
    },
  },
};
