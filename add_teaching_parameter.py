#!/usr/bin/env python3

import re

def add_teaching_parameter():
    with open('lib/content/lessons_catalog.dart', 'r') as f:
        content = f.read()
    
    # Pattern to find LessonContent blocks that are missing the teaching parameter
    # Look for: concept: [ ... ], followed by drill: Drill
    pattern = r'(content: LessonContent\(\s*hook:[^}]+concept:\s*\[[^]]+\],\s*)(drill: Drill)'
    
    def replacement(match):
        before = match.group(1)
        after = match.group(2)
        
        # Check if teaching is already present
        if 'teaching:' in before:
            return match.group(0)
        
        # Add teaching parameter
        teaching = '          teaching: "The core principle that transforms these concepts into power. When you understand the psychology behind each technique, you become not just a practitioner but a master of human nature.",\n          '
        
        return before + teaching + after
    
    # Apply the fix
    fixed_content = re.sub(pattern, replacement, content, flags=re.DOTALL)
    
    # Write back to file
    with open('lib/content/lessons_catalog.dart', 'w') as f:
        f.write(fixed_content)
    
    print("Added teaching parameter to all lessons!")

if __name__ == "__main__":
    add_teaching_parameter() 