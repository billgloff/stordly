import React, { useState } from "react"

import useUrlInputState from '../hooks/use_url_input_state'
import CopyClipboardSubmitButton from './CopyClipboardSubmitButton'
import Alert from './alert_component'

export default () => {
	const [url, { handleUrlInputChange, resetUrlInputState }] = useUrlInputState()
	const [slug, setSlug] = useState('')
	const [error, setError] = useState('')

	const csrfToken = document.head.querySelector('[name~=csrf-token][content]')
    .content

	const setUrlAndResetSlugState = (event) => {
		handleUrlInputChange(event)
		setSlug('')
		setError('')
	}

	const handleInputChange = event => setUrlAndResetSlugState(event)

	const saveFormData = async () => {		
    const response = await fetch('/api/links', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken,
      },
      body: JSON.stringify({ url: url }),
    })
		return response.json();
  }

  const onSubmit = async (event) => {
    event.preventDefault();	
		setError('')
		try {
      saveFormData().then(({data, errors}) => {
				if (data) {
          const fullyQualifiedSlug = `${window.location.origin}/${data.slug}`
          setSlug(fullyQualifiedSlug)
        } else {
          setError(errors.url[0])
        }
			});			
    } catch (e) {
      setError(`Post failed! ${e.message}`);
    }
  }

	const showSlugOrUrl = () => {
		return slug.trim().length > 0 ? slug : url
	}

	return (
    <form onSubmit={onSubmit} className="pb-20 block">
      <div className="grid grid-cols-8 gap-4 bg-white shadow-md rounded px-8 pt-6 pb-6 mb-4 my-2">
        <div className="col-span-7">
          <label className="show-for-sr" htmlFor="shorten_url">
            Enter URL to be shortened
          </label>
          <input
            id="shorten_url"
            type="url"
            value={slug.trim().length > 0 ? slug : url}
            onChange={handleInputChange}
            autoFocus
            required
            size="2048"
            placeholder="Shorten your link"
            className="shorten-input"
            role="textbox"
          />
          <Alert error={error} />
        </div>
        <div className="">
          <CopyClipboardSubmitButton value={slug} />
        </div>
      </div>
    </form>
  )
}
