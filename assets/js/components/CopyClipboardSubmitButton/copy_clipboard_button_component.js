import React, { useState } from 'react'
import { CopyToClipboard } from 'react-copy-to-clipboard'

export default ({value}) => {
	const [copied, setCopied] = useState(false)
    
	return (
    <div>
      <CopyToClipboard text={value} onCopy={() => setCopied(true)}>
        <button
          className={`${
            copied ? 'copy-button' : 'shorten-button'
          } button-large button-primary button}`}
        >
          {copied ? 'Copied!' : 'Copy'}
        </button>
      </CopyToClipboard>
    </div>
  )
}
