import React from 'react'
import { render, screen } from 'test-utils'

import AlertComponent from '../alert_component'

const ERROR = "URL is not a valid URL!"

test('Successfully shows an error message', () => {
	const { asFragment } = render(<AlertComponent error={ERROR} />)
	expect(screen.getByText(ERROR)).toBeInTheDocument()
	expect(asFragment()).toMatchSnapshot()	
})

test('Correctly does not show an error message when message is blank', () => {
	const { asFragment } = render(<AlertComponent error={''} />)
  expect(asFragment()).toMatchSnapshot()
})