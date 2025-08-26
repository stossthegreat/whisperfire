#!/usr/bin/env python3

def fix_remaining_lessons():
    with open('lib/content/lessons_catalog.dart', 'r') as f:
        lines = f.readlines()
    
    fixed_lines = []
    i = 0
    
    while i < len(lines):
        line = lines[i]
        fixed_lines.append(line)
        
        # Look for LessonContent opening
        if 'content: LessonContent(' in line:
            # Find the concept array and drill
            concept_start = None
            concept_end = None
            drill_start = None
            
            j = i + 1
            while j < len(lines):
                if 'concept: [' in lines[j]:
                    concept_start = j
                elif concept_start and '],' in lines[j]:
                    concept_end = j
                elif concept_start and 'drill: Drill' in lines[j]:
                    drill_start = j
                    break
                j += 1
            
            if concept_start and concept_end and drill_start:
                # Check if teaching is already present between concept and drill
                has_teaching = False
                for k in range(concept_end + 1, drill_start):
                    if 'teaching:' in lines[k]:
                        has_teaching = True
                        break
                
                # If no teaching, add it
                if not has_teaching:
                    # Insert teaching after concept_end
                    fixed_lines.append('          teaching: "The core principle that transforms these concepts into power. When you understand the psychology behind each technique, you become not just a practitioner but a master of human nature.",\n')
        
        i += 1
    
    # Write back to file
    with open('lib/content/lessons_catalog.dart', 'w') as f:
        f.writelines(fixed_lines)
    
    print("Fixed remaining lessons!")

if __name__ == "__main__":
    fix_remaining_lessons() 