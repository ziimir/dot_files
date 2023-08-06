import React, {memo} from 'react';
import {createCn} from 'bem-react-classname';

import './{{_expr_:expand('%:t:r')}}.css';

export const {{_expr_:substitute(expand('%:t:r'), '\(\%(\<\l\+\)\%(-\)\@=\)\|-\(\l\)', '\u\1\2', 'g')}} = memo((props) => {
    const cn = createCn('{{_expr_:expand('%:t:r')}}', props.className);

    return (
        <div className={cn()}>
            {{_cursor_}}
        </div>
    );
});

{{_expr_:substitute(expand('%:t:r'), '\(\%(\<\l\+\)\%(-\)\@=\)\|-\(\l\)', '\u\1\2', 'g')}}.displayName = '{{_expr_:substitute(expand('%:t:r'), '\(\%(\<\l\+\)\%(-\)\@=\)\|-\(\l\)', '\u\1\2', 'g')}}';
