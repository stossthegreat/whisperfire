import 'package:whisperfire/data/models/lesson_models.dart';

const kCategories = [
  'seduction',
  'gravity',
  'frame',
  'scarcity',
  'deception',
  'coldpower'
];

const kCategoryNames = {
  'magnetic_presence': 'Magnetic Presence',
  'composed_authority': 'Emotional Alchemy',
  'frame': 'Conversation Frames',
  'scarcity': 'Scarcity & Desire',
  'deception': 'Hidden Dynamics',
  'strategic_influence': 'Psychological Gravity',
};

/// Map<category, Map<world, Map<lessonNum, Lesson>>>
const lessonsCatalog = <String, Map<int, Map<int, Lesson>>>{
  'seduction': {
    1: {
      1: Lesson(
        id: 'seduction_1_1',
        title: 'The Power of Mystery',
        category: 'seduction',
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
        id: 'seduction_1_2',
        title: 'Scarcity is a Crown',
        category: 'seduction',
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
        id: 'seduction_1_3',
        title: 'Presence is a Spell',
        category: 'seduction',
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
        id: 'seduction_1_4',
        title: 'The Haunting Memory',
        category: 'seduction',
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
        id: 'seduction_1_5',
        title: 'The Mirror of Desire',
        category: 'seduction',
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
        id: 'seduction_2_6',
        title: 'The Ice Mask',
        category: 'seduction',
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
        id: 'seduction_2_7',
        title: 'Deliberate Distance',
        category: 'seduction',
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
        id: 'seduction_2_8',
        title: 'Rare Attention',
        category: 'seduction',
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
        id: 'seduction_2_9',
        title: 'Social Freezing',
        category: 'seduction',
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
        id: 'seduction_2_10',
        title: 'Cold Humor',
        category: 'seduction',
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
        id: 'seduction_3_11',
        title: 'The Freeze-Out',
        category: 'seduction',
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
        id: 'seduction_3_12',
        title: 'Selective Engagement',
        category: 'seduction',
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
        id: 'seduction_3_13',
        title: 'Strategic Mystery',
        category: 'seduction',
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
        id: 'seduction_3_14',
        title: 'Cold Command',
        category: 'seduction',
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
        id: 'seduction_3_15',
        title: 'The Predator\'s Calm',
        category: 'seduction',
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
        id: 'seduction_4_16',
        title: 'The High Throne',
        category: 'seduction',
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
        id: 'seduction_4_17',
        title: 'Silent Punishment',
        category: 'seduction',
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
        id: 'seduction_4_18',
        title: 'Indifference to Praise & Insult',
        category: 'seduction',
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
        id: 'seduction_4_19',
        title: 'Calculated Precision',
        category: 'seduction',
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
        id: 'seduction_4_20',
        title: 'Cold Majesty',
        category: 'seduction',
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
  'gravity': {
    1: {},
    2: {},
    3: {},
    4: {},
  },
  'frame': {
    1: {},
    2: {},
    3: {},
    4: {},
  },
  'scarcity': {
    1: {},
    2: {},
    3: {},
    4: {},
  },
  'deception': {
    1: {},
    2: {},
    3: {},
    4: {},
  },
  'coldpower': {
    1: {},
    2: {},
    3: {},
    4: {},
  },
};
