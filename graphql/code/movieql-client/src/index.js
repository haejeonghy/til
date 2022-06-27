import React from 'react';
import ReactDOM from 'react-dom/client'
import App from './App';
import client from "./client"
import { ApolloProvider } from '@apollo/client';

const root = ReactDOM.createRoot(document.getElementById('root'));
root.render(
    <React.StrictMode>
        {/* provider : 애플리케이션 구성원 모두가 client에 접근하게 해준다. */}
        <ApolloProvider client={client}>
            <App/>
        </ApolloProvider>
    </React.StrictMode>
)