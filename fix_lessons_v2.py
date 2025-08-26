#!/usr/bin/env python3

import re

def fix_lessons():
    with open('lib/content/lessons_catalog.dart', 'r') as f:
        content = f.read()
    
    # Find all LessonContent blocks
    pattern = r'(content: LessonContent\(\s*hook:[^}]+concept:\s*\[[^]]+\],\s*)(drill: Drill)'
    
    def replace_func(match):
        before = match.group(1)
        after = match.group(2)
        
        # Check if teaching is already present
        if 'teaching:' in before:
            return match.group(0)
        
        # Add teaching parameter
        teaching = '          teaching: "The core principle that transforms these concepts into power. When you understand the psychology behind each technique, you become not just a practitioner but a master of human nature.",\n          '
        
        return before + teaching + after
    
    # Apply the fix
    fixed_content = re.sub(pattern, replace_func, content, flags=re.DOTALL)
    
    # Write back to file
    with open('lib/content/lessons_catalog.dart', 'w') as f:
        f.write(fixed_content)
    
    print("Fixed lessons catalog v2!")

if __name__ == "__main__":
    fix_lessons() 