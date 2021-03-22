import React, {useState} from 'react'

import SubmitButton from './submit_button_component'
import CopyClipboardButton from './copy_clipboard_button_component'

export default ({ value }) => {
  return value.trim('') == '' ? (
    <SubmitButton />
  ) : (
    <CopyClipboardButton value={value} />
  )
}
