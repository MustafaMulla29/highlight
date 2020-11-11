import React, { useState } from 'react';
import { useParams } from 'react-router-dom';
import { Spinner, CircularSpinner } from './components/Spinner/Spinner';
import { Header } from './components/Header/Header';
import {
    Switch,
    Route,
    BrowserRouter as Router,
    Redirect,
} from 'react-router-dom';
import { useQuery, gql } from '@apollo/client';
import { Player } from './pages/Player/PlayerPage';
import { SessionsPage } from './pages/Sessions/SessionsPage';
import { SetupPage } from './pages/Setup/SetupPage';
import { useIntegrated } from './util/integrated';
import styles from './App.module.css';

export const OrgRouter = () => {
    const { organization_id } = useParams();
    const { loading, error, data } = useQuery<
        { organization: { name: string } },
        { id: number }
    >(
        gql`
            query GetOrganization($id: ID!) {
                organization(id: $id) {
                    name
                }
            }
        `,
        { variables: { id: organization_id } }
    );
    const { integrated, loading: integratedLoading } = useIntegrated(
        organization_id
    );

    if (error) {
        return <p>{'OrgValidator error: ' + JSON.stringify(error)}</p>;
    }
    if (integratedLoading || loading || !data?.organization) {
        return (
            <div className={styles.loadingWrapper}>
                <Spinner />
            </div>
        );
    }
    return (
        <>
            <Header />
            <Switch>
                <Route path="/:organization_id/sessions/:session_id">
                    <Player />
                </Route>
                <Route path="/:organization_id/sessions">
                    <SessionsPage integrated={integrated} />
                </Route>
                <Route path="/:organization_id">
                    <SetupPage integrated={integrated} />
                </Route>
            </Switch>
        </>
    );
};
