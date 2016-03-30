--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: pgcrypto; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS pgcrypto WITH SCHEMA public;


--
-- Name: EXTENSION pgcrypto; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pgcrypto IS 'cryptographic functions';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: movie_genres; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movie_genres (
    id integer NOT NULL,
    movie_id integer,
    movie_genre character varying(20)
);


ALTER TABLE public.movie_genres OWNER TO postgres;

--
-- Name: movie_genres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE movie_genres_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movie_genres_id_seq OWNER TO postgres;

--
-- Name: movie_genres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE movie_genres_id_seq OWNED BY movie_genres.id;


--
-- Name: movie_ratings; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movie_ratings (
    id integer NOT NULL,
    user_id integer,
    movie_id integer,
    rating double precision
);


ALTER TABLE public.movie_ratings OWNER TO postgres;

--
-- Name: movie_ratings_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE movie_ratings_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movie_ratings_id_seq OWNER TO postgres;

--
-- Name: movie_ratings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE movie_ratings_id_seq OWNED BY movie_ratings.id;


--
-- Name: movie_reviews; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movie_reviews (
    id integer NOT NULL,
    movie_id integer,
    user_id integer,
    movie_review text
);


ALTER TABLE public.movie_reviews OWNER TO postgres;

--
-- Name: movie_reviews_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE movie_reviews_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movie_reviews_id_seq OWNER TO postgres;

--
-- Name: movie_reviews_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE movie_reviews_id_seq OWNED BY movie_reviews.id;


--
-- Name: movie_titles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movie_titles (
    id integer NOT NULL,
    movie_title character varying(200)
);


ALTER TABLE public.movie_titles OWNER TO postgres;

--
-- Name: movie_titles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE movie_titles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movie_titles_id_seq OWNER TO postgres;

--
-- Name: movie_titles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE movie_titles_id_seq OWNED BY movie_titles.id;


--
-- Name: movie_years; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movie_years (
    id integer NOT NULL,
    movie_id integer,
    year character varying(6)
);


ALTER TABLE public.movie_years OWNER TO postgres;

--
-- Name: movie_years_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE movie_years_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movie_years_id_seq OWNER TO postgres;

--
-- Name: movie_years_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE movie_years_id_seq OWNED BY movie_years.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    firstname character varying(50),
    lastname character varying(50),
    username character varying(50),
    password character varying(255),
    is_admin bit(1) DEFAULT B'0'::"bit"
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_genres ALTER COLUMN id SET DEFAULT nextval('movie_genres_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_ratings ALTER COLUMN id SET DEFAULT nextval('movie_ratings_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_reviews ALTER COLUMN id SET DEFAULT nextval('movie_reviews_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_titles ALTER COLUMN id SET DEFAULT nextval('movie_titles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movie_years ALTER COLUMN id SET DEFAULT nextval('movie_years_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: movie_genres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY movie_genres (id, movie_id, movie_genre) FROM stdin;
1	1	Adventure
2	1	Animation
3	1	Children
4	1	Comedy
5	1	Fantasy
6	2	Adventure
7	2	Children
8	2	Fantasy
9	3	Comedy
10	3	Romance
11	4	Comedy
12	4	Drama
13	4	Romance
14	5	Comedy
15	6	Action
16	6	Crime
17	6	Thriller
18	7	Comedy
19	7	Romance
20	8	Adventure
21	8	Children
22	9	Action
23	10	Action
24	10	Adventure
25	10	Thriller
26	11	Comedy
27	11	Drama
28	11	Romance
29	12	Comedy
30	12	Horror
31	13	Adventure
32	13	Animation
33	13	Children
34	14	Drama
35	15	Action
36	15	Adventure
37	15	Romance
38	16	Crime
39	16	Drama
40	17	Drama
41	17	Romance
42	18	Comedy
43	19	Comedy
44	20	Action
45	20	Comedy
46	20	Crime
47	20	Drama
48	20	Thriller
49	21	Comedy
50	21	Crime
51	21	Thriller
52	22	Crime
53	22	Drama
54	22	Horror
55	22	Mystery
56	22	Thriller
57	23	Action
58	23	Crime
59	23	Thriller
60	24	Drama
61	24	Sci-Fi
62	25	Drama
63	25	Romance
64	26	Drama
65	27	Children
66	27	Drama
67	28	Drama
68	28	Romance
69	29	Adventure
70	29	Drama
71	29	Fantasy
72	29	Mystery
73	29	Sci-Fi
74	30	Crime
75	30	Drama
76	31	Drama
77	32	Mystery
78	32	Sci-Fi
79	32	Thriller
80	33	Adventure
81	33	Romance
82	33	IMAX
83	34	Children
84	34	Drama
85	35	Drama
86	35	Romance
87	36	Crime
88	36	Drama
89	37	Comedy
90	37	Romance
91	38	Drama
92	39	Drama
93	39	War
94	40	Action
95	40	Crime
96	40	Drama
97	41	Drama
98	42	Action
99	42	Adventure
100	42	Fantasy
101	43	Comedy
102	43	Drama
103	43	Thriller
104	44	Drama
105	44	Romance
106	45	Mystery
107	45	Thriller
108	46	Animation
109	46	Children
110	46	Drama
111	46	Musical
112	46	Romance
113	47	Drama
114	47	Romance
115	48	Crime
116	48	Mystery
117	48	Thriller
118	49	Comedy
119	49	Drama
120	49	Romance
121	50	Adventure
122	50	Drama
123	51	Children
124	51	Comedy
125	52	Drama
126	53	Drama
127	54	Comedy
128	54	Drama
129	54	Romance
130	55	Drama
131	55	Mystery
132	56	Adventure
133	56	Children
134	56	Fantasy
135	57	Drama
136	57	Thriller
137	58	Drama
138	59	Comedy
139	59	Crime
140	60	Comedy
141	60	Romance
142	61	Comedy
143	62	Action
144	62	Sci-Fi
145	62	Thriller
146	63	Comedy
147	63	Romance
148	64	Comedy
149	65	Action
150	65	Comedy
151	65	Horror
152	65	Thriller
153	66	Action
154	67	Comedy
155	67	Drama
156	68	Drama
157	68	War
158	69	Drama
159	69	Romance
160	70	Comedy
161	70	Drama
162	71	Action
163	71	Sci-Fi
164	71	Thriller
165	72	Action
166	72	Crime
167	72	Drama
168	72	Thriller
169	73	Drama
170	73	Thriller
171	74	Children
172	74	Drama
173	75	Crime
174	75	Drama
175	75	Romance
176	76	Comedy
177	76	Drama
178	77	Drama
179	77	Romance
180	78	Comedy
181	78	Drama
182	79	Drama
183	79	Romance
184	80	Action
185	80	Adventure
186	80	Drama
187	81	Children
188	81	Comedy
189	82	Comedy
190	83	Action
191	83	Thriller
192	84	Drama
193	85	Drama
194	85	Horror
195	85	Thriller
196	86	Comedy
197	86	Horror
198	86	Romance
199	87	Comedy
200	87	Drama
201	87	Romance
202	88	Action
203	88	Adventure
204	88	Thriller
205	89	Comedy
206	89	Drama
207	90	Crime
208	90	Drama
209	91	Drama
210	91	Thriller
211	92	Adventure
212	92	Comedy
213	92	Crime
214	92	Romance
215	93	Comedy
216	94	Mystery
217	94	Sci-Fi
218	94	Thriller
219	95	Comedy
220	96	Drama
221	96	Romance
222	97	Adventure
223	97	Children
224	97	Comedy
225	97	Musical
226	98	Documentary
227	99	Action
228	99	Drama
229	99	War
230	100	Crime
231	100	Drama
232	100	Thriller
233	101	Action
234	101	Adventure
235	101	Comedy
236	101	Crime
237	102	Drama
238	102	Mystery
239	103	Drama
240	104	Comedy
241	105	Documentary
242	106	Crime
243	106	Drama
244	107	Comedy
245	107	Romance
246	108	Drama
247	109	Comedy
248	109	Romance
249	110	Drama
250	110	Mystery
251	110	Romance
252	111	Drama
253	112	Comedy
254	113	Adventure
255	113	Children
256	113	Fantasy
257	114	Comedy
258	114	Romance
259	115	Drama
260	115	Romance
261	116	Thriller
262	117	Comedy
263	118	Documentary
264	119	Drama
265	120	Drama
266	120	Romance
267	121	Comedy
268	122	Comedy
269	123	Action
270	123	Comedy
271	123	Crime
272	123	Drama
273	123	Thriller
274	124	Adventure
275	124	Children
276	125	Drama
277	126	Crime
278	126	Drama
279	126	Thriller
280	127	Adventure
281	127	Drama
282	127	IMAX
283	128	Action
284	128	Drama
285	128	Romance
286	128	War
287	129	Drama
288	129	Horror
289	130	Action
290	130	Adventure
291	130	Comedy
292	130	Crime
293	131	Drama
294	132	Adventure
295	132	Drama
296	132	War
297	133	Comedy
298	133	Drama
299	134	Comedy
300	134	War
301	135	Adventure
302	135	Children
303	136	Crime
304	136	Drama
305	136	Mystery
306	137	Action
307	137	Adventure
308	137	Mystery
309	137	Sci-Fi
310	138	Drama
311	138	Thriller
312	138	War
313	139	Documentary
314	140	Action
315	140	Romance
316	140	Western
317	141	Crime
318	141	Film-Noir
319	141	Mystery
320	141	Thriller
321	142	Action
322	142	Crime
323	142	Thriller
324	143	Comedy
325	143	Crime
326	143	Drama
327	144	Action
328	144	Drama
329	144	Romance
330	145	Adventure
331	145	Children
332	145	Drama
333	146	Action
334	146	Adventure
335	146	Crime
336	146	Thriller
337	147	Comedy
338	147	Drama
339	148	Action
340	148	Sci-Fi
341	148	Thriller
342	149	Action
343	149	Crime
344	149	Sci-Fi
345	150	Comedy
346	151	Drama
347	152	Comedy
348	153	Horror
349	154	Comedy
350	154	Drama
351	155	Drama
352	155	Romance
353	156	Comedy
354	156	Romance
355	157	Action
356	157	Children
357	158	Drama
358	158	Romance
359	159	Comedy
360	159	Horror
361	159	Thriller
362	160	Drama
363	161	Action
364	161	Crime
365	161	Thriller
366	162	Comedy
367	162	Romance
368	163	Comedy
369	164	Fantasy
370	164	Horror
371	164	Mystery
372	165	Thriller
373	166	Drama
374	166	Romance
375	167	Drama
376	168	Comedy
377	168	Drama
378	169	Comedy
379	169	Drama
380	169	Romance
381	170	Horror
382	170	Sci-Fi
383	171	Action
384	171	Crime
385	171	Drama
386	171	Mystery
387	171	Sci-Fi
388	171	Thriller
389	172	Drama
390	172	Musical
391	172	Romance
392	173	Thriller
393	174	Drama
394	174	Fantasy
395	175	Drama
396	175	Romance
397	176	Comedy
398	177	Action
399	178	Comedy
400	178	Drama
401	179	Documentary
402	180	Drama
403	180	Romance
404	181	Action
405	181	Adventure
406	181	Sci-Fi
407	182	Drama
408	183	Western
409	184	Drama
410	185	Adventure
411	185	Comedy
412	185	Crime
413	185	Mystery
414	186	Drama
415	187	Drama
416	187	War
417	188	Drama
418	188	Romance
419	189	Comedy
420	190	Drama
421	190	Thriller
422	191	Comedy
423	191	Drama
424	192	Drama
425	193	Horror
426	194	Drama
427	194	Romance
428	195	Comedy
429	196	Comedy
430	196	Drama
431	196	Romance
432	197	Drama
433	197	Thriller
434	198	Thriller
435	199	Action
436	199	Thriller
437	200	Comedy
438	201	Drama
439	201	Thriller
440	202	Drama
441	202	Thriller
442	203	Adventure
443	203	Comedy
444	204	Comedy
445	204	Drama
446	204	Romance
447	205	Drama
448	206	Comedy
449	207	Comedy
450	207	Drama
451	208	Action
452	208	Comedy
453	208	Romance
454	209	Comedy
455	209	Romance
456	210	Adventure
457	210	Children
458	211	Animation
459	211	Children
460	211	Comedy
461	211	Romance
462	212	Thriller
463	213	Children
464	213	Drama
465	214	Drama
466	214	Musical
467	215	Children
468	215	Comedy
469	215	Fantasy
470	216	Crime
471	216	Drama
472	217	Documentary
473	218	Crime
474	218	Drama
475	219	Comedy
476	220	Drama
477	220	Romance
478	221	Children
479	221	Comedy
480	222	Action
481	223	Comedy
482	223	Romance
483	224	Drama
484	224	Horror
485	225	Drama
486	226	Comedy
487	227	Comedy
488	227	Sci-Fi
489	228	Mystery
490	228	Thriller
491	229	Adventure
492	229	Children
493	229	Comedy
494	229	Fantasy
495	229	Romance
496	230	Crime
497	230	Drama
498	230	Thriller
499	231	Action
500	231	Adventure
501	231	Sci-Fi
502	232	Drama
503	233	Children
504	233	Drama
505	234	Drama
506	235	Drama
507	235	Fantasy
508	235	Romance
509	236	Drama
510	236	Romance
511	236	War
512	236	Western
513	237	Comedy
514	238	Crime
515	238	Drama
516	239	Drama
517	240	Drama
518	240	Romance
519	241	Drama
520	242	Comedy
521	242	Drama
522	243	Drama
523	243	Horror
524	243	Sci-Fi
525	244	Comedy
526	245	Comedy
527	246	Comedy
528	246	Romance
529	247	Drama
530	248	Comedy
531	249	Drama
532	250	Drama
533	250	Thriller
534	251	Comedy
535	251	Drama
536	251	Romance
537	252	Drama
538	253	Crime
539	253	Drama
540	254	Action
541	254	Crime
542	254	Thriller
543	255	Comedy
544	255	Romance
545	256	Crime
546	256	Drama
547	257	Drama
548	257	Thriller
549	258	Action
550	258	Drama
551	258	Sci-Fi
552	258	Thriller
553	259	Action
554	259	Crime
555	259	Drama
556	259	Thriller
557	260	Comedy
558	260	Romance
559	261	Comedy
560	261	Crime
561	261	Drama
562	261	Thriller
563	262	Drama
564	263	Drama
565	264	Drama
566	265	Drama
567	265	Romance
568	266	Drama
569	266	Romance
570	267	Action
571	267	Thriller
572	267	Western
573	268	Comedy
574	268	Drama
575	269	Comedy
576	270	Drama
577	271	Drama
578	272	Comedy
579	272	Drama
580	273	Drama
581	274	Comedy
582	275	Animation
583	275	Children
584	276	Children
585	276	Drama
586	276	Fantasy
587	276	Mystery
588	277	Action
589	277	Drama
590	277	Thriller
591	278	Action
592	278	Adventure
593	278	Sci-Fi
594	279	Comedy
595	279	Drama
596	279	Fantasy
597	280	Crime
598	280	Drama
599	281	Comedy
600	281	Drama
601	281	Thriller
602	282	Film-Noir
603	282	Thriller
604	283	Drama
605	284	Comedy
606	284	Drama
607	285	Comedy
608	285	Drama
609	286	Comedy
610	287	Drama
611	288	Action
612	288	Comedy
613	288	Sci-Fi
614	289	Horror
615	289	Thriller
616	290	Adventure
617	290	Drama
618	290	Sci-Fi
619	291	Action
620	291	Crime
621	291	Horror
622	292	Drama
623	293	Horror
624	293	Sci-Fi
625	294	Comedy
626	295	Drama
627	296	Mystery
628	296	Thriller
629	297	Drama
630	297	War
631	298	Drama
632	299	Action
633	299	Sci-Fi
634	299	Thriller
635	300	Comedy
636	300	Romance
637	301	Adventure
638	301	Drama
639	301	War
640	302	Drama
641	303	Comedy
642	304	Children
643	305	Comedy
644	306	Comedy
645	306	Drama
646	307	Drama
647	307	Musical
648	308	Drama
649	308	Film-Noir
650	308	Romance
651	309	Comedy
652	310	Action
653	310	Crime
654	310	Drama
655	310	Thriller
656	311	Drama
657	311	Mystery
658	311	Thriller
659	312	Comedy
660	312	Drama
661	312	Romance
662	313	Comedy
663	313	Drama
664	314	Action
665	314	Crime
666	314	Fantasy
667	314	Thriller
668	315	Drama
669	316	Children
670	316	Comedy
671	316	Fantasy
672	317	Comedy
673	317	Drama
674	317	Romance
675	317	War
676	318	Comedy
677	318	Romance
678	319	Drama
679	320	Action
680	320	Comedy
681	321	Comedy
682	321	Drama
683	321	Romance
684	322	Adventure
685	322	Children
686	322	Romance
687	323	Documentary
688	324	Adventure
689	324	Animation
690	324	Children
691	324	Drama
692	324	Musical
693	324	IMAX
694	325	Drama
695	326	Drama
696	326	Horror
697	326	Mystery
698	326	Thriller
699	327	Action
700	327	Comedy
701	327	Crime
702	327	Fantasy
703	328	Adventure
704	328	Comedy
705	328	Western
706	329	Drama
707	330	Action
708	330	Comedy
709	331	Comedy
710	331	Drama
711	332	Comedy
712	332	Drama
713	332	Romance
714	333	Thriller
715	334	Children
716	334	Comedy
717	335	Drama
718	336	Action
719	336	Thriller
720	337	Action
721	337	Romance
722	337	Thriller
723	338	Comedy
724	338	Romance
725	339	Action
726	339	Sci-Fi
727	339	Thriller
728	340	Action
729	340	Adventure
730	340	Comedy
731	340	Romance
732	340	Thriller
733	341	Drama
734	341	Romance
735	342	Drama
736	342	Horror
737	342	Romance
738	342	Thriller
739	343	Western
740	344	Action
741	344	Crime
742	344	Drama
743	345	Drama
744	346	Drama
745	347	Action
746	347	Comedy
747	348	Drama
748	349	Drama
749	349	Romance
750	349	War
751	350	Action
752	350	Crime
753	350	Drama
754	351	Crime
755	351	Drama
756	352	Adventure
757	352	Animation
758	353	Action
759	353	Adventure
760	353	Fantasy
761	354	Drama
762	355	Documentary
763	356	Action
764	356	Fantasy
765	357	Horror
766	357	Thriller
767	358	Drama
768	359	Crime
769	359	Drama
770	360	Children
771	360	Comedy
772	360	Fantasy
773	361	Drama
774	362	Comedy
775	363	Comedy
776	364	Comedy
777	364	Thriller
778	365	Western
779	366	Comedy
780	366	Romance
781	367	Drama
782	368	Comedy
783	369	Action
784	369	Comedy
785	369	Crime
786	369	Thriller
787	370	Adventure
788	370	Children
789	370	Drama
790	371	Thriller
791	372	Action
792	372	Thriller
793	373	Drama
794	374	Drama
795	374	Romance
796	375	Horror
797	375	Sci-Fi
798	375	Thriller
799	376	Drama
800	376	Mystery
801	376	Romance
802	376	Thriller
803	377	Drama
804	378	Comedy
805	379	Comedy
806	379	Drama
807	380	Crime
808	380	Drama
809	381	Adventure
810	381	Comedy
811	381	Western
812	382	Comedy
813	383	Action
814	383	Adventure
815	383	Thriller
816	384	Comedy
817	384	Sci-Fi
818	385	Drama
819	385	Thriller
820	386	Comedy
821	387	Action
822	387	Comedy
823	387	Drama
824	388	Drama
825	389	Comedy
826	389	Romance
827	390	Comedy
828	391	Action
829	391	Adventure
830	391	Sci-Fi
831	392	Adventure
832	392	Documentary
833	393	Comedy
834	393	Romance
835	394	Comedy
836	395	Drama
837	395	Romance
838	396	Comedy
839	396	Romance
840	397	Drama
841	398	Comedy
842	399	Comedy
843	399	Drama
844	400	Drama
845	400	Mystery
846	400	Romance
847	401	Drama
848	402	Comedy
849	402	Romance
850	403	Drama
851	403	Thriller
852	404	Adventure
853	404	Children
854	404	Drama
855	405	Crime
856	405	Drama
857	405	Thriller
858	406	Thriller
859	407	Drama
860	407	Western
861	408	Action
862	408	Adventure
863	408	Crime
864	408	Drama
865	408	Romance
866	408	Thriller
867	409	Comedy
868	410	Drama
869	410	Romance
870	411	Crime
871	411	Drama
872	411	Thriller
873	412	Action
874	412	Adventure
875	412	Crime
876	412	Thriller
877	413	Action
878	413	Drama
879	413	War
880	414	Action
881	414	Comedy
882	414	War
883	415	Comedy
884	416	Comedy
885	416	Romance
886	417	Drama
887	417	Romance
888	418	Comedy
889	419	Comedy
890	420	Comedy
891	420	Drama
892	421	Comedy
893	421	War
894	422	Action
895	422	Thriller
896	423	Drama
897	424	Comedy
898	424	Drama
899	425	Drama
900	425	Musical
901	426	Action
902	426	Crime
903	426	Thriller
904	427	Action
905	427	Adventure
906	427	Sci-Fi
907	427	Thriller
908	428	Drama
909	428	Thriller
910	429	Crime
911	429	Drama
912	429	Thriller
913	430	Drama
914	431	Action
915	431	Adventure
916	431	Comedy
917	431	Fantasy
918	432	Comedy
919	433	Comedy
920	433	Western
921	434	Drama
922	434	Romance
923	435	Comedy
924	436	Thriller
925	437	Drama
926	438	Comedy
927	438	Mystery
928	439	Action
929	439	Crime
930	439	Drama
931	440	Action
932	440	Adventure
933	440	Thriller
934	441	Drama
935	442	Comedy
936	442	Drama
937	442	Romance
938	442	Thriller
939	443	Comedy
940	443	Romance
941	444	Drama
942	444	Romance
943	445	Comedy
944	445	Romance
945	446	Comedy
946	446	Drama
947	447	Drama
948	448	Action
949	448	Children
950	448	Romance
951	449	Action
952	449	Drama
953	449	Sci-Fi
954	450	Comedy
955	451	Drama
956	451	Fantasy
957	451	Romance
958	452	Crime
959	452	Drama
960	452	Thriller
961	453	Drama
962	454	Drama
963	454	Romance
964	455	Drama
965	456	Action
966	456	Drama
967	457	Horror
968	457	Sci-Fi
969	458	Comedy
970	458	Mystery
971	458	Romance
972	459	Comedy
973	460	Drama
974	460	Romance
975	461	Comedy
976	461	Drama
977	462	Action
978	462	Drama
979	462	Mystery
980	463	Comedy
981	464	Action
982	464	Crime
983	464	Drama
984	464	Sci-Fi
985	464	Thriller
986	465	Comedy
987	466	Crime
988	466	Thriller
989	467	Action
990	467	Drama
991	468	Drama
992	469	Drama
993	470	Drama
994	471	Drama
995	472	Drama
996	472	War
997	473	Comedy
998	473	Drama
999	474	Drama
1000	475	Children
1001	475	Drama
1002	476	Comedy
1003	476	Crime
1004	476	Horror
1005	477	Action
1006	477	Adventure
1007	477	Fantasy
1008	477	Mystery
1009	478	Drama
1010	478	Romance
1011	479	Drama
1012	480	Drama
1013	481	Drama
1014	482	Drama
1015	483	Comedy
1016	483	Drama
1017	483	Romance
1018	484	Thriller
1019	485	Action
1020	485	Sci-Fi
1021	485	Thriller
1022	486	Comedy
1023	486	Drama
1024	486	Romance
1025	487	Comedy
1026	487	Romance
1027	487	Thriller
1028	488	Action
1029	488	Crime
1030	489	Drama
1031	490	Action
1032	490	Adventure
1033	490	Children
1034	490	Comedy
1035	490	Fantasy
1036	490	Sci-Fi
1037	491	Action
1038	491	Adventure
1039	491	Thriller
1040	492	Action
1041	492	Mystery
1042	492	Thriller
1043	493	Drama
1044	493	Musical
1045	494	Comedy
1046	494	Romance
1047	495	Animation
1048	495	Children
1049	495	Fantasy
1050	495	Musical
1051	496	Action
1052	496	Adventure
1053	496	Comedy
1054	496	Romance
1055	497	Action
1056	497	Drama
1057	497	Western
1058	498	Crime
1059	498	Drama
1060	498	Thriller
1061	499	Crime
1062	499	Thriller
1063	500	Documentary
1064	501	Action
1065	501	Adventure
1066	501	Animation
1067	501	Children
1068	501	Fantasy
1069	502	Drama
1070	503	Comedy
1071	503	Drama
1072	504	Drama
1073	504	Romance
1074	505	Drama
1075	505	Horror
1076	506	Comedy
1077	506	Romance
1078	507	Comedy
1079	507	Drama
1080	508	Comedy
1081	508	Drama
1082	509	Comedy
1083	509	Drama
1084	510	Comedy
1085	510	Drama
1086	511	Drama
1087	511	Romance
1088	512	Drama
1089	513	Comedy
1090	513	Drama
1091	514	Children
1092	514	Comedy
1093	515	Adventure
1094	515	Children
1095	515	Drama
1096	516	Drama
1097	517	Documentary
1098	518	Comedy
1099	518	Drama
1100	519	Comedy
1101	520	Children
1102	520	Comedy
1103	521	Comedy
1104	521	Drama
1105	521	Fantasy
1106	521	Romance
1107	521	Thriller
1108	522	Adventure
1109	522	Animation
1110	522	Children
1111	522	Comedy
1112	522	Musical
1113	523	Action
1114	523	Sci-Fi
1115	524	Adventure
1116	524	Drama
1117	524	Western
1118	525	Action
1119	525	Crime
1120	525	Thriller
1121	526	Crime
1122	526	Horror
1123	526	Thriller
1124	527	Animation
1125	527	Children
1126	527	Drama
1127	527	Fantasy
1128	527	Musical
1129	528	Animation
1130	528	Children
1131	528	Fantasy
1132	528	Musical
1133	528	Romance
1134	528	IMAX
1135	529	Animation
1136	529	Children
1137	529	Fantasy
1138	529	Musical
1139	530	Comedy
1140	530	Romance
1141	531	Adventure
1142	531	Western
1143	532	Action
1144	532	Comedy
1145	532	Crime
1146	533	Drama
1147	534	Documentary
1148	535	Comedy
1149	536	Drama
1150	536	Romance
1151	537	Fantasy
1152	537	Horror
1153	538	Comedy
1154	538	Crime
1155	538	Drama
1156	538	Thriller
1157	539	Adventure
1158	539	Children
1159	540	Action
1160	540	Adventure
1161	540	Animation
1162	540	Horror
1163	540	Sci-Fi
1164	541	Action
1165	541	Horror
1166	541	Sci-Fi
1167	542	Comedy
1168	543	Drama
1169	543	Romance
1170	544	Drama
1171	544	Thriller
1172	545	Comedy
1173	545	Drama
1174	546	Animation
1175	546	Children
1176	547	Comedy
1177	547	Drama
1178	548	Comedy
1179	548	Romance
1180	549	Comedy
1181	550	Drama
1182	551	Comedy
1183	552	Drama
1184	552	Thriller
1185	553	Crime
1186	553	Drama
1187	553	Mystery
1188	553	Thriller
1189	554	Drama
1190	554	Romance
1191	555	Adventure
1192	555	Animation
1193	555	Children
1194	555	Fantasy
1195	555	Musical
1196	555	Romance
1197	556	Drama
1198	556	War
1199	557	Comedy
1200	558	Comedy
1201	559	Comedy
1202	559	Drama
1203	560	Comedy
1204	561	Romance
1205	562	Comedy
1206	562	Drama
1207	563	Drama
1208	563	Thriller
1209	564	Action
1210	564	Crime
1211	564	Drama
1212	564	War
1213	565	Action
1214	565	Adventure
1215	565	Mystery
1216	565	Thriller
1217	566	Comedy
1218	566	Drama
1219	567	Drama
1220	568	Action
1221	568	Adventure
1222	568	Fantasy
1223	569	Comedy
1224	570	Crime
1225	570	Drama
1226	570	Thriller
1227	571	Drama
1228	572	Adventure
1229	572	Animation
1230	572	Children
1231	572	Fantasy
1232	572	Musical
1233	573	Thriller
1234	574	Comedy
1235	575	Comedy
1236	576	Comedy
1237	576	Drama
1238	576	War
1239	577	Action
1240	578	Drama
1241	579	Drama
1242	580	Comedy
1243	580	Sci-Fi
1244	581	Adventure
1245	581	Animation
1246	581	Children
1247	581	Comedy
1248	581	Fantasy
1249	581	Sci-Fi
1250	582	Adventure
1251	582	Comedy
1252	582	Sci-Fi
1253	583	Drama
1254	583	Thriller
1255	584	Drama
1256	585	Drama
1257	585	Mystery
1258	585	Romance
1259	585	Sci-Fi
1260	585	Thriller
1261	586	Crime
1262	587	Drama
1263	588	Action
1264	588	Adventure
1265	588	Comedy
1266	588	War
1267	589	Drama
1268	589	Romance
1269	590	Comedy
1270	590	Romance
1271	591	Action
1272	591	Sci-Fi
1273	591	Thriller
1274	592	Action
1275	592	Crime
1276	592	Drama
1277	593	Mystery
1278	593	Thriller
1279	594	Drama
1280	594	Romance
1281	595	Comedy
1282	596	Drama
1283	597	Drama
1284	598	Action
1285	598	Adventure
1286	599	Comedy
1287	600	Drama
1288	601	Crime
1289	601	Drama
1290	601	Thriller
1291	602	Comedy
1292	602	Romance
1293	603	Adventure
1294	603	Animation
1295	603	Children
1296	603	Comedy
1297	603	Musical
1298	604	Comedy
1299	605	Adventure
1300	605	Children
1301	606	Crime
1302	606	Drama
1303	606	Romance
1304	606	Thriller
1305	607	Drama
1306	607	Mystery
1307	607	Western
1308	608	Drama
1309	608	Romance
1310	609	Crime
1311	610	Comedy
1312	610	Fantasy
1313	610	Sci-Fi
1314	611	Comedy
1315	612	Adventure
1316	612	Animation
1317	612	Comedy
1318	613	Documentary
1319	614	Drama
1320	614	Fantasy
1321	614	Horror
1322	614	Thriller
1323	615	Comedy
1324	616	Drama
1325	617	Comedy
1326	618	Crime
1327	618	Thriller
1328	619	Crime
1329	620	Action
1330	620	Adventure
1331	620	Thriller
1332	621	Horror
1333	622	Action
1334	622	Adventure
1335	622	Romance
1336	622	Thriller
1337	623	Action
1338	623	Sci-Fi
1339	624	Animation
1340	624	Sci-Fi
1341	625	Horror
1342	625	Thriller
1343	626	Comedy
1344	627	Animation
1345	627	Children
1346	627	Comedy
1347	628	Film-Noir
1348	629	Comedy
1349	630	Action
1350	630	Sci-Fi
1351	630	Thriller
1352	631	Comedy
1353	631	War
1354	632	Comedy
1355	632	Drama
1356	632	Romance
1357	633	Adventure
1358	633	Children
1359	634	Children
1360	634	Drama
1361	635	Drama
1362	636	Documentary
1363	637	Drama
1364	637	War
1365	638	Action
1366	638	Adventure
1367	639	Comedy
1368	639	Crime
1369	640	Drama
1370	640	Romance
1371	641	Comedy
1372	641	Drama
1373	642	Drama
1374	643	Comedy
1375	643	Drama
1376	644	Documentary
1377	645	Comedy
1378	645	Crime
1379	645	Drama
1380	646	Drama
1381	646	Romance
1382	647	Action
1383	647	Adventure
1384	647	Sci-Fi
1385	647	Thriller
1386	648	Drama
1387	649	Drama
1388	649	Thriller
1389	650	Animation
1390	650	Children
1391	650	Drama
1392	650	Musical
1393	650	Romance
1394	651	Comedy
1395	651	Thriller
1396	652	Comedy
1397	653	Action
1398	653	Drama
1399	653	Thriller
1400	654	Comedy
1401	654	Fantasy
1402	654	Romance
1403	654	Sci-Fi
1404	655	Action
1405	655	Adventure
1406	655	Drama
1407	655	Thriller
1408	656	Comedy
1409	656	Horror
1410	656	Thriller
1411	657	Drama
1412	657	Mystery
1413	657	Western
1414	658	Children
1415	658	Comedy
1416	659	Drama
1417	659	Romance
1418	660	Comedy
1419	660	Drama
1420	660	Romance
1421	661	Comedy
1422	661	Romance
1423	662	Drama
1424	662	Thriller
1425	663	Crime
1426	663	Drama
1427	664	Comedy
1428	664	Romance
1429	665	Adventure
1430	665	Children
1431	666	Action
1432	666	Adventure
1433	667	Children
1434	667	Comedy
1435	667	Fantasy
1436	668	Comedy
1437	669	Comedy
1438	670	Drama
1439	671	Drama
1440	671	Mystery
1441	672	Drama
1442	673	Adventure
1443	673	Children
1444	674	Comedy
1445	674	Fantasy
1446	674	Musical
1447	675	Comedy
1448	676	Drama
1449	677	Crime
1450	677	Thriller
1451	678	Comedy
1452	679	Comedy
1453	680	Drama
1454	681	Action
1455	681	Adventure
1456	681	Thriller
1457	682	Children
1458	682	Comedy
1459	682	Fantasy
1460	683	Comedy
1461	683	Drama
1462	683	Romance
1463	684	Action
1464	684	Thriller
1465	685	Children
1466	685	Comedy
1467	686	Horror
1468	687	Comedy
1469	687	Horror
1470	688	Drama
1471	689	Drama
1472	690	Drama
1473	691	Action
1474	691	Adventure
1475	691	Sci-Fi
1476	691	Thriller
1477	692	Crime
1478	692	Drama
1479	693	Drama
1480	694	Comedy
1481	694	Drama
1482	694	Romance
1483	695	Drama
1484	696	Crime
1485	696	Drama
1486	697	Action
1487	697	Comedy
1488	697	Crime
1489	697	Thriller
1490	698	Drama
1491	699	Drama
1492	700	Crime
1493	700	Drama
1494	700	Romance
1495	700	Thriller
1496	701	Comedy
1497	701	Crime
1498	702	Comedy
1499	703	Crime
1500	703	Drama
1501	703	Musical
1502	703	Thriller
1503	704	Comedy
1504	705	Action
1505	705	Crime
1506	705	Drama
1507	706	Action
1508	706	Comedy
1509	706	Crime
1510	706	Thriller
1511	707	Horror
1512	707	Thriller
1513	708	Sci-Fi
1514	708	Thriller
1515	709	Children
1516	709	Comedy
1517	710	Drama
1518	710	Thriller
1519	711	Children
1520	711	Drama
1521	711	Fantasy
1522	712	Action
1523	712	Comedy
1524	712	Crime
1525	713	Adventure
1526	713	Animation
1527	713	Children
1528	713	Musical
1529	714	Thriller
1530	715	Horror
1531	715	Thriller
1532	716	Comedy
1533	716	Drama
1534	716	Romance
1535	717	Drama
1536	718	Drama
1537	719	Adventure
1538	719	Drama
1539	719	Romance
1540	719	War
1541	720	Comedy
1542	720	Drama
1543	720	Romance
1544	721	Comedy
1545	721	Musical
1546	721	Romance
1547	722	Musical
1548	722	Romance
1549	723	Comedy
1550	723	Musical
1551	724	Drama
1552	724	Romance
1553	725	Drama
1554	725	Mystery
1555	725	Romance
1556	725	Thriller
1557	726	Mystery
1558	726	Thriller
1559	727	Comedy
1560	727	Romance
1561	728	Drama
1562	728	Thriller
1563	729	Comedy
1564	729	Musical
1565	729	Romance
1566	730	Action
1567	730	Adventure
1568	730	Mystery
1569	730	Romance
1570	730	Thriller
1571	731	Comedy
1572	731	Drama
1573	731	Romance
1574	732	Comedy
1575	732	Crime
1576	733	Comedy
1577	733	Crime
1578	733	Mystery
1579	733	Romance
1580	733	Thriller
1581	734	Drama
1582	734	Romance
1583	735	Film-Noir
1584	735	Mystery
1585	736	Comedy
1586	736	Drama
1587	736	Musical
1588	736	Romance
1589	737	Comedy
1590	737	Romance
1591	738	Comedy
1592	738	Drama
1593	738	Romance
1594	739	Children
1595	739	Drama
1596	740	Musical
1597	741	Adventure
1598	741	Children
1599	741	Fantasy
1600	741	Musical
1601	742	Drama
1602	742	Romance
1603	742	War
1604	743	Comedy
1605	744	Drama
1606	744	Film-Noir
1607	744	Romance
1608	745	Drama
1609	745	Mystery
1610	746	Adventure
1611	746	Drama
1612	746	Sci-Fi
1613	747	Drama
1614	748	Comedy
1615	749	Drama
1616	749	Mystery
1617	749	Romance
1618	749	Thriller
1619	750	Drama
1620	750	Film-Noir
1621	750	Mystery
1622	750	Thriller
1623	751	Film-Noir
1624	751	Romance
1625	751	Thriller
1626	752	Mystery
1627	752	Romance
1628	752	Thriller
1629	753	Drama
1630	753	Romance
1631	754	Crime
1632	754	Mystery
1633	754	Romance
1634	754	Thriller
1635	755	Comedy
1636	756	Comedy
1637	756	Musical
1638	757	Comedy
1639	757	Romance
1640	758	Comedy
1641	758	Romance
1642	759	Musical
1643	760	Comedy
1644	760	Drama
1645	761	Action
1646	761	Adventure
1647	761	Romance
1648	762	Adventure
1649	763	Crime
1650	763	Film-Noir
1651	763	Mystery
1652	764	Drama
1653	764	Fantasy
1654	764	Romance
1655	765	Drama
1656	766	Comedy
1657	766	Musical
1658	766	Romance
1659	767	Comedy
1660	767	Drama
1661	767	War
1662	768	Comedy
1663	768	Romance
1664	769	Drama
1665	769	Romance
1666	769	Western
1667	770	Drama
1668	771	Comedy
1669	771	Crime
1670	772	Comedy
1671	772	Romance
1672	773	Adventure
1673	773	Comedy
1674	774	Drama
1675	774	Fantasy
1676	774	Romance
1677	775	Drama
1678	776	Comedy
1679	776	Romance
1680	777	Drama
1681	777	Romance
1682	778	Drama
1683	779	Comedy
1684	779	Mystery
1685	780	Drama
1686	781	Crime
1687	781	Drama
1688	782	Drama
1689	783	Musical
1690	784	Romance
1691	784	Western
1692	785	Drama
1693	785	Mystery
1694	785	Thriller
1695	786	War
1696	787	Western
1697	788	Horror
1698	788	Sci-Fi
1699	788	Thriller
1700	789	Adventure
1701	789	Comedy
1702	789	Romance
1703	789	War
1704	790	Adventure
1705	790	Comedy
1706	790	Crime
1707	790	Drama
1708	790	Romance
1709	791	Drama
1710	792	Drama
1711	793	Comedy
1712	793	Drama
1713	794	Drama
1714	794	Romance
1715	795	Romance
1716	795	War
1717	796	Drama
1718	796	War
1719	797	Action
1720	798	Drama
1721	799	Drama
1722	800	Adventure
1723	800	Children
1724	801	Drama
1725	801	Romance
1726	802	Comedy
1727	802	Drama
1728	803	Action
1729	803	Adventure
1730	803	Thriller
1731	804	Drama
1732	805	Drama
1733	806	Comedy
1734	806	Drama
1735	807	Action
1736	807	Crime
1737	807	Drama
1738	807	Thriller
1739	808	Drama
1740	808	Thriller
1741	809	Action
1742	809	Crime
1743	810	Crime
1744	810	Film-Noir
1745	811	Crime
1746	812	Drama
1747	812	Thriller
1748	813	Action
1749	813	Thriller
1750	814	Children
1751	814	Comedy
1752	815	Drama
1753	816	Children
1754	816	Comedy
1755	816	Western
1756	817	Adventure
1757	817	Western
1758	818	Adventure
1759	818	Children
1760	818	Fantasy
1761	819	Children
1762	819	Comedy
1763	820	Adventure
1764	820	Children
1765	820	Comedy
1766	821	Children
1767	821	Drama
1768	822	Children
1769	822	Comedy
1770	822	Romance
1771	823	Children
1772	823	Comedy
1773	823	Drama
1774	824	Adventure
1775	824	Children
1776	824	Drama
1777	825	Children
1778	825	Comedy
1779	826	Adventure
1780	826	Children
1781	827	Children
1782	827	Comedy
1783	827	Mystery
1784	828	Adventure
1785	828	Drama
1786	828	Sci-Fi
1787	829	Comedy
1788	830	Children
1789	830	Comedy
1790	831	Animation
1791	831	Children
1792	831	Fantasy
1793	831	Musical
1794	831	Romance
1795	832	Animation
1796	832	Children
1797	832	Musical
1798	833	Animation
1799	833	Children
1800	833	Musical
1801	834	Animation
1802	834	Children
1803	834	Fantasy
1804	834	Musical
1805	835	Adventure
1806	835	Drama
1807	836	Children
1808	836	Comedy
1809	836	Fantasy
1810	836	Musical
1811	837	Animation
1812	837	Children
1813	837	Drama
1814	837	Musical
1815	838	Adventure
1816	838	Animation
1817	838	Children
1818	838	Musical
1819	839	Adventure
1820	839	Children
1821	839	Musical
1822	840	Adventure
1823	840	Animation
1824	840	Children
1825	840	Fantasy
1826	840	Musical
1827	841	Animation
1828	841	Children
1829	841	Drama
1830	842	Comedy
1831	842	Crime
1832	842	Drama
1833	842	Thriller
1834	843	Musical
1835	843	Romance
1836	844	Action
1837	844	Crime
1838	844	Thriller
1839	845	Action
1840	845	Horror
1841	845	Sci-Fi
1842	845	Thriller
1843	846	Drama
1844	847	Drama
1845	848	Drama
1846	849	Comedy
1847	849	Drama
1848	850	Drama
1849	850	Romance
1850	851	Drama
1851	852	Drama
1852	852	Romance
1853	853	Action
1854	853	Drama
1855	853	Thriller
1856	854	Action
1857	854	Adventure
1858	855	Documentary
1859	855	Drama
1860	856	Drama
1861	857	Crime
1862	857	Drama
1863	857	Romance
1864	858	Drama
1865	859	Drama
1866	860	Comedy
1867	860	Musical
1868	860	Romance
1869	861	Drama
1870	862	Drama
1871	862	Romance
1872	863	Comedy
1873	863	Drama
1874	864	Thriller
1875	865	Drama
1876	866	Animation
1877	866	Children
1878	866	Comedy
1879	866	Fantasy
1880	866	Musical
1881	866	Romance
1882	867	Comedy
1883	867	Musical
1884	867	Romance
1885	868	Comedy
1886	868	Musical
1887	868	Romance
1888	869	Crime
1889	869	Film-Noir
1890	870	Crime
1891	870	Film-Noir
1892	870	Thriller
1893	871	Adventure
1894	872	Romance
1895	872	War
1896	873	Children
1897	873	Comedy
1898	873	Fantasy
1899	873	Musical
1900	874	Drama
1901	874	Horror
1902	874	Thriller
1903	875	Comedy
1904	875	Sci-Fi
1905	876	Comedy
1906	876	War
1907	877	Comedy
1908	877	Crime
1909	878	Comedy
1910	879	Comedy
1911	879	Musical
1912	879	Romance
1913	880	Drama
1914	881	Comedy
1915	881	Musical
1916	882	Crime
1917	882	Drama
1918	883	Adventure
1919	883	Drama
1920	884	Crime
1921	884	Mystery
1922	884	Thriller
1923	885	Musical
1924	886	Drama
1925	886	Musical
1926	886	Romance
1927	887	Crime
1928	887	Mystery
1929	887	Thriller
1930	888	Drama
1931	888	War
1932	889	Comedy
1933	890	Crime
1934	890	Mystery
1935	890	Thriller
1936	891	Drama
1937	892	Drama
1938	892	Romance
1939	892	Thriller
1940	893	Drama
1941	894	Drama
1942	895	Children
1943	895	Drama
1944	895	Sci-Fi
1945	896	Children
1946	896	Drama
1947	896	Fantasy
1948	897	Action
1949	897	Drama
1950	897	Romance
1951	898	Action
1952	898	Romance
1953	899	Drama
1954	900	Drama
1955	901	Horror
1956	902	Documentary
1957	903	Action
1958	903	Comedy
1959	903	Drama
1960	904	Comedy
1961	905	Crime
1962	905	Drama
1963	906	Drama
1964	907	Drama
1965	908	Drama
1966	909	Comedy
1967	909	Drama
1968	910	Drama
1969	911	Documentary
1970	912	Drama
1971	913	Comedy
1972	913	Crime
1973	914	Comedy
1974	914	Fantasy
1975	915	Action
1976	915	Adventure
1977	915	Sci-Fi
1978	915	Thriller
1979	916	Horror
1980	917	Action
1981	917	Adventure
1982	917	Sci-Fi
1983	917	Thriller
1984	918	Horror
1985	918	Mystery
1986	919	Drama
1987	919	Mystery
1988	920	Drama
1989	921	Comedy
1990	921	Drama
1991	922	Comedy
1992	923	Adventure
1993	923	Comedy
1994	923	Fantasy
1995	924	Documentary
1996	925	Documentary
1997	926	Animation
1998	926	Children
1999	926	Comedy
2000	926	Crime
2001	927	Drama
2002	928	Crime
2003	928	Film-Noir
2004	928	Thriller
2005	929	Film-Noir
2006	930	Film-Noir
2007	931	Drama
2008	932	Drama
2009	932	War
2010	933	Comedy
2011	933	Drama
2012	934	Comedy
2013	935	Action
2014	935	Adventure
2015	935	Horror
2016	936	Documentary
2017	937	Action
2018	938	Comedy
2019	939	Drama
2020	940	Comedy
2021	940	Drama
2022	941	Comedy
2023	941	Drama
2024	941	Romance
2025	942	Drama
2026	942	Fantasy
2027	942	Romance
2028	943	Drama
2029	943	Romance
2030	944	Drama
2031	944	War
2032	945	Crime
2033	945	Drama
2034	945	Film-Noir
2035	946	Comedy
2036	947	Drama
2037	947	Romance
2038	947	War
2039	948	Comedy
2040	948	Drama
2041	949	Drama
2042	950	Drama
2043	951	Drama
2044	952	Comedy
2045	952	Romance
2046	953	Documentary
2047	954	Crime
2048	954	Drama
2049	954	Romance
2050	955	Documentary
2051	955	Musical
2052	956	Documentary
2053	957	Drama
2054	958	Comedy
2055	959	Action
2056	959	Adventure
2057	959	Sci-Fi
2058	960	Action
2059	960	Adventure
2060	960	Comedy
2061	960	Fantasy
2062	960	Romance
2063	961	Action
2064	961	Adventure
2065	962	Fantasy
2066	962	Sci-Fi
2067	963	Action
2068	963	Adventure
2069	963	Horror
2070	963	Sci-Fi
2071	964	Action
2072	964	Adventure
2073	964	Western
2074	965	Comedy
2075	966	Drama
2076	967	Adventure
2077	967	Drama
2078	967	War
2079	968	Crime
2080	968	Drama
2081	968	Sci-Fi
2082	968	Thriller
2083	969	Drama
2084	970	Action
2085	970	Drama
2086	970	War
2087	971	Action
2088	971	Drama
2089	971	Western
2090	972	Action
2091	972	Adventure
2092	972	Sci-Fi
2093	973	Drama
2094	973	Fantasy
2095	973	Romance
2096	974	Film-Noir
2097	974	Mystery
2098	974	Thriller
2099	975	Crime
2100	975	Drama
2101	976	Horror
2102	976	Sci-Fi
2103	977	Action
2104	977	Adventure
2105	977	Comedy
2106	977	Fantasy
2107	977	Horror
2108	978	Adventure
2109	978	Drama
2110	978	Romance
2111	979	Drama
2112	979	War
2113	980	Action
2114	980	Crime
2115	980	Drama
2116	980	Thriller
2117	981	Crime
2118	981	Horror
2119	982	Action
2120	982	Comedy
2121	982	Musical
2122	983	Crime
2123	983	Drama
2124	984	Drama
2125	984	War
2126	985	Adventure
2127	985	Animation
2128	985	Children
2129	985	Comedy
2130	985	Sci-Fi
2131	986	Action
2132	986	Drama
2133	986	Romance
2134	986	War
2135	987	Drama
2136	988	Drama
2137	988	Romance
2138	989	Crime
2139	989	Drama
2140	990	Drama
2141	991	Comedy
2142	991	Romance
2143	992	Drama
2144	993	Drama
2145	993	Mystery
2146	993	Sci-Fi
2147	994	Action
2148	994	Drama
2149	994	War
2150	995	Comedy
2151	995	Crime
2152	996	Comedy
2153	996	Drama
2154	996	Romance
2155	997	Comedy
2156	997	Drama
2157	997	Romance
2158	998	Drama
2159	999	Comedy
2160	1000	Action
2161	1000	Sci-Fi
2162	1000	Thriller
2163	1001	Comedy
2164	1001	Fantasy
2165	1001	Horror
2166	1002	Drama
2167	1002	War
2168	1003	Comedy
2169	1003	Drama
2170	1004	Comedy
2171	1004	Drama
2172	1004	Romance
2173	1005	Crime
2174	1005	Drama
2175	1005	Film-Noir
2176	1005	Thriller
2177	1006	Drama
2178	1007	Comedy
2179	1007	Drama
2180	1007	Romance
2181	1008	Crime
2182	1008	Film-Noir
2183	1008	Thriller
2184	1009	Action
2185	1009	Crime
2186	1009	Romance
2187	1009	Thriller
2188	1010	Adventure
2189	1010	Drama
2190	1010	War
2191	1011	Drama
2192	1011	Fantasy
2193	1012	Crime
2194	1012	Film-Noir
2195	1012	Mystery
2196	1012	Thriller
2197	1013	Drama
2198	1013	Sci-Fi
2199	1013	Thriller
2200	1014	Action
2201	1014	Adventure
2202	1014	Drama
2203	1014	Western
2204	1015	Comedy
2205	1015	Horror
2206	1015	Sci-Fi
2207	1016	Comedy
2208	1016	Musical
2209	1016	War
2210	1017	Comedy
2211	1017	Romance
2212	1018	Horror
2213	1019	Adventure
2214	1019	Drama
2215	1020	Crime
2216	1020	Film-Noir
2217	1020	Thriller
2218	1021	Action
2219	1021	Comedy
2220	1021	Fantasy
2221	1021	Horror
2222	1022	Action
2223	1022	Adventure
2224	1022	Drama
2225	1022	War
2226	1023	Drama
2227	1023	War
2228	1024	Action
2229	1024	Drama
2230	1024	Mystery
2231	1024	Romance
2232	1024	Thriller
2233	1025	Comedy
2234	1025	Fantasy
2235	1025	Romance
2236	1026	Drama
2237	1026	Western
2238	1027	Crime
2239	1027	Thriller
2240	1027	War
2241	1028	Comedy
2242	1028	Drama
2243	1029	Comedy
2244	1029	Mystery
2245	1029	Thriller
2246	1030	Adventure
2247	1030	Comedy
2248	1030	Sci-Fi
2249	1031	Comedy
2250	1031	Crime
2251	1031	Drama
2252	1032	Drama
2253	1032	War
2254	1033	Comedy
2255	1033	Drama
2256	1033	Film-Noir
2257	1034	Action
2258	1034	Adventure
2259	1034	Animation
2260	1034	Sci-Fi
2261	1035	Action
2262	1035	Adventure
2263	1035	Fantasy
2264	1036	Drama
2265	1037	Comedy
2266	1037	Drama
2267	1037	Romance
2268	1038	Comedy
2269	1038	Fantasy
2270	1039	Comedy
2271	1039	Drama
2272	1040	Drama
2273	1041	Comedy
2274	1041	Drama
2275	1041	War
2276	1042	Animation
2277	1042	Children
2278	1042	Fantasy
2279	1042	Musical
2280	1043	Drama
2281	1043	Western
2282	1044	Crime
2283	1044	Film-Noir
2284	1044	Mystery
2285	1045	Comedy
2286	1046	Drama
2287	1046	Romance
2288	1047	Action
2289	1047	Adventure
2290	1047	Drama
2291	1048	Comedy
2292	1049	Documentary
2293	1050	Drama
2294	1050	Romance
2295	1051	Action
2296	1051	Adventure
2297	1052	Comedy
2298	1052	Drama
2299	1053	Drama
2300	1054	Drama
2301	1055	Drama
2302	1055	Romance
2303	1056	Comedy
2304	1057	Drama
2305	1057	Musical
2306	1058	Drama
2307	1058	War
2308	1059	Comedy
2309	1059	Drama
2310	1060	Drama
2311	1060	Sci-Fi
2312	1061	Children
2313	1061	Drama
2314	1061	Fantasy
2315	1062	Adventure
2316	1062	Drama
2317	1063	Action
2318	1063	Western
2319	1064	Drama
2320	1064	Romance
2321	1065	Adventure
2322	1065	Drama
2323	1065	Sci-Fi
2324	1066	Comedy
2325	1066	Romance
2326	1067	Comedy
2327	1068	Drama
2328	1069	Comedy
2329	1070	Comedy
2330	1070	Drama
2331	1071	Action
2332	1071	Horror
2333	1071	Sci-Fi
2334	1071	Thriller
2335	1072	Comedy
2336	1072	Horror
2337	1072	Thriller
2338	1073	Horror
2339	1074	Horror
2340	1075	Horror
2341	1076	Horror
2342	1077	Horror
2343	1078	Drama
2344	1078	Horror
2345	1078	Mystery
2346	1078	Thriller
2347	1079	Horror
2348	1080	Horror
2349	1081	Horror
2350	1082	Horror
2351	1082	Thriller
2352	1083	Horror
2353	1083	Thriller
2354	1084	Horror
2355	1084	Sci-Fi
2356	1085	Horror
2357	1085	Thriller
2358	1086	Drama
2359	1086	Horror
2360	1086	Thriller
2361	1087	Fantasy
2362	1087	Horror
2363	1087	Romance
2364	1087	Thriller
2365	1088	Drama
2366	1088	Horror
2367	1088	Sci-Fi
2368	1089	Horror
2369	1089	Thriller
2370	1090	Thriller
2371	1091	Crime
2372	1091	Drama
2373	1091	Thriller
2374	1092	Drama
2375	1092	Fantasy
2376	1092	Horror
2377	1092	Thriller
2378	1093	Drama
2379	1093	Fantasy
2380	1093	Horror
2381	1094	Horror
2382	1094	Thriller
2383	1095	Horror
2384	1096	Horror
2385	1097	Horror
2386	1097	Mystery
2387	1097	Thriller
2388	1098	Crime
2389	1098	Drama
2390	1098	Thriller
2391	1099	Crime
2392	1099	Thriller
2393	1100	Comedy
2394	1100	Drama
2395	1100	Romance
2396	1101	Drama
2397	1101	Mystery
2398	1102	Horror
2399	1102	Thriller
2400	1103	Action
2401	1103	Adventure
2402	1103	Sci-Fi
2403	1103	Thriller
2404	1104	Drama
2405	1104	Romance
2406	1105	Drama
2407	1106	Children
2408	1106	Comedy
2409	1107	Documentary
2410	1108	Drama
2411	1109	Drama
2412	1110	Drama
2413	1111	Adventure
2414	1111	Children
2415	1111	Comedy
2416	1112	Action
2417	1112	Adventure
2418	1112	Thriller
2419	1113	Adventure
2420	1113	Sci-Fi
2421	1114	Action
2422	1114	Mystery
2423	1114	Sci-Fi
2424	1115	Action
2425	1115	Sci-Fi
2426	1116	Action
2427	1116	Adventure
2428	1116	Sci-Fi
2429	1116	Thriller
2430	1117	Action
2431	1117	Adventure
2432	1117	Sci-Fi
2433	1118	Adventure
2434	1118	Comedy
2435	1118	Sci-Fi
2436	1119	Action
2437	1119	Crime
2438	1120	Action
2439	1120	Comedy
2440	1120	Western
2441	1121	Action
2442	1121	Western
2443	1122	Comedy
2444	1122	Musical
2445	1122	Romance
2446	1123	Comedy
2447	1123	Musical
2448	1123	Romance
2449	1124	Action
2450	1124	Drama
2451	1125	Action
2452	1125	Drama
2453	1125	Thriller
2454	1126	Western
2455	1127	Action
2456	1127	Horror
2457	1128	Horror
2458	1128	Thriller
2459	1129	Action
2460	1129	Horror
2461	1130	Comedy
2462	1131	Action
2463	1131	Comedy
2464	1131	Sci-Fi
2465	1132	Comedy
2466	1132	Drama
2467	1133	Drama
2468	1133	Romance
2469	1134	Comedy
2470	1135	Comedy
2471	1135	Drama
2472	1136	Action
2473	1136	Comedy
2474	1136	Crime
2475	1136	Drama
2476	1136	Sci-Fi
2477	1137	Drama
2478	1138	Romance
2479	1138	War
2480	1139	Drama
2481	1140	Drama
2482	1141	Crime
2483	1141	Drama
2484	1142	Adventure
2485	1142	Animation
2486	1142	Comedy
2487	1142	Crime
2488	1143	Crime
2489	1143	Drama
2490	1143	Mystery
2491	1143	Thriller
2492	1144	Comedy
2493	1144	Horror
2494	1144	Mystery
2495	1144	Thriller
2496	1145	Action
2497	1145	Romance
2498	1145	War
2499	1145	Western
2500	1146	Comedy
2501	1146	Drama
2502	1146	Fantasy
2503	1146	Romance
2504	1147	Comedy
2505	1147	Drama
2506	1148	Crime
2507	1148	Drama
2508	1148	Romance
2509	1149	Drama
2510	1150	Drama
2511	1151	Comedy
2512	1152	Crime
2513	1152	Drama
2514	1152	Romance
2515	1153	Drama
2516	1153	Musical
2517	1154	Drama
2518	1155	Adventure
2519	1155	Drama
2520	1156	Documentary
2521	1157	Crime
2522	1157	Drama
2523	1157	Mystery
2524	1157	Thriller
2525	1158	Drama
2526	1159	Comedy
2527	1160	Action
2528	1160	Thriller
2529	1161	Drama
2530	1162	Action
2531	1162	Adventure
2532	1162	Comedy
2533	1162	Thriller
2534	1163	Comedy
2535	1163	Thriller
2536	1164	Action
2537	1164	Comedy
2538	1165	Action
2539	1165	Comedy
2540	1165	Crime
2541	1165	Drama
2542	1165	Thriller
2543	1166	Drama
2544	1167	Action
2545	1167	Thriller
2546	1168	Comedy
2547	1169	Comedy
2548	1170	Comedy
2549	1170	Romance
2550	1171	Drama
2551	1172	Comedy
2552	1172	War
2553	1173	Comedy
2554	1173	Drama
2555	1174	Crime
2556	1175	Comedy
2557	1176	War
2558	1177	Comedy
2559	1177	Romance
2560	1178	Comedy
2561	1178	Drama
2562	1179	Comedy
2563	1179	Romance
2564	1180	Comedy
2565	1181	Comedy
2566	1181	Drama
2567	1181	Romance
2568	1182	Drama
2569	1182	Fantasy
2570	1182	Romance
2571	1183	Mystery
2572	1183	Thriller
2573	1184	Children
2574	1184	Comedy
2575	1184	Mystery
2576	1185	Comedy
2577	1186	Comedy
2578	1186	Romance
2579	1187	Crime
2580	1187	Drama
2581	1187	Fantasy
2582	1187	Film-Noir
2583	1187	Mystery
2584	1187	Romance
2585	1188	Action
2586	1188	Drama
2587	1189	Crime
2588	1189	Drama
2589	1190	Comedy
2590	1190	Romance
2591	1191	Drama
2592	1192	Crime
2593	1192	Thriller
2594	1193	Action
2595	1193	Comedy
2596	1193	Crime
2597	1193	Drama
2598	1194	Children
2599	1194	Comedy
2600	1195	Romance
2601	1196	Comedy
2602	1196	Drama
2603	1197	Romance
2604	1198	Action
2605	1198	Romance
2606	1198	Sci-Fi
2607	1198	Thriller
2608	1199	Drama
2609	1199	Thriller
2610	1200	Comedy
2611	1200	Drama
2612	1201	Drama
2613	1201	Thriller
2614	1202	Comedy
2615	1202	Drama
2616	1202	Mystery
2617	1202	Romance
2618	1203	Comedy
2619	1204	Drama
2620	1205	Drama
2621	1205	Musical
2622	1206	Action
2623	1206	Drama
2624	1206	Thriller
2625	1207	Animation
2626	1207	Children
2627	1207	Musical
2628	1208	Comedy
2629	1209	Romance
2630	1210	Action
2631	1210	Adventure
2632	1210	Children
2633	1211	Drama
2634	1211	Romance
2635	1212	Action
2636	1213	Drama
2637	1213	Romance
2638	1214	Action
2639	1214	Adventure
2640	1214	Thriller
2641	1215	Comedy
2642	1215	Crime
2643	1215	Romance
2644	1216	Crime
2645	1217	Comedy
2646	1218	Drama
2647	1219	Drama
2648	1220	Drama
2649	1221	Comedy
2650	1221	Romance
2651	1222	Comedy
2652	1223	Romance
2653	1224	Action
2654	1224	Drama
2655	1224	Thriller
2656	1225	Comedy
2657	1226	Action
2658	1226	Adventure
2659	1226	Comedy
2660	1227	Action
2661	1227	Thriller
2662	1228	Drama
2663	1229	Romance
2664	1230	Drama
2665	1231	Action
2666	1231	Crime
2667	1231	Romance
2668	1232	Comedy
2669	1233	Action
2670	1233	Adventure
2671	1233	Comedy
2672	1233	Sci-Fi
2673	1234	Comedy
2674	1235	Comedy
2675	1235	Drama
2676	1236	Drama
2677	1237	Drama
2678	1238	Drama
2679	1238	Romance
2680	1239	Comedy
2681	1239	Drama
2682	1239	Romance
2683	1240	Comedy
2684	1240	Crime
2685	1241	Comedy
2686	1241	Romance
2687	1242	Comedy
2688	1242	Drama
2689	1242	Romance
2690	1243	Drama
2691	1244	Action
2692	1244	Adventure
2693	1244	Sci-Fi
2694	1244	Thriller
2695	1245	Drama
2696	1246	Comedy
2697	1247	Children
2698	1247	Drama
2699	1248	Drama
2700	1249	Comedy
2701	1249	Romance
2702	1250	Action
2703	1250	Adventure
2704	1250	Thriller
2705	1251	Drama
2706	1251	Romance
2707	1252	Drama
2708	1253	Action
2709	1253	Romance
2710	1253	Thriller
2711	1254	Action
2712	1254	Adventure
2713	1254	Fantasy
2714	1254	Thriller
2715	1255	Comedy
2716	1255	Thriller
2717	1256	Adventure
2718	1256	Animation
2719	1256	Children
2720	1256	Comedy
2721	1256	Musical
2722	1257	Comedy
2723	1257	Romance
2724	1258	Comedy
2725	1258	Romance
2726	1259	Drama
2727	1260	Action
2728	1260	Crime
2729	1260	Drama
2730	1260	Thriller
2731	1261	Action
2732	1261	Comedy
2733	1261	Sci-Fi
2734	1262	Comedy
2735	1263	Adventure
2736	1263	Children
2737	1264	Children
2738	1264	Fantasy
2739	1265	Drama
2740	1265	Sci-Fi
2741	1266	Comedy
2742	1267	Action
2743	1267	Drama
2744	1268	Action
2745	1268	Adventure
2746	1268	Fantasy
2747	1269	Children
2748	1269	Comedy
2749	1270	Action
2750	1270	Crime
2751	1270	Drama
2752	1270	Thriller
2753	1271	Horror
2754	1271	Sci-Fi
2755	1271	Thriller
2756	1272	Action
2757	1272	Adventure
2758	1272	Sci-Fi
2759	1272	Thriller
2760	1273	Children
2761	1273	Comedy
2762	1274	Comedy
2763	1274	Romance
2764	1275	Comedy
2765	1275	Drama
2766	1276	Adventure
2767	1276	Children
2768	1276	Drama
2769	1277	Drama
2770	1278	Drama
2771	1278	Mystery
2772	1278	Romance
2773	1278	Thriller
2774	1279	Crime
2775	1279	Drama
2776	1279	Thriller
2777	1280	Action
2778	1281	Drama
2779	1281	Romance
2780	1282	Crime
2781	1282	Drama
2782	1282	Film-Noir
2783	1283	Comedy
2784	1284	Horror
2785	1284	Sci-Fi
2786	1284	Thriller
2787	1285	Action
2788	1285	Comedy
2789	1286	Adventure
2790	1286	Romance
2791	1287	Action
2792	1287	Adventure
2793	1288	Action
2794	1288	Thriller
2795	1289	Drama
2796	1289	Thriller
2797	1290	Action
2798	1290	Adventure
2799	1290	Thriller
2800	1291	Drama
2801	1291	Romance
2802	1292	Comedy
2803	1293	Comedy
2804	1294	Adventure
2805	1294	Drama
2806	1295	Action
2807	1295	Thriller
2808	1295	War
2809	1296	Crime
2810	1296	Film-Noir
2811	1296	Mystery
2812	1296	Thriller
2813	1297	Adventure
2814	1297	Drama
2815	1297	War
2816	1298	Crime
2817	1298	Drama
2818	1298	Mystery
2819	1298	Thriller
2820	1299	Drama
2821	1300	Horror
2822	1301	Drama
2823	1302	Drama
2824	1302	Mystery
2825	1302	Thriller
2826	1303	Action
2827	1303	Drama
2828	1303	Thriller
2829	1304	Crime
2830	1304	Drama
2831	1304	Mystery
2832	1305	Comedy
2833	1305	Romance
2834	1306	Action
2835	1306	Thriller
2836	1307	Comedy
2837	1307	Romance
2838	1308	Drama
2839	1309	Drama
2840	1310	Comedy
2841	1310	Drama
2842	1310	Romance
2843	1311	Comedy
2844	1311	Drama
2845	1312	Comedy
2846	1312	Drama
2847	1313	Drama
2848	1313	Romance
2849	1314	Horror
2850	1314	Mystery
2851	1314	Thriller
2852	1315	Drama
2853	1315	Mystery
2854	1315	Thriller
2855	1316	Children
2856	1316	Comedy
2857	1316	Romance
2858	1316	Sci-Fi
2859	1317	Crime
2860	1317	Drama
2861	1317	Thriller
2862	1318	Comedy
2863	1318	Drama
2864	1319	Documentary
2865	1320	Drama
2866	1321	Drama
2867	1322	Drama
2868	1322	Sci-Fi
2869	1322	Thriller
2870	1323	Children
2871	1323	Drama
2872	1323	Fantasy
2873	1324	Drama
2874	1324	Horror
2875	1324	Thriller
2876	1325	Drama
2877	1325	Romance
2878	1326	Romance
2879	1326	Thriller
2880	1327	Drama
2881	1328	Drama
2882	1329	Crime
2883	1329	Mystery
2884	1329	Thriller
2885	1330	Comedy
2886	1330	War
2887	1331	Comedy
2888	1332	Action
2889	1332	Drama
2890	1333	Romance
2891	1334	Drama
2892	1334	War
2893	1335	Crime
2894	1335	Drama
2895	1335	Thriller
2896	1336	Drama
2897	1337	Drama
2898	1338	Drama
2899	1338	Romance
2900	1338	Thriller
2901	1339	Crime
2902	1339	Thriller
2903	1340	Action
2904	1340	Sci-Fi
2905	1341	Drama
2906	1341	Romance
2907	1342	Drama
2908	1342	Romance
2909	1343	Action
2910	1343	Adventure
2911	1343	Fantasy
2912	1344	Comedy
2913	1344	Drama
2914	1344	Sci-Fi
2915	1345	Drama
2916	1345	Romance
2917	1346	Drama
2918	1346	Romance
2919	1347	Crime
2920	1347	Thriller
2921	1348	Action
2922	1348	Thriller
2923	1349	Adventure
2924	1349	Animation
2925	1349	Children
2926	1349	Drama
2927	1349	Musical
2928	1350	Comedy
2929	1350	Crime
2930	1350	Thriller
2931	1351	Action
2932	1351	Horror
2933	1351	Sci-Fi
2934	1352	Horror
2935	1352	Sci-Fi
2936	1353	Drama
2937	1353	Mystery
2938	1354	Drama
2939	1355	Drama
2940	1356	Drama
2941	1356	War
2942	1357	Comedy
2943	1357	Drama
2944	1358	Comedy
2945	1358	Drama
2946	1359	Children
2947	1359	Comedy
2948	1359	Fantasy
2949	1360	Comedy
2950	1361	Drama
2951	1361	Romance
2952	1362	Children
2953	1362	Comedy
2954	1363	Crime
2955	1363	Drama
2956	1363	Mystery
2957	1364	Children
2958	1364	Comedy
2959	1365	Drama
2960	1366	Comedy
2961	1366	Horror
2962	1366	Mystery
2963	1366	Thriller
2964	1367	Drama
2965	1368	Drama
2966	1368	Romance
2967	1369	Action
2968	1369	Adventure
2969	1369	Thriller
2970	1370	Action
2971	1370	Adventure
2972	1370	Drama
2973	1370	Sci-Fi
2974	1371	Drama
2975	1371	Romance
2976	1372	Crime
2977	1372	Drama
2978	1372	Thriller
2979	1373	Drama
2980	1374	Comedy
2981	1375	Comedy
2982	1375	Crime
2983	1376	Drama
2984	1376	Romance
2985	1377	Comedy
2986	1377	Drama
2987	1378	Drama
2988	1378	Romance
2989	1379	Action
2990	1379	Children
2991	1379	Comedy
2992	1380	Action
2993	1380	Adventure
2994	1380	Thriller
2995	1381	Comedy
2996	1382	Adventure
2997	1382	Film-Noir
2998	1382	Sci-Fi
2999	1382	Thriller
3000	1383	Adventure
3001	1383	Children
3002	1383	Fantasy
3003	1383	Sci-Fi
3004	1384	Action
3005	1384	Crime
3006	1384	Thriller
3007	1385	Comedy
3008	1386	Crime
3009	1386	Drama
3010	1386	Fantasy
3011	1386	Thriller
3012	1387	Comedy
3013	1387	Romance
3014	1388	Horror
3015	1389	Drama
3016	1389	Romance
3017	1390	Drama
3018	1391	Comedy
3019	1392	Action
3020	1392	Horror
3021	1392	Sci-Fi
3022	1393	Drama
3023	1393	Romance
3024	1394	Action
3025	1394	Crime
3026	1394	Thriller
3027	1395	Crime
3028	1395	Romance
3029	1395	Thriller
3030	1396	Horror
3031	1397	Action
3032	1397	Comedy
3033	1397	Musical
3034	1398	Action
3035	1398	Drama
3036	1399	Comedy
3037	1399	Romance
3038	1400	Sci-Fi
3039	1400	Thriller
3040	1401	Crime
3041	1401	Drama
3042	1401	Mystery
3043	1401	Romance
3044	1401	Thriller
3045	1402	Comedy
3046	1402	Drama
3047	1402	Romance
3048	1403	Crime
3049	1403	Thriller
3050	1404	Action
3051	1404	Drama
3052	1405	Crime
3053	1405	Drama
3054	1405	Thriller
3055	1406	Action
3056	1406	Crime
3057	1406	Thriller
3058	1407	Comedy
3059	1408	Comedy
3060	1408	Drama
3061	1409	Action
3062	1409	Drama
3063	1410	Documentary
3064	1410	IMAX
3065	1411	Comedy
3066	1411	Crime
3067	1411	Drama
3068	1411	Mystery
3069	1411	Thriller
3070	1412	Action
3071	1412	Adventure
3072	1412	Drama
3073	1413	Crime
3074	1413	Drama
3075	1414	Crime
3076	1414	Drama
3077	1414	Mystery
3078	1414	Thriller
3079	1415	Adventure
3080	1415	Children
3081	1415	Comedy
3082	1416	Crime
3083	1416	Drama
3084	1417	Comedy
3085	1417	Drama
3086	1418	Drama
3087	1419	Comedy
3088	1419	Drama
3089	1420	Comedy
3090	1420	Romance
3091	1421	Children
3092	1421	Comedy
3093	1422	Comedy
3094	1422	Thriller
3095	1423	Comedy
3096	1423	Drama
3097	1424	Adventure
3098	1424	Children
3099	1425	Comedy
3100	1425	Documentary
3101	1426	Drama
3102	1426	Romance
3103	1427	Action
3104	1427	Adventure
3105	1427	Sci-Fi
3106	1428	Action
3107	1428	Drama
3108	1428	Thriller
3109	1429	Crime
3110	1429	Drama
3111	1429	Mystery
3112	1429	Thriller
3113	1430	Drama
3114	1430	Fantasy
3115	1430	Romance
3116	1431	Comedy
3117	1431	Drama
3118	1432	Drama
3119	1433	Drama
3120	1433	Thriller
3121	1434	Drama
3122	1434	Romance
3123	1435	Comedy
3124	1435	Mystery
3125	1435	Thriller
3126	1436	Drama
3127	1437	Adventure
3128	1437	Children
3129	1437	Comedy
3130	1437	Fantasy
3131	1438	Comedy
3132	1439	Comedy
3133	1439	Romance
3134	1440	Comedy
3135	1441	Documentary
3136	1442	Comedy
3137	1443	Action
3138	1443	Comedy
3139	1444	Drama
3140	1445	Drama
3141	1446	Horror
3142	1446	Sci-Fi
3143	1447	Comedy
3144	1448	Documentary
3145	1449	Action
3146	1449	Comedy
3147	1449	Crime
3148	1450	Action
3149	1450	Adventure
3150	1451	Action
3151	1451	Thriller
3152	1452	Comedy
3153	1452	Drama
3154	1453	Comedy
3155	1453	Drama
3156	1454	Crime
3157	1454	Drama
3158	1454	Romance
3159	1454	War
3160	1455	Comedy
3161	1456	Drama
3162	1456	Sci-Fi
3163	1456	Thriller
3164	1457	Comedy
3165	1457	Romance
3166	1458	Drama
3167	1458	Romance
3168	1459	Drama
3169	1460	Adventure
3170	1460	Animation
3171	1460	Children
3172	1460	Fantasy
3173	1460	Musical
3174	1461	Action
3175	1461	Sci-Fi
3176	1461	Thriller
3177	1462	Comedy
3178	1462	Drama
3179	1462	Romance
3180	1463	Adventure
3181	1463	Comedy
3182	1463	Drama
3183	1464	Comedy
3184	1464	Drama
3185	1464	Romance
3186	1465	Adventure
3187	1465	Comedy
3188	1465	Western
3189	1466	Comedy
3190	1466	Drama
3191	1466	Romance
3192	1467	Drama
3193	1467	Mystery
3194	1467	Thriller
3195	1468	Drama
3196	1469	Thriller
3197	1470	Drama
3198	1471	Adventure
3199	1471	Comedy
3200	1471	Romance
3201	1472	Comedy
3202	1472	Drama
3203	1472	Romance
3204	1473	Comedy
3205	1474	Drama
3206	1474	Romance
3207	1475	Adventure
3208	1475	Drama
3209	1476	Comedy
3210	1476	Drama
3211	1477	Drama
3212	1477	Romance
3213	1478	Comedy
3214	1478	Drama
3215	1479	Drama
3216	1480	Comedy
3217	1480	Romance
3218	1481	Adventure
3219	1481	Animation
3220	1481	Children
3221	1481	Comedy
3222	1481	Drama
3223	1481	Musical
3224	1481	Romance
3225	1482	Action
3226	1482	Crime
3227	1482	Mystery
3228	1482	Sci-Fi
3229	1482	Thriller
3230	1483	Comedy
3231	1483	Crime
3232	1483	Drama
3233	1484	Comedy
3234	1485	Comedy
3235	1485	Crime
3236	1485	Drama
3237	1485	Romance
3238	1485	Thriller
3239	1486	Drama
3240	1486	Mystery
3241	1487	Comedy
3242	1487	Drama
3243	1488	Drama
3244	1488	Romance
3245	1489	Action
3246	1489	Romance
3247	1489	Sci-Fi
3248	1489	Thriller
3249	1490	Action
3250	1490	Comedy
3251	1490	Crime
3252	1490	Thriller
3253	1491	Animation
3254	1491	Children
3255	1491	Fantasy
3256	1491	War
3257	1492	Drama
3258	1492	Sci-Fi
3259	1492	Thriller
3260	1493	Drama
3261	1494	Comedy
3262	1494	Romance
3263	1495	Horror
3264	1495	Sci-Fi
3265	1496	Action
3266	1496	Drama
3267	1496	Romance
3268	1496	War
3269	1497	Action
3270	1497	Drama
3271	1497	War
3272	1498	Drama
3273	1498	Romance
3274	1499	Adventure
3275	1499	Drama
3276	1500	Drama
3277	1501	Comedy
3278	1501	Romance
3279	1502	Drama
3280	1502	Musical
3281	1502	Romance
3282	1503	Drama
3283	1503	War
3284	1504	Comedy
3285	1504	Drama
3286	1504	Musical
3287	1505	Drama
3288	1506	Drama
3289	1506	War
3290	1507	Drama
3291	1508	Drama
3292	1509	Drama
3293	1510	Drama
3294	1511	Drama
3295	1511	Romance
3296	1511	War
3297	1512	Crime
3298	1512	Drama
3299	1513	Drama
3300	1513	Romance
3301	1514	Drama
3302	1514	Musical
3303	1514	Romance
3304	1515	Adventure
3305	1515	Comedy
3306	1515	Romance
3307	1516	Drama
3308	1517	Drama
3309	1517	Mystery
3310	1518	Drama
3311	1518	Musical
3312	1519	Drama
3313	1520	Action
3314	1520	Crime
3315	1520	Thriller
3316	1521	Drama
3317	1522	Drama
3318	1523	Drama
3319	1524	Drama
3320	1525	Comedy
3321	1525	Drama
3322	1526	Drama
3323	1526	Romance
3324	1527	Drama
3325	1528	Drama
3326	1529	Drama
3327	1530	Comedy
3328	1530	Crime
3329	1531	Drama
3330	1531	Mystery
3331	1532	Comedy
3332	1532	Sci-Fi
3333	1533	Comedy
3334	1534	Adventure
3335	1534	Fantasy
3336	1534	Musical
3337	1535	Comedy
3338	1535	Drama
3339	1536	Horror
3340	1537	Horror
3341	1537	Thriller
3342	1538	Horror
3343	1538	Thriller
3344	1539	Horror
3345	1540	Horror
3346	1541	Horror
3347	1541	Mystery
3348	1541	Thriller
3349	1542	Horror
3350	1543	Horror
3351	1544	Horror
3352	1545	Horror
3353	1546	Horror
3354	1547	Horror
3355	1548	Horror
3356	1549	Horror
3357	1550	Horror
3358	1551	Horror
3359	1552	Horror
3360	1553	Horror
3361	1554	Horror
3362	1555	Horror
3363	1555	Thriller
3364	1556	Horror
3365	1556	Thriller
3366	1557	Comedy
3367	1557	Horror
3368	1557	Thriller
3369	1558	Horror
3370	1558	Thriller
3371	1559	Horror
3372	1559	Thriller
3373	1560	Horror
3374	1560	Thriller
3375	1561	Horror
3376	1561	Mystery
3377	1562	Horror
3378	1563	Horror
3379	1564	Action
3380	1564	Comedy
3381	1564	Crime
3382	1564	Drama
3383	1565	Action
3384	1565	Comedy
3385	1565	Crime
3386	1565	Drama
3387	1566	Action
3388	1566	Comedy
3389	1566	Crime
3390	1566	Drama
3391	1567	Comedy
3392	1567	Horror
3393	1568	Comedy
3394	1568	Horror
3395	1569	Action
3396	1569	Adventure
3397	1569	Children
3398	1569	Comedy
3399	1569	Fantasy
3400	1570	Action
3401	1570	Comedy
3402	1570	Romance
3403	1571	Comedy
3404	1572	Drama
3405	1572	Mystery
3406	1572	Sci-Fi
3407	1572	Thriller
3408	1573	Drama
3409	1573	Sci-Fi
3410	1574	Adventure
3411	1574	Comedy
3412	1574	Sci-Fi
3413	1575	Adventure
3414	1575	Comedy
3415	1575	Sci-Fi
3416	1575	Western
3417	1576	Action
3418	1576	Adventure
3419	1576	Drama
3420	1577	Children
3421	1577	Comedy
3422	1577	Fantasy
3423	1578	Children
3424	1578	Comedy
3425	1578	Fantasy
3426	1579	Children
3427	1579	Comedy
3428	1579	Western
3429	1580	Children
3430	1580	Fantasy
3431	1580	Musical
3432	1581	Animation
3433	1581	Children
3434	1581	Drama
3435	1582	Action
3436	1582	Adventure
3437	1582	Drama
3438	1583	Drama
3439	1583	Romance
3440	1584	Adventure
3441	1584	Sci-Fi
3442	1585	Drama
3443	1586	Crime
3444	1586	Drama
3445	1586	Mystery
3446	1586	Thriller
3447	1587	Drama
3448	1587	Mystery
3449	1588	Drama
3450	1588	Romance
3451	1589	Horror
3452	1589	Thriller
3453	1590	Comedy
3454	1590	Crime
3455	1591	Action
3456	1591	Drama
3457	1591	War
3458	1592	Comedy
3459	1592	Romance
3460	1593	Drama
3461	1594	Children
3462	1594	Comedy
3463	1595	Children
3464	1595	Comedy
3465	1596	Adventure
3466	1596	Animation
3467	1596	Children
3468	1596	Fantasy
3469	1597	Children
3470	1597	Sci-Fi
3471	1598	Children
3472	1598	Comedy
3473	1599	Children
3474	1599	Comedy
3475	1600	Adventure
3476	1600	Children
3477	1600	Comedy
3478	1601	Children
3479	1601	Comedy
3480	1601	Sci-Fi
3481	1602	Children
3482	1602	Comedy
3483	1603	Action
3484	1603	Adventure
3485	1603	Children
3486	1603	Comedy
3487	1604	Children
3488	1604	Comedy
3489	1605	Adventure
3490	1605	Children
3491	1605	Fantasy
3492	1606	Comedy
3493	1606	Fantasy
3494	1607	Adventure
3495	1607	Children
3496	1607	Drama
3497	1607	Romance
3498	1608	Adventure
3499	1608	Children
3500	1608	Sci-Fi
3501	1609	Action
3502	1609	Animation
3503	1609	Children
3504	1609	Crime
3505	1610	Comedy
3506	1610	Musical
3507	1611	Adventure
3508	1611	Children
3509	1611	Comedy
3510	1612	Adventure
3511	1612	Children
3512	1612	Comedy
3513	1613	Children
3514	1613	Comedy
3515	1613	Fantasy
3516	1613	Horror
3517	1614	Children
3518	1614	Comedy
3519	1614	Sci-Fi
3520	1615	Adventure
3521	1615	Children
3522	1615	Comedy
3523	1615	Fantasy
3524	1615	Sci-Fi
3525	1616	Action
3526	1616	Comedy
3527	1616	Western
3528	1617	Adventure
3529	1617	Children
3530	1618	Adventure
3531	1618	Children
3532	1619	Action
3533	1619	Crime
3534	1619	Drama
3535	1619	Mystery
3536	1619	Thriller
3537	1620	Children
3538	1620	Comedy
3539	1620	Romance
3540	1621	Comedy
3541	1622	Documentary
3542	1623	Drama
3543	1623	Romance
3544	1624	Documentary
3545	1625	Comedy
3546	1625	Drama
3547	1625	Fantasy
3548	1625	Romance
3549	1626	Film-Noir
3550	1627	Drama
3551	1627	Romance
3552	1627	War
3553	1628	Drama
3554	1628	Fantasy
3555	1628	Mystery
3556	1629	Drama
3557	1630	Drama
3558	1630	Romance
3559	1630	Western
3560	1631	Drama
3561	1632	Comedy
3562	1633	Comedy
3563	1634	Crime
3564	1634	Drama
3565	1634	Romance
3566	1635	Drama
3567	1635	War
3568	1636	Drama
3569	1636	Mystery
3570	1636	Thriller
3571	1637	Adventure
3572	1637	Children
3573	1638	Animation
3574	1638	Children
3575	1638	Comedy
3576	1638	Musical
3577	1639	Adventure
3578	1639	Children
3579	1639	Drama
3580	1640	Animation
3581	1640	Children
3582	1640	Comedy
3583	1640	Romance
3584	1641	Animation
3585	1641	Children
3586	1641	Comedy
3587	1641	Musical
3588	1641	Romance
3589	1642	Children
3590	1642	Comedy
3591	1643	Children
3592	1643	Comedy
3593	1643	Musical
3594	1644	Children
3595	1644	Musical
3596	1645	Adventure
3597	1645	Animation
3598	1645	Children
3599	1646	Drama
3600	1646	Fantasy
3601	1647	Animation
3602	1647	Children
3603	1647	Fantasy
3604	1647	Musical
3605	1648	Adventure
3606	1648	Comedy
3607	1648	Musical
3608	1649	Adventure
3609	1649	Animation
3610	1649	Children
3611	1650	Adventure
3612	1650	Animation
3613	1650	Children
3614	1650	Crime
3615	1650	Drama
3616	1651	Children
3617	1651	Sci-Fi
3618	1652	Adventure
3619	1652	Animation
3620	1652	Children
3621	1652	Fantasy
3622	1652	Musical
3623	1652	Romance
3624	1653	Adventure
3625	1653	Children
3626	1653	Fantasy
3627	1654	Action
3628	1654	Adventure
3629	1654	Sci-Fi
3630	1655	Children
3631	1655	Comedy
3632	1656	Animation
3633	1656	Children
3634	1656	Musical
3635	1657	Children
3636	1657	Drama
3637	1657	Fantasy
3638	1657	Mystery
3639	1657	Thriller
3640	1658	Children
3641	1658	Comedy
3642	1659	Adventure
3643	1659	Animation
3644	1659	Children
3645	1659	Musical
3646	1660	Comedy
3647	1660	Fantasy
3648	1660	Romance
3649	1661	Adventure
3650	1661	Drama
3651	1662	Animation
3652	1662	Children
3653	1662	Comedy
3654	1662	Musical
3655	1663	Adventure
3656	1663	Children
3657	1663	Fantasy
3658	1663	Western
3659	1664	Drama
3660	1665	Action
3661	1665	Adventure
3662	1665	Sci-Fi
3663	1666	Drama
3664	1666	War
3665	1667	Horror
3666	1667	Thriller
3667	1668	Comedy
3668	1668	Romance
3669	1669	Comedy
3670	1670	Comedy
3671	1670	Crime
3672	1670	Thriller
3673	1671	Comedy
3674	1672	Crime
3675	1672	Drama
3676	1673	Horror
3677	1673	Thriller
3678	1674	Drama
3679	1675	Action
3680	1675	Adventure
3681	1675	Fantasy
3682	1676	Adventure
3683	1676	Animation
3684	1676	Children
3685	1676	Fantasy
3686	1677	Drama
3687	1677	Sci-Fi
3688	1678	Thriller
3689	1679	Horror
3690	1680	Drama
3691	1680	Horror
3692	1681	Horror
3693	1681	Thriller
3694	1682	Horror
3695	1682	Thriller
3696	1683	Animation
3697	1683	Children
3698	1683	Comedy
3699	1683	Drama
3700	1683	Fantasy
3701	1684	Children
3702	1684	Comedy
3703	1684	Fantasy
3704	1685	Comedy
3705	1685	Drama
3706	1685	Romance
3707	1686	Action
3708	1686	Crime
3709	1686	Mystery
3710	1686	Thriller
3711	1687	Crime
3712	1687	Drama
3713	1687	Romance
3714	1688	Drama
3715	1689	Drama
3716	1690	Adventure
3717	1690	Comedy
3718	1691	Comedy
3719	1691	Fantasy
3720	1691	Sci-Fi
3721	1692	Adventure
3722	1692	Children
3723	1692	Musical
3724	1693	Comedy
3725	1693	Sci-Fi
3726	1694	Animation
3727	1694	Children
3728	1695	Adventure
3729	1695	Animation
3730	1695	Children
3731	1695	Drama
3732	1695	Fantasy
3733	1696	Adventure
3734	1696	Animation
3735	1696	Children
3736	1696	Drama
3737	1697	Adventure
3738	1697	Fantasy
3739	1698	Adventure
3740	1698	Animation
3741	1698	Children
3742	1698	Comedy
3743	1699	Adventure
3744	1699	Animation
3745	1699	Children
3746	1699	Musical
3747	1699	Western
3748	1700	Adventure
3749	1700	Fantasy
3750	1700	Romance
3751	1701	Comedy
3752	1701	Romance
3753	1702	Comedy
3754	1702	Drama
3755	1702	Romance
3756	1703	Drama
3757	1703	Romance
3758	1704	Adventure
3759	1704	Drama
3760	1704	Fantasy
3761	1705	Comedy
3762	1705	Fantasy
3763	1705	Horror
3764	1706	Comedy
3765	1706	Fantasy
3766	1706	Horror
3767	1707	Adventure
3768	1707	Comedy
3769	1708	Comedy
3770	1709	Children
3771	1709	Comedy
3772	1710	Action
3773	1710	Adventure
3774	1711	Drama
3775	1711	Romance
3776	1712	Comedy
3777	1712	Drama
3778	1713	Romance
3779	1714	Crime
3780	1714	Horror
3781	1715	Crime
3782	1715	Horror
3783	1715	Thriller
3784	1716	Drama
3785	1716	Horror
3786	1716	Thriller
3787	1717	Adventure
3788	1717	Children
3789	1717	Fantasy
3790	1718	Adventure
3791	1718	Children
3792	1718	Fantasy
3793	1719	Comedy
3794	1719	Horror
3795	1720	Action
3796	1720	Comedy
3797	1720	Drama
3798	1720	Horror
3799	1721	Comedy
3800	1721	Drama
3801	1722	Crime
3802	1722	Drama
3803	1722	Romance
3804	1722	Thriller
3805	1723	Action
3806	1723	Horror
3807	1723	Thriller
3808	1724	Drama
3809	1724	Romance
3810	1725	Comedy
3811	1726	Action
3812	1726	Comedy
3813	1727	Comedy
3814	1727	Drama
3815	1727	Romance
3816	1728	Comedy
3817	1728	Drama
3818	1729	Adventure
3819	1729	Fantasy
3820	1729	Sci-Fi
3821	1730	Comedy
3822	1730	Fantasy
3823	1731	Crime
3824	1731	Drama
3825	1731	Thriller
3826	1732	Comedy
3827	1732	Thriller
3828	1733	Thriller
3829	1734	Thriller
3830	1735	Thriller
3831	1736	Drama
3832	1736	Mystery
3833	1736	Romance
3834	1736	Thriller
3835	1737	Drama
3836	1737	Film-Noir
3837	1737	Thriller
3838	1738	Adventure
3839	1738	Drama
3840	1738	Mystery
3841	1738	Thriller
3842	1739	Comedy
3843	1739	Mystery
3844	1740	Thriller
3845	1741	Crime
3846	1741	Drama
3847	1741	Film-Noir
3848	1741	Thriller
3849	1742	Mystery
3850	1742	Romance
3851	1742	Thriller
3852	1743	Drama
3853	1744	Animation
3854	1744	Comedy
3855	1744	Fantasy
3856	1744	Sci-Fi
3857	1745	Drama
3858	1746	Comedy
3859	1747	Thriller
3860	1748	Action
3861	1748	Adventure
3862	1748	Fantasy
3863	1749	Action
3864	1749	Crime
3865	1749	Drama
3866	1750	Comedy
3867	1751	Action
3868	1752	Drama
3869	1753	Drama
3870	1754	Drama
3871	1755	Drama
3872	1755	War
3873	1756	Crime
3874	1756	Drama
3875	1756	Thriller
3876	1757	Mystery
3877	1757	Thriller
3878	1758	Comedy
3879	1758	Romance
3880	1759	Film-Noir
3881	1759	Mystery
3882	1759	Thriller
3883	1760	Drama
3884	1761	Drama
3885	1761	Mystery
3886	1761	Thriller
3887	1762	Crime
3888	1762	Thriller
3889	1763	Thriller
3890	1764	Thriller
3891	1765	Drama
3892	1765	Thriller
3893	1766	Comedy
3894	1766	Romance
3895	1767	Drama
3896	1767	Thriller
3897	1768	Comedy
3898	1769	Crime
3899	1769	Drama
3900	1769	Thriller
3901	1770	Drama
3902	1771	Horror
3903	1771	Mystery
3904	1771	Sci-Fi
3905	1771	Thriller
3906	1772	Drama
3907	1773	Drama
3908	1774	Comedy
3909	1774	Drama
3910	1775	Comedy
3911	1775	Drama
3912	1776	Drama
3913	1777	Comedy
3914	1777	Drama
3915	1777	Romance
3916	1778	Comedy
3917	1778	Drama
3918	1778	Romance
3919	1779	Comedy
3920	1780	Comedy
3921	1780	Drama
3922	1780	Romance
3923	1781	Comedy
3924	1782	Drama
3925	1783	Comedy
3926	1783	Drama
3927	1784	Comedy
3928	1784	Fantasy
3929	1785	Drama
3930	1786	Comedy
3931	1787	Action
3932	1788	Comedy
3933	1788	Romance
3934	1789	Comedy
3935	1790	Comedy
3936	1790	Drama
3937	1790	Romance
3938	1791	Drama
3939	1791	Fantasy
3940	1791	Thriller
3941	1792	Comedy
3942	1792	Crime
3943	1793	Adventure
3944	1793	Comedy
3945	1794	Comedy
3946	1794	Romance
3947	1795	Mystery
3948	1795	Thriller
3949	1796	Crime
3950	1796	Drama
3951	1796	Thriller
3952	1797	Drama
3953	1797	Romance
3954	1798	Drama
3955	1799	Drama
3956	1800	Action
3957	1800	Comedy
3958	1800	Crime
3959	1800	Thriller
3960	1801	Action
3961	1801	Adventure
3962	1801	Sci-Fi
3963	1802	Drama
3964	1803	Action
3965	1803	Crime
3966	1803	Thriller
3967	1804	Horror
3968	1804	Thriller
3969	1805	Crime
3970	1806	Comedy
3971	1806	Drama
3972	1807	Drama
3973	1808	Drama
3974	1809	Drama
3975	1810	Horror
3976	1810	Sci-Fi
3977	1810	Thriller
3978	1811	Action
3979	1811	Horror
3980	1811	Sci-Fi
3981	1811	Thriller
3982	1812	Comedy
3983	1812	Crime
3984	1812	Drama
3985	1813	Comedy
3986	1813	Drama
3987	1814	Drama
3988	1814	Fantasy
3989	1814	Romance
3990	1815	Drama
3991	1816	Adventure
3992	1816	Animation
3993	1816	Children
3994	1816	Comedy
3995	1816	Fantasy
3996	1817	Comedy
3997	1818	Comedy
3998	1819	Adventure
3999	1819	Drama
4000	1819	Fantasy
4001	1819	Romance
4002	1820	Comedy
4003	1821	Comedy
4004	1821	Musical
4005	1822	Comedy
4006	1823	Drama
4007	1823	Musical
4008	1824	Drama
4009	1825	Comedy
4010	1826	Action
4011	1826	Crime
4012	1827	Drama
4013	1828	Sci-Fi
4014	1829	Drama
4015	1830	Drama
4016	1831	Drama
4017	1832	Comedy
4018	1832	Horror
4019	1832	Thriller
4020	1833	Drama
4021	1833	Fantasy
4022	1833	Mystery
4023	1833	Romance
4024	1834	Comedy
4025	1834	Drama
4026	1835	Drama
4027	1835	Thriller
4028	1836	Comedy
4029	1836	Drama
4030	1836	Fantasy
4031	1837	Action
4032	1837	Sci-Fi
4033	1837	War
4034	1838	Documentary
4035	1839	Comedy
4036	1839	Drama
4037	1839	Romance
4038	1839	War
4039	1840	Comedy
4040	1841	Drama
4041	1841	Thriller
4042	1842	Fantasy
4043	1842	Horror
4044	1842	Thriller
4045	1843	Horror
4046	1843	Western
4047	1844	Crime
4048	1844	Drama
4049	1845	Comedy
4050	1845	Documentary
4051	1846	Comedy
4052	1846	Drama
4053	1846	Romance
4054	1847	Drama
4055	1848	Action
4056	1848	Thriller
4057	1849	Comedy
4058	1850	Drama
4059	1851	Drama
4060	1852	Horror
4061	1852	Mystery
4062	1852	Thriller
4063	1853	Comedy
4064	1853	Romance
4065	1854	Romance
4066	1855	Comedy
4067	1855	Drama
4068	1856	Action
4069	1856	Adventure
4070	1856	Drama
4071	1856	Thriller
4072	1857	Drama
4073	1858	Mystery
4074	1858	Sci-Fi
4075	1858	Thriller
4076	1859	Drama
4077	1860	Drama
4078	1861	Comedy
4079	1861	Thriller
4080	1862	Comedy
4081	1863	Drama
4082	1864	Comedy
4083	1864	Drama
4084	1865	Action
4085	1865	Thriller
4086	1866	Animation
4087	1866	Children
4088	1866	Comedy
4089	1867	Adventure
4090	1867	Animation
4091	1867	Children
4092	1867	Comedy
4093	1868	Comedy
4094	1869	Drama
4095	1870	Drama
4096	1870	War
4097	1871	Comedy
4098	1872	Drama
4099	1873	Comedy
4100	1874	Drama
4101	1875	Drama
4102	1875	Horror
4103	1875	Sci-Fi
4104	1876	Action
4105	1876	Horror
4106	1876	Sci-Fi
4107	1876	Thriller
4108	1877	Action
4109	1877	Sci-Fi
4110	1878	Action
4111	1878	Adventure
4112	1878	Fantasy
4113	1878	Horror
4114	1879	Adventure
4115	1879	Fantasy
4116	1879	Romance
4117	1879	Sci-Fi
4118	1879	Thriller
4119	1880	Adventure
4120	1880	Sci-Fi
4121	1881	Comedy
4122	1881	Drama
4123	1881	Romance
4124	1882	Action
4125	1882	Adventure
4126	1882	Drama
4127	1883	Comedy
4128	1883	Crime
4129	1883	Mystery
4130	1884	Comedy
4131	1885	Action
4132	1885	Adventure
4133	1885	Fantasy
4134	1886	Comedy
4135	1886	Drama
4136	1887	Comedy
4137	1888	Action
4138	1888	Adventure
4139	1888	Thriller
4140	1889	Horror
4141	1889	Sci-Fi
4142	1890	Comedy
4143	1890	Crime
4144	1891	Comedy
4145	1891	Crime
4146	1892	Comedy
4147	1892	Crime
4148	1893	Comedy
4149	1893	Crime
4150	1894	Comedy
4151	1894	Crime
4152	1895	Comedy
4153	1895	Crime
4154	1896	Adventure
4155	1896	Children
4156	1896	Drama
4157	1897	Comedy
4158	1897	Romance
4159	1898	Comedy
4160	1898	Drama
4161	1899	Comedy
4162	1899	Crime
4163	1900	Crime
4164	1900	Horror
4165	1900	Thriller
4166	1901	Comedy
4167	1902	Crime
4168	1902	Drama
4169	1902	Thriller
4170	1903	Children
4171	1903	Comedy
4172	1903	Drama
4173	1904	Action
4174	1904	Drama
4175	1904	Romance
4176	1904	Sci-Fi
4177	1905	Animation
4178	1905	Musical
4179	1906	Comedy
4180	1906	Drama
4181	1907	Comedy
4182	1907	Drama
4183	1907	Romance
4184	1908	Comedy
4185	1908	Drama
4186	1909	Adventure
4187	1909	Children
4188	1909	Fantasy
4189	1910	Children
4190	1910	Drama
4191	1910	Fantasy
4192	1911	Western
4193	1912	Action
4194	1912	Adventure
4195	1912	Thriller
4196	1913	Action
4197	1913	Adventure
4198	1913	Drama
4199	1913	Thriller
4200	1914	Action
4201	1914	Adventure
4202	1914	Thriller
4203	1914	War
4204	1915	Action
4205	1915	Adventure
4206	1915	Comedy
4207	1915	Romance
4208	1916	Action
4209	1916	Adventure
4210	1916	Comedy
4211	1916	Romance
4212	1917	Comedy
4213	1917	Sci-Fi
4214	1918	Comedy
4215	1918	Sci-Fi
4216	1919	Action
4217	1919	Drama
4218	1920	Action
4219	1920	Drama
4220	1921	Action
4221	1921	Drama
4222	1922	Action
4223	1922	Drama
4224	1923	Comedy
4225	1923	Crime
4226	1923	Mystery
4227	1923	Thriller
4228	1924	Action
4229	1924	Adventure
4230	1924	Children
4231	1924	Fantasy
4232	1924	Mystery
4233	1924	Thriller
4234	1925	Drama
4235	1925	Romance
4236	1926	Comedy
4237	1927	Comedy
4238	1927	Drama
4239	1928	Comedy
4240	1929	Drama
4241	1929	Thriller
4242	1930	Drama
4243	1931	Action
4244	1931	Adventure
4245	1931	Drama
4246	1932	Action
4247	1932	Adventure
4248	1932	Children
4249	1932	Drama
4250	1933	Comedy
4251	1934	Comedy
4252	1934	Romance
4253	1935	Crime
4254	1936	Comedy
4255	1936	Drama
4256	1936	Romance
4257	1937	Action
4258	1937	Drama
4259	1937	War
4260	1938	Horror
4261	1938	Sci-Fi
4262	1939	Action
4263	1939	Adventure
4264	1939	Drama
4265	1939	Fantasy
4266	1939	Thriller
4267	1940	Adventure
4268	1940	Children
4269	1940	Drama
4270	1941	Comedy
4271	1941	Drama
4272	1942	Drama
4273	1943	Drama
4274	1944	Drama
4275	1945	Drama
4276	1946	Comedy
4277	1946	Drama
4278	1946	War
4279	1947	Drama
4280	1948	Drama
4281	1949	Drama
4282	1950	Drama
4283	1950	Romance
4284	1950	Western
4285	1951	Drama
4286	1952	Drama
4287	1952	Romance
4288	1953	Comedy
4289	1953	Drama
4290	1954	Drama
4291	1955	Horror
4292	1955	Thriller
4293	1956	Comedy
4294	1956	Drama
4295	1957	Horror
4296	1957	Sci-Fi
4297	1958	Adventure
4298	1958	Children
4299	1958	Comedy
4300	1959	Adventure
4301	1959	Comedy
4302	1959	Sci-Fi
4303	1960	Horror
4304	1961	Drama
4305	1961	Fantasy
4306	1962	Horror
4307	1962	Mystery
4308	1962	Sci-Fi
4309	1963	Drama
4310	1963	Horror
4311	1963	Sci-Fi
4312	1963	Thriller
4313	1964	Horror
4314	1964	Sci-Fi
4315	1965	Action
4316	1965	Comedy
4317	1966	Comedy
4318	1966	Crime
4319	1967	Horror
4320	1968	Horror
4321	1969	Comedy
4322	1969	Horror
4323	1969	Thriller
4324	1970	Horror
4325	1971	Comedy
4326	1972	Horror
4327	1973	Crime
4328	1973	Drama
4329	1973	Mystery
4330	1973	Thriller
4331	1974	Action
4332	1974	Comedy
4333	1974	Romance
4334	1974	Thriller
4335	1975	Comedy
4336	1975	Drama
4337	1976	Adventure
4338	1976	Comedy
4339	1977	Action
4340	1977	Adventure
4341	1977	Comedy
4342	1978	Comedy
4343	1979	Comedy
4344	1980	Drama
4345	1981	Action
4346	1981	Mystery
4347	1981	Thriller
4348	1982	Action
4349	1982	War
4350	1983	Adventure
4351	1984	Comedy
4352	1984	Western
4353	1985	Drama
4354	1985	Thriller
4355	1986	Drama
4356	1986	Romance
4357	1987	Comedy
4358	1987	Romance
4359	1988	Adventure
4360	1988	Comedy
4361	1988	Thriller
4362	1989	Comedy
4363	1989	Romance
4364	1990	Drama
4365	1990	Horror
4366	1990	Thriller
4367	1991	Drama
4368	1992	Action
4369	1992	Thriller
4370	1993	Comedy
4371	1993	Romance
4372	1994	Comedy
4373	1994	Romance
4374	1995	Animation
4375	1995	Sci-Fi
4376	1996	Comedy
4377	1996	Romance
4378	1997	Romance
4379	1998	Comedy
4380	1998	Sci-Fi
4381	1999	Comedy
4382	2000	Comedy
4383	2001	Drama
4384	2002	Comedy
4385	2002	Crime
4386	2003	Comedy
4387	2003	Drama
4388	2004	Drama
4389	2004	Mystery
4390	2004	Thriller
4391	2005	Comedy
4392	2005	Drama
4393	2005	Romance
4394	2006	Comedy
4395	2006	Sci-Fi
4396	2007	Crime
4397	2007	Film-Noir
4398	2008	Horror
4399	2009	Comedy
4400	2009	Horror
4401	2010	Horror
4402	2011	Horror
4403	2012	Horror
4404	2013	Comedy
4405	2014	Drama
4406	2014	Horror
4407	2014	Thriller
4408	2015	Drama
4409	2016	Action
4410	2016	Drama
4411	2016	Thriller
4412	2017	Drama
4413	2018	Action
4414	2018	Adventure
4415	2018	Drama
4416	2018	Thriller
4417	2019	Action
4418	2019	Horror
4419	2019	Sci-Fi
4420	2020	Action
4421	2020	Sci-Fi
4422	2020	Thriller
4423	2020	Western
4424	2021	Action
4425	2021	Adventure
4426	2021	Sci-Fi
4427	2022	Action
4428	2022	Drama
4429	2022	Sci-Fi
4430	2023	Action
4431	2023	Sci-Fi
4432	2024	Action
4433	2024	Sci-Fi
4434	2025	Action
4435	2025	Sci-Fi
4436	2026	Action
4437	2026	Sci-Fi
4438	2027	Action
4439	2028	Action
4440	2028	Drama
4441	2028	Thriller
4442	2029	Drama
4443	2030	Adventure
4444	2031	Comedy
4445	2032	Action
4446	2032	Crime
4447	2032	Drama
4448	2032	Thriller
4449	2033	Drama
4450	2034	Comedy
4451	2034	Crime
4452	2034	Thriller
4453	2035	Drama
4454	2035	Romance
4455	2036	Comedy
4456	2037	Drama
4457	2038	Horror
4458	2039	Action
4459	2039	Sci-Fi
4460	2040	Horror
4461	2040	Thriller
4462	2041	Drama
4463	2041	Horror
4464	2041	Thriller
4465	2042	Comedy
4466	2043	Horror
4467	2043	Sci-Fi
4468	2043	Thriller
4469	2044	Horror
4470	2044	Sci-Fi
4471	2044	Thriller
4472	2045	Comedy
4473	2046	Comedy
4474	2046	Romance
4475	2047	Animation
4476	2047	Children
4477	2048	Horror
4478	2048	Thriller
4479	2049	Crime
4480	2049	Thriller
4481	2050	Drama
4482	2051	Drama
4483	2052	Drama
4484	2052	Musical
4485	2052	Romance
4486	2053	Comedy
4487	2054	Action
4488	2054	Crime
4489	2055	Comedy
4490	2055	Drama
4491	2055	Romance
4492	2056	Drama
4493	2056	Romance
4494	2057	Action
4495	2057	Sci-Fi
4496	2057	Thriller
4497	2058	Comedy
4498	2058	Romance
4499	2059	Drama
4500	2059	Musical
4501	2060	Comedy
4502	2061	Drama
4503	2062	Comedy
4504	2062	Drama
4505	2063	Crime
4506	2063	Mystery
4507	2063	Thriller
4508	2064	Comedy
4509	2064	Crime
4510	2065	Comedy
4511	2065	Romance
4512	2066	Action
4513	2066	Comedy
4514	2067	Comedy
4515	2067	Drama
4516	2068	Drama
4517	2068	Romance
4518	2069	Comedy
4519	2069	Crime
4520	2069	Thriller
4521	2070	Comedy
4522	2070	Crime
4523	2070	Drama
4524	2071	Comedy
4525	2071	Drama
4526	2071	Romance
4527	2072	Drama
4528	2073	Comedy
4529	2074	Drama
4530	2074	Romance
4531	2074	Sci-Fi
4532	2074	Thriller
4533	2075	Comedy
4534	2075	Drama
4535	2076	Comedy
4536	2076	Romance
4537	2077	Comedy
4538	2078	Comedy
4539	2079	Action
4540	2079	Sci-Fi
4541	2079	Thriller
4542	2080	Crime
4543	2080	Thriller
4544	2081	Comedy
4545	2081	Horror
4546	2082	Drama
4547	2082	Romance
4548	2083	Drama
4549	2084	Drama
4550	2085	Drama
4551	2086	Drama
4552	2086	Film-Noir
4553	2087	Comedy
4554	2087	Horror
4555	2087	Sci-Fi
4556	2088	Action
4557	2088	Horror
4558	2088	Sci-Fi
4559	2089	Adventure
4560	2089	Sci-Fi
4561	2090	Action
4562	2090	Crime
4563	2091	Action
4564	2091	Adventure
4565	2091	Comedy
4566	2091	Fantasy
4567	2091	Horror
4568	2091	Thriller
4569	2092	Comedy
4570	2093	Drama
4571	2093	Romance
4572	2094	Drama
4573	2095	Comedy
4574	2095	Fantasy
4575	2096	Drama
4576	2096	Fantasy
4577	2097	Action
4578	2097	Adventure
4579	2097	Crime
4580	2097	Sci-Fi
4581	2097	Thriller
4582	2098	Comedy
4583	2098	Drama
4584	2098	Romance
4585	2099	Action
4586	2099	Adventure
4587	2099	Sci-Fi
4588	2100	Comedy
4589	2100	Romance
4590	2101	Horror
4591	2101	Romance
4592	2102	Horror
4593	2103	Horror
4594	2104	Horror
4595	2105	Horror
4596	2106	Horror
4597	2107	Drama
4598	2108	Action
4599	2108	Adventure
4600	2108	Sci-Fi
4601	2109	Action
4602	2109	Sci-Fi
4603	2110	Action
4604	2110	Adventure
4605	2110	Sci-Fi
4606	2111	Action
4607	2111	Adventure
4608	2111	Sci-Fi
4609	2112	Horror
4610	2113	Horror
4611	2114	Drama
4612	2114	Horror
4613	2114	Sci-Fi
4614	2115	Horror
4615	2116	Horror
4616	2117	Horror
4617	2118	Horror
4618	2119	Drama
4619	2119	Fantasy
4620	2119	Horror
4621	2120	Horror
4622	2121	Horror
4623	2121	Sci-Fi
4624	2122	Comedy
4625	2122	Horror
4626	2122	Musical
4627	2122	Sci-Fi
4628	2123	Comedy
4629	2123	Documentary
4630	2124	Horror
4631	2124	Sci-Fi
4632	2125	Sci-Fi
4633	2126	Action
4634	2126	Drama
4635	2126	Sci-Fi
4636	2127	Sci-Fi
4637	2128	Horror
4638	2128	Sci-Fi
4639	2128	Thriller
4640	2129	Sci-Fi
4641	2130	Sci-Fi
4642	2131	Horror
4643	2131	Sci-Fi
4644	2132	Horror
4645	2132	Sci-Fi
4646	2133	War
4647	2134	War
4648	2135	Comedy
4649	2135	Romance
4650	2136	Drama
4651	2136	Sci-Fi
4652	2136	Thriller
4653	2137	Drama
4654	2138	Drama
4655	2138	Fantasy
4656	2139	Drama
4657	2139	Thriller
4658	2140	Documentary
4659	2140	Musical
4660	2141	Drama
4661	2142	Comedy
4662	2142	Romance
4663	2142	Sci-Fi
4664	2143	Drama
4665	2144	Action
4666	2144	Adventure
4667	2144	Comedy
4668	2145	Drama
4669	2145	Mystery
4670	2146	Adventure
4671	2146	Animation
4672	2146	Children
4673	2146	Drama
4674	2147	Crime
4675	2147	Drama
4676	2147	Mystery
4677	2147	Thriller
4678	2148	Documentary
4679	2149	Comedy
4680	2149	Romance
4681	2150	Drama
4682	2151	Action
4683	2151	Crime
4684	2152	Documentary
4685	2153	Comedy
4686	2154	Drama
4687	2155	Comedy
4688	2156	Comedy
4689	2156	Drama
4690	2156	Romance
4691	2157	Sci-Fi
4692	2158	Comedy
4693	2158	Horror
4694	2159	Animation
4695	2159	Comedy
4696	2159	Musical
4697	2160	Action
4698	2160	Comedy
4699	2160	Sci-Fi
4700	2160	Western
4701	2161	Drama
4702	2162	Drama
4703	2163	Comedy
4704	2163	Romance
4705	2164	Thriller
4706	2165	Romance
4707	2166	Children
4708	2166	Comedy
4709	2167	Drama
4710	2167	Horror
4711	2167	Thriller
4712	2168	Drama
4713	2169	Drama
4714	2169	Mystery
4715	2169	Thriller
4716	2170	Horror
4717	2170	Thriller
4718	2171	Comedy
4719	2171	Romance
4720	2172	Action
4721	2172	Comedy
4722	2172	Sci-Fi
4723	2173	Comedy
4724	2173	Fantasy
4725	2173	Sci-Fi
4726	2174	Comedy
4727	2175	Horror
4728	2175	Thriller
4729	2176	Action
4730	2176	Adventure
4731	2176	Children
4732	2176	Comedy
4733	2177	Comedy
4734	2177	Romance
4735	2178	Action
4736	2178	Horror
4737	2178	Sci-Fi
4738	2178	Thriller
4739	2179	Action
4740	2179	Comedy
4741	2179	Fantasy
4742	2180	Comedy
4743	2180	Romance
4744	2181	Drama
4745	2182	Crime
4746	2182	Film-Noir
4747	2183	Crime
4748	2183	Film-Noir
4749	2184	Action
4750	2184	Drama
4751	2184	Romance
4752	2184	War
4753	2185	Drama
4754	2185	Romance
4755	2186	Drama
4756	2186	Romance
4757	2186	War
4758	2187	Crime
4759	2187	Drama
4760	2188	Drama
4761	2188	Romance
4762	2189	Adventure
4763	2189	Comedy
4764	2189	Romance
4765	2190	Adventure
4766	2190	Drama
4767	2190	Thriller
4768	2191	Action
4769	2191	Adventure
4770	2191	Comedy
4771	2191	Fantasy
4772	2191	Mystery
4773	2192	Comedy
4774	2193	Action
4775	2193	Drama
4776	2193	Thriller
4777	2194	Comedy
4778	2194	Drama
4779	2195	Drama
4780	2196	Action
4781	2196	Crime
4782	2196	Thriller
4783	2197	Drama
4784	2198	Comedy
4785	2198	Horror
4786	2198	Musical
4787	2199	Comedy
4788	2199	Horror
4789	2200	Action
4790	2200	Adventure
4791	2200	Comedy
4792	2201	Drama
4793	2201	Mystery
4794	2202	Comedy
4795	2202	Drama
4796	2203	Comedy
4797	2203	Mystery
4798	2204	Thriller
4799	2205	Drama
4800	2206	Drama
4801	2207	Comedy
4802	2208	Drama
4803	2209	Adventure
4804	2209	Animation
4805	2209	Children
4806	2209	Drama
4807	2209	Sci-Fi
4808	2210	Drama
4809	2210	Horror
4810	2210	Mystery
4811	2211	Action
4812	2211	Mystery
4813	2212	Crime
4814	2212	Drama
4815	2212	Romance
4816	2212	Thriller
4817	2213	Comedy
4818	2213	Drama
4819	2214	Comedy
4820	2214	Drama
4821	2215	Comedy
4822	2216	Crime
4823	2216	Drama
4824	2217	Comedy
4825	2218	Drama
4826	2219	Comedy
4827	2220	Comedy
4828	2220	Romance
4829	2221	Drama
4830	2222	Drama
4831	2223	Crime
4832	2223	Drama
4833	2223	Romance
4834	2223	Thriller
4835	2224	Comedy
4836	2225	Comedy
4837	2225	Horror
4838	2226	Horror
4839	2227	Horror
4840	2228	Comedy
4841	2229	Horror
4842	2230	Comedy
4843	2231	Horror
4844	2232	Horror
4845	2232	Thriller
4846	2233	Comedy
4847	2234	Comedy
4848	2235	Comedy
4849	2235	Horror
4850	2235	Romance
4851	2235	Thriller
4852	2236	Adventure
4853	2236	Comedy
4854	2236	Romance
4855	2237	Comedy
4856	2238	Comedy
4857	2239	Comedy
4858	2239	Drama
4859	2239	Fantasy
4860	2239	Romance
4861	2240	Children
4862	2240	Comedy
4863	2241	Comedy
4864	2242	Adventure
4865	2242	Animation
4866	2242	Children
4867	2242	Drama
4868	2242	Fantasy
4869	2243	Drama
4870	2243	Romance
4871	2244	Action
4872	2244	Drama
4873	2244	Romance
4874	2244	Thriller
4875	2245	Crime
4876	2245	Drama
4877	2245	Mystery
4878	2245	Romance
4879	2245	Thriller
4880	2246	Children
4881	2246	Comedy
4882	2247	Comedy
4883	2247	Romance
4884	2248	Comedy
4885	2248	Thriller
4886	2249	Action
4887	2249	Sci-Fi
4888	2250	Action
4889	2250	Sci-Fi
4890	2251	Comedy
4891	2252	Animation
4892	2252	Horror
4893	2252	Mystery
4894	2252	Thriller
4895	2253	Action
4896	2253	Thriller
4897	2254	Action
4898	2254	War
4899	2255	Action
4900	2255	War
4901	2256	Action
4902	2257	Action
4903	2257	War
4904	2258	Drama
4905	2258	Mystery
4906	2258	Romance
4907	2258	Thriller
4908	2259	Adventure
4909	2259	Romance
4910	2260	Action
4911	2260	Adventure
4912	2260	Fantasy
4913	2261	Horror
4914	2261	Sci-Fi
4915	2261	Thriller
4916	2262	Children
4917	2262	Comedy
4918	2263	Comedy
4919	2264	Drama
4920	2265	Drama
4921	2266	Romance
4922	2266	War
4923	2267	Comedy
4924	2267	Romance
4925	2268	Action
4926	2268	Adventure
4927	2268	Comedy
4928	2268	Thriller
4929	2269	Comedy
4930	2270	Comedy
4931	2270	Romance
4932	2271	Drama
4933	2271	Thriller
4934	2272	Horror
4935	2272	Mystery
4936	2272	Thriller
4937	2273	Comedy
4938	2273	Romance
4939	2274	Drama
4940	2274	Mystery
4941	2275	Adventure
4942	2275	Children
4943	2275	Comedy
4944	2275	Drama
4945	2276	Adventure
4946	2276	Drama
4947	2276	Romance
4948	2277	Drama
4949	2278	Adventure
4950	2278	Sci-Fi
4951	2278	Thriller
4952	2279	Drama
4953	2280	Thriller
4954	2281	Adventure
4955	2281	Animation
4956	2281	Comedy
4957	2281	Fantasy
4958	2281	Musical
4959	2282	Drama
4960	2282	Romance
4961	2283	Documentary
4962	2283	Musical
4963	2284	Comedy
4964	2285	Comedy
4965	2285	Drama
4966	2286	Drama
4967	2287	Adventure
4968	2287	Comedy
4969	2287	Musical
4970	2288	Comedy
4971	2289	Comedy
4972	2290	Drama
4973	2291	Comedy
4974	2291	Horror
4975	2291	Thriller
4976	2292	Horror
4977	2293	Comedy
4978	2294	Adventure
4979	2294	Drama
4980	2294	Thriller
4981	2295	Adventure
4982	2295	Fantasy
4983	2296	Drama
4984	2296	Mystery
4985	2296	Romance
4986	2297	Comedy
4987	2297	Musical
4988	2297	Romance
4989	2298	Drama
4990	2298	Mystery
4991	2298	Romance
4992	2299	Animation
4993	2299	Children
4994	2299	Fantasy
4995	2300	Musical
4996	2301	Horror
4997	2302	Action
4998	2302	Adventure
4999	2302	Comedy
5000	2303	Action
5001	2303	Adventure
5002	2303	Comedy
5003	2304	Action
5004	2304	Crime
5005	2304	Drama
5006	2304	Thriller
5007	2305	Drama
5008	2306	Comedy
5009	2306	Drama
5010	2307	Comedy
5011	2307	Romance
5012	2308	Drama
5013	2308	Romance
5014	2309	Children
5015	2309	Comedy
5016	2310	Action
5017	2310	Comedy
5018	2311	Comedy
5019	2311	Romance
5020	2312	Comedy
5021	2312	Drama
5022	2313	Action
5023	2313	Adventure
5024	2313	Comedy
5025	2313	Drama
5026	2313	War
5027	2314	Comedy
5028	2315	Action
5029	2315	Adventure
5030	2315	Drama
5031	2316	Drama
5032	2316	Romance
5033	2317	Western
5034	2318	Horror
5035	2318	Mystery
5036	2319	Adventure
5037	2319	Animation
5038	2319	Children
5039	2320	Horror
5040	2320	Sci-Fi
5041	2321	Horror
5042	2321	Sci-Fi
5043	2322	Horror
5044	2322	Mystery
5045	2322	Thriller
5046	2323	Horror
5047	2323	Thriller
5048	2324	Action
5049	2324	Adventure
5050	2324	Drama
5051	2325	Drama
5052	2325	Romance
5053	2326	Comedy
5054	2327	Drama
5055	2328	Crime
5056	2328	Drama
5057	2328	Thriller
5058	2329	Comedy
5059	2330	Action
5060	2330	Adventure
5061	2330	Sci-Fi
5062	2330	Thriller
5063	2331	Crime
5064	2331	Thriller
5065	2332	Comedy
5066	2333	Drama
5067	2333	Romance
5068	2333	War
5069	2334	Drama
5070	2334	Romance
5071	2335	Western
5072	2336	Crime
5073	2336	Drama
5074	2336	Western
5075	2337	Action
5076	2337	Comedy
5077	2338	Drama
5078	2339	Comedy
5079	2339	Drama
5080	2340	Drama
5081	2340	Romance
5082	2341	Drama
5083	2342	Drama
5084	2342	Romance
5085	2343	Comedy
5086	2343	Crime
5087	2343	Drama
5088	2343	Fantasy
5089	2344	Drama
5090	2345	Drama
5091	2345	Musical
5092	2346	Comedy
5093	2346	Romance
5094	2347	Adventure
5095	2347	Comedy
5096	2347	Romance
5097	2348	Comedy
5098	2349	Drama
5099	2349	Sci-Fi
5100	2350	Drama
5101	2350	Thriller
5102	2351	Drama
5103	2351	Film-Noir
5104	2351	Mystery
5105	2351	Romance
5106	2352	Musical
5107	2352	Romance
5108	2352	War
5109	2353	Drama
5110	2353	Romance
5111	2354	Drama
5112	2354	Romance
5113	2355	Action
5114	2355	Drama
5115	2355	War
5116	2356	Mystery
5117	2357	Comedy
5118	2357	Musical
5119	2358	Action
5120	2358	Adventure
5121	2358	Thriller
5122	2359	Action
5123	2359	Adventure
5124	2359	Thriller
5125	2360	Action
5126	2360	Adventure
5127	2360	Thriller
5128	2361	Adventure
5129	2361	Drama
5130	2361	Romance
5131	2362	Action
5132	2362	Western
5133	2363	Crime
5134	2363	Drama
5135	2363	Thriller
5136	2364	Children
5137	2364	Comedy
5138	2365	Action
5139	2365	Crime
5140	2365	Thriller
5141	2366	Action
5142	2366	Crime
5143	2366	Drama
5144	2366	Thriller
5145	2367	Comedy
5146	2367	Drama
5147	2368	Comedy
5148	2368	Romance
5149	2369	Drama
5150	2370	Action
5151	2371	Adventure
5152	2371	Drama
5153	2372	Drama
5154	2372	Thriller
5155	2373	Adventure
5156	2373	Comedy
5157	2373	Fantasy
5158	2373	Sci-Fi
5159	2374	Drama
5160	2374	Romance
5161	2375	Adventure
5162	2375	Drama
5163	2376	Drama
5164	2376	Fantasy
5165	2376	Musical
5166	2377	Drama
5167	2377	War
5168	2378	Comedy
5169	2378	Crime
5170	2378	Drama
5171	2379	Horror
5172	2379	Thriller
5173	2380	Comedy
5174	2380	Drama
5175	2381	Drama
5176	2382	Comedy
5177	2382	Drama
5178	2383	Comedy
5179	2383	Romance
5180	2384	Drama
5181	2385	Thriller
5182	2386	Documentary
5183	2387	Action
5184	2387	Crime
5185	2387	Drama
5186	2387	Sci-Fi
5187	2387	Thriller
5188	2388	Action
5189	2388	Crime
5190	2388	Sci-Fi
5191	2388	Thriller
5192	2389	Adventure
5193	2389	Animation
5194	2389	Children
5195	2389	Comedy
5196	2389	Crime
5197	2389	Fantasy
5198	2389	Mystery
5199	2390	Drama
5200	2391	Action
5201	2391	Adventure
5202	2391	Thriller
5203	2392	Action
5204	2392	Adventure
5205	2392	Thriller
5206	2393	Action
5207	2393	Adventure
5208	2393	Thriller
5209	2394	Horror
5210	2394	Thriller
5211	2395	Action
5212	2395	Adventure
5213	2395	Thriller
5214	2396	Horror
5215	2396	Thriller
5216	2397	Drama
5217	2398	Comedy
5218	2398	Drama
5219	2398	Fantasy
5220	2399	Action
5221	2399	Adventure
5222	2399	Animation
5223	2399	Drama
5224	2399	Fantasy
5225	2400	Comedy
5226	2400	Drama
5227	2400	Romance
5228	2400	War
5229	2401	Comedy
5230	2401	Romance
5231	2402	Thriller
5232	2403	Drama
5233	2403	Thriller
5234	2404	Documentary
5235	2405	Drama
5236	2405	Sci-Fi
5237	2406	Drama
5238	2407	Drama
5239	2408	Comedy
5240	2408	Horror
5241	2409	Thriller
5242	2410	Horror
5243	2411	Horror
5244	2412	Comedy
5245	2412	Horror
5246	2412	Sci-Fi
5247	2413	Crime
5248	2413	Drama
5249	2414	Action
5250	2414	Drama
5251	2415	Horror
5252	2416	Comedy
5253	2416	War
5254	2417	Horror
5255	2417	Sci-Fi
5256	2418	Comedy
5257	2418	Horror
5258	2419	Comedy
5259	2420	Action
5260	2420	Drama
5261	2421	Action
5262	2421	Adventure
5263	2422	Comedy
5264	2423	Action
5265	2423	Drama
5266	2423	Sci-Fi
5267	2423	Thriller
5268	2424	Comedy
5269	2424	Sci-Fi
5270	2425	Adventure
5271	2425	Animation
5272	2425	Children
5273	2425	Comedy
5274	2425	Musical
5275	2426	Comedy
5276	2426	Drama
5277	2426	War
5278	2427	Adventure
5279	2427	Drama
5280	2428	Western
5281	2429	Drama
5282	2430	Comedy
5283	2431	Comedy
5284	2432	Comedy
5285	2433	Comedy
5286	2434	Comedy
5287	2435	Mystery
5288	2435	Romance
5289	2435	Thriller
5290	2436	Comedy
5291	2436	Drama
5292	2437	Comedy
5293	2437	Romance
5294	2438	Drama
5295	2439	Comedy
5296	2440	Comedy
5297	2440	War
5298	2441	Comedy
5299	2441	Drama
5300	2442	Adventure
5301	2442	Comedy
5302	2442	Fantasy
5303	2443	Drama
5304	2443	War
5305	2444	Adventure
5306	2444	Animation
5307	2444	Children
5308	2444	Fantasy
5309	2444	Sci-Fi
5310	2445	Thriller
5311	2446	Crime
5312	2446	Drama
5313	2446	Thriller
5314	2447	Horror
5315	2447	Sci-Fi
5316	2448	Comedy
5317	2448	Drama
5318	2448	Musical
5319	2449	Comedy
5320	2449	Musical
5321	2450	Action
5322	2450	Drama
5323	2450	War
5324	2451	Drama
5325	2451	Thriller
5326	2452	Drama
5327	2452	Thriller
5328	2453	Action
5329	2453	Drama
5330	2453	War
5331	2454	Comedy
5332	2454	Drama
5333	2455	Drama
5334	2455	Mystery
5335	2456	Drama
5336	2457	Adventure
5337	2457	Comedy
5338	2457	Sci-Fi
5339	2458	Comedy
5340	2458	Drama
5341	2459	Comedy
5342	2459	Romance
5343	2460	Western
5344	2461	Drama
5345	2461	Horror
5346	2462	Comedy
5347	2463	Documentary
5348	2464	Drama
5349	2465	Comedy
5350	2465	Drama
5351	2465	Romance
5352	2466	Fantasy
5353	2466	Horror
5354	2466	Mystery
5355	2466	Romance
5356	2467	Action
5357	2467	Adventure
5358	2467	Thriller
5359	2468	Drama
5360	2469	Children
5361	2469	Comedy
5362	2469	Fantasy
5363	2469	Musical
5364	2470	Comedy
5365	2470	Fantasy
5366	2470	Romance
5367	2471	Comedy
5368	2471	Fantasy
5369	2472	Drama
5370	2473	Drama
5371	2474	Drama
5372	2474	War
5373	2475	Drama
5374	2476	Drama
5375	2476	Western
5376	2477	Drama
5377	2477	Romance
5378	2478	Drama
5379	2479	Comedy
5380	2480	Comedy
5381	2480	Drama
5382	2480	Romance
5383	2481	Drama
5384	2482	Comedy
5385	2482	Drama
5386	2482	Romance
5387	2483	Drama
5388	2484	Drama
5389	2484	Thriller
5390	2485	Crime
5391	2485	Romance
5392	2485	Thriller
5393	2486	Drama
5394	2486	Romance
5395	2487	Action
5396	2487	Comedy
5397	2487	Crime
5398	2487	Thriller
5399	2488	Drama
5400	2488	Mystery
5401	2489	Drama
5402	2489	Romance
5403	2490	Action
5404	2490	Drama
5405	2491	Comedy
5406	2491	Drama
5407	2491	Fantasy
5408	2491	Romance
5409	2492	Drama
5410	2493	Drama
5411	2494	Drama
5412	2495	Drama
5413	2496	Action
5414	2496	Fantasy
5415	2496	Horror
5416	2496	Mystery
5417	2496	Thriller
5418	2497	Adventure
5419	2497	Animation
5420	2497	Children
5421	2497	Comedy
5422	2497	Fantasy
5423	2498	Drama
5424	2499	Drama
5425	2499	Romance
5426	2499	War
5427	2500	Comedy
5428	2501	Drama
5429	2501	Film-Noir
5430	2502	Drama
5431	2502	Romance
5432	2502	Western
5433	2503	Drama
5434	2504	Drama
5435	2505	Comedy
5436	2505	Drama
5437	2506	Drama
5438	2507	Comedy
5439	2507	Drama
5440	2508	Comedy
5441	2508	Crime
5442	2508	Drama
5443	2509	Drama
5444	2509	War
5445	2510	Drama
5446	2511	Action
5447	2511	War
5448	2512	Action
5449	2512	Adventure
5450	2513	Comedy
5451	2514	Drama
5452	2515	Documentary
5453	2515	Musical
5454	2516	Drama
5455	2516	War
5456	2517	Comedy
5457	2517	Romance
5458	2518	Drama
5459	2519	Comedy
5460	2520	Crime
5461	2520	Drama
5462	2521	Drama
5463	2522	Mystery
5464	2523	Drama
5465	2523	Thriller
5466	2524	Drama
5467	2525	Action
5468	2525	Adventure
5469	2525	Fantasy
5470	2526	Drama
5471	2526	Romance
5472	2527	Drama
5473	2527	Romance
5474	2527	Sci-Fi
5475	2528	Children
5476	2528	Comedy
5477	2528	Fantasy
5478	2529	Drama
5479	2530	Animation
5480	2530	Children
5481	2530	Musical
5482	2530	IMAX
5483	2531	Drama
5484	2532	Comedy
5485	2532	Drama
5486	2533	Comedy
5487	2533	Drama
5488	2533	Musical
5489	2534	Action
5490	2534	Drama
5491	2535	Adventure
5492	2536	Comedy
5493	2536	Drama
5494	2537	Adventure
5495	2537	Drama
5496	2538	Crime
5497	2538	Drama
5498	2538	Thriller
5499	2539	Drama
5500	2540	Drama
5501	2541	Comedy
5502	2541	Drama
5503	2542	Adventure
5504	2542	Comedy
5505	2542	Sci-Fi
5506	2543	Drama
5507	2543	Mystery
5508	2543	Thriller
5509	2544	Comedy
5510	2545	Drama
5511	2546	Drama
5512	2547	Drama
5513	2548	Documentary
5514	2549	Drama
5515	2550	Drama
5516	2551	Drama
5517	2552	Documentary
5518	2553	Children
5519	2553	Drama
5520	2554	Adventure
5521	2554	Sci-Fi
5522	2554	Thriller
5523	2555	Drama
5524	2555	Romance
5525	2556	Drama
5526	2556	War
5527	2557	Action
5528	2557	Crime
5529	2557	Romance
5530	2557	Thriller
5531	2558	Crime
5532	2558	Drama
5533	2559	Comedy
5534	2559	Drama
5535	2559	Musical
5536	2559	Romance
5537	2560	Comedy
5538	2560	Drama
5539	2561	Drama
5540	2562	Drama
5541	2562	Horror
5542	2563	Thriller
5543	2564	Action
5544	2564	Mystery
5545	2564	Thriller
5546	2565	Romance
5547	2566	Adventure
5548	2567	Action
5549	2567	Comedy
5550	2568	Comedy
5551	2568	Drama
5552	2568	Romance
5553	2569	Drama
5554	2570	Animation
5555	2570	Children
5556	2571	Drama
5557	2572	Drama
5558	2573	Mystery
5559	2573	Thriller
5560	2574	Drama
5561	2575	Drama
5562	2576	Drama
5563	2577	Comedy
5564	2577	Romance
5565	2578	Crime
5566	2578	Drama
5567	2579	Thriller
5568	2580	Comedy
5569	2581	Comedy
5570	2582	Thriller
5571	2583	Comedy
5572	2584	Comedy
5573	2585	Comedy
5574	2585	Romance
5575	2586	Drama
5576	2587	Drama
5577	2588	Comedy
5578	2588	Crime
5579	2589	Comedy
5580	2590	Drama
5581	2590	Thriller
5582	2591	Drama
5583	2592	Drama
5584	2592	Mystery
5585	2593	Drama
5586	2594	Comedy
5587	2595	Comedy
5588	2596	Comedy
5589	2596	Drama
5590	2597	Action
5591	2597	Crime
5592	2597	Drama
5593	2597	Thriller
5594	2598	Drama
5595	2598	Romance
5596	2598	Thriller
5597	2599	Comedy
5598	2599	Fantasy
5599	2600	Adventure
5600	2600	Drama
5601	2600	Romance
5602	2601	Drama
5603	2602	Comedy
5604	2602	Drama
5605	2602	Romance
5606	2603	Crime
5607	2603	Drama
5608	2603	Mystery
5609	2603	Thriller
5610	2604	Comedy
5611	2604	Drama
5612	2605	Action
5613	2605	Comedy
5614	2605	Horror
5615	2606	Action
5616	2606	Crime
5617	2606	Drama
5618	2606	Thriller
5619	2607	Comedy
5620	2607	Crime
5621	2607	Drama
5622	2607	Thriller
5623	2608	Action
5624	2608	Crime
5625	2608	Thriller
5626	2608	Western
5627	2609	Action
5628	2609	Comedy
5629	2610	Drama
5630	2610	Romance
5631	2610	Sci-Fi
5632	2611	Comedy
5633	2611	Drama
5634	2611	Romance
5635	2612	Drama
5636	2613	Crime
5637	2613	Drama
5638	2614	Comedy
5639	2614	Horror
5640	2614	Mystery
5641	2614	Thriller
5642	2615	Drama
5643	2615	Thriller
5644	2616	Action
5645	2616	Crime
5646	2616	Drama
5647	2616	Thriller
5648	2617	Comedy
5649	2618	Documentary
5650	2619	Comedy
5651	2620	Comedy
5652	2620	Mystery
5653	2620	Romance
5654	2621	Adventure
5655	2621	Drama
5656	2622	Comedy
5657	2623	Animation
5658	2623	Children
5659	2624	Drama
5660	2625	Film-Noir
5661	2626	Drama
5662	2627	Crime
5663	2627	Drama
5664	2627	Thriller
5665	2628	Horror
5666	2628	Sci-Fi
5667	2628	Thriller
5668	2629	Comedy
5669	2629	Crime
5670	2630	Comedy
5671	2631	Documentary
5672	2632	Crime
5673	2632	Drama
5674	2633	Comedy
5675	2633	Drama
5676	2633	Romance
5677	2634	Comedy
5678	2634	Drama
5679	2635	Comedy
5680	2635	Drama
5681	2636	Western
5682	2637	Comedy
5683	2638	Action
5684	2638	Thriller
5685	2639	Comedy
5686	2639	Drama
5687	2640	Drama
5688	2640	Thriller
5689	2641	Comedy
5690	2641	Drama
5691	2641	Romance
5692	2642	Comedy
5693	2643	Comedy
5694	2643	Drama
5695	2644	Comedy
5696	2644	Sci-Fi
5697	2645	Documentary
5698	2646	Crime
5699	2646	Drama
5700	2647	Drama
5701	2648	Drama
5702	2648	Romance
5703	2649	Drama
5704	2650	Drama
5705	2651	Crime
5706	2651	Drama
5707	2651	Film-Noir
5708	2651	Thriller
5709	2652	Documentary
5710	2653	War
5711	2654	Horror
5712	2654	Sci-Fi
5713	2655	Comedy
5714	2656	Drama
5715	2656	War
5716	2657	Comedy
5717	2657	Drama
5718	2657	Romance
5719	2658	Adventure
5720	2658	Children
5721	2659	Adventure
5722	2659	Drama
5723	2660	Drama
5724	2661	Sci-Fi
5725	2662	Fantasy
5726	2662	Horror
5727	2662	Mystery
5728	2662	Thriller
5729	2663	Drama
5730	2663	Romance
5731	2664	Comedy
5732	2664	Drama
5733	2664	Fantasy
5734	2664	Romance
5735	2665	Comedy
5736	2665	Drama
5737	2666	Drama
5738	2666	Romance
5739	2667	Comedy
5740	2667	Drama
5741	2667	Romance
5742	2668	Crime
5743	2668	Drama
5744	2669	Comedy
5745	2669	Drama
5746	2670	Crime
5747	2670	Film-Noir
5748	2671	Drama
5749	2671	Western
5750	2672	Romance
5751	2672	Western
5752	2673	Drama
5753	2673	Thriller
5754	2674	Drama
5755	2675	Action
5756	2675	War
5757	2676	Western
5758	2677	Drama
5759	2678	Sci-Fi
5760	2679	Drama
5761	2679	War
5762	2680	Drama
5763	2681	Film-Noir
5764	2682	Action
5765	2682	Crime
5766	2683	Comedy
5767	2684	Drama
5768	2684	Mystery
5769	2684	Thriller
5770	2685	Comedy
5771	2685	Mystery
5772	2686	Children
5773	2686	Comedy
5774	2687	Adventure
5775	2687	Crime
5776	2687	Drama
5777	2687	Romance
5778	2688	Comedy
5779	2689	Comedy
5780	2690	Comedy
5781	2690	Fantasy
5782	2690	Romance
5783	2691	Comedy
5784	2691	Romance
5785	2692	Comedy
5786	2693	Adventure
5787	2693	Children
5788	2693	Comedy
5789	2693	Musical
5790	2694	Children
5791	2694	Comedy
5792	2695	Children
5793	2695	Comedy
5794	2695	Musical
5795	2696	Children
5796	2696	Comedy
5797	2697	Adventure
5798	2697	Animation
5799	2697	Children
5800	2697	Fantasy
5801	2698	Adventure
5802	2698	Sci-Fi
5803	2699	Comedy
5804	2699	Drama
5805	2699	Romance
5806	2700	Drama
5807	2700	Thriller
5808	2701	Action
5809	2701	Drama
5810	2702	Action
5811	2702	Drama
5812	2703	Action
5813	2703	Adventure
5814	2703	Drama
5815	2703	War
5816	2704	Drama
5817	2705	Drama
5818	2705	Thriller
5819	2706	Adventure
5820	2706	Children
5821	2706	Drama
5822	2707	Crime
5823	2707	Drama
5824	2708	Drama
5825	2708	Romance
5826	2708	War
5827	2709	Drama
5828	2710	Adventure
5829	2710	Comedy
5830	2711	Adventure
5831	2711	Crime
5832	2711	Drama
5833	2712	Drama
5834	2712	Thriller
5835	2713	Comedy
5836	2714	Comedy
5837	2714	Romance
5838	2715	Drama
5839	2716	Drama
5840	2717	Drama
5841	2717	Musical
5842	2718	Drama
5843	2718	Romance
5844	2719	Crime
5845	2720	Drama
5846	2721	Animation
5847	2721	Comedy
5848	2722	Action
5849	2722	Crime
5850	2722	Drama
5851	2723	Action
5852	2723	Drama
5853	2724	Action
5854	2724	Drama
5855	2725	Action
5856	2725	Drama
5857	2726	Action
5858	2726	Drama
5859	2727	Crime
5860	2727	Drama
5861	2727	Film-Noir
5862	2728	Drama
5863	2728	Romance
5864	2729	Drama
5865	2730	Action
5866	2730	Children
5867	2730	Comedy
5868	2730	Fantasy
5869	2730	Sci-Fi
5870	2731	Action
5871	2731	Children
5872	2731	Fantasy
5873	2732	Action
5874	2732	Adventure
5875	2732	Children
5876	2732	Comedy
5877	2732	Fantasy
5878	2733	Action
5879	2733	Drama
5880	2733	War
5881	2734	Action
5882	2734	Crime
5883	2734	Drama
5884	2735	Action
5885	2735	Drama
5886	2735	Thriller
5887	2736	Action
5888	2737	Mystery
5889	2737	Thriller
5890	2738	Comedy
5891	2738	Drama
5892	2739	Drama
5893	2740	Comedy
5894	2740	Drama
5895	2740	War
5896	2741	Drama
5897	2742	Comedy
5898	2743	Drama
5899	2744	Action
5900	2744	Crime
5901	2744	Romance
5902	2744	Thriller
5903	2745	Drama
5904	2745	Romance
5905	2746	Comedy
5906	2746	Romance
5907	2747	Drama
5908	2748	Drama
5909	2748	Thriller
5910	2749	Drama
5911	2749	Horror
5912	2750	Adventure
5913	2750	Drama
5914	2750	Thriller
5915	2751	Comedy
5916	2751	Drama
5917	2751	Romance
5918	2752	Comedy
5919	2752	Fantasy
5920	2753	Drama
5921	2753	Western
5922	2754	Drama
5923	2755	Drama
5924	2756	Adventure
5925	2756	Drama
5926	2757	Adventure
5927	2757	Drama
5928	2757	Sci-Fi
5929	2758	Comedy
5930	2759	Sci-Fi
5931	2759	Thriller
5932	2760	Drama
5933	2760	Romance
5934	2761	Horror
5935	2761	Mystery
5936	2762	Comedy
5937	2762	Drama
5938	2763	Drama
5939	2764	Adventure
5940	2764	Fantasy
5941	2764	Romance
5942	2765	Drama
5943	2765	Romance
5944	2766	Comedy
5945	2766	Drama
5946	2766	Romance
5947	2767	Animation
5948	2767	Children
5949	2768	Thriller
5950	2769	Western
5951	2770	Adventure
5952	2770	Comedy
5953	2770	Fantasy
5954	2771	Horror
5955	2772	Comedy
5956	2773	Adventure
5957	2773	Comedy
5958	2773	Romance
5959	2774	Adventure
5960	2774	Drama
5961	2774	Western
5962	2775	Drama
5963	2776	Comedy
5964	2777	Drama
5965	2778	Drama
5966	2778	Horror
5967	2778	Thriller
5968	2779	Comedy
5969	2779	Drama
5970	2780	Comedy
5971	2780	Romance
5972	2781	Drama
5973	2782	Drama
5974	2782	Mystery
5975	2782	Sci-Fi
5976	2783	Comedy
5977	2783	Drama
5978	2784	Drama
5979	2784	Mystery
5980	2784	Thriller
5981	2785	Comedy
5982	2785	Drama
5983	2786	Comedy
5984	2787	Action
5985	2787	Adventure
5986	2787	Drama
5987	2787	Thriller
5988	2787	Western
5989	2788	Drama
5990	2788	Thriller
5991	2789	Drama
5992	2789	Romance
5993	2790	Drama
5994	2790	Thriller
5995	2791	Comedy
5996	2791	Romance
5997	2792	Comedy
5998	2792	Fantasy
5999	2792	Romance
6000	2793	Drama
6001	2793	Thriller
6002	2794	Action
6003	2794	Drama
6004	2794	War
6005	2795	Comedy
6006	2796	Comedy
6007	2796	Drama
6008	2797	Comedy
6009	2797	Romance
6010	2798	Comedy
6011	2799	Comedy
6012	2799	Drama
6013	2800	Action
6014	2800	Sci-Fi
6015	2800	Thriller
6016	2801	Drama
6017	2801	Romance
6018	2802	Crime
6019	2802	Thriller
6020	2803	Comedy
6021	2803	Drama
6022	2803	Romance
6023	2804	Drama
6024	2805	Crime
6025	2805	Horror
6026	2805	Mystery
6027	2805	Thriller
6028	2806	Comedy
6029	2806	Drama
6030	2806	Romance
6031	2807	Comedy
6032	2807	Drama
6033	2808	Comedy
6034	2809	Documentary
6035	2810	Drama
6036	2810	Mystery
6037	2810	Romance
6038	2811	Comedy
6039	2811	Drama
6040	2812	Drama
6041	2812	Musical
6042	2813	Drama
6043	2813	Horror
6044	2813	Thriller
6045	2814	Comedy
6046	2814	Drama
6047	2815	Comedy
6048	2815	Drama
6049	2816	Comedy
6050	2816	Musical
6051	2816	Romance
6052	2817	Horror
6053	2818	Crime
6054	2818	Drama
6055	2818	Thriller
6056	2819	Comedy
6057	2820	Drama
6058	2820	Thriller
6059	2821	Drama
6060	2821	Romance
6061	2822	Action
6062	2822	Thriller
6063	2822	War
6064	2823	Drama
6065	2823	Romance
6066	2824	Mystery
6067	2824	Thriller
6068	2825	Comedy
6069	2825	Drama
6070	2825	Romance
6071	2826	Children
6072	2826	Comedy
6073	2827	Comedy
6074	2827	Drama
6075	2828	Comedy
6076	2828	Drama
6077	2829	Comedy
6078	2829	Drama
6079	2829	Romance
6080	2830	Comedy
6081	2830	Drama
6082	2831	Comedy
6083	2831	Drama
6084	2832	Horror
6085	2832	Sci-Fi
6086	2833	Horror
6087	2833	Sci-Fi
6088	2834	Horror
6089	2834	Sci-Fi
6090	2835	Action
6091	2835	Horror
6092	2835	Sci-Fi
6093	2836	Drama
6094	2836	Romance
6095	2837	Action
6096	2837	Adventure
6097	2837	Drama
6098	2838	Drama
6099	2839	Comedy
6100	2840	Action
6101	2840	Drama
6102	2840	Romance
6103	2840	Thriller
6104	2841	Adventure
6105	2841	War
6106	2842	Crime
6107	2842	Drama
6108	2843	Comedy
6109	2843	Drama
6110	2844	Comedy
6111	2844	Drama
6112	2845	Action
6113	2845	Sci-Fi
6114	2846	Drama
6115	2846	Musical
6116	2847	Comedy
6117	2848	Comedy
6118	2849	Crime
6119	2849	Drama
6120	2849	Romance
6121	2849	Thriller
6122	2850	Comedy
6123	2850	Musical
6124	2851	Comedy
6125	2851	Musical
6126	2852	Musical
6127	2853	Crime
6128	2853	Drama
6129	2853	Musical
6130	2854	Comedy
6131	2854	Musical
6132	2854	Romance
6133	2855	Adventure
6134	2855	Comedy
6135	2856	Drama
6136	2856	Musical
6137	2856	Romance
6138	2857	Animation
6139	2857	Children
6140	2857	Comedy
6141	2858	Adventure
6142	2858	Musical
6143	2858	Romance
6144	2859	Comedy
6145	2860	Comedy
6146	2860	Romance
6147	2861	Adventure
6148	2861	Animation
6149	2861	Children
6150	2862	Comedy
6151	2862	Romance
6152	2863	Comedy
6153	2864	Comedy
6154	2864	Crime
6155	2865	Comedy
6156	2866	Comedy
6157	2866	Drama
6158	2867	Drama
6159	2867	Horror
6160	2868	Comedy
6161	2869	Action
6162	2869	Adventure
6163	2869	Thriller
6164	2870	Action
6165	2870	Adventure
6166	2870	Comedy
6167	2870	Western
6168	2871	Horror
6169	2871	Thriller
6170	2872	Action
6171	2872	Drama
6172	2872	Romance
6173	2872	War
6174	2873	Adventure
6175	2873	Comedy
6176	2873	Romance
6177	2874	Action
6178	2874	Adventure
6179	2874	Romance
6180	2874	Thriller
6181	2875	Thriller
6182	2876	Action
6183	2876	Adventure
6184	2876	Thriller
6185	2877	Action
6186	2877	Adventure
6187	2877	Sci-Fi
6188	2877	Thriller
6189	2878	Action
6190	2878	Adventure
6191	2878	Thriller
6192	2879	Comedy
6193	2879	Drama
6194	2880	Action
6195	2880	Drama
6196	2880	War
6197	2881	Western
6198	2882	Drama
6199	2883	Comedy
6200	2884	Drama
6201	2885	Documentary
6202	2886	Action
6203	2886	Adventure
6204	2886	Drama
6205	2886	War
6206	2887	Drama
6207	2888	Horror
6208	2888	Sci-Fi
6209	2889	Horror
6210	2889	Sci-Fi
6211	2889	Thriller
6212	2890	Horror
6213	2890	Sci-Fi
6214	2890	Thriller
6215	2891	Horror
6216	2891	Sci-Fi
6217	2891	Thriller
6218	2892	Horror
6219	2892	Sci-Fi
6220	2892	Thriller
6221	2893	Horror
6222	2893	Sci-Fi
6223	2893	Thriller
6224	2894	Horror
6225	2894	Sci-Fi
6226	2894	Thriller
6227	2895	Drama
6228	2895	Romance
6229	2896	Comedy
6230	2897	War
6231	2898	Comedy
6232	2898	Western
6233	2899	Adventure
6234	2899	Children
6235	2900	Adventure
6236	2900	Children
6237	2901	Comedy
6238	2901	Musical
6239	2901	Romance
6240	2902	Drama
6241	2902	Horror
6242	2903	Documentary
6243	2904	Drama
6244	2905	Documentary
6245	2905	Musical
6246	2906	Action
6247	2906	Drama
6248	2906	Thriller
6249	2906	Western
6250	2907	Action
6251	2907	Crime
6252	2907	Drama
6253	2907	Thriller
6254	2908	Crime
6255	2908	Drama
6256	2908	Film-Noir
6257	2909	Drama
6258	2909	Romance
6259	2910	Comedy
6260	2910	Drama
6261	2910	Romance
6262	2911	Horror
6263	2911	Sci-Fi
6264	2911	Thriller
6265	2912	Comedy
6266	2913	Comedy
6267	2914	Comedy
6268	2915	Comedy
6269	2915	Horror
6270	2916	Comedy
6271	2916	Horror
6272	2917	Comedy
6273	2917	Horror
6274	2918	Comedy
6275	2918	Horror
6276	2919	Comedy
6277	2919	Horror
6278	2919	Sci-Fi
6279	2919	Thriller
6280	2920	Action
6281	2920	Sci-Fi
6282	2920	Thriller
6283	2921	Action
6284	2921	Sci-Fi
6285	2922	Adventure
6286	2922	Drama
6287	2922	Romance
6288	2922	Sci-Fi
6289	2923	Drama
6290	2923	Sci-Fi
6291	2924	Crime
6292	2924	Drama
6293	2924	Sci-Fi
6294	2924	Thriller
6295	2925	Action
6296	2925	Adventure
6297	2925	Sci-Fi
6298	2926	Action
6299	2926	Adventure
6300	2926	Sci-Fi
6301	2927	Action
6302	2927	Adventure
6303	2927	Sci-Fi
6304	2928	Action
6305	2928	Comedy
6306	2928	Romance
6307	2929	Film-Noir
6308	2929	Horror
6309	2929	Mystery
6310	2929	Thriller
6311	2930	Drama
6312	2930	Romance
6313	2931	Horror
6314	2931	Thriller
6315	2932	Horror
6316	2933	Action
6317	2933	Comedy
6318	2933	Crime
6319	2933	Thriller
6320	2934	Comedy
6321	2935	Drama
6322	2936	Comedy
6323	2936	Crime
6324	2937	Action
6325	2937	Comedy
6326	2937	Crime
6327	2937	Drama
6328	2938	Action
6329	2938	Crime
6330	2939	Documentary
6331	2940	Comedy
6332	2940	Romance
6333	2941	Drama
6334	2942	Drama
6335	2943	Drama
6336	2943	War
6337	2944	Action
6338	2944	Thriller
6339	2945	Horror
6340	2945	Western
6341	2946	Crime
6342	2946	Drama
6343	2946	Film-Noir
6344	2946	Thriller
6345	2947	Action
6346	2947	Crime
6347	2947	Drama
6348	2947	Thriller
6349	2948	Drama
6350	2948	Mystery
6351	2949	Drama
6352	2949	Thriller
6353	2950	Horror
6354	2951	Drama
6355	2952	Drama
6356	2953	Crime
6357	2953	Drama
6358	2954	Drama
6359	2955	Drama
6360	2955	Western
6361	2956	Drama
6362	2957	Comedy
6363	2957	Romance
6364	2958	Action
6365	2958	Adventure
6366	2958	Comedy
6367	2958	Fantasy
6368	2959	Crime
6369	2959	Drama
6370	2959	Thriller
6371	2960	Drama
6372	2960	War
6373	2961	Comedy
6374	2961	Romance
6375	2962	Action
6376	2962	Crime
6377	2962	Thriller
6378	2963	Action
6379	2963	Adventure
6380	2963	Animation
6381	2963	Children
6382	2963	Sci-Fi
6383	2964	Drama
6384	2965	Animation
6385	2965	Children
6386	2965	Comedy
6387	2966	Adventure
6388	2966	Comedy
6389	2967	Action
6390	2967	Drama
6391	2967	War
6392	2968	Adventure
6393	2968	Animation
6394	2968	Children
6395	2968	Comedy
6396	2968	Fantasy
6397	2969	Drama
6398	2969	Thriller
6399	2970	Drama
6400	2971	Drama
6401	2971	Sci-Fi
6402	2971	Thriller
6403	2972	Animation
6404	2972	Children
6405	2972	Musical
6406	2973	Comedy
6407	2974	Action
6408	2974	Crime
6409	2974	Drama
6410	2974	Thriller
6411	2975	Action
6412	2975	Crime
6413	2975	Thriller
6414	2976	Action
6415	2976	Crime
6416	2976	Thriller
6417	2977	Crime
6418	2977	Drama
6419	2977	Romance
6420	2978	Action
6421	2978	War
6422	2979	Action
6423	2979	War
6424	2980	Action
6425	2980	War
6426	2981	Action
6427	2982	Horror
6428	2982	Sci-Fi
6429	2982	Thriller
6430	2983	Action
6431	2983	Adventure
6432	2983	Fantasy
6433	2984	Comedy
6434	2985	Comedy
6435	2985	Drama
6436	2985	Romance
6437	2986	Animation
6438	2986	Children
6439	2986	Musical
6440	2987	Animation
6441	2987	Children
6442	2987	Musical
6443	2988	Sci-Fi
6444	2989	Action
6445	2989	Crime
6446	2990	Crime
6447	2990	Drama
6448	2991	Comedy
6449	2991	Fantasy
6450	2992	Comedy
6451	2992	Horror
6452	2993	Comedy
6453	2994	Comedy
6454	2995	Drama
6455	2995	Mystery
6456	2996	Drama
6457	2997	Drama
6458	2998	Drama
6459	2999	Western
6460	3000	Action
6461	3000	Adventure
6462	3000	Sci-Fi
6463	3001	Romance
6464	3001	Thriller
6465	3002	Thriller
6466	3003	Drama
6467	3003	Horror
6468	3003	Mystery
6469	3004	Animation
6470	3004	Children
6471	3005	Drama
6472	3005	Mystery
6473	3006	Action
6474	3006	Sci-Fi
6475	3007	Comedy
6476	3008	Western
6477	3009	Adventure
6478	3009	Fantasy
6479	3010	Drama
6480	3010	War
6481	3011	Comedy
6482	3012	Drama
6483	3012	Thriller
6484	3013	Drama
6485	3013	War
6486	3014	Comedy
6487	3015	Drama
6488	3016	Comedy
6489	3017	Drama
6490	3018	Comedy
6491	3019	Children
6492	3020	Comedy
6493	3021	Drama
6494	3021	Romance
6495	3022	Drama
6496	3023	Drama
6497	3023	Romance
6498	3024	Comedy
6499	3024	Drama
6500	3024	Romance
6501	3025	Horror
6502	3025	Sci-Fi
6503	3025	Thriller
6504	3026	Action
6505	3026	Adventure
6506	3026	Comedy
6507	3026	Sci-Fi
6508	3027	Comedy
6509	3027	Horror
6510	3027	Thriller
6511	3028	Comedy
6512	3029	Horror
6513	3029	Sci-Fi
6514	3030	Adventure
6515	3030	Drama
6516	3030	Romance
6517	3031	Thriller
6518	3032	Action
6519	3032	Comedy
6520	3032	War
6521	3033	Action
6522	3033	Fantasy
6523	3033	Horror
6524	3033	Sci-Fi
6525	3033	Thriller
6526	3034	Horror
6527	3035	Horror
6528	3036	Horror
6529	3037	Action
6530	3037	Comedy
6531	3038	Horror
6532	3039	Drama
6533	3040	Drama
6534	3041	Horror
6535	3042	Drama
6536	3042	Thriller
6537	3043	Thriller
6538	3044	Crime
6539	3044	Thriller
6540	3045	Comedy
6541	3046	Comedy
6542	3047	Drama
6543	3047	Romance
6544	3048	Thriller
6545	3049	Comedy
6546	3050	Documentary
6547	3051	Comedy
6548	3052	Drama
6549	3052	Horror
6550	3052	Thriller
6551	3053	Action
6552	3053	Adventure
6553	3053	Sci-Fi
6554	3054	Comedy
6555	3054	Documentary
6556	3055	Action
6557	3055	Comedy
6558	3055	Crime
6559	3055	Romance
6560	3056	Comedy
6561	3057	Drama
6562	3058	Drama
6563	3058	Western
6564	3059	Drama
6565	3060	Comedy
6566	3060	Western
6567	3061	Action
6568	3061	Adventure
6569	3061	Fantasy
6570	3062	Horror
6571	3062	Sci-Fi
6572	3063	Action
6573	3063	Thriller
6574	3064	Comedy
6575	3065	Drama
6576	3065	Romance
6577	3066	Action
6578	3066	Adventure
6579	3066	Fantasy
6580	3067	Documentary
6581	3068	Horror
6582	3069	Comedy
6583	3069	Crime
6584	3069	Drama
6585	3069	Romance
6586	3069	Thriller
6587	3070	Drama
6588	3071	Crime
6589	3071	Thriller
6590	3072	Crime
6591	3072	Thriller
6592	3073	Drama
6593	3074	Action
6594	3074	Comedy
6595	3075	Comedy
6596	3075	Drama
6597	3076	Drama
6598	3077	Drama
6599	3078	Comedy
6600	3079	Crime
6601	3079	Thriller
6602	3080	Horror
6603	3081	Comedy
6604	3081	Romance
6605	3082	Drama
6606	3082	Musical
6607	3083	Comedy
6608	3084	Documentary
6609	3085	Drama
6610	3086	Drama
6611	3087	Drama
6612	3088	Horror
6613	3089	Horror
6614	3090	Horror
6615	3091	Horror
6616	3091	Sci-Fi
6617	3092	Comedy
6618	3092	Drama
6619	3093	Adventure
6620	3093	Sci-Fi
6621	3094	Adventure
6622	3094	Sci-Fi
6623	3095	Comedy
6624	3095	Horror
6625	3096	Comedy
6626	3097	Adventure
6627	3097	Horror
6628	3097	Sci-Fi
6629	3098	Horror
6630	3098	Sci-Fi
6631	3099	Horror
6632	3099	Musical
6633	3099	Thriller
6634	3100	Sci-Fi
6635	3100	Thriller
6636	3101	Horror
6637	3102	Horror
6638	3103	Comedy
6639	3104	Comedy
6640	3104	Drama
6641	3105	Adventure
6642	3105	Animation
6643	3105	Children
6644	3106	Action
6645	3106	Drama
6646	3106	Thriller
6647	3107	Action
6648	3107	Crime
6649	3107	Drama
6650	3107	Thriller
6651	3108	Comedy
6652	3109	Drama
6653	3110	Drama
6654	3111	Drama
6655	3111	Thriller
6656	3112	Comedy
6657	3112	Romance
6658	3113	Comedy
6659	3114	Drama
6660	3114	Horror
6661	3114	Thriller
6662	3115	Action
6663	3115	Drama
6664	3116	Drama
6665	3117	Action
6666	3117	Adventure
6667	3117	Sci-Fi
6668	3118	Drama
6669	3118	Thriller
6670	3119	Horror
6671	3120	Comedy
6672	3120	Horror
6673	3121	Musical
6674	3122	Animation
6675	3122	Children
6676	3123	Drama
6677	3123	Film-Noir
6678	3124	Crime
6679	3124	Film-Noir
6680	3125	Drama
6681	3126	Comedy
6682	3127	Drama
6683	3128	Horror
6684	3129	Action
6685	3129	Comedy
6686	3130	Crime
6687	3130	Horror
6688	3130	Mystery
6689	3130	Thriller
6690	3131	Comedy
6691	3131	Drama
6692	3132	Action
6693	3132	Comedy
6694	3133	Drama
6695	3133	Romance
6696	3134	Comedy
6697	3135	Drama
6698	3136	Action
6699	3136	Sci-Fi
6700	3136	Thriller
6701	3137	Drama
6702	3138	Drama
6703	3138	Romance
6704	3139	Action
6705	3139	Adventure
6706	3139	Thriller
6707	3140	Drama
6708	3140	War
6709	3141	Action
6710	3141	Sci-Fi
6711	3141	Thriller
6712	3142	Drama
6713	3142	Romance
6714	3143	Children
6715	3143	Comedy
6716	3143	Fantasy
6717	3144	Documentary
6718	3145	Animation
6719	3145	Children
6720	3145	Comedy
6721	3146	Children
6722	3146	Comedy
6723	3147	Drama
6724	3147	Romance
6725	3147	War
6726	3148	Drama
6727	3148	Romance
6728	3149	Drama
6729	3149	Sci-Fi
6730	3150	Action
6731	3150	Drama
6732	3150	Romance
6733	3151	Action
6734	3151	Adventure
6735	3151	Comedy
6736	3151	Fantasy
6737	3152	Drama
6738	3153	Action
6739	3153	Adventure
6740	3154	Adventure
6741	3154	Drama
6742	3155	Comedy
6743	3156	Comedy
6744	3157	Action
6745	3157	Adventure
6746	3157	Thriller
6747	3158	Adventure
6748	3158	Animation
6749	3158	Children
6750	3158	Sci-Fi
6751	3159	Drama
6752	3160	Drama
6753	3160	War
6754	3161	Drama
6755	3162	Comedy
6756	3163	Comedy
6757	3163	Crime
6758	3163	Thriller
6759	3164	Comedy
6760	3164	Drama
6761	3165	Drama
6762	3165	Romance
6763	3166	Comedy
6764	3166	Sci-Fi
6765	3167	Adventure
6766	3167	Animation
6767	3167	Children
6768	3167	Comedy
6769	3167	Fantasy
6770	3168	Drama
6771	3169	Comedy
6772	3169	Romance
6773	3170	Drama
6774	3171	Thriller
6775	3172	Drama
6776	3173	Drama
6777	3174	Comedy
6778	3174	Drama
6779	3174	Romance
6780	3175	Romance
6781	3176	Comedy
6782	3176	Crime
6783	3177	Adventure
6784	3177	Comedy
6785	3177	Crime
6786	3178	Drama
6787	3179	Comedy
6788	3179	Drama
6789	3180	Horror
6790	3181	Drama
6791	3181	Romance
6792	3181	Western
6793	3182	Comedy
6794	3183	Drama
6795	3183	Thriller
6796	3183	War
6797	3184	Crime
6798	3184	Drama
6799	3184	Thriller
6800	3185	Romance
6801	3185	Western
6802	3186	Drama
6803	3186	Horror
6804	3187	Crime
6805	3187	Film-Noir
6806	3187	Mystery
6807	3187	Thriller
6808	3188	Crime
6809	3188	Drama
6810	3188	Thriller
6811	3189	Children
6812	3189	Musical
6813	3190	Comedy
6814	3191	Drama
6815	3191	Romance
6816	3192	Action
6817	3192	Drama
6818	3192	War
6819	3192	Western
6820	3193	Crime
6821	3193	Drama
6822	3194	Western
6823	3195	Drama
6824	3196	Drama
6825	3196	War
6826	3197	Crime
6827	3197	Drama
6828	3197	Thriller
6829	3198	Action
6830	3198	Comedy
6831	3199	Drama
6832	3199	Romance
6833	3200	Drama
6834	3201	Crime
6835	3201	Drama
6836	3201	Mystery
6837	3201	Thriller
6838	3202	Adventure
6839	3202	Children
6840	3202	Comedy
6841	3203	Drama
6842	3203	Romance
6843	3204	Comedy
6844	3204	Drama
6845	3204	Romance
6846	3205	Comedy
6847	3205	Drama
6848	3205	Romance
6849	3206	Action
6850	3206	Crime
6851	3206	Thriller
6852	3207	Action
6853	3207	Crime
6854	3207	Drama
6855	3208	Action
6856	3208	Comedy
6857	3209	Drama
6858	3209	Romance
6859	3210	Comedy
6860	3211	Comedy
6861	3211	Romance
6862	3212	Drama
6863	3212	Thriller
6864	3213	Drama
6865	3214	Comedy
6866	3214	Sci-Fi
6867	3215	Comedy
6868	3216	Comedy
6869	3217	Comedy
6870	3217	Drama
6871	3217	Romance
6872	3218	Action
6873	3218	Comedy
6874	3218	Crime
6875	3218	Thriller
6876	3219	Action
6877	3219	Comedy
6878	3219	Crime
6879	3219	Drama
6880	3220	Action
6881	3220	Crime
6882	3220	Mystery
6883	3220	Romance
6884	3220	Thriller
6885	3221	Animation
6886	3221	Children
6887	3222	Comedy
6888	3222	Romance
6889	3223	Romance
6890	3223	Sci-Fi
6891	3224	Thriller
6892	3225	Drama
6893	3226	Horror
6894	3226	Sci-Fi
6895	3227	Horror
6896	3227	Thriller
6897	3228	Drama
6898	3229	Comedy
6899	3230	Comedy
6900	3230	Documentary
6901	3231	Action
6902	3231	Adventure
6903	3231	Drama
6904	3231	War
6905	3232	Comedy
6906	3233	Fantasy
6907	3233	Horror
6908	3233	Thriller
6909	3234	Action
6910	3234	Crime
6911	3234	Drama
6912	3234	Thriller
6913	3234	Western
6914	3235	Drama
6915	3236	Drama
6916	3236	Thriller
6917	3237	Thriller
6918	3238	Drama
6919	3238	War
6920	3239	Comedy
6921	3240	Drama
6922	3241	Comedy
6923	3241	Drama
6924	3242	Action
6925	3242	Adventure
6926	3242	Comedy
6927	3242	Sci-Fi
6928	3243	Comedy
6929	3244	Horror
6930	3244	Thriller
6931	3245	Comedy
6932	3245	Sci-Fi
6933	3246	Drama
6934	3247	Comedy
6935	3248	Comedy
6936	3248	Horror
6937	3248	Thriller
6938	3249	Fantasy
6939	3249	Romance
6940	3250	Comedy
6941	3250	Fantasy
6942	3251	Comedy
6943	3251	Romance
6944	3251	Sci-Fi
6945	3252	Comedy
6946	3252	Romance
6947	3253	Action
6948	3253	Adventure
6949	3253	Fantasy
6950	3253	Sci-Fi
6951	3254	Adventure
6952	3254	Comedy
6953	3254	Horror
6954	3255	Drama
6955	3256	Comedy
6956	3257	Comedy
6957	3257	Horror
6958	3258	Crime
6959	3258	Drama
6960	3259	Comedy
6961	3259	Romance
6962	3260	Action
6963	3260	Adventure
6964	3260	Drama
6965	3260	Thriller
6966	3261	Horror
6967	3261	Mystery
6968	3262	Drama
6969	3262	Romance
6970	3263	Drama
6971	3263	Mystery
6972	3263	Romance
6973	3264	Comedy
6974	3264	Drama
6975	3264	Romance
6976	3265	Horror
6977	3265	Thriller
6978	3266	Comedy
6979	3266	Romance
6980	3267	Drama
6981	3268	Comedy
6982	3268	Drama
6983	3268	Romance
6984	3269	Drama
6985	3270	Comedy
6986	3270	Fantasy
6987	3270	Romance
6988	3271	Animation
6989	3271	Children
6990	3272	Drama
6991	3272	Romance
6992	3273	Comedy
6993	3273	Drama
6994	3273	Fantasy
6995	3273	Romance
6996	3274	Animation
6997	3274	Comedy
6998	3274	Fantasy
6999	3275	Action
7000	3275	Thriller
7001	3276	Drama
7002	3276	Romance
7003	3277	Action
7004	3277	Comedy
7005	3278	Comedy
7006	3279	Action
7007	3279	Drama
7008	3280	Thriller
7009	3281	Comedy
7010	3281	Romance
7011	3282	Comedy
7012	3283	Drama
7013	3283	Fantasy
7014	3283	Mystery
7015	3283	Romance
7016	3284	Drama
7017	3285	Drama
7018	3286	Drama
7019	3287	Drama
7020	3288	Comedy
7021	3288	Drama
7022	3289	Comedy
7023	3289	Drama
7024	3289	Romance
7025	3290	Comedy
7026	3290	Drama
7027	3290	Romance
7028	3291	Drama
7029	3292	Children
7030	3292	Musical
7031	3293	Drama
7032	3294	Drama
7033	3295	Comedy
7034	3295	Drama
7035	3295	Romance
7036	3296	Drama
7037	3297	Musical
7038	3298	Drama
7039	3298	Romance
7040	3298	War
7041	3299	Horror
7042	3299	Mystery
7043	3300	Comedy
7044	3301	Action
7045	3302	Action
7046	3303	Comedy
7047	3304	Action
7048	3304	Crime
7049	3304	Drama
7050	3305	Comedy
7051	3305	Drama
7052	3305	Romance
7053	3306	Crime
7054	3306	Mystery
7055	3307	Action
7056	3307	Adventure
7057	3307	War
7058	3308	Action
7059	3308	Crime
7060	3308	Drama
7061	3308	Horror
7062	3308	Thriller
7063	3309	Drama
7064	3310	Crime
7065	3310	Mystery
7066	3311	Horror
7067	3311	Sci-Fi
7068	3311	Thriller
7069	3312	Comedy
7070	3313	Comedy
7071	3314	Drama
7072	3315	Documentary
7073	3316	Crime
7074	3316	Drama
7075	3317	Comedy
7076	3318	Comedy
7077	3319	Comedy
7078	3320	Drama
7079	3320	War
7080	3321	Action
7081	3321	Thriller
7082	3322	Comedy
7083	3323	Mystery
7084	3323	Thriller
7085	3324	Comedy
7086	3324	Crime
7087	3324	Romance
7088	3325	Comedy
7089	3325	Romance
7090	3326	Comedy
7091	3326	Romance
7092	3327	Action
7093	3327	Adventure
7094	3327	Children
7095	3327	Comedy
7096	3328	Comedy
7097	3329	Drama
7098	3329	Thriller
7099	3330	Drama
7100	3330	Thriller
7101	3331	Documentary
7102	3332	Action
7103	3332	Crime
7104	3332	Mystery
7105	3332	Thriller
7106	3333	Crime
7107	3333	Drama
7108	3334	Comedy
7109	3334	Fantasy
7110	3335	Animation
7111	3335	Children
7112	3336	Drama
7113	3336	Romance
7114	3337	Comedy
7115	3337	Drama
7116	3337	Romance
7117	3338	Adventure
7118	3338	Comedy
7119	3338	Mystery
7120	3338	Romance
7121	3339	Comedy
7122	3340	Drama
7123	3340	Thriller
7124	3341	Comedy
7125	3342	Comedy
7126	3342	Drama
7127	3343	Comedy
7128	3344	Drama
7129	3345	Action
7130	3345	Crime
7131	3345	Drama
7132	3346	Drama
7133	3347	Action
7134	3347	Thriller
7135	3348	Horror
7136	3349	Comedy
7137	3350	Comedy
7138	3351	Action
7139	3351	Adventure
7140	3351	Comedy
7141	3351	Thriller
7142	3352	Drama
7143	3353	Drama
7144	3353	Romance
7145	3354	Action
7146	3354	Adventure
7147	3354	Fantasy
7148	3354	Sci-Fi
7149	3355	Comedy
7150	3356	Adventure
7151	3356	Sci-Fi
7152	3357	Documentary
7153	3358	Crime
7154	3359	Comedy
7155	3359	Drama
7156	3359	Romance
7157	3360	Comedy
7158	3361	Drama
7159	3361	Fantasy
7160	3362	Drama
7161	3363	Comedy
7162	3364	Comedy
7163	3364	Romance
7164	3365	Drama
7165	3366	Comedy
7166	3366	Romance
7167	3367	Drama
7168	3367	Romance
7169	3368	Comedy
7170	3368	Drama
7171	3368	Musical
7172	3369	Comedy
7173	3369	Crime
7174	3370	Drama
7175	3371	Comedy
7176	3372	Children
7177	3372	Fantasy
7178	3372	Musical
7179	3373	Drama
7180	3373	Romance
7181	3374	Crime
7182	3374	Film-Noir
7183	3374	Thriller
7184	3375	Action
7185	3375	Comedy
7186	3375	Romance
7187	3376	Drama
7188	3377	Drama
7189	3378	Documentary
7190	3379	Romance
7191	3379	Thriller
7192	3380	Adventure
7193	3380	Animation
7194	3380	Children
7195	3380	Comedy
7196	3380	Fantasy
7197	3380	Romance
7198	3381	Comedy
7199	3381	Romance
7200	3382	Drama
7201	3382	Musical
7202	3382	Romance
7203	3383	Action
7204	3383	Drama
7205	3383	Romance
7206	3383	War
7207	3384	Drama
7208	3385	Comedy
7209	3385	Romance
7210	3386	Comedy
7211	3386	Drama
7212	3387	Western
7213	3388	Comedy
7214	3388	Western
7215	3389	Comedy
7216	3389	Western
7217	3390	Drama
7218	3391	Adventure
7219	3391	War
7220	3391	Western
7221	3392	Crime
7222	3392	Drama
7223	3392	Thriller
7224	3393	Adventure
7225	3393	Western
7226	3394	Western
7227	3395	Comedy
7228	3396	Crime
7229	3396	Drama
7230	3396	Thriller
7231	3397	Comedy
7232	3397	Crime
7233	3398	Drama
7234	3399	Horror
7235	3399	Thriller
7236	3400	Drama
7237	3400	Romance
7238	3400	War
7239	3401	Drama
7240	3401	War
7241	3402	Action
7242	3402	Adventure
7243	3402	Drama
7244	3402	War
7245	3403	Comedy
7246	3404	Comedy
7247	3405	Comedy
7248	3405	Sci-Fi
7249	3406	Action
7250	3406	Crime
7251	3406	Drama
7252	3407	Drama
7253	3408	Drama
7254	3408	Musical
7255	3408	Romance
7256	3409	Comedy
7257	3409	Drama
7258	3410	Comedy
7259	3410	War
7260	3411	Action
7261	3411	Crime
7262	3411	Thriller
7263	3412	Action
7264	3412	War
7265	3413	Crime
7266	3413	Thriller
7267	3414	Action
7268	3414	Drama
7269	3415	Comedy
7270	3415	Musical
7271	3415	Romance
7272	3416	Comedy
7273	3416	Drama
7274	3416	Romance
7275	3417	Comedy
7276	3418	Musical
7277	3419	Comedy
7278	3419	Romance
7279	3420	Crime
7280	3420	Drama
7281	3421	Adventure
7282	3421	Animation
7283	3421	Children
7284	3421	Fantasy
7285	3422	Action
7286	3422	Adventure
7287	3423	Comedy
7288	3424	Action
7289	3424	Crime
7290	3424	Thriller
7291	3425	Adventure
7292	3425	Drama
7293	3425	Sci-Fi
7294	3426	Crime
7295	3426	Drama
7296	3427	Drama
7297	3427	Romance
7298	3428	Comedy
7299	3429	Crime
7300	3429	Drama
7301	3430	Drama
7302	3430	Romance
7303	3431	Comedy
7304	3432	Crime
7305	3432	Drama
7306	3432	Mystery
7307	3432	Thriller
7308	3433	Drama
7309	3434	Children
7310	3434	Comedy
7311	3435	Action
7312	3436	Comedy
7313	3437	Drama
7314	3438	Crime
7315	3438	Drama
7316	3438	Thriller
7317	3439	Drama
7318	3440	Comedy
7319	3440	Drama
7320	3440	Fantasy
7321	3440	Romance
7322	3441	Drama
7323	3442	Comedy
7324	3442	Musical
7325	3443	Comedy
7326	3443	Crime
7327	3444	Action
7328	3444	Comedy
7329	3445	Action
7330	3445	Comedy
7331	3446	Action
7332	3446	Comedy
7333	3447	Comedy
7334	3447	Drama
7335	3448	Action
7336	3448	Comedy
7337	3448	Romance
7338	3449	Drama
7339	3449	Fantasy
7340	3449	Horror
7341	3450	Drama
7342	3451	Crime
7343	3451	Drama
7344	3451	Western
7345	3452	Drama
7346	3452	Thriller
7347	3452	War
7348	3453	Drama
7349	3454	Comedy
7350	3454	Drama
7351	3454	Mystery
7352	3454	Thriller
7353	3455	Comedy
7354	3455	Crime
7355	3455	Drama
7356	3456	Western
7357	3457	Comedy
7358	3457	Horror
7359	3457	Sci-Fi
7360	3458	Sci-Fi
7361	3459	Comedy
7362	3460	Drama
7363	3460	Romance
7364	3461	Drama
7365	3462	Drama
7366	3463	Drama
7367	3464	Drama
7368	3465	Comedy
7369	3465	Horror
7370	3466	Film-Noir
7371	3467	Drama
7372	3468	Comedy
7373	3468	Drama
7374	3468	Romance
7375	3468	Western
7376	3469	Drama
7377	3470	Drama
7378	3470	Film-Noir
7379	3471	Drama
7380	3472	Mystery
7381	3472	Thriller
7382	3473	Horror
7383	3474	Action
7384	3474	Drama
7385	3474	Romance
7386	3474	Thriller
7387	3475	Drama
7388	3476	Action
7389	3476	Thriller
7390	3477	Action
7391	3477	Comedy
7392	3477	Drama
7393	3478	Action
7394	3478	Sci-Fi
7395	3478	Thriller
7396	3479	Action
7397	3479	Crime
7398	3480	Adventure
7399	3480	Documentary
7400	3480	IMAX
7401	3481	Adventure
7402	3481	Animation
7403	3481	Fantasy
7404	3481	Sci-Fi
7405	3482	Comedy
7406	3482	Romance
7407	3483	Action
7408	3483	Drama
7409	3484	Crime
7410	3484	Drama
7411	3484	Thriller
7412	3485	Comedy
7413	3486	Animation
7414	3486	Drama
7415	3486	Sci-Fi
7416	3486	IMAX
7417	3487	Animation
7418	3487	Horror
7419	3487	IMAX
7420	3488	Comedy
7421	3488	Drama
7422	3488	Romance
7423	3489	Drama
7424	3490	Action
7425	3490	Crime
7426	3490	Drama
7427	3491	Adventure
7428	3491	Comedy
7429	3491	Fantasy
7430	3492	Drama
7431	3492	Thriller
7432	3493	Comedy
7433	3493	Romance
7434	3494	Horror
7435	3494	Thriller
7436	3495	Drama
7437	3495	War
7438	3496	Comedy
7439	3496	Drama
7440	3496	Musical
7441	3497	Drama
7442	3497	War
7443	3498	Comedy
7444	3499	Adventure
7445	3499	Children
7446	3499	Comedy
7447	3500	Comedy
7448	3500	Drama
7449	3501	Drama
7450	3501	Musical
7451	3502	Horror
7452	3502	Sci-Fi
7453	3503	Drama
7454	3504	Comedy
7455	3505	Drama
7456	3506	Comedy
7457	3507	Drama
7458	3508	Drama
7459	3508	Romance
7460	3509	Action
7461	3509	Crime
7462	3509	Drama
7463	3510	Comedy
7464	3510	Romance
7465	3511	Thriller
7466	3512	Comedy
7467	3512	Sci-Fi
7468	3513	Comedy
7469	3513	Romance
7470	3514	Film-Noir
7471	3514	Mystery
7472	3514	Thriller
7473	3515	Action
7474	3515	Comedy
7475	3515	Horror
7476	3515	Sci-Fi
7477	3516	Action
7478	3516	Crime
7479	3516	Thriller
7480	3517	Comedy
7481	3518	Comedy
7482	3518	Drama
7483	3519	Comedy
7484	3519	Horror
7485	3520	Children
7486	3520	Comedy
7487	3521	Romance
7488	3522	Comedy
7489	3523	Drama
7490	3523	Romance
7491	3524	Crime
7492	3524	Mystery
7493	3524	Thriller
7494	3525	Drama
7495	3526	Drama
7496	3527	Comedy
7497	3528	Comedy
7498	3529	Comedy
7499	3530	Comedy
7500	3531	Horror
7501	3532	Documentary
7502	3533	Comedy
7503	3534	Horror
7504	3534	Mystery
7505	3534	Thriller
7506	3535	Comedy
7507	3535	Horror
7508	3536	Adventure
7509	3536	Animation
7510	3536	Children
7511	3536	Fantasy
7512	3537	Comedy
7513	3538	Mystery
7514	3538	Romance
7515	3538	Thriller
7516	3539	Comedy
7517	3539	Drama
7518	3539	Fantasy
7519	3540	Comedy
7520	3541	Comedy
7521	3542	Comedy
7522	3542	Romance
7523	3542	Sci-Fi
7524	3543	Action
7525	3543	Thriller
7526	3543	War
7527	3544	Comedy
7528	3544	Drama
7529	3545	Drama
7530	3546	Action
7531	3547	Comedy
7532	3547	Horror
7533	3548	Comedy
7534	3548	Horror
7535	3548	Sci-Fi
7536	3549	Drama
7537	3549	Romance
7538	3549	Western
7539	3550	Drama
7540	3551	Comedy
7541	3551	Drama
7542	3552	Comedy
7543	3552	Drama
7544	3552	Romance
7545	3553	Horror
7546	3554	Action
7547	3554	Adventure
7548	3555	Comedy
7549	3555	Sci-Fi
7550	3556	Comedy
7551	3556	Sci-Fi
7552	3557	Drama
7553	3557	Thriller
7554	3558	Crime
7555	3558	Drama
7556	3559	Action
7557	3559	Comedy
7558	3559	Thriller
7559	3559	Western
7560	3560	Action
7561	3560	Horror
7562	3560	Sci-Fi
7563	3560	Thriller
7564	3561	Action
7565	3561	Sci-Fi
7566	3561	Thriller
7567	3562	Drama
7568	3563	Comedy
7569	3563	Drama
7570	3563	Romance
7571	3564	Drama
7572	3564	Mystery
7573	3565	Drama
7574	3566	Comedy
7575	3567	Comedy
7576	3568	Horror
7577	3568	Sci-Fi
7578	3569	Comedy
7579	3569	Horror
7580	3570	Comedy
7581	3570	Mystery
7582	3571	Comedy
7583	3572	Drama
7584	3572	Fantasy
7585	3572	Romance
7586	3573	Action
7587	3573	Adventure
7588	3574	Action
7589	3574	Adventure
7590	3575	Action
7591	3575	Adventure
7592	3576	Action
7593	3577	Comedy
7594	3577	Drama
7595	3578	Adventure
7596	3578	Comedy
7597	3578	Sci-Fi
7598	3579	Action
7599	3579	Crime
7600	3579	Drama
7601	3580	Comedy
7602	3580	Drama
7603	3581	Action
7604	3581	Thriller
7605	3582	Adventure
7606	3582	Comedy
7607	3583	Drama
7608	3583	War
7609	3584	Comedy
7610	3584	Romance
7611	3585	Action
7612	3585	Sci-Fi
7613	3586	Drama
7614	3587	Comedy
7615	3587	Drama
7616	3587	Romance
7617	3588	Comedy
7618	3589	Drama
7619	3589	Thriller
7620	3590	Comedy
7621	3590	Musical
7622	3590	Sci-Fi
7623	3591	Drama
7624	3591	Musical
7625	3591	Mystery
7626	3592	Drama
7627	3593	Adventure
7628	3593	Comedy
7629	3593	Fantasy
7630	3594	Comedy
7631	3595	Action
7632	3595	War
7633	3596	Drama
7634	3597	Drama
7635	3597	Romance
7636	3598	Action
7637	3598	Drama
7638	3598	Mystery
7639	3599	Comedy
7640	3600	Drama
7641	3601	Comedy
7642	3601	Drama
7643	3602	Drama
7644	3602	Romance
7645	3603	Comedy
7646	3603	Crime
7647	3603	Romance
7648	3604	Comedy
7649	3604	Romance
7650	3605	Comedy
7651	3605	Fantasy
7652	3606	Drama
7653	3607	Crime
7654	3607	Drama
7655	3608	Drama
7656	3609	Comedy
7657	3609	Crime
7658	3609	Mystery
7659	3609	Thriller
7660	3610	Drama
7661	3611	Action
7662	3611	Comedy
7663	3611	Crime
7664	3612	Action
7665	3613	Drama
7666	3614	Drama
7667	3615	Comedy
7668	3616	Horror
7669	3616	Sci-Fi
7670	3616	Thriller
7671	3617	Comedy
7672	3618	Action
7673	3618	Adventure
7674	3618	Crime
7675	3618	Drama
7676	3618	Thriller
7677	3619	Comedy
7678	3619	Romance
7679	3620	Comedy
7680	3621	Comedy
7681	3622	Animation
7682	3622	Comedy
7683	3622	Musical
7684	3623	Drama
7685	3623	Sci-Fi
7686	3623	Thriller
7687	3624	Comedy
7688	3625	Comedy
7689	3625	Drama
7690	3626	Action
7691	3626	Crime
7692	3626	Thriller
7693	3627	Drama
7694	3628	Action
7695	3628	Thriller
7696	3629	Adventure
7697	3629	Comedy
7698	3630	Action
7699	3630	Comedy
7700	3630	Drama
7701	3631	Action
7702	3632	Action
7703	3633	Action
7704	3633	Adventure
7705	3633	Sci-Fi
7706	3633	Thriller
7707	3634	Comedy
7708	3634	Romance
7709	3635	Action
7710	3635	Crime
7711	3635	Thriller
7712	3636	Comedy
7713	3636	Drama
7714	3637	Comedy
7715	3637	Drama
7716	3637	Musical
7717	3638	Action
7718	3638	Adventure
7719	3638	Drama
7720	3638	Sci-Fi
7721	3639	Comedy
7722	3639	Drama
7723	3639	Romance
7724	3640	Crime
7725	3640	Horror
7726	3640	Thriller
7727	3641	Comedy
7728	3642	Action
7729	3643	Comedy
7730	3643	Horror
7731	3643	Sci-Fi
7732	3644	Adventure
7733	3644	Comedy
7734	3645	Action
7735	3645	Drama
7736	3646	Drama
7737	3647	Drama
7738	3647	Horror
7739	3647	Mystery
7740	3647	Thriller
7741	3648	Drama
7742	3649	Comedy
7743	3650	Crime
7744	3650	Drama
7745	3650	Thriller
7746	3651	Comedy
7747	3651	Crime
7748	3652	Comedy
7749	3653	Comedy
7750	3653	Romance
7751	3654	Horror
7752	3655	Comedy
7753	3656	Drama
7754	3657	Comedy
7755	3657	Drama
7756	3657	Romance
7757	3658	Horror
7758	3658	Thriller
7759	3659	Horror
7760	3659	Thriller
7761	3660	Comedy
7762	3660	Romance
7763	3661	Action
7764	3661	Comedy
7765	3661	Crime
7766	3661	Thriller
7767	3662	Drama
7768	3663	Action
7769	3663	Comedy
7770	3664	Comedy
7771	3665	Comedy
7772	3665	Crime
7773	3666	Comedy
7774	3667	Comedy
7775	3668	Comedy
7776	3668	Fantasy
7777	3668	Horror
7778	3669	Comedy
7779	3669	Drama
7780	3670	Action
7781	3670	Horror
7782	3671	Adventure
7783	3671	Children
7784	3671	Comedy
7785	3671	Drama
7786	3672	Comedy
7787	3673	Horror
7788	3674	Adventure
7789	3674	Comedy
7790	3675	Adventure
7791	3675	Drama
7792	3676	Crime
7793	3676	Musical
7794	3677	Drama
7795	3678	Crime
7796	3678	Drama
7797	3679	Crime
7798	3679	Drama
7799	3680	Comedy
7800	3681	Drama
7801	3681	Romance
7802	3681	Thriller
7803	3682	Children
7804	3682	Comedy
7805	3682	Romance
7806	3683	Action
7807	3683	Comedy
7808	3684	Drama
7809	3685	Adventure
7810	3685	Comedy
7811	3686	Comedy
7812	3687	Comedy
7813	3688	Drama
7814	3688	Musical
7815	3689	Comedy
7816	3689	Musical
7817	3689	Western
7818	3690	Drama
7819	3690	Western
7820	3691	Documentary
7821	3692	Drama
7822	3693	Drama
7823	3693	Sci-Fi
7824	3694	Comedy
7825	3695	Drama
7826	3696	Comedy
7827	3697	Action
7828	3697	Animation
7829	3697	Comedy
7830	3697	Crime
7831	3697	Drama
7832	3697	Romance
7833	3697	Thriller
7834	3698	Drama
7835	3698	Horror
7836	3698	Mystery
7837	3698	Thriller
7838	3699	Action
7839	3699	Comedy
7840	3699	Western
7841	3700	Comedy
7842	3701	Drama
7843	3702	Horror
7844	3702	Thriller
7845	3703	Drama
7846	3703	Romance
7847	3703	War
7848	3704	Comedy
7849	3705	Drama
7850	3706	Drama
7851	3707	Comedy
7852	3708	Comedy
7853	3709	Adventure
7854	3709	Comedy
7855	3710	Horror
7856	3710	Sci-Fi
7857	3710	Thriller
7858	3711	Comedy
7859	3711	Drama
7860	3711	Romance
7861	3712	Drama
7862	3713	Romance
7863	3713	Sci-Fi
7864	3714	Comedy
7865	3714	Drama
7866	3714	Romance
7867	3715	Comedy
7868	3715	Romance
7869	3716	Horror
7870	3717	Drama
7871	3718	Comedy
7872	3718	Romance
7873	3719	Action
7874	3719	Children
7875	3719	Comedy
7876	3720	Action
7877	3720	Children
7878	3720	Comedy
7879	3721	Action
7880	3721	Children
7881	3722	Horror
7882	3723	Comedy
7883	3723	Horror
7884	3724	Drama
7885	3724	Horror
7886	3724	Mystery
7887	3724	Thriller
7888	3725	Action
7889	3725	Adventure
7890	3725	Drama
7891	3725	Romance
7892	3726	Comedy
7893	3726	Drama
7894	3726	Musical
7895	3727	Comedy
7896	3727	Drama
7897	3728	Documentary
7898	3729	Drama
7899	3730	Drama
7900	3731	Crime
7901	3731	Drama
7902	3731	Romance
7903	3732	Comedy
7904	3732	Horror
7905	3733	Thriller
7906	3734	Drama
7907	3735	Drama
7908	3736	Comedy
7909	3737	Drama
7910	3737	Musical
7911	3737	Romance
7912	3738	Crime
7913	3738	Drama
7914	3738	Thriller
7915	3739	Comedy
7916	3739	Musical
7917	3739	Sci-Fi
7918	3740	Drama
7919	3741	Documentary
7920	3742	Drama
7921	3743	Horror
7922	3743	Thriller
7923	3744	Drama
7924	3745	Drama
7925	3745	Romance
7926	3746	Comedy
7927	3746	Fantasy
7928	3746	Horror
7929	3746	Musical
7930	3746	Thriller
7931	3747	Western
7932	3748	Horror
7933	3749	Comedy
7934	3749	Drama
7935	3750	Adventure
7936	3750	Comedy
7937	3750	Romance
7938	3750	War
7939	3751	Comedy
7940	3751	Romance
7941	3752	Comedy
7942	3752	Musical
7943	3753	Comedy
7944	3753	Romance
7945	3754	Comedy
7946	3755	Action
7947	3755	Adventure
7948	3755	Drama
7949	3755	Romance
7950	3755	Thriller
7951	3756	Drama
7952	3757	Action
7953	3757	Comedy
7954	3757	Romance
7955	3757	War
7956	3758	Drama
7957	3758	Thriller
7958	3759	Comedy
7959	3759	Drama
7960	3760	Drama
7961	3761	Mystery
7962	3761	Thriller
7963	3762	Drama
7964	3763	Drama
7965	3764	Drama
7966	3764	Musical
7967	3765	Adventure
7968	3765	Sci-Fi
7969	3766	Sci-Fi
7970	3767	Thriller
7971	3768	Drama
7972	3769	Comedy
7973	3770	Adventure
7974	3770	Thriller
7975	3771	Children
7976	3771	Comedy
7977	3772	Comedy
7978	3772	Romance
7979	3773	Action
7980	3773	Adventure
7981	3773	Drama
7982	3773	War
7983	3774	Drama
7984	3774	Thriller
7985	3775	Crime
7986	3775	Drama
7987	3776	Comedy
7988	3776	Musical
7989	3777	Horror
7990	3777	Mystery
7991	3777	Thriller
7992	3778	Comedy
7993	3779	Drama
7994	3780	Crime
7995	3780	Drama
7996	3780	Thriller
7997	3781	Horror
7998	3782	Comedy
7999	3783	Drama
8000	3783	War
8001	3784	Comedy
8002	3784	Crime
8003	3784	Romance
8004	3785	Comedy
8005	3785	Crime
8006	3786	Action
8007	3786	Comedy
8008	3787	Drama
8009	3788	Crime
8010	3788	Drama
8011	3788	Film-Noir
8012	3788	Mystery
8013	3788	Thriller
8014	3789	Comedy
8015	3789	Drama
8016	3790	Action
8017	3790	Animation
8018	3790	Sci-Fi
8019	3791	Horror
8020	3792	Action
8021	3792	Crime
8022	3792	Thriller
8023	3793	Drama
8024	3793	Musical
8025	3794	Drama
8026	3795	Comedy
8027	3795	Crime
8028	3796	Crime
8029	3796	Horror
8030	3796	Mystery
8031	3796	Thriller
8032	3797	Action
8033	3798	Comedy
8034	3798	Drama
8035	3799	Action
8036	3799	Crime
8037	3799	Romance
8038	3800	Drama
8039	3801	Drama
8040	3802	Drama
8041	3803	Animation
8042	3803	Drama
8043	3803	Fantasy
8044	3804	Drama
8045	3804	Fantasy
8046	3804	Mystery
8047	3804	Sci-Fi
8048	3805	Comedy
8049	3805	Romance
8050	3806	Horror
8051	3806	Thriller
8052	3807	Drama
8053	3807	Mystery
8054	3807	Sci-Fi
8055	3807	Thriller
8056	3808	Action
8057	3808	Comedy
8058	3808	Crime
8059	3808	Drama
8060	3809	Drama
8061	3810	Crime
8062	3810	Drama
8063	3811	Thriller
8064	3812	Adventure
8065	3812	Animation
8066	3812	Children
8067	3812	Comedy
8068	3812	Fantasy
8069	3813	Action
8070	3813	Sci-Fi
8071	3813	Thriller
8072	3814	Drama
8073	3815	Crime
8074	3815	Drama
8075	3816	Comedy
8076	3816	Fantasy
8077	3816	Romance
8078	3817	Horror
8079	3817	Thriller
8080	3818	Adventure
8081	3818	Children
8082	3818	Fantasy
8083	3819	Comedy
8084	3819	Crime
8085	3819	Mystery
8086	3819	Thriller
8087	3820	Adventure
8088	3820	Comedy
8089	3820	Fantasy
8090	3821	Comedy
8091	3822	Action
8092	3822	Crime
8093	3822	Drama
8094	3822	Thriller
8095	3823	Drama
8096	3823	Fantasy
8097	3823	Horror
8098	3823	Thriller
8099	3823	War
8100	3824	Drama
8101	3825	Action
8102	3825	Crime
8103	3825	Drama
8104	3826	Comedy
8105	3826	Sci-Fi
8106	3827	Drama
8107	3828	Adventure
8108	3828	Comedy
8109	3828	Fantasy
8110	3829	Drama
8111	3829	Musical
8112	3829	Romance
8113	3830	Crime
8114	3830	Drama
8115	3830	Romance
8116	3831	Action
8117	3831	Adventure
8118	3831	Fantasy
8119	3832	Drama
8120	3832	War
8121	3833	Drama
8122	3834	Drama
8123	3834	War
8124	3835	Drama
8125	3835	Romance
8126	3836	Drama
8127	3836	Romance
8128	3837	Fantasy
8129	3837	Mystery
8130	3837	Thriller
8131	3838	Drama
8132	3839	Comedy
8133	3840	Action
8134	3840	Drama
8135	3840	Thriller
8136	3841	Mystery
8137	3841	Thriller
8138	3842	Action
8139	3842	Crime
8140	3842	Thriller
8141	3842	War
8142	3843	Drama
8143	3843	Musical
8144	3844	Action
8145	3844	Sci-Fi
8146	3845	Thriller
8147	3846	Action
8148	3846	Adventure
8149	3846	Sci-Fi
8150	3847	Sci-Fi
8151	3848	Adventure
8152	3848	Sci-Fi
8153	3849	Crime
8154	3850	Action
8155	3851	Adventure
8156	3851	Drama
8157	3851	Thriller
8158	3852	Comedy
8159	3852	Crime
8160	3853	Crime
8161	3853	Drama
8162	3854	Action
8163	3854	Adventure
8164	3854	Comedy
8165	3854	Drama
8166	3854	Romance
8167	3854	Thriller
8168	3855	Crime
8169	3855	Thriller
8170	3856	Action
8171	3856	Drama
8172	3856	War
8173	3857	Drama
8174	3858	Documentary
8175	3859	Adventure
8176	3859	Western
8177	3860	Crime
8178	3860	Thriller
8179	3861	Action
8180	3861	Drama
8181	3861	Thriller
8182	3862	Sci-Fi
8183	3862	Thriller
8184	3863	Drama
8185	3863	War
8186	3864	Crime
8187	3864	Mystery
8188	3865	Drama
8189	3866	Comedy
8190	3866	Drama
8191	3867	Comedy
8192	3868	Comedy
8193	3868	Romance
8194	3869	Comedy
8195	3870	Mystery
8196	3870	Romance
8197	3870	Sci-Fi
8198	3870	Thriller
8199	3871	Drama
8200	3872	Drama
8201	3873	Drama
8202	3873	Mystery
8203	3873	Thriller
8204	3874	Comedy
8205	3874	Drama
8206	3875	Adventure
8207	3875	Comedy
8208	3875	Fantasy
8209	3875	Sci-Fi
8210	3876	Comedy
8211	3877	Horror
8212	3877	Sci-Fi
8213	3878	Comedy
8214	3878	Drama
8215	3878	Fantasy
8216	3879	Action
8217	3879	Adventure
8218	3879	Fantasy
8219	3880	Action
8220	3880	Sci-Fi
8221	3881	Action
8222	3881	Adventure
8223	3881	Sci-Fi
8224	3882	Comedy
8225	3883	Adventure
8226	3883	Animation
8227	3883	Children
8228	3883	Comedy
8229	3884	Comedy
8230	3884	Drama
8231	3884	Romance
8232	3885	Comedy
8233	3885	Romance
8234	3886	Adventure
8235	3886	Fantasy
8236	3887	Comedy
8237	3887	Drama
8238	3887	Romance
8239	3888	Drama
8240	3888	Romance
8241	3889	Adventure
8242	3889	Crime
8243	3889	Drama
8244	3889	Thriller
8245	3890	Drama
8246	3890	Romance
8247	3891	Drama
8248	3891	Romance
8249	3892	Action
8250	3892	Drama
8251	3892	War
8252	3893	Animation
8253	3894	Animation
8254	3895	Comedy
8255	3896	Drama
8256	3897	Adventure
8257	3897	Comedy
8258	3897	Thriller
8259	3898	Drama
8260	3898	Mystery
8261	3898	Thriller
8262	3899	Drama
8263	3900	Action
8264	3900	Drama
8265	3900	War
8266	3901	Drama
8267	3901	Musical
8268	3901	Romance
8269	3902	Comedy
8270	3902	Drama
8271	3902	Mystery
8272	3903	Drama
8273	3904	Drama
8274	3904	Romance
8275	3905	Drama
8276	3906	Drama
8277	3906	Film-Noir
8278	3907	Drama
8279	3908	Comedy
8280	3908	Crime
8281	3908	Mystery
8282	3908	Thriller
8283	3909	Drama
8284	3910	Comedy
8285	3911	Action
8286	3911	Mystery
8287	3911	Thriller
8288	3912	Action
8289	3912	Comedy
8290	3912	Crime
8291	3912	Drama
8292	3912	Thriller
8293	3913	Thriller
8294	3914	Drama
8295	3914	Thriller
8296	3915	Drama
8297	3915	Romance
8298	3916	Drama
8299	3917	Comedy
8300	3918	Drama
8301	3919	Adventure
8302	3919	Animation
8303	3919	Children
8304	3919	Drama
8305	3919	Fantasy
8306	3920	Action
8307	3920	Adventure
8308	3920	Fantasy
8309	3921	Action
8310	3921	Adventure
8311	3921	Fantasy
8312	3922	Musical
8313	3922	Sci-Fi
8314	3923	Thriller
8315	3924	Action
8316	3924	Drama
8317	3924	Sci-Fi
8318	3924	Thriller
8319	3925	Action
8320	3925	Comedy
8321	3926	Adventure
8322	3926	Children
8323	3926	Comedy
8324	3927	Action
8325	3927	Comedy
8326	3927	Crime
8327	3927	Drama
8328	3928	Comedy
8329	3928	Drama
8330	3928	Romance
8331	3929	Comedy
8332	3930	Sci-Fi
8333	3930	Thriller
8334	3931	Action
8335	3931	Drama
8336	3932	Crime
8337	3932	Drama
8338	3933	Documentary
8339	3934	Comedy
8340	3934	Drama
8341	3934	War
8342	3935	Drama
8343	3935	Romance
8344	3936	Mystery
8345	3936	Sci-Fi
8346	3936	Thriller
8347	3937	Western
8348	3938	Action
8349	3938	Adventure
8350	3938	Drama
8351	3938	Thriller
8352	3939	Drama
8353	3939	Fantasy
8354	3939	Horror
8355	3939	Mystery
8356	3939	Thriller
8357	3940	Drama
8358	3940	Romance
8359	3941	Drama
8360	3942	Action
8361	3942	Adventure
8362	3942	Animation
8363	3942	Drama
8364	3942	Fantasy
8365	3943	Animation
8366	3943	Sci-Fi
8367	3944	Comedy
8368	3944	Drama
8369	3945	Adventure
8370	3945	Children
8371	3945	Comedy
8372	3945	Drama
8373	3946	Comedy
8374	3946	Romance
8375	3947	Drama
8376	3947	Romance
8377	3948	Drama
8378	3948	Musical
8379	3948	Romance
8380	3949	Drama
8381	3949	Romance
8382	3950	Drama
8383	3950	Musical
8384	3951	Drama
8385	3951	Musical
8386	3952	Comedy
8387	3952	Drama
8388	3952	Romance
8389	3953	Comedy
8390	3953	Crime
8391	3953	Drama
8392	3954	Drama
8393	3955	Children
8394	3955	Comedy
8395	3956	Action
8396	3956	Thriller
8397	3957	Action
8398	3957	Sci-Fi
8399	3958	Comedy
8400	3958	Crime
8401	3959	Comedy
8402	3960	Comedy
8403	3960	Drama
8404	3961	Musical
8405	3962	Children
8406	3962	Drama
8407	3963	Comedy
8408	3964	Comedy
8409	3964	Documentary
8410	3965	Comedy
8411	3965	Fantasy
8412	3966	Children
8413	3966	Comedy
8414	3966	Drama
8415	3967	Drama
8416	3967	Horror
8417	3967	Thriller
8418	3968	Comedy
8419	3968	Musical
8420	3968	Romance
8421	3969	Drama
8422	3969	War
8423	3970	Crime
8424	3970	Drama
8425	3970	Thriller
8426	3971	Comedy
8427	3971	Crime
8428	3971	Mystery
8429	3972	Drama
8430	3972	Thriller
8431	3973	Drama
8432	3974	Comedy
8433	3974	Crime
8434	3975	Drama
8435	3976	Adventure
8436	3976	War
8437	3977	Comedy
8438	3977	Romance
8439	3978	Drama
8440	3979	Comedy
8441	3979	Mystery
8442	3979	Thriller
8443	3980	Comedy
8444	3980	Drama
8445	3981	Drama
8446	3982	Comedy
8447	3983	Drama
8448	3984	Horror
8449	3984	Sci-Fi
8450	3985	Drama
8451	3985	Fantasy
8452	3985	Mystery
8453	3985	Romance
8454	3985	Thriller
8455	3986	Fantasy
8456	3986	Horror
8457	3987	Comedy
8458	3987	Drama
8459	3988	Comedy
8460	3988	Drama
8461	3989	Comedy
8462	3989	Romance
8463	3990	Drama
8464	3990	Horror
8465	3991	Comedy
8466	3992	Comedy
8467	3993	Comedy
8468	3994	Comedy
8469	3994	Drama
8470	3995	Comedy
8471	3995	Drama
8472	3995	Romance
8473	3996	Animation
8474	3996	Fantasy
8475	3996	Horror
8476	3996	Sci-Fi
8477	3997	Drama
8478	3998	Comedy
8479	3998	Romance
8480	3999	Action
8481	3999	Drama
8482	3999	War
8483	4000	Action
8484	4001	Action
8485	4002	Animation
8486	4002	Children
8487	4002	Comedy
8488	4002	Musical
8489	4003	Horror
8490	4003	Thriller
8491	4004	Comedy
8492	4004	Drama
8493	4004	Romance
8494	4005	Comedy
8495	4005	Mystery
8496	4006	Comedy
8497	4006	Musical
8498	4006	Romance
8499	4007	Film-Noir
8500	4008	Action
8501	4008	Comedy
8502	4008	Crime
8503	4009	Action
8504	4009	Adventure
8505	4009	Sci-Fi
8506	4010	Comedy
8507	4010	Drama
8508	4010	Romance
8509	4011	Comedy
8510	4011	Thriller
8511	4012	Drama
8512	4013	Drama
8513	4013	Thriller
8514	4014	Drama
8515	4014	Romance
8516	4015	Drama
8517	4015	Thriller
8518	4016	Western
8519	4017	Comedy
8520	4018	Drama
8521	4018	Romance
8522	4019	Comedy
8523	4020	Comedy
8524	4021	Horror
8525	4021	Sci-Fi
8526	4022	Drama
8527	4023	Musical
8528	4024	Drama
8529	4025	Drama
8530	4025	Thriller
8531	4026	Western
8532	4027	Documentary
8533	4028	Drama
8534	4029	Comedy
8535	4029	Horror
8536	4030	Drama
8537	4030	Sci-Fi
8538	4031	Comedy
8539	4032	Comedy
8540	4032	Fantasy
8541	4033	Adventure
8542	4033	Animation
8543	4033	Children
8544	4033	Comedy
8545	4034	Action
8546	4034	Horror
8547	4034	Sci-Fi
8548	4034	Thriller
8549	4035	Action
8550	4035	Comedy
8551	4036	Drama
8552	4037	Comedy
8553	4037	Romance
8554	4038	Comedy
8555	4038	Drama
8556	4039	Documentary
8557	4040	Drama
8558	4040	Romance
8559	4041	Adventure
8560	4041	Drama
8561	4042	Comedy
8562	4042	Western
8563	4043	Comedy
8564	4044	Comedy
8565	4045	Drama
8566	4045	Romance
8567	4046	Drama
8568	4047	Drama
8569	4048	Comedy
8570	4048	Romance
8571	4049	Action
8572	4049	Adventure
8573	4050	Comedy
8574	4050	Sci-Fi
8575	4051	Action
8576	4051	Comedy
8577	4052	Action
8578	4052	Comedy
8579	4053	Action
8580	4053	Comedy
8581	4054	Comedy
8582	4054	Drama
8583	4055	Comedy
8584	4056	Action
8585	4056	Horror
8586	4056	Thriller
8587	4057	Comedy
8588	4058	Drama
8589	4059	Horror
8590	4059	Thriller
8591	4060	Action
8592	4060	Adventure
8593	4060	Sci-Fi
8594	4060	Thriller
8595	4061	Comedy
8596	4061	Crime
8597	4061	Drama
8598	4062	Thriller
8599	4063	Drama
8600	4064	Drama
8601	4065	Drama
8602	4065	Romance
8603	4065	Thriller
8604	4066	Comedy
8605	4066	Romance
8606	4067	Thriller
8607	4068	Comedy
8608	4069	Comedy
8609	4069	Romance
8610	4070	Crime
8611	4070	Drama
8612	4070	Mystery
8613	4071	Documentary
8614	4071	War
8615	4072	Drama
8616	4072	Film-Noir
8617	4073	Crime
8618	4073	Drama
8619	4073	Mystery
8620	4074	Comedy
8621	4075	Drama
8622	4075	Thriller
8623	4076	Crime
8624	4076	Drama
8625	4076	Thriller
8626	4077	Comedy
8627	4077	Romance
8628	4078	Drama
8629	4078	Thriller
8630	4079	Comedy
8631	4079	Romance
8632	4080	Comedy
8633	4080	Romance
8634	4081	Action
8635	4081	Adventure
8636	4081	Drama
8637	4081	Thriller
8638	4081	Western
8639	4082	Comedy
8640	4082	Romance
8641	4083	Drama
8642	4083	War
8643	4084	Comedy
8644	4084	Horror
8645	4084	Sci-Fi
8646	4085	Comedy
8647	4086	Comedy
8648	4086	Romance
8649	4087	Comedy
8650	4087	Horror
8651	4088	Children
8652	4088	Horror
8653	4088	Mystery
8654	4088	Thriller
8655	4089	Crime
8656	4089	Thriller
8657	4090	Action
8658	4090	Adventure
8659	4090	Fantasy
8660	4091	Romance
8661	4091	Thriller
8662	4092	Crime
8663	4092	Thriller
8664	4093	Comedy
8665	4094	Horror
8666	4094	Sci-Fi
8667	4094	Thriller
8668	4095	Comedy
8669	4095	Romance
8670	4096	Documentary
8671	4097	Crime
8672	4097	Drama
8673	4097	Thriller
8674	4098	Crime
8675	4098	Drama
8676	4099	Comedy
8677	4099	Crime
8678	4100	Comedy
8679	4100	Romance
8680	4101	Comedy
8681	4102	Comedy
8682	4102	Drama
8683	4103	Drama
8684	4104	Drama
8685	4105	Drama
8686	4105	Thriller
8687	4106	Drama
8688	4106	Romance
8689	4107	Drama
8690	4108	Comedy
8691	4108	Drama
8692	4109	Action
8693	4109	Adventure
8694	4109	Sci-Fi
8695	4109	Thriller
8696	4110	Thriller
8697	4111	Comedy
8698	4111	Drama
8699	4112	Adventure
8700	4113	Adventure
8701	4114	Drama
8702	4115	Comedy
8703	4116	Adventure
8704	4117	Comedy
8705	4118	Drama
8706	4118	Thriller
8707	4119	Drama
8708	4119	Romance
8709	4120	Drama
8710	4121	Drama
8711	4121	Romance
8712	4122	Drama
8713	4122	Romance
8714	4122	War
8715	4123	Action
8716	4123	Comedy
8717	4124	Musical
8718	4124	Western
8719	4125	Drama
8720	4125	Romance
8721	4125	War
8722	4126	Comedy
8723	4126	Drama
8724	4126	Romance
8725	4127	Action
8726	4127	Adventure
8727	4127	Sci-Fi
8728	4127	IMAX
8729	4128	Drama
8730	4129	Comedy
8731	4129	Drama
8732	4129	Romance
8733	4130	Comedy
8734	4131	Crime
8735	4131	Horror
8736	4131	Mystery
8737	4132	Crime
8738	4132	Drama
8739	4133	Documentary
8740	4134	Drama
8741	4134	Thriller
8742	4135	Action
8743	4135	Crime
8744	4135	Drama
8745	4135	Mystery
8746	4135	Thriller
8747	4136	Drama
8748	4137	Drama
8749	4138	Comedy
8750	4138	Drama
8751	4138	Romance
8752	4139	Drama
8753	4139	Thriller
8754	4140	Drama
8755	4141	Comedy
8756	4141	Musical
8757	4141	Romance
8758	4142	Comedy
8759	4142	Sci-Fi
8760	4143	Drama
8761	4144	Adventure
8762	4144	Western
8763	4145	Drama
8764	4145	Thriller
8765	4146	Comedy
8766	4147	Drama
8767	4147	Romance
8768	4148	Drama
8769	4148	War
8770	4149	Action
8771	4150	Drama
8772	4150	Sci-Fi
8773	4151	Action
8774	4151	Comedy
8775	4151	Crime
8776	4152	Comedy
8777	4152	Drama
8778	4153	Drama
8779	4153	Fantasy
8780	4154	Action
8781	4154	Mystery
8782	4154	Thriller
8783	4155	Adventure
8784	4155	Children
8785	4155	Comedy
8786	4155	Fantasy
8787	4155	Mystery
8788	4156	Action
8789	4156	Drama
8790	4156	War
8791	4157	Drama
8792	4158	Comedy
8793	4159	Action
8794	4159	Crime
8795	4159	Thriller
8796	4160	Crime
8797	4160	Drama
8798	4160	Romance
8799	4160	Thriller
8800	4161	Drama
8801	4161	War
8802	4162	Comedy
8803	4163	Adventure
8804	4163	Drama
8805	4163	Horror
8806	4163	Mystery
8807	4163	Thriller
8808	4164	Drama
8809	4164	Film-Noir
8810	4164	Thriller
8811	4165	Western
8812	4166	Comedy
8813	4166	Sci-Fi
8814	4166	Thriller
8815	4167	Action
8816	4167	Comedy
8817	4168	Comedy
8818	4169	Western
8819	4170	Action
8820	4170	Comedy
8821	4170	Crime
8822	4171	Comedy
8823	4172	Adventure
8824	4172	Animation
8825	4172	Children
8826	4172	Sci-Fi
8827	4173	Action
8828	4173	Crime
8829	4173	Mystery
8830	4173	Sci-Fi
8831	4173	Thriller
8832	4174	Adventure
8833	4174	Drama
8834	4175	Drama
8835	4176	Adventure
8836	4176	Animation
8837	4176	Children
8838	4176	Comedy
8839	4177	Comedy
8840	4177	Romance
8841	4178	Comedy
8842	4178	Drama
8843	4178	Romance
8844	4179	Comedy
8845	4179	Drama
8846	4179	Romance
8847	4180	Children
8848	4180	Comedy
8849	4180	Romance
8850	4181	Comedy
8851	4181	Drama
8852	4182	Comedy
8853	4182	Drama
8854	4183	Children
8855	4183	Comedy
8856	4183	Fantasy
8857	4184	Action
8858	4184	Comedy
8859	4184	Sci-Fi
8860	4185	Action
8861	4185	Animation
8862	4185	Children
8863	4185	Comedy
8864	4186	Comedy
8865	4186	Drama
8866	4187	Action
8867	4187	Adventure
8868	4187	Fantasy
8869	4188	Crime
8870	4188	Drama
8871	4189	Crime
8872	4189	Drama
8873	4189	Thriller
8874	4190	Sci-Fi
8875	4191	Comedy
8876	4191	Romance
8877	4192	Drama
8878	4192	Romance
8879	4193	Children
8880	4193	Drama
8881	4193	Musical
8882	4194	Drama
8883	4194	Mystery
8884	4194	Thriller
8885	4195	Horror
8886	4195	Thriller
8887	4196	Drama
8888	4196	Romance
8889	4197	Action
8890	4197	Comedy
8891	4197	Horror
8892	4197	Sci-Fi
8893	4198	Action
8894	4198	Adventure
8895	4198	Drama
8896	4198	Thriller
8897	4199	Children
8898	4199	Comedy
8899	4200	Comedy
8900	4201	Children
8901	4201	Comedy
8902	4202	Documentary
8903	4203	Comedy
8904	4203	Drama
8905	4203	Romance
8906	4204	Horror
8907	4205	Action
8908	4205	Comedy
8909	4206	Drama
8910	4206	Musical
8911	4206	Romance
8912	4207	Action
8913	4207	Adventure
8914	4207	Comedy
8915	4208	Drama
8916	4209	Drama
8917	4210	Adventure
8918	4210	Drama
8919	4210	Romance
8920	4211	Comedy
8921	4212	Comedy
8922	4212	Mystery
8923	4213	Horror
8924	4213	Sci-Fi
8925	4213	Thriller
8926	4214	Adventure
8927	4214	Children
8928	4215	Comedy
8929	4215	Drama
8930	4216	Crime
8931	4216	Drama
8932	4216	Mystery
8933	4216	Thriller
8934	4217	Action
8935	4217	Crime
8936	4217	Thriller
8937	4218	Comedy
8938	4218	Drama
8939	4218	Musical
8940	4219	Drama
8941	4220	Crime
8942	4220	Drama
8943	4220	Thriller
8944	4221	Action
8945	4221	Crime
8946	4221	Drama
8947	4222	Action
8948	4222	Drama
8949	4222	Sci-Fi
8950	4223	Action
8951	4223	Adventure
8952	4223	Comedy
8953	4223	Sci-Fi
8954	4224	Adventure
8955	4224	Drama
8956	4224	Romance
8957	4225	Comedy
8958	4225	Drama
8959	4225	Romance
8960	4226	Drama
8961	4227	Drama
8962	4227	Romance
8963	4228	Drama
8964	4228	Thriller
8965	4229	Comedy
8966	4229	Drama
8967	4229	Fantasy
8968	4229	Sci-Fi
8969	4230	Drama
8970	4231	Comedy
8971	4231	Romance
8972	4232	Drama
8973	4233	Drama
8974	4233	Musical
8975	4234	Animation
8976	4234	Children
8977	4234	Fantasy
8978	4235	Animation
8979	4235	Children
8980	4236	Action
8981	4236	Adventure
8982	4236	Fantasy
8983	4236	Romance
8984	4237	Action
8985	4237	Comedy
8986	4237	Romance
8987	4237	War
8988	4238	Action
8989	4238	Horror
8990	4239	Sci-Fi
8991	4239	Thriller
8992	4240	Horror
8993	4241	Comedy
8994	4242	Musical
8995	4242	Western
8996	4243	Horror
8997	4244	Comedy
8998	4244	Crime
8999	4244	Romance
9000	4244	Thriller
9001	4245	Drama
9002	4246	Horror
9003	4247	Crime
9004	4247	Horror
9005	4247	Thriller
9006	4248	Drama
9007	4249	Comedy
9008	4249	Musical
9009	4250	Drama
9010	4251	Crime
9011	4251	Drama
9012	4252	Thriller
9013	4253	Comedy
9014	4254	Crime
9015	4254	Horror
9016	4254	Thriller
9017	4255	Drama
9018	4255	Horror
9019	4255	Thriller
9020	4256	Comedy
9021	4257	Action
9022	4257	Crime
9023	4258	Comedy
9024	4258	Drama
9025	4259	Comedy
9026	4260	Adventure
9027	4260	Comedy
9028	4261	Comedy
9029	4262	Comedy
9030	4263	Horror
9031	4264	Horror
9032	4265	Children
9033	4265	Comedy
9034	4266	Adventure
9035	4266	Comedy
9036	4266	Sci-Fi
9037	4267	Drama
9038	4268	Children
9039	4268	Drama
9040	4269	Comedy
9041	4269	Crime
9042	4270	Comedy
9043	4270	Crime
9044	4271	Comedy
9045	4271	Sci-Fi
9046	4272	Drama
9047	4272	Thriller
9048	4273	Action
9049	4273	Thriller
9050	4274	Comedy
9051	4274	Drama
9052	4275	Adventure
9053	4275	War
9054	4276	Action
9055	4276	Thriller
9056	4277	Comedy
9057	4277	Crime
9058	4277	Musical
9059	4277	Mystery
9060	4278	Comedy
9061	4278	Drama
9062	4278	Romance
9063	4279	Adventure
9064	4279	Animation
9065	4279	Fantasy
9066	4280	Documentary
9067	4281	Comedy
9068	4281	Romance
9069	4282	Action
9070	4282	Comedy
9071	4283	Drama
9072	4283	Romance
9073	4284	Action
9074	4284	Comedy
9075	4284	Crime
9076	4284	Drama
9077	4284	Thriller
9078	4285	Animation
9079	4285	Children
9080	4285	Musical
9081	4286	Crime
9082	4286	Mystery
9083	4286	Thriller
9084	4287	Drama
9085	4288	Drama
9086	4289	Drama
9087	4290	Comedy
9088	4290	Crime
9089	4291	Drama
9090	4292	Action
9091	4292	Adventure
9092	4292	Fantasy
9093	4292	Sci-Fi
9094	4293	Horror
9095	4293	Sci-Fi
9096	4294	Drama
9097	4295	Documentary
9098	4296	Drama
9099	4297	Drama
9100	4298	Drama
9101	4298	Romance
9102	4299	Comedy
9103	4300	Comedy
9104	4301	Horror
9105	4302	Comedy
9106	4303	Animation
9107	4303	Comedy
9108	4303	War
9109	4304	Western
9110	4305	Action
9111	4305	Adventure
9112	4305	Comedy
9113	4305	Crime
9114	4305	Drama
9115	4306	Crime
9116	4306	Drama
9117	4306	Thriller
9118	4307	Horror
9119	4308	Romance
9120	4309	Action
9121	4309	Comedy
9122	4309	Crime
9123	4310	Comedy
9124	4310	Drama
9125	4310	Romance
9126	4310	Thriller
9127	4311	Drama
9128	4311	Fantasy
9129	4312	Drama
9130	4313	Documentary
9131	4314	Comedy
9132	4314	Documentary
9133	4315	Adventure
9134	4315	Animation
9135	4315	Children
9136	4315	Fantasy
9137	4316	Comedy
9138	4316	Drama
9139	4316	Romance
9140	4317	Comedy
9141	4317	Romance
9142	4318	Action
9143	4318	Comedy
9144	4318	Crime
9145	4318	Thriller
9146	4319	Horror
9147	4319	Mystery
9148	4319	Thriller
9149	4320	Crime
9150	4320	Drama
9151	4321	Documentary
9152	4322	Drama
9153	4323	Documentary
9154	4324	Comedy
9155	4324	Drama
9156	4325	Drama
9157	4325	Fantasy
9158	4325	War
9159	4326	Drama
9160	4327	Crime
9161	4327	Drama
9162	4328	Animation
9163	4328	Drama
9164	4328	War
9165	4329	Action
9166	4329	Thriller
9167	4330	Comedy
9168	4330	Drama
9169	4330	Romance
9170	4331	Comedy
9171	4331	Drama
9172	4331	Musical
9173	4332	Drama
9174	4333	Fantasy
9175	4333	Musical
9176	4333	Romance
9177	4334	Drama
9178	4334	Romance
9179	4335	Comedy
9180	4335	Drama
9181	4336	Mystery
9182	4336	Thriller
9183	4337	Comedy
9184	4338	Action
9185	4338	Adventure
9186	4338	Comedy
9187	4339	Comedy
9188	4339	Romance
9189	4340	Drama
9190	4340	Romance
9191	4341	Action
9192	4341	Adventure
9193	4341	Crime
9194	4341	Thriller
9195	4342	Drama
9196	4342	Romance
9197	4343	Thriller
9198	4344	Thriller
9199	4345	Documentary
9200	4345	Horror
9201	4346	Documentary
9202	4346	Horror
9203	4347	Drama
9204	4347	Romance
9205	4348	Action
9206	4348	Drama
9207	4349	Comedy
9208	4349	Drama
9209	4350	Drama
9210	4350	War
9211	4351	Comedy
9212	4351	Romance
9213	4352	Western
9214	4353	Drama
9215	4353	Horror
9216	4353	Sci-Fi
9217	4353	Thriller
9218	4354	Animation
9219	4354	Children
9220	4354	Comedy
9221	4355	Comedy
9222	4355	Crime
9223	4356	Comedy
9224	4356	Fantasy
9225	4357	Comedy
9226	4357	Romance
9227	4358	Crime
9228	4358	Drama
9229	4359	Drama
9230	4359	Horror
9231	4359	Thriller
9232	4360	Drama
9233	4361	Musical
9234	4361	Romance
9235	4362	Horror
9236	4362	Sci-Fi
9237	4363	Comedy
9238	4364	Comedy
9239	4365	Action
9240	4365	Drama
9241	4365	Thriller
9242	4366	Documentary
9243	4367	Horror
9244	4368	Action
9245	4368	Comedy
9246	4368	Documentary
9247	4369	Drama
9248	4370	Drama
9249	4370	Romance
9250	4371	Comedy
9251	4371	Drama
9252	4372	Drama
9253	4373	Action
9254	4373	Adventure
9255	4373	Comedy
9256	4374	Fantasy
9257	4374	Horror
9258	4375	Drama
9259	4375	Romance
9260	4375	War
9261	4376	Comedy
9262	4376	War
9263	4377	Comedy
9264	4378	Action
9265	4378	Adventure
9266	4378	Comedy
9267	4378	Crime
9268	4379	Children
9269	4379	Comedy
9270	4379	Fantasy
9271	4379	Romance
9272	4380	Drama
9273	4381	Thriller
9274	4382	Crime
9275	4382	Thriller
9276	4383	Drama
9277	4384	Drama
9278	4384	Romance
9279	4385	Comedy
9280	4385	Romance
9281	4386	Adventure
9282	4386	Fantasy
9283	4387	Drama
9284	4387	War
9285	4388	Drama
9286	4388	Romance
9287	4389	Drama
9288	4390	Documentary
9289	4390	Musical
9290	4391	Drama
9291	4392	Action
9292	4392	Drama
9293	4392	Thriller
9294	4393	Drama
9295	4393	Romance
9296	4393	War
9297	4394	Romance
9298	4394	Western
9299	4395	Comedy
9300	4395	Drama
9301	4395	Romance
9302	4396	Drama
9303	4397	Action
9304	4397	Horror
9305	4398	Drama
9306	4399	Comedy
9307	4399	Romance
9308	4400	Adventure
9309	4400	Drama
9310	4401	Comedy
9311	4401	Drama
9312	4402	Adventure
9313	4402	Romance
9314	4403	Comedy
9315	4403	Drama
9316	4403	Romance
9317	4404	Action
9318	4404	Drama
9319	4405	Drama
9320	4406	Drama
9321	4407	Drama
9322	4408	Horror
9323	4408	Sci-Fi
9324	4408	Thriller
9325	4409	Crime
9326	4409	Drama
9327	4409	Romance
9328	4410	Comedy
9329	4410	Musical
9330	4410	Sci-Fi
9331	4411	Drama
9332	4411	Thriller
9333	4411	War
9334	4412	Comedy
9335	4412	Horror
9336	4413	Comedy
9337	4414	Crime
9338	4414	Drama
9339	4414	Thriller
9340	4415	Crime
9341	4415	Drama
9342	4416	Action
9343	4416	Adventure
9344	4416	Thriller
9345	4417	Drama
9346	4418	Comedy
9347	4419	Drama
9348	4420	Drama
9349	4420	Thriller
9350	4420	War
9351	4421	Drama
9352	4421	Romance
9353	4422	Animation
9354	4422	Comedy
9355	4422	Musical
9356	4423	Action
9357	4423	Adventure
9358	4423	Crime
9359	4423	Thriller
9360	4424	Drama
9361	4424	Romance
9362	4424	Sci-Fi
9363	4425	Adventure
9364	4425	Animation
9365	4425	Children
9366	4425	Sci-Fi
9367	4425	IMAX
9368	4426	Horror
9369	4426	Thriller
9370	4427	Comedy
9371	4427	Drama
9372	4428	Crime
9373	4428	Drama
9374	4429	Comedy
9375	4429	Drama
9376	4430	Horror
9377	4430	Thriller
9378	4431	Crime
9379	4431	Drama
9380	4431	Thriller
9381	4432	Action
9382	4432	Adventure
9383	4432	Fantasy
9384	4433	Action
9385	4433	Drama
9386	4433	War
9387	4434	Comedy
9388	4434	Crime
9389	4435	Comedy
9390	4435	Drama
9391	4435	Romance
9392	4436	Action
9393	4436	Sci-Fi
9394	4436	Thriller
9395	4437	Drama
9396	4438	Documentary
9397	4439	Action
9398	4439	Drama
9399	4439	War
9400	4440	Adventure
9401	4440	Comedy
9402	4441	Drama
9403	4442	Drama
9404	4442	Thriller
9405	4443	Comedy
9406	4443	Drama
9407	4444	Documentary
9408	4445	Drama
9409	4446	Drama
9410	4447	Comedy
9411	4447	Crime
9412	4447	Mystery
9413	4447	Thriller
9414	4448	Comedy
9415	4449	Comedy
9416	4449	Drama
9417	4449	Musical
9418	4449	Romance
9419	4450	Comedy
9420	4451	Comedy
9421	4451	Romance
9422	4452	Action
9423	4452	Drama
9424	4452	Sci-Fi
9425	4452	Thriller
9426	4453	Comedy
9427	4453	Drama
9428	4454	Drama
9429	4455	Drama
9430	4456	Thriller
9431	4457	Drama
9432	4458	Adventure
9433	4458	Fantasy
9434	4459	Crime
9435	4459	Drama
9436	4460	Drama
9437	4461	Crime
9438	4461	Drama
9439	4462	Comedy
9440	4462	Romance
9441	4463	Crime
9442	4463	Drama
9443	4463	Thriller
9444	4464	Drama
9445	4464	Thriller
9446	4465	Action
9447	4465	Thriller
9448	4466	Drama
9449	4466	Thriller
9450	4467	Drama
9451	4468	Action
9452	4468	War
9453	4469	Film-Noir
9454	4469	Mystery
9455	4470	Comedy
9456	4470	Crime
9457	4470	Drama
9458	4471	Comedy
9459	4471	Drama
9460	4471	Romance
9461	4472	Comedy
9462	4472	Drama
9463	4472	Romance
9464	4473	Animation
9465	4473	Children
9466	4473	Drama
9467	4473	Fantasy
9468	4474	Adventure
9469	4474	Fantasy
9470	4475	Drama
9471	4475	Romance
9472	4475	War
9473	4476	Comedy
9474	4477	Horror
9475	4477	Sci-Fi
9476	4478	Horror
9477	4478	Mystery
9478	4478	Thriller
9479	4479	Horror
9480	4479	Sci-Fi
9481	4480	Sci-Fi
9482	4481	Drama
9483	4481	Romance
9484	4482	Action
9485	4482	Drama
9486	4482	Romance
9487	4483	Drama
9488	4484	Comedy
9489	4484	Crime
9490	4484	Drama
9491	4485	Crime
9492	4485	Drama
9493	4486	Children
9494	4486	Comedy
9495	4486	Fantasy
9496	4487	Comedy
9497	4487	Crime
9498	4487	Drama
9499	4487	Musical
9500	4488	Drama
9501	4488	Romance
9502	4489	Drama
9503	4490	Drama
9504	4490	Romance
9505	4491	Drama
9506	4491	War
9507	4492	Horror
9508	4492	Thriller
9509	4493	Action
9510	4493	Adventure
9511	4493	Animation
9512	4493	Fantasy
9513	4493	Sci-Fi
9514	4494	Comedy
9515	4494	Drama
9516	4495	Drama
9517	4496	Comedy
9518	4496	Crime
9519	4496	Drama
9520	4496	Thriller
9521	4497	Comedy
9522	4497	Documentary
9523	4498	Comedy
9524	4498	Romance
9525	4499	Comedy
9526	4500	Drama
9527	4501	Comedy
9528	4501	Romance
9529	4502	Action
9530	4502	Comedy
9531	4503	Action
9532	4503	Comedy
9533	4504	Action
9534	4504	Adventure
9535	4504	Crime
9536	4504	Drama
9537	4504	Thriller
9538	4505	Comedy
9539	4505	Drama
9540	4505	Romance
9541	4505	War
9542	4506	Crime
9543	4506	Drama
9544	4506	Mystery
9545	4506	Thriller
9546	4507	Drama
9547	4508	Comedy
9548	4508	Crime
9549	4508	Drama
9550	4508	Romance
9551	4509	Comedy
9552	4510	Comedy
9553	4510	Musical
9554	4511	Drama
9555	4511	Romance
9556	4512	Comedy
9557	4512	Romance
9558	4513	Crime
9559	4513	Drama
9560	4513	Romance
9561	4514	Comedy
9562	4514	Drama
9563	4514	Romance
9564	4515	Comedy
9565	4515	Romance
9566	4516	Horror
9567	4516	Thriller
9568	4517	Drama
9569	4518	Action
9570	4518	Crime
9571	4518	Drama
9572	4519	Drama
9573	4519	Film-Noir
9574	4519	Mystery
9575	4520	Action
9576	4520	Crime
9577	4520	Drama
9578	4521	Action
9579	4521	Crime
9580	4521	Drama
9581	4522	Horror
9582	4522	Thriller
9583	4523	Action
9584	4523	Thriller
9585	4524	Comedy
9586	4524	Romance
9587	4525	Documentary
9588	4526	Drama
9589	4526	Horror
9590	4527	Drama
9591	4527	Film-Noir
9592	4528	Comedy
9593	4528	Crime
9594	4529	Comedy
9595	4529	Crime
9596	4530	Crime
9597	4530	Drama
9598	4531	Action
9599	4531	Sci-Fi
9600	4531	Thriller
9601	4532	Comedy
9602	4532	Crime
9603	4533	Romance
9604	4533	Western
9605	4534	Animation
9606	4534	Children
9607	4534	Fantasy
9608	4535	Drama
9609	4536	Action
9610	4536	Sci-Fi
9611	4537	Comedy
9612	4537	Romance
9613	4538	Drama
9614	4538	Mystery
9615	4538	Thriller
9616	4539	Comedy
9617	4540	Comedy
9618	4541	Drama
9619	4542	Drama
9620	4542	War
9621	4543	Drama
9622	4544	Drama
9623	4544	Romance
9624	4545	Drama
9625	4546	Adventure
9626	4546	Comedy
9627	4546	Musical
9628	4547	Comedy
9629	4547	Drama
9630	4547	War
9631	4548	Comedy
9632	4549	Comedy
9633	4549	Documentary
9634	4550	Documentary
9635	4551	Comedy
9636	4551	Documentary
9637	4551	Musical
9638	4552	Drama
9639	4553	Comedy
9640	4553	Musical
9641	4554	Mystery
9642	4554	Thriller
9643	4555	Action
9644	4555	Thriller
9645	4556	Comedy
9646	4556	Drama
9647	4557	Comedy
9648	4558	Drama
9649	4558	Musical
9650	4559	Comedy
9651	4559	Sci-Fi
9652	4560	Comedy
9653	4560	Romance
9654	4561	Action
9655	4561	Adventure
9656	4561	Comedy
9657	4562	Action
9658	4562	Crime
9659	4563	Animation
9660	4563	Children
9661	4564	Drama
9662	4564	Romance
9663	4565	Documentary
9664	4565	Musical
9665	4566	Romance
9666	4566	Thriller
9667	4567	Comedy
9668	4568	Comedy
9669	4569	Action
9670	4569	Adventure
9671	4569	Thriller
9672	4570	Adventure
9673	4570	Children
9674	4570	Drama
9675	4571	Adventure
9676	4571	Children
9677	4572	Action
9678	4572	Drama
9679	4573	Action
9680	4574	Drama
9681	4574	Romance
9682	4575	Crime
9683	4575	Drama
9684	4576	Drama
9685	4576	War
9686	4577	Comedy
9687	4578	Comedy
9688	4578	Musical
9689	4578	Romance
9690	4579	Drama
9691	4579	Sci-Fi
9692	4580	Action
9693	4580	Crime
9694	4580	Drama
9695	4580	Thriller
9696	4581	Action
9697	4581	Drama
9698	4581	War
9699	4582	Crime
9700	4582	Drama
9701	4582	Thriller
9702	4583	Comedy
9703	4584	Comedy
9704	4584	Drama
9705	4585	Comedy
9706	4585	Drama
9707	4586	Comedy
9708	4586	Drama
9709	4586	Thriller
9710	4587	Action
9711	4587	Crime
9712	4587	Drama
9713	4587	Thriller
9714	4588	Drama
9715	4588	Mystery
9716	4589	Crime
9717	4589	Drama
9718	4590	Comedy
9719	4590	Drama
9720	4591	Drama
9721	4591	Romance
9722	4592	Comedy
9723	4592	Drama
9724	4592	Romance
9725	4593	Comedy
9726	4594	Action
9727	4594	Comedy
9728	4595	Comedy
9729	4596	Action
9730	4596	Drama
9731	4596	Thriller
9732	4597	Crime
9733	4597	Drama
9734	4597	Mystery
9735	4597	Thriller
9736	4598	Drama
9737	4599	Drama
9738	4600	Comedy
9739	4600	Drama
9740	4600	Romance
9741	4601	Action
9742	4601	Drama
9743	4601	Thriller
9744	4602	Drama
9745	4602	Horror
9746	4602	Thriller
9747	4603	Drama
9748	4604	Comedy
9749	4604	Crime
9750	4604	Drama
9751	4605	Drama
9752	4606	Drama
9753	4607	Comedy
9754	4607	Romance
9755	4607	Thriller
9756	4608	Drama
9757	4609	Drama
9758	4609	Musical
9759	4610	Comedy
9760	4610	Romance
9761	4611	Drama
9762	4611	Mystery
9763	4612	Drama
9764	4612	War
9765	4613	Drama
9766	4614	Comedy
9767	4614	Drama
9768	4614	Romance
9769	4615	Adventure
9770	4615	Children
9771	4615	Sci-Fi
9772	4616	Comedy
9773	4616	Drama
9774	4616	Romance
9775	4617	Horror
9776	4617	Mystery
9777	4617	Thriller
9778	4618	Horror
9779	4618	Mystery
9780	4619	Drama
9781	4620	Comedy
9782	4620	Drama
9783	4620	Musical
9784	4620	Romance
9785	4621	Drama
9786	4621	Romance
9787	4622	Drama
9788	4622	Horror
9789	4622	Sci-Fi
9790	4622	Thriller
9791	4623	Animation
9792	4623	Children
9793	4624	Comedy
9794	4624	Romance
9795	4625	Comedy
9796	4625	Romance
9797	4626	Horror
9798	4626	Mystery
9799	4626	Thriller
9800	4627	Documentary
9801	4627	Drama
9802	4628	Drama
9803	4629	Action
9804	4629	Romance
9805	4630	Drama
9806	4630	Thriller
9807	4630	War
9808	4631	Action
9809	4631	Drama
9810	4631	Sci-Fi
9811	4631	Thriller
9812	4632	Comedy
9813	4633	Comedy
9814	4633	Drama
9815	4633	Romance
9816	4634	Drama
9817	4634	Thriller
9818	4635	Documentary
9819	4636	Drama
9820	4636	Fantasy
9821	4637	Comedy
9822	4637	Drama
9823	4637	Romance
9824	4638	Drama
9825	4638	Film-Noir
9826	4638	Mystery
9827	4638	Romance
9828	4639	Documentary
9829	4640	Crime
9830	4640	Drama
9831	4641	Action
9832	4641	Crime
9833	4641	Drama
9834	4641	Thriller
9835	4642	Drama
9836	4642	Thriller
9837	4643	Action
9838	4643	Animation
9839	4643	Sci-Fi
9840	4643	Thriller
9841	4644	Drama
9842	4645	Comedy
9843	4645	Crime
9844	4645	Drama
9845	4646	Comedy
9846	4647	Crime
9847	4647	Drama
9848	4648	Horror
9849	4649	Crime
9850	4649	Drama
9851	4650	Drama
9852	4650	Romance
9853	4651	Action
9854	4651	Adventure
9855	4651	Sci-Fi
9856	4652	Comedy
9857	4653	Comedy
9858	4653	Musical
9859	4654	Adventure
9860	4654	Children
9861	4654	Comedy
9862	4654	Mystery
9863	4655	Comedy
9864	4655	Crime
9865	4656	Documentary
9866	4657	Action
9867	4657	Comedy
9868	4657	Crime
9869	4658	Drama
9870	4658	Thriller
9871	4659	Sci-Fi
9872	4660	Mystery
9873	4660	Sci-Fi
9874	4661	Comedy
9875	4661	Horror
9876	4661	Sci-Fi
9877	4661	Thriller
9878	4662	Drama
9879	4662	Sci-Fi
9880	4663	Comedy
9881	4663	Crime
9882	4663	Romance
9883	4664	Comedy
9884	4664	Drama
9885	4665	Adventure
9886	4665	Drama
9887	4666	Comedy
9888	4667	Comedy
9889	4668	Comedy
9890	4668	Crime
9891	4669	Comedy
9892	4670	Adventure
9893	4670	Children
9894	4670	Comedy
9895	4670	Fantasy
9896	4670	Musical
9897	4671	Comedy
9898	4672	Crime
9899	4672	Thriller
9900	4673	Crime
9901	4673	Horror
9902	4673	Mystery
9903	4673	Thriller
9904	4674	Documentary
9905	4675	Crime
9906	4675	Drama
9907	4675	Thriller
9908	4676	Documentary
9909	4677	Drama
9910	4678	Crime
9911	4678	Drama
9912	4679	Documentary
9913	4680	Children
9914	4680	Comedy
9915	4680	Romance
9916	4681	Action
9917	4681	Adventure
9918	4681	Sci-Fi
9919	4681	Thriller
9920	4682	Crime
9921	4682	Drama
9922	4682	Thriller
9923	4683	Crime
9924	4683	Drama
9925	4683	Thriller
9926	4684	Children
9927	4684	Comedy
9928	4685	Comedy
9929	4685	Drama
9930	4686	Documentary
9931	4686	Musical
9932	4687	Comedy
9933	4687	Drama
9934	4687	Romance
9935	4688	Comedy
9936	4688	Drama
9937	4688	Musical
9938	4689	Drama
9939	4689	Musical
9940	4690	Musical
9941	4691	Drama
9942	4691	Musical
9943	4692	Action
9944	4692	Adventure
9945	4692	Animation
9946	4692	Children
9947	4692	Fantasy
9948	4692	Sci-Fi
9949	4693	Musical
9950	4694	Western
9951	4695	Comedy
9952	4695	Musical
9953	4695	Romance
9954	4696	Comedy
9955	4696	Musical
9956	4696	Romance
9957	4697	Action
9958	4697	Adventure
9959	4697	Sci-Fi
9960	4697	Thriller
9961	4697	IMAX
9962	4698	Horror
9963	4698	Mystery
9964	4699	Comedy
9965	4699	Romance
9966	4700	Comedy
9967	4700	Drama
9968	4700	Romance
9969	4701	Animation
9970	4701	Children
9971	4702	Comedy
9972	4702	Drama
9973	4702	Fantasy
9974	4702	Romance
9975	4703	Comedy
9976	4704	Documentary
9977	4705	Adventure
9978	4705	Animation
9979	4705	Children
9980	4705	Comedy
9981	4706	Action
9982	4706	Crime
9983	4707	Horror
9984	4707	Thriller
9985	4708	Documentary
9986	4709	Drama
9987	4710	Action
9988	4710	Crime
9989	4710	Thriller
9990	4711	Drama
9991	4712	Action
9992	4712	Comedy
9993	4712	Crime
9994	4712	Thriller
9995	4713	Drama
9996	4713	War
9997	4714	Musical
9998	4715	Children
9999	4715	Comedy
10000	4716	Adventure
10001	4716	Drama
10002	4716	Western
10003	4717	Adventure
10004	4717	Romance
10005	4717	War
10006	4717	Western
10007	4718	Comedy
10008	4718	Romance
10009	4719	Western
10010	4720	Comedy
10011	4721	Comedy
10012	4722	Comedy
10013	4722	Western
10014	4723	Comedy
10015	4723	Western
10016	4724	Drama
10017	4724	War
10018	4725	Action
10019	4726	Drama
10020	4726	War
10021	4726	Western
10022	4727	Comedy
10023	4728	Comedy
10024	4728	Crime
10025	4728	Mystery
10026	4728	Romance
10027	4729	Comedy
10028	4730	Western
10029	4731	Children
10030	4731	Drama
10031	4732	Comedy
10032	4732	War
10033	4732	Western
10034	4733	Western
10035	4734	Drama
10036	4734	War
10037	4735	Documentary
10038	4736	War
10039	4737	Drama
10040	4738	Thriller
10041	4738	War
10042	4739	Drama
10043	4739	War
10044	4740	Drama
10045	4740	Thriller
10046	4741	War
10047	4742	Comedy
10048	4742	Romance
10049	4743	Adventure
10050	4743	Romance
10051	4743	Western
10052	4744	Action
10053	4744	Adventure
10054	4744	Drama
10055	4744	Romance
10056	4745	War
10057	4746	Action
10058	4746	Adventure
10059	4746	Drama
10060	4747	Drama
10061	4748	Drama
10062	4748	War
10063	4749	Comedy
10064	4749	Crime
10065	4750	Drama
10066	4751	Documentary
10067	4752	Drama
10068	4753	Comedy
10069	4753	Western
10070	4754	Action
10071	4754	Drama
10072	4754	War
10073	4755	Adventure
10074	4755	Drama
10075	4755	War
10076	4756	Drama
10077	4756	War
10078	4757	Drama
10079	4758	Drama
10080	4758	Western
10081	4759	Children
10082	4759	Comedy
10083	4760	Drama
10084	4760	Romance
10085	4761	Crime
10086	4761	Drama
10087	4762	Thriller
10088	4763	Drama
10089	4763	Thriller
10090	4764	Mystery
10091	4764	Thriller
10092	4765	Drama
10093	4766	Comedy
10094	4766	Western
10095	4767	Comedy
10096	4767	Musical
10097	4768	Comedy
10098	4769	Musical
10099	4769	Romance
10100	4770	Action
10101	4770	Crime
10102	4770	Drama
10103	4771	Adventure
10104	4771	Animation
10105	4771	Children
10106	4771	Comedy
10107	4772	Comedy
10108	4772	Crime
10109	4772	Drama
10110	4772	Thriller
10111	4773	Comedy
10112	4773	Romance
10113	4774	Comedy
10114	4774	Drama
10115	4774	Romance
10116	4775	Crime
10117	4775	Thriller
10118	4776	Drama
10119	4776	War
10120	4777	Drama
10121	4778	Horror
10122	4779	Action
10123	4779	Horror
10124	4779	Sci-Fi
10125	4780	Action
10126	4780	Adventure
10127	4780	Comedy
10128	4780	Crime
10129	4780	Thriller
10130	4781	Action
10131	4781	Thriller
10132	4782	Thriller
10133	4783	Drama
10134	4783	Romance
10135	4784	Drama
10136	4785	Drama
10137	4786	Action
10138	4786	War
10139	4787	Comedy
10140	4788	Adventure
10141	4788	Drama
10142	4789	Comedy
10143	4790	Comedy
10144	4790	Romance
10145	4791	Comedy
10146	4791	Drama
10147	4792	Adventure
10148	4792	Romance
10149	4793	Comedy
10150	4794	Drama
10151	4794	Horror
10152	4794	Mystery
10153	4794	Thriller
10154	4795	Crime
10155	4795	Drama
10156	4795	Mystery
10157	4796	Comedy
10158	4797	Comedy
10159	4798	Action
10160	4798	Adventure
10161	4798	Sci-Fi
10162	4799	Comedy
10163	4800	Adventure
10164	4800	Animation
10165	4800	Children
10166	4800	Fantasy
10167	4801	Action
10168	4801	Adventure
10169	4801	Sci-Fi
10170	4802	Drama
10171	4802	Mystery
10172	4802	Thriller
10173	4803	Action
10174	4803	Adventure
10175	4803	Comedy
10176	4803	Fantasy
10177	4804	Action
10178	4804	Fantasy
10179	4804	Sci-Fi
10180	4805	Drama
10181	4805	Romance
10182	4806	Drama
10183	4806	Fantasy
10184	4807	Action
10185	4807	Comedy
10186	4807	Crime
10187	4807	Thriller
10188	4808	Comedy
10189	4808	Drama
10190	4808	Romance
10191	4809	Action
10192	4809	Comedy
10193	4809	Thriller
10194	4810	Crime
10195	4810	Drama
10196	4810	Thriller
10197	4811	Comedy
10198	4811	Musical
10199	4812	Comedy
10200	4812	Drama
10201	4813	Children
10202	4813	Comedy
10203	4814	Action
10204	4814	Comedy
10205	4815	Comedy
10206	4815	War
10207	4816	Comedy
10208	4816	Drama
10209	4817	Action
10210	4817	Adventure
10211	4817	Comedy
10212	4817	Romance
10213	4817	Thriller
10214	4818	Drama
10215	4819	Action
10216	4819	Adventure
10217	4819	Children
10218	4820	Comedy
10219	4820	Crime
10220	4820	Drama
10221	4820	War
10222	4821	Comedy
10223	4821	Musical
10224	4822	Comedy
10225	4823	Comedy
10226	4823	Crime
10227	4824	Comedy
10228	4824	Drama
10229	4825	Action
10230	4825	Sci-Fi
10231	4825	Thriller
10232	4826	Action
10233	4826	Drama
10234	4827	Comedy
10235	4828	Comedy
10236	4828	Drama
10237	4828	Mystery
10238	4829	Action
10239	4829	Comedy
10240	4829	Crime
10241	4829	Thriller
10242	4830	Action
10243	4830	Sci-Fi
10244	4831	Adventure
10245	4831	Comedy
10246	4831	Crime
10247	4831	Thriller
10248	4832	Comedy
10249	4833	Comedy
10250	4833	Crime
10251	4833	Romance
10252	4834	Romance
10253	4834	Thriller
10254	4835	Drama
10255	4836	Drama
10256	4837	Children
10257	4837	Comedy
10258	4837	Fantasy
10259	4838	Action
10260	4838	Thriller
10261	4839	Comedy
10262	4839	Drama
10263	4839	Romance
10264	4840	Action
10265	4840	Sci-Fi
10266	4841	Documentary
10267	4842	Drama
10268	4843	Comedy
10269	4843	Horror
10270	4844	Crime
10271	4844	Drama
10272	4844	Film-Noir
10273	4845	Drama
10274	4846	Drama
10275	4847	Drama
10276	4848	Drama
10277	4849	Comedy
10278	4849	Crime
10279	4850	Action
10280	4850	Horror
10281	4850	Thriller
10282	4851	Action
10283	4851	Comedy
10284	4852	Western
10285	4853	Action
10286	4853	Comedy
10287	4854	Comedy
10288	4855	Comedy
10289	4855	Drama
10290	4856	Drama
10291	4857	Comedy
10292	4857	Romance
10293	4858	Action
10294	4858	Adventure
10295	4858	Children
10296	4858	Fantasy
10297	4859	Comedy
10298	4859	Drama
10299	4859	Romance
10300	4860	Comedy
10301	4861	Crime
10302	4861	Horror
10303	4861	Mystery
10304	4861	Thriller
10305	4862	Adventure
10306	4862	Drama
10307	4863	Drama
10308	4863	Romance
10309	4864	Drama
10310	4864	Romance
10311	4865	Comedy
10312	4865	Romance
10313	4866	Action
10314	4866	Drama
10315	4867	Comedy
10316	4867	Romance
10317	4868	Drama
10318	4868	Thriller
10319	4869	Action
10320	4869	Crime
10321	4870	Drama
10322	4871	Action
10323	4871	Adventure
10324	4871	Drama
10325	4871	Sci-Fi
10326	4872	Drama
10327	4873	Comedy
10328	4873	Drama
10329	4874	Crime
10330	4874	Drama
10331	4875	Western
10332	4876	Sci-Fi
10333	4877	Comedy
10334	4877	Romance
10335	4878	Comedy
10336	4878	Horror
10337	4878	Sci-Fi
10338	4879	Drama
10339	4879	Fantasy
10340	4879	Musical
10341	4879	Romance
10342	4880	Comedy
10343	4880	Crime
10344	4881	Comedy
10345	4881	Crime
10346	4882	Action
10347	4882	Adventure
10348	4883	Horror
10349	4883	Romance
10350	4884	Comedy
10351	4884	Drama
10352	4884	Fantasy
10353	4885	Documentary
10354	4886	Drama
10355	4886	Romance
10356	4887	Drama
10357	4888	Drama
10358	4889	Documentary
10359	4889	War
10360	4890	Drama
10361	4890	Sci-Fi
10362	4891	Documentary
10363	4892	Drama
10364	4892	War
10365	4893	Drama
10366	4894	Drama
10367	4894	Romance
10368	4895	Comedy
10369	4895	Musical
10370	4896	Action
10371	4896	Comedy
10372	4896	Crime
10373	4896	Fantasy
10374	4897	Comedy
10375	4897	Romance
10376	4898	Comedy
10377	4898	Fantasy
10378	4898	Mystery
10379	4899	Horror
10380	4899	Thriller
10381	4900	Comedy
10382	4900	Drama
10383	4900	Musical
10384	4900	Romance
10385	4901	Drama
10386	4902	Comedy
10387	4902	Drama
10388	4902	Musical
10389	4902	Romance
10390	4903	Drama
10391	4904	Horror
10392	4904	Mystery
10393	4904	Thriller
10394	4905	Horror
10395	4905	Thriller
10396	4906	Comedy
10397	4906	Crime
10398	4906	Drama
10399	4907	Action
10400	4907	Adventure
10401	4907	Crime
10402	4907	Thriller
10403	4908	Comedy
10404	4908	Drama
10405	4908	Romance
10406	4909	Comedy
10407	4909	Drama
10408	4909	Romance
10409	4910	Animation
10410	4910	Drama
10411	4910	Romance
10412	4911	Action
10413	4911	Comedy
10414	4911	Romance
10415	4911	Thriller
10416	4912	Action
10417	4912	Comedy
10418	4912	Crime
10419	4913	Action
10420	4913	Adventure
10421	4913	Drama
10422	4914	Action
10423	4914	Romance
10424	4915	Action
10425	4916	Comedy
10426	4916	Crime
10427	4916	Drama
10428	4917	Adventure
10429	4917	Musical
10430	4918	Drama
10431	4919	Drama
10432	4919	Romance
10433	4920	Horror
10434	4920	Sci-Fi
10435	4920	Thriller
10436	4921	Comedy
10437	4921	Musical
10438	4921	Romance
10439	4922	Comedy
10440	4922	Romance
10441	4922	Sci-Fi
10442	4922	Thriller
10443	4923	Drama
10444	4924	Crime
10445	4924	Drama
10446	4924	Horror
10447	4924	Thriller
10448	4925	Adventure
10449	4925	Comedy
10450	4926	Adventure
10451	4926	Fantasy
10452	4927	Comedy
10453	4927	Horror
10454	4928	Horror
10455	4928	Romance
10456	4929	Adventure
10457	4929	Children
10458	4930	Horror
10459	4931	Adventure
10460	4931	Drama
10461	4932	Comedy
10462	4932	Drama
10463	4932	Romance
10464	4933	Drama
10465	4933	Thriller
10466	4934	Children
10467	4934	Comedy
10468	4934	Drama
10469	4935	Action
10470	4935	Fantasy
10471	4935	Horror
10472	4936	Comedy
10473	4936	Horror
10474	4937	Crime
10475	4937	Thriller
10476	4938	Adventure
10477	4938	Drama
10478	4939	Comedy
10479	4939	Crime
10480	4940	Action
10481	4940	Adventure
10482	4940	Comedy
10483	4941	Comedy
10484	4941	Drama
10485	4941	Romance
10486	4942	Drama
10487	4943	Documentary
10488	4944	Animation
10489	4944	Comedy
10490	4944	Fantasy
10491	4945	Fantasy
10492	4945	Horror
10493	4945	Sci-Fi
10494	4945	Thriller
10495	4946	Comedy
10496	4946	Drama
10497	4946	Musical
10498	4946	Romance
10499	4947	Drama
10500	4948	Drama
10501	4949	Comedy
10502	4949	Drama
10503	4949	Romance
10504	4950	Documentary
10505	4951	Comedy
10506	4951	Drama
10507	4952	Comedy
10508	4952	Musical
10509	4952	Romance
10510	4952	Western
10511	4953	Drama
10512	4954	Drama
10513	4954	Thriller
10514	4955	Drama
10515	4955	Fantasy
10516	4955	Sci-Fi
10517	4956	Drama
10518	4957	Children
10519	4957	Comedy
10520	4957	Drama
10521	4958	Children
10522	4958	Comedy
10523	4959	Action
10524	4959	Crime
10525	4959	Sci-Fi
10526	4959	Thriller
10527	4960	Crime
10528	4960	Drama
10529	4961	Crime
10530	4961	Drama
10531	4962	Children
10532	4962	Comedy
10533	4962	Crime
10534	4962	Musical
10535	4963	Action
10536	4963	Crime
10537	4964	Thriller
10538	4965	Horror
10539	4965	Mystery
10540	4965	Thriller
10541	4966	Action
10542	4966	Crime
10543	4966	Thriller
10544	4967	Action
10545	4967	Crime
10546	4967	Thriller
10547	4968	Comedy
10548	4969	Action
10549	4969	Adventure
10550	4969	War
10551	4970	Thriller
10552	4971	Drama
10553	4971	Thriller
10554	4972	Comedy
10555	4973	Action
10556	4973	Comedy
10557	4973	Thriller
10558	4974	Action
10559	4974	Comedy
10560	4974	Drama
10561	4974	Thriller
10562	4975	Comedy
10563	4976	Adventure
10564	4976	Drama
10565	4977	Drama
10566	4977	War
10567	4978	Crime
10568	4979	Drama
10569	4979	Horror
10570	4979	Thriller
10571	4980	Comedy
10572	4981	Crime
10573	4981	Drama
10574	4981	Thriller
10575	4982	Comedy
10576	4983	Drama
10577	4984	Film-Noir
10578	4984	Horror
10579	4984	Thriller
10580	4985	Drama
10581	4986	Comedy
10582	4986	Drama
10583	4986	Romance
10584	4987	Comedy
10585	4987	Drama
10586	4988	Drama
10587	4988	Fantasy
10588	4988	Horror
10589	4989	Drama
10590	4990	Comedy
10591	4990	Drama
10592	4991	Crime
10593	4991	Drama
10594	4992	Drama
10595	4992	Thriller
10596	4992	War
10597	4993	Drama
10598	4993	Musical
10599	4994	Action
10600	4994	Adventure
10601	4994	Animation
10602	4994	Fantasy
10603	4995	Drama
10604	4996	Drama
10605	4996	Fantasy
10606	4997	Crime
10607	4997	Drama
10608	4997	Thriller
10609	4998	Comedy
10610	4998	Musical
10611	4999	Documentary
10612	4999	Musical
10613	5000	Comedy
10614	5000	Drama
10615	5001	Crime
10616	5001	Drama
10617	5001	Mystery
10618	5001	Thriller
10619	5002	Crime
10620	5002	Documentary
10621	5003	Crime
10622	5003	Drama
10623	5003	Mystery
10624	5004	Comedy
10625	5004	Romance
10626	5005	Action
10627	5005	Crime
10628	5005	Thriller
10629	5006	Drama
10630	5007	Drama
10631	5007	Thriller
10632	5008	Horror
10633	5009	Comedy
10634	5009	Drama
10635	5010	Action
10636	5010	Adventure
10637	5010	Sci-Fi
10638	5011	Drama
10639	5011	Romance
10640	5012	Crime
10641	5012	Drama
10642	5012	Thriller
10643	5013	Crime
10644	5013	Drama
10645	5013	Mystery
10646	5013	Romance
10647	5013	Thriller
10648	5014	Drama
10649	5014	Romance
10650	5014	War
10651	5015	Drama
10652	5016	Comedy
10653	5016	Horror
10654	5017	Adventure
10655	5017	Animation
10656	5017	Children
10657	5018	Drama
10658	5019	Action
10659	5019	Comedy
10660	5019	Crime
10661	5020	Documentary
10662	5020	War
10663	5021	Drama
10664	5022	Action
10665	5022	Drama
10666	5022	Thriller
10667	5023	Adventure
10668	5023	Comedy
10669	5023	Drama
10670	5023	Fantasy
10671	5023	Mystery
10672	5023	Sci-Fi
10673	5023	Thriller
10674	5024	Thriller
10675	5025	Horror
10676	5026	Comedy
10677	5026	Musical
10678	5026	Romance
10679	5027	Comedy
10680	5027	Drama
10681	5028	Drama
10682	5029	Crime
10683	5029	Thriller
10684	5030	Drama
10685	5031	Crime
10686	5031	Mystery
10687	5031	War
10688	5032	Crime
10689	5032	Mystery
10690	5033	Crime
10691	5033	Mystery
10692	5034	Comedy
10693	5035	Drama
10694	5035	Romance
10695	5035	Thriller
10696	5036	Crime
10697	5036	Drama
10698	5037	Action
10699	5037	Adventure
10700	5037	Sci-Fi
10701	5037	Thriller
10702	5037	IMAX
10703	5038	Documentary
10704	5039	Children
10705	5039	Comedy
10706	5039	Fantasy
10707	5040	Documentary
10708	5041	Drama
10709	5042	Comedy
10710	5042	Drama
10711	5042	Romance
10712	5043	Comedy
10713	5044	Documentary
10714	5045	Action
10715	5045	Animation
10716	5045	Children
10717	5045	Fantasy
10718	5046	Adventure
10719	5046	Drama
10720	5046	War
10721	5047	Documentary
10722	5048	Comedy
10723	5048	Mystery
10724	5048	Sci-Fi
10725	5049	Adventure
10726	5049	Thriller
10727	5049	Western
10728	5050	Children
10729	5050	Comedy
10730	5051	Horror
10731	5051	Thriller
10732	5052	Crime
10733	5052	Drama
10734	5052	Mystery
10735	5052	Romance
10736	5052	Thriller
10737	5053	Comedy
10738	5053	Crime
10739	5053	Drama
10740	5053	Mystery
10741	5053	Romance
10742	5054	Comedy
10743	5054	Crime
10744	5055	Children
10745	5055	Comedy
10746	5055	Fantasy
10747	5055	Horror
10748	5056	Action
10749	5056	Adventure
10750	5056	Sci-Fi
10751	5057	Drama
10752	5058	Documentary
10753	5059	Crime
10754	5059	Drama
10755	5059	Thriller
10756	5060	Action
10757	5060	Crime
10758	5060	Fantasy
10759	5060	Sci-Fi
10760	5060	Thriller
10761	5061	Horror
10762	5061	Mystery
10763	5062	Comedy
10764	5062	Romance
10765	5063	Drama
10766	5063	Thriller
10767	5064	Drama
10768	5064	Romance
10769	5064	Thriller
10770	5065	Comedy
10771	5065	Crime
10772	5066	Drama
10773	5066	Horror
10774	5066	Thriller
10775	5067	Action
10776	5067	Crime
10777	5067	Drama
10778	5068	Drama
10779	5068	Sci-Fi
10780	5068	Thriller
10781	5069	Comedy
10782	5070	Drama
10783	5071	Drama
10784	5071	War
10785	5072	Drama
10786	5072	Romance
10787	5073	Drama
10788	5074	Drama
10789	5075	Adventure
10790	5075	Drama
10791	5076	Crime
10792	5076	Fantasy
10793	5076	Horror
10794	5077	Drama
10795	5077	Romance
10796	5078	Crime
10797	5078	Drama
10798	5078	Thriller
10799	5079	Action
10800	5079	Adventure
10801	5079	Comedy
10802	5079	Crime
10803	5079	Drama
10804	5080	Adventure
10805	5080	Drama
10806	5080	Romance
10807	5081	Comedy
10808	5081	Drama
10809	5082	Comedy
10810	5082	Drama
10811	5082	Romance
10812	5083	Action
10813	5083	Comedy
10814	5084	Action
10815	5084	Comedy
10816	5084	Fantasy
10817	5085	Action
10818	5085	Sci-Fi
10819	5086	Crime
10820	5086	Drama
10821	5087	Comedy
10822	5087	Romance
10823	5088	Action
10824	5088	Adventure
10825	5088	Comedy
10826	5089	Horror
10827	5089	Mystery
10828	5089	Sci-Fi
10829	5089	Thriller
10830	5090	Action
10831	5090	Comedy
10832	5090	Crime
10833	5090	Thriller
10834	5091	Comedy
10835	5092	Mystery
10836	5092	Thriller
10837	5093	Action
10838	5093	Comedy
10839	5093	Crime
10840	5093	Drama
10841	5093	Thriller
10842	5094	Drama
10843	5094	Romance
10844	5095	Drama
10845	5096	Drama
10846	5096	Romance
10847	5097	Comedy
10848	5097	Fantasy
10849	5098	Drama
10850	5098	Film-Noir
10851	5098	Thriller
10852	5099	Comedy
10853	5099	Romance
10854	5100	Action
10855	5100	Drama
10856	5101	Action
10857	5101	Thriller
10858	5102	Crime
10859	5102	Drama
10860	5102	Thriller
10861	5103	Comedy
10862	5103	Drama
10863	5104	Comedy
10864	5104	Drama
10865	5104	Romance
10866	5105	Comedy
10867	5105	Crime
10868	5106	Action
10869	5106	Drama
10870	5106	Horror
10871	5106	Thriller
10872	5107	Comedy
10873	5107	Drama
10874	5107	Romance
10875	5108	Drama
10876	5108	War
10877	5109	Comedy
10878	5110	Action
10879	5110	Western
10880	5111	Comedy
10881	5111	Crime
10882	5112	Drama
10883	5113	Action
10884	5113	Crime
10885	5113	Drama
10886	5113	Thriller
10887	5114	Drama
10888	5114	Romance
10889	5114	Thriller
10890	5115	Comedy
10891	5115	Romance
10892	5116	Drama
10893	5116	Romance
10894	5117	Action
10895	5117	Romance
10896	5118	Comedy
10897	5118	Fantasy
10898	5119	Comedy
10899	5119	Drama
10900	5120	Drama
10901	5120	Romance
10902	5121	Crime
10903	5121	Mystery
10904	5121	Thriller
10905	5122	Action
10906	5122	Crime
10907	5122	Drama
10908	5122	Thriller
10909	5123	Drama
10910	5124	Crime
10911	5124	Drama
10912	5124	Mystery
10913	5124	Romance
10914	5124	Thriller
10915	5125	Children
10916	5125	Fantasy
10917	5126	Comedy
10918	5126	Fantasy
10919	5126	Horror
10920	5126	Thriller
10921	5127	Action
10922	5127	Crime
10923	5127	Drama
10924	5128	Action
10925	5128	Adventure
10926	5128	Comedy
10927	5128	Crime
10928	5129	Comedy
10929	5129	Musical
10930	5129	Romance
10931	5130	Comedy
10932	5131	Drama
10933	5132	Comedy
10934	5132	Musical
10935	5132	Romance
10936	5133	Drama
10937	5134	Comedy
10938	5134	Musical
10939	5134	Romance
10940	5135	Action
10941	5135	Crime
10942	5135	Drama
10943	5136	Comedy
10944	5136	Fantasy
10945	5136	Romance
10946	5137	Comedy
10947	5138	Children
10948	5138	Drama
10949	5139	Drama
10950	5139	Musical
10951	5140	Drama
10952	5140	Romance
10953	5141	Drama
10954	5142	Adventure
10955	5142	Drama
10956	5143	Drama
10957	5143	Fantasy
10958	5144	Drama
10959	5144	War
10960	5145	Comedy
10961	5145	Drama
10962	5145	Fantasy
10963	5145	Romance
10964	5146	Drama
10965	5146	Mystery
10966	5146	Romance
10967	5147	Drama
10968	5148	Action
10969	5148	Adventure
10970	5148	Western
10971	5149	Drama
10972	5150	Action
10973	5150	Drama
10974	5150	Romance
10975	5150	Western
10976	5151	Comedy
10977	5151	Crime
10978	5151	Mystery
10979	5152	Comedy
10980	5153	Adventure
10981	5153	Comedy
10982	5153	Musical
10983	5154	Action
10984	5154	Crime
10985	5154	Drama
10986	5154	Thriller
10987	5155	Drama
10988	5156	Drama
10989	5157	Drama
10990	5157	Musical
10991	5157	Romance
10992	5158	Comedy
10993	5159	Comedy
10994	5159	Romance
10995	5160	Drama
10996	5161	Comedy
10997	5161	Romance
10998	5162	Comedy
10999	5162	Romance
11000	5163	Comedy
11001	5163	Drama
11002	5164	Adventure
11003	5164	Drama
11004	5165	Drama
11005	5165	Romance
11006	5166	Comedy
11007	5166	Drama
11008	5167	Action
11009	5167	Adventure
11010	5167	Drama
11011	5168	Comedy
11012	5169	Drama
11013	5169	Romance
11014	5170	Comedy
11015	5171	Drama
11016	5172	Comedy
11017	5172	Drama
11018	5173	Adventure
11019	5173	Animation
11020	5173	Drama
11021	5173	Fantasy
11022	5173	Sci-Fi
11023	5174	Drama
11024	5175	Comedy
11025	5175	Romance
11026	5176	Comedy
11027	5176	Crime
11028	5176	Drama
11029	5177	Comedy
11030	5177	War
11031	5178	Drama
11032	5178	War
11033	5179	Comedy
11034	5179	Thriller
11035	5180	Crime
11036	5180	Drama
11037	5181	Drama
11038	5181	Horror
11039	5181	Thriller
11040	5182	Horror
11041	5182	Mystery
11042	5182	Thriller
11043	5183	Horror
11044	5183	Mystery
11045	5183	Thriller
11046	5184	Animation
11047	5184	Drama
11048	5184	Sci-Fi
11049	5184	War
11050	5185	Comedy
11051	5186	Comedy
11052	5186	Romance
11053	5187	Comedy
11054	5187	Drama
11055	5187	War
11056	5188	Drama
11057	5188	Fantasy
11058	5188	Mystery
11059	5188	Sci-Fi
11060	5189	Documentary
11061	5190	Comedy
11062	5190	Crime
11063	5190	Drama
11064	5190	Film-Noir
11065	5190	Musical
11066	5191	Sci-Fi
11067	5192	Comedy
11068	5192	Drama
11069	5192	Romance
11070	5193	Drama
11071	5194	Drama
11072	5195	Comedy
11073	5195	Musical
11074	5195	Romance
11075	5196	Action
11076	5196	Adventure
11077	5196	Sci-Fi
11078	5197	Crime
11079	5197	Drama
11080	5197	Romance
11081	5197	Thriller
11082	5198	Comedy
11083	5198	Drama
11084	5198	Romance
11085	5199	Comedy
11086	5199	Drama
11087	5199	Romance
11088	5200	Drama
11089	5200	Romance
11090	5201	Action
11091	5201	Adventure
11092	5201	Drama
11093	5201	War
11094	5202	Drama
11095	5202	Fantasy
11096	5202	Romance
11097	5203	Comedy
11098	5203	Drama
11099	5203	Romance
11100	5204	Comedy
11101	5205	Drama
11102	5205	Romance
11103	5206	Drama
11104	5206	Thriller
11105	5207	Action
11106	5207	Adventure
11107	5207	Drama
11108	5207	Fantasy
11109	5208	Drama
11110	5208	Romance
11111	5209	Comedy
11112	5210	Documentary
11113	5210	War
11114	5211	Comedy
11115	5212	Drama
11116	5213	Crime
11117	5213	Drama
11118	5214	Children
11119	5214	Comedy
11120	5215	Drama
11121	5215	Romance
11122	5215	War
11123	5216	Action
11124	5216	Sci-Fi
11125	5216	Thriller
11126	5217	Action
11127	5217	Adventure
11128	5217	Children
11129	5217	Fantasy
11130	5218	Drama
11131	5218	Musical
11132	5219	Drama
11133	5220	Comedy
11134	5220	Romance
11135	5221	Comedy
11136	5221	Romance
11137	5222	Action
11138	5222	Crime
11139	5223	Drama
11140	5224	Drama
11141	5225	Crime
11142	5225	Drama
11143	5225	Thriller
11144	5226	Drama
11145	5227	Comedy
11146	5228	Comedy
11147	5228	Sci-Fi
11148	5229	Comedy
11149	5230	Action
11150	5230	Comedy
11151	5231	Drama
11152	5232	Crime
11153	5232	Drama
11154	5232	Film-Noir
11155	5233	Drama
11156	5234	Comedy
11157	5234	Crime
11158	5234	Drama
11159	5234	Romance
11160	5235	Adventure
11161	5236	Comedy
11162	5237	Comedy
11163	5238	Drama
11164	5238	Horror
11165	5239	Comedy
11166	5240	Western
11167	5241	Comedy
11168	5241	Romance
11169	5242	Comedy
11170	5242	Romance
11171	5243	Comedy
11172	5244	Comedy
11173	5244	Romance
11174	5244	War
11175	5245	Adventure
11176	5245	Drama
11177	5245	Romance
11178	5245	Thriller
11179	5245	War
11180	5246	Crime
11181	5246	Drama
11182	5246	Film-Noir
11183	5246	Thriller
11184	5247	Crime
11185	5247	Drama
11186	5247	Film-Noir
11187	5247	Romance
11188	5247	Thriller
11189	5248	Drama
11190	5248	Western
11191	5249	Drama
11192	5250	Comedy
11193	5251	Comedy
11194	5251	Romance
11195	5252	Comedy
11196	5252	Drama
11197	5253	Drama
11198	5253	Film-Noir
11199	5253	Mystery
11200	5254	Documentary
11201	5255	Crime
11202	5255	Drama
11203	5255	Thriller
11204	5256	Comedy
11205	5257	Animation
11206	5257	Comedy
11207	5257	Fantasy
11208	5258	Drama
11209	5259	Drama
11210	5260	Action
11211	5260	Comedy
11212	5260	Crime
11213	5260	Drama
11214	5260	Horror
11215	5260	Thriller
11216	5261	Sci-Fi
11217	5262	Drama
11218	5262	War
11219	5263	Drama
11220	5264	Adventure
11221	5264	Children
11222	5264	Comedy
11223	5264	Fantasy
11224	5264	Musical
11225	5265	Comedy
11226	5266	Comedy
11227	5267	Drama
11228	5268	Comedy
11229	5268	Romance
11230	5269	Drama
11231	5269	Sci-Fi
11232	5269	Thriller
11233	5270	Comedy
11234	5270	Romance
11235	5271	Adventure
11236	5271	Documentary
11237	5272	Comedy
11238	5272	Crime
11239	5272	Thriller
11240	5273	Drama
11241	5273	Musical
11242	5274	Comedy
11243	5275	Drama
11244	5276	Drama
11245	5277	Comedy
11246	5278	Action
11247	5278	Crime
11248	5278	Drama
11249	5279	Comedy
11250	5280	Comedy
11251	5281	Thriller
11252	5282	Horror
11253	5283	Horror
11254	5284	Drama
11255	5285	Action
11256	5285	Crime
11257	5285	Thriller
11258	5286	Drama
11259	5287	Comedy
11260	5287	Drama
11261	5288	Drama
11262	5289	Comedy
11263	5289	Romance
11264	5290	Comedy
11265	5291	Comedy
11266	5291	Drama
11267	5292	Drama
11268	5293	Action
11269	5293	Drama
11270	5294	Action
11271	5294	Adventure
11272	5294	Fantasy
11273	5295	Drama
11274	5295	War
11275	5296	Animation
11276	5296	Comedy
11277	5296	Fantasy
11278	5296	Musical
11279	5297	Crime
11280	5297	Drama
11281	5297	Mystery
11282	5297	Thriller
11283	5298	Action
11284	5298	Adventure
11285	5298	Drama
11286	5298	War
11287	5299	Adventure
11288	5299	Comedy
11289	5300	Action
11290	5301	Drama
11291	5301	Romance
11292	5302	Action
11293	5302	Adventure
11294	5303	Comedy
11295	5303	Drama
11296	5304	Comedy
11297	5305	Adventure
11298	5305	Comedy
11299	5306	Drama
11300	5307	Comedy
11301	5307	Horror
11302	5308	Romance
11303	5309	Thriller
11304	5310	Comedy
11305	5310	Drama
11306	5311	Adventure
11307	5311	Drama
11308	5312	Action
11309	5312	Comedy
11310	5312	Crime
11311	5312	Thriller
11312	5313	Crime
11313	5313	Drama
11314	5314	Drama
11315	5315	Drama
11316	5315	Thriller
11317	5316	Crime
11318	5316	Drama
11319	5316	Thriller
11320	5317	Comedy
11321	5317	Drama
11322	5318	Film-Noir
11323	5319	Drama
11324	5319	War
11325	5320	Comedy
11326	5321	Action
11327	5321	Adventure
11328	5321	Children
11329	5321	Comedy
11330	5322	Comedy
11331	5322	Romance
11332	5323	Mystery
11333	5323	Thriller
11334	5324	Thriller
11335	5325	Comedy
11336	5325	Drama
11337	5325	Romance
11338	5326	Comedy
11339	5326	Drama
11340	5326	Romance
11341	5327	Drama
11342	5327	Romance
11343	5328	Action
11344	5328	Drama
11345	5328	Horror
11346	5328	Thriller
11347	5329	Drama
11348	5329	Romance
11349	5329	Sci-Fi
11350	5330	Crime
11351	5330	Drama
11352	5330	Thriller
11353	5331	Comedy
11354	5331	Crime
11355	5331	Drama
11356	5332	Drama
11357	5333	Comedy
11358	5333	Drama
11359	5333	Romance
11360	5334	Comedy
11361	5334	Crime
11362	5335	Action
11363	5335	Adventure
11364	5335	Children
11365	5335	Comedy
11366	5335	Mystery
11367	5336	Drama
11368	5336	Mystery
11369	5336	Thriller
11370	5337	Action
11371	5337	Adventure
11372	5337	Fantasy
11373	5337	Horror
11374	5338	Animation
11375	5338	Children
11376	5338	Comedy
11377	5338	Musical
11378	5338	Western
11379	5339	Comedy
11380	5339	Romance
11381	5340	Action
11382	5341	Crime
11383	5341	Drama
11384	5342	Drama
11385	5342	War
11386	5342	Western
11387	5343	Comedy
11388	5343	Fantasy
11389	5343	Romance
11390	5344	Action
11391	5344	Comedy
11392	5344	Crime
11393	5345	Drama
11394	5345	Mystery
11395	5345	Thriller
11396	5346	Crime
11397	5346	Drama
11398	5346	Thriller
11399	5347	Drama
11400	5347	Horror
11401	5348	Adventure
11402	5348	Drama
11403	5349	Action
11404	5349	Drama
11405	5349	Horror
11406	5350	Drama
11407	5351	Adventure
11408	5351	Fantasy
11409	5352	Comedy
11410	5353	Western
11411	5354	Action
11412	5354	Adventure
11413	5354	Comedy
11414	5355	Comedy
11415	5355	Drama
11416	5356	Drama
11417	5357	Action
11418	5357	Crime
11419	5357	Western
11420	5358	Children
11421	5358	Comedy
11422	5358	Fantasy
11423	5359	Action
11424	5359	Thriller
11425	5360	Comedy
11426	5360	Drama
11427	5361	Comedy
11428	5361	Crime
11429	5361	Drama
11430	5361	Mystery
11431	5362	Comedy
11432	5363	Comedy
11433	5363	Thriller
11434	5364	Comedy
11435	5365	Action
11436	5365	Drama
11437	5365	Thriller
11438	5366	Action
11439	5366	Crime
11440	5366	Thriller
11441	5367	Documentary
11442	5368	Crime
11443	5368	Drama
11444	5368	Thriller
11445	5369	Comedy
11446	5369	Fantasy
11447	5369	Romance
11448	5370	Action
11449	5370	Crime
11450	5370	Drama
11451	5370	Mystery
11452	5370	Thriller
11453	5371	Comedy
11454	5372	Drama
11455	5372	Horror
11456	5372	Thriller
11457	5373	Comedy
11458	5373	Romance
11459	5374	Comedy
11460	5375	Action
11461	5375	Adventure
11462	5375	Comedy
11463	5376	Action
11464	5376	Adventure
11465	5376	Fantasy
11466	5376	Horror
11467	5377	Action
11468	5377	Adventure
11469	5377	Drama
11470	5377	War
11471	5378	Comedy
11472	5378	Drama
11473	5379	Drama
11474	5380	Action
11475	5380	Crime
11476	5380	Drama
11477	5380	Thriller
11478	5381	Drama
11479	5382	Drama
11480	5383	Drama
11481	5383	Thriller
11482	5383	War
11483	5384	Adventure
11484	5384	Drama
11485	5384	Sci-Fi
11486	5385	Action
11487	5385	Crime
11488	5386	Documentary
11489	5387	Drama
11490	5388	Comedy
11491	5388	Drama
11492	5389	Drama
11493	5389	Horror
11494	5390	Drama
11495	5391	Action
11496	5391	Drama
11497	5391	War
11498	5392	Drama
11499	5392	Horror
11500	5392	Mystery
11501	5393	Crime
11502	5393	Mystery
11503	5393	Thriller
11504	5394	Comedy
11505	5394	Romance
11506	5395	Drama
11507	5395	Thriller
11508	5395	War
11509	5396	Fantasy
11510	5396	Horror
11511	5396	Thriller
11512	5397	Action
11513	5397	Crime
11514	5398	Drama
11515	5399	Horror
11516	5400	Documentary
11517	5401	Action
11518	5401	Adventure
11519	5401	Sci-Fi
11520	5401	Thriller
11521	5402	Action
11522	5402	Adventure
11523	5402	Thriller
11524	5403	Crime
11525	5403	Drama
11526	5403	Film-Noir
11527	5403	Thriller
11528	5404	Action
11529	5404	Adventure
11530	5404	Thriller
11531	5405	Comedy
11532	5405	Fantasy
11533	5405	Musical
11534	5405	Romance
11535	5406	Comedy
11536	5406	Romance
11537	5407	Comedy
11538	5407	Drama
11539	5407	Romance
11540	5408	Drama
11541	5409	Drama
11542	5410	Comedy
11543	5410	Romance
11544	5411	Drama
11545	5411	Romance
11546	5412	Crime
11547	5412	Drama
11548	5412	Thriller
11549	5413	Drama
11550	5414	Musical
11551	5414	Romance
11552	5414	Western
11553	5415	Drama
11554	5416	Mystery
11555	5416	Thriller
11556	5417	Comedy
11557	5417	Western
11558	5418	Drama
11559	5419	Drama
11560	5420	Comedy
11561	5420	Crime
11562	5420	Fantasy
11563	5421	Horror
11564	5421	Thriller
11565	5422	Comedy
11566	5422	Drama
11567	5423	Comedy
11568	5424	Adventure
11569	5424	Sci-Fi
11570	5425	Horror
11571	5426	Action
11572	5426	Comedy
11573	5426	Fantasy
11574	5426	Horror
11575	5427	Drama
11576	5427	Romance
11577	5428	Comedy
11578	5428	Romance
11579	5429	Drama
11580	5429	Thriller
11581	5430	Action
11582	5430	Adventure
11583	5430	Drama
11584	5430	Thriller
11585	5431	Comedy
11586	5431	Romance
11587	5432	Drama
11588	5433	Action
11589	5434	Comedy
11590	5434	Romance
11591	5435	Comedy
11592	5435	Musical
11593	5436	Comedy
11594	5436	Drama
11595	5436	Romance
11596	5437	Comedy
11597	5437	Fantasy
11598	5438	Drama
11599	5438	Horror
11600	5438	Romance
11601	5438	Thriller
11602	5439	Drama
11603	5439	Musical
11604	5439	Romance
11605	5440	Comedy
11606	5441	Comedy
11607	5441	Horror
11608	5442	Action
11609	5442	Adventure
11610	5442	Comedy
11611	5442	Romance
11612	5443	Action
11613	5443	Adventure
11614	5443	Thriller
11615	5444	Comedy
11616	5445	Crime
11617	5445	Drama
11618	5445	Film-Noir
11619	5445	Thriller
11620	5446	Comedy
11621	5446	Drama
11622	5447	Adventure
11623	5447	Children
11624	5447	Sci-Fi
11625	5448	Drama
11626	5449	Crime
11627	5449	Drama
11628	5450	Drama
11629	5451	Drama
11630	5452	Action
11631	5452	Drama
11632	5452	War
11633	5453	Action
11634	5453	Adventure
11635	5453	Fantasy
11636	5454	Drama
11637	5454	Thriller
11638	5455	Action
11639	5455	Drama
11640	5455	Thriller
11641	5455	War
11642	5456	Adventure
11643	5457	Adventure
11644	5457	Drama
11645	5458	Film-Noir
11646	5458	Thriller
11647	5459	Drama
11648	5460	Comedy
11649	5461	Action
11650	5461	Drama
11651	5462	Drama
11652	5463	Documentary
11653	5464	Crime
11654	5464	Thriller
11655	5465	Thriller
11656	5466	Action
11657	5466	Adventure
11658	5466	Crime
11659	5466	Thriller
11660	5467	Drama
11661	5467	Romance
11662	5467	War
11663	5468	Adventure
11664	5468	Sci-Fi
11665	5469	Drama
11666	5469	Sci-Fi
11667	5470	Drama
11668	5470	Sci-Fi
11669	5471	Comedy
11670	5471	Musical
11671	5472	Fantasy
11672	5472	Sci-Fi
11673	5473	Comedy
11674	5474	Crime
11675	5474	Drama
11676	5475	Adventure
11677	5475	Drama
11678	5475	Romance
11679	5476	Comedy
11680	5476	Romance
11681	5476	Thriller
11682	5477	Action
11683	5477	Sci-Fi
11684	5477	Thriller
11685	5478	Drama
11686	5478	War
11687	5479	Comedy
11688	5479	Crime
11689	5479	Drama
11690	5479	Mystery
11691	5479	Romance
11692	5480	Comedy
11693	5480	Crime
11694	5480	Mystery
11695	5481	Comedy
11696	5481	Crime
11697	5481	Mystery
11698	5482	Comedy
11699	5482	Crime
11700	5482	Mystery
11701	5482	Romance
11702	5483	Comedy
11703	5483	Crime
11704	5483	Drama
11705	5483	Musical
11706	5483	Mystery
11707	5483	Romance
11708	5484	Documentary
11709	5484	Musical
11710	5485	Drama
11711	5485	Romance
11712	5486	Comedy
11713	5487	Adventure
11714	5487	Comedy
11715	5487	War
11716	5488	Fantasy
11717	5488	Sci-Fi
11718	5489	Drama
11719	5489	Fantasy
11720	5489	Sci-Fi
11721	5490	Action
11722	5490	Comedy
11723	5491	Comedy
11724	5491	Horror
11725	5491	Sci-Fi
11726	5492	Comedy
11727	5492	Horror
11728	5492	Sci-Fi
11729	5493	Comedy
11730	5494	Horror
11731	5495	Drama
11732	5495	Horror
11733	5496	Comedy
11734	5497	Comedy
11735	5497	Musical
11736	5498	Western
11737	5499	Crime
11738	5499	Drama
11739	5499	Western
11740	5500	Action
11741	5500	Adventure
11742	5500	War
11743	5500	Western
11744	5501	Crime
11745	5501	Drama
11746	5501	Thriller
11747	5502	Adventure
11748	5502	Drama
11749	5502	Western
11750	5503	Comedy
11751	5503	Western
11752	5504	Comedy
11753	5504	Drama
11754	5504	Western
11755	5505	Action
11756	5506	Horror
11757	5507	Comedy
11758	5508	Drama
11759	5508	Horror
11760	5508	Sci-Fi
11761	5509	Drama
11762	5510	Drama
11763	5510	Film-Noir
11764	5511	Comedy
11765	5511	Crime
11766	5512	Drama
11767	5512	Film-Noir
11768	5512	Thriller
11769	5513	Action
11770	5513	Adventure
11771	5514	Crime
11772	5514	Drama
11773	5514	Film-Noir
11774	5514	Thriller
11775	5515	Documentary
11776	5516	Comedy
11777	5517	Comedy
11778	5518	Drama
11779	5519	Comedy
11780	5519	Romance
11781	5520	Crime
11782	5520	Film-Noir
11783	5521	Drama
11784	5521	Thriller
11785	5522	Drama
11786	5523	Drama
11787	5524	Comedy
11788	5524	Drama
11789	5525	Drama
11790	5526	Drama
11791	5527	Documentary
11792	5527	Musical
11793	5528	Action
11794	5528	Drama
11795	5528	War
11796	5529	Crime
11797	5529	Drama
11798	5529	Thriller
11799	5530	Drama
11800	5530	Horror
11801	5530	Mystery
11802	5530	Thriller
11803	5531	Comedy
11804	5532	Comedy
11805	5532	Sci-Fi
11806	5533	Comedy
11807	5533	Musical
11808	5534	Action
11809	5534	Sci-Fi
11810	5535	Fantasy
11811	5535	Musical
11812	5535	Romance
11813	5536	Drama
11814	5537	Drama
11815	5538	Comedy
11816	5538	Drama
11817	5539	Drama
11818	5540	Adventure
11819	5540	Animation
11820	5540	Children
11821	5540	Fantasy
11822	5541	Action
11823	5541	Crime
11824	5541	Drama
11825	5541	Thriller
11826	5542	Drama
11827	5542	Horror
11828	5542	Mystery
11829	5542	Thriller
11830	5543	Drama
11831	5544	Comedy
11832	5544	Crime
11833	5544	Romance
11834	5545	Action
11835	5545	Comedy
11836	5545	Crime
11837	5546	Comedy
11838	5546	Western
11839	5547	Comedy
11840	5548	Crime
11841	5548	Drama
11842	5549	Crime
11843	5549	Drama
11844	5549	Film-Noir
11845	5550	Action
11846	5550	Drama
11847	5550	War
11848	5551	Crime
11849	5551	Drama
11850	5551	Mystery
11851	5552	Drama
11852	5553	Action
11853	5553	Drama
11854	5553	Romance
11855	5553	Thriller
11856	5554	Drama
11857	5554	Thriller
11858	5554	Western
11859	5555	Drama
11860	5556	Comedy
11861	5556	Drama
11862	5557	Drama
11863	5557	Romance
11864	5558	Drama
11865	5559	Drama
11866	5560	Documentary
11867	5561	Comedy
11868	5561	Romance
11869	5562	Action
11870	5562	Drama
11871	5563	Horror
11872	5563	Sci-Fi
11873	5564	Action
11874	5564	Crime
11875	5565	Drama
11876	5566	Drama
11877	5566	Sci-Fi
11878	5567	Drama
11879	5568	Drama
11880	5569	Animation
11881	5569	Fantasy
11882	5569	Thriller
11883	5570	Crime
11884	5570	Drama
11885	5571	Action
11886	5571	Adventure
11887	5571	Romance
11888	5572	Children
11889	5572	Comedy
11890	5572	Fantasy
11891	5572	Sci-Fi
11892	5573	Comedy
11893	5573	Drama
11894	5574	Comedy
11895	5574	Drama
11896	5574	War
11897	5575	Drama
11898	5576	Drama
11899	5576	Mystery
11900	5576	Romance
11901	5577	Drama
11902	5577	Romance
11903	5577	War
11904	5578	Drama
11905	5578	Thriller
11906	5579	Drama
11907	5580	Drama
11908	5581	Horror
11909	5582	Crime
11910	5582	Thriller
11911	5583	Crime
11912	5583	Horror
11913	5583	Sci-Fi
11914	5584	Drama
11915	5584	Horror
11916	5584	Mystery
11917	5584	Thriller
11918	5585	Horror
11919	5586	Adventure
11920	5586	War
11921	5586	Western
11922	5587	Mystery
11923	5588	Comedy
11924	5588	Drama
11925	5589	Action
11926	5589	Comedy
11927	5589	Romance
11928	5590	Drama
11929	5590	Film-Noir
11930	5591	Comedy
11931	5591	Drama
11932	5592	Action
11933	5592	Adventure
11934	5592	Animation
11935	5592	Comedy
11936	5592	Crime
11937	5592	Mystery
11938	5593	Comedy
11939	5593	Drama
11940	5593	Fantasy
11941	5593	Romance
11942	5594	Drama
11943	5594	Romance
11944	5595	Action
11945	5595	Drama
11946	5595	War
11947	5596	Action
11948	5596	Comedy
11949	5597	Drama
11950	5598	Comedy
11951	5598	Musical
11952	5598	Romance
11953	5599	Drama
11954	5599	Horror
11955	5599	Mystery
11956	5599	Thriller
11957	5600	Drama
11958	5600	Musical
11959	5601	Action
11960	5601	Thriller
11961	5602	Drama
11962	5603	Mystery
11963	5604	Comedy
11964	5604	Drama
11965	5604	Romance
11966	5605	Adventure
11967	5605	Mystery
11968	5605	Thriller
11969	5606	Comedy
11970	5606	Drama
11971	5606	Romance
11972	5607	Drama
11973	5607	Romance
11974	5608	Comedy
11975	5608	Drama
11976	5608	Thriller
11977	5609	Comedy
11978	5610	Drama
11979	5611	Western
11980	5612	Drama
11981	5613	Drama
11982	5613	War
11983	5614	Drama
11984	5615	Adventure
11985	5615	Drama
11986	5616	Drama
11987	5616	Thriller
11988	5617	Adventure
11989	5617	Crime
11990	5617	Drama
11991	5618	Adventure
11992	5618	Animation
11993	5618	Children
11994	5618	Comedy
11995	5618	Musical
11996	5618	Romance
11997	5619	Action
11998	5619	Adventure
11999	5619	Drama
12000	5619	Sci-Fi
12001	5619	Thriller
12002	5620	Comedy
12003	5621	Drama
12004	5622	Comedy
12005	5622	Drama
12006	5623	Drama
12007	5624	Adventure
12008	5624	Fantasy
12009	5624	IMAX
12010	5625	Action
12011	5625	Crime
12012	5625	Horror
12013	5625	Mystery
12014	5625	Thriller
12015	5626	Action
12016	5626	Comedy
12017	5626	Crime
12018	5626	Drama
12019	5627	Action
12020	5627	Sci-Fi
12021	5627	Thriller
12022	5628	Animation
12023	5628	Children
12024	5628	Comedy
12025	5629	Comedy
12026	5629	Fantasy
12027	5629	Thriller
12028	5630	Comedy
12029	5631	Drama
12030	5632	Drama
12031	5633	Drama
12032	5633	Musical
12033	5633	Romance
12034	5634	Comedy
12035	5634	Romance
12036	5635	Comedy
12037	5635	Crime
12038	5636	Crime
12039	5636	Mystery
12040	5636	Thriller
12041	5637	Drama
12042	5637	Romance
12043	5638	Crime
12044	5638	Mystery
12045	5638	Thriller
12046	5639	Crime
12047	5639	Mystery
12048	5639	Thriller
12049	5640	Drama
12050	5640	Horror
12051	5641	Crime
12052	5641	Drama
12053	5641	Film-Noir
12054	5642	Drama
12055	5642	Romance
12056	5643	Drama
12057	5643	Romance
12058	5644	Comedy
12059	5645	Action
12060	5645	Drama
12061	5645	Romance
12062	5645	War
12063	5646	Comedy
12064	5646	Crime
12065	5647	Drama
12066	5648	Crime
12067	5648	Drama
12068	5648	Thriller
12069	5649	Drama
12070	5649	Romance
12071	5650	Drama
12072	5651	Drama
12073	5652	Comedy
12074	5652	Documentary
12075	5652	Drama
12076	5653	Crime
12077	5653	Drama
12078	5653	Film-Noir
12079	5653	Romance
12080	5654	Romance
12081	5654	Sci-Fi
12082	5655	Drama
12083	5656	Action
12084	5656	Adventure
12085	5656	Drama
12086	5656	Romance
12087	5656	Thriller
12088	5656	Western
12089	5657	Drama
12090	5657	Fantasy
12091	5657	Horror
12092	5658	Children
12093	5658	Comedy
12094	5658	Musical
12095	5659	Crime
12096	5659	Drama
12097	5659	Film-Noir
12098	5660	Drama
12099	5660	Fantasy
12100	5661	Action
12101	5661	Drama
12102	5661	War
12103	5662	Drama
12104	5663	Action
12105	5663	Thriller
12106	5664	Drama
12107	5664	Musical
12108	5664	Romance
12109	5665	Adventure
12110	5665	Drama
12111	5665	Romance
12112	5666	Drama
12113	5666	Romance
12114	5667	Mystery
12115	5667	Thriller
12116	5668	Crime
12117	5668	Drama
12118	5668	Horror
12119	5669	Comedy
12120	5670	Drama
12121	5670	Fantasy
12122	5670	Romance
12123	5671	Action
12124	5671	Crime
12125	5671	Thriller
12126	5672	Drama
12127	5672	Horror
12128	5673	Comedy
12129	5673	Western
12130	5674	Drama
12131	5675	Adventure
12132	5675	Children
12133	5675	Comedy
12134	5676	Crime
12135	5676	Drama
12136	5677	Comedy
12137	5678	Comedy
12138	5678	Drama
12139	5678	Romance
12140	5679	Drama
12141	5679	Romance
12142	5680	Action
12143	5680	Comedy
12144	5680	Crime
12145	5681	Drama
12146	5682	Drama
12147	5682	Romance
12148	5683	Drama
12149	5683	Musical
12150	5684	Drama
12151	5684	Thriller
12152	5685	Action
12153	5685	Adventure
12154	5685	Animation
12155	5685	Children
12156	5685	Sci-Fi
12157	5686	Drama
12158	5686	War
12159	5687	Comedy
12160	5687	Musical
12161	5688	Comedy
12162	5688	Drama
12163	5689	Drama
12164	5689	Romance
12165	5690	Comedy
12166	5690	Drama
12167	5691	Action
12168	5691	Comedy
12169	5692	Action
12170	5692	Comedy
12171	5692	Horror
12172	5692	Sci-Fi
12173	5693	Adventure
12174	5693	Comedy
12175	5693	Fantasy
12176	5693	Musical
12177	5694	Documentary
12178	5694	Drama
12179	5695	Documentary
12180	5695	War
12181	5696	Adventure
12182	5696	Drama
12183	5696	Romance
12184	5697	Drama
12185	5697	Film-Noir
12186	5698	Action
12187	5698	Adventure
12188	5698	Drama
12189	5698	Romance
12190	5699	Comedy
12191	5700	Drama
12192	5700	Mystery
12193	5700	Romance
12194	5700	Thriller
12195	5701	Drama
12196	5701	War
12197	5702	Adventure
12198	5702	Drama
12199	5702	Sci-Fi
12200	5703	Comedy
12201	5703	Crime
12202	5704	Crime
12203	5704	Drama
12204	5705	Action
12205	5705	Comedy
12206	5706	Action
12207	5706	Comedy
12208	5707	Adventure
12209	5707	Animation
12210	5707	Drama
12211	5708	Drama
12212	5708	Thriller
12213	5709	Comedy
12214	5710	Comedy
12215	5710	Fantasy
12216	5711	Comedy
12217	5712	Adventure
12218	5712	Children
12219	5712	Drama
12220	5713	Comedy
12221	5713	Romance
12222	5714	Adventure
12223	5714	Horror
12224	5714	Sci-Fi
12225	5715	Children
12226	5715	Musical
12227	5715	Romance
12228	5716	Drama
12229	5717	Drama
12230	5717	Western
12231	5718	Comedy
12232	5718	Drama
12233	5718	Fantasy
12234	5718	Mystery
12235	5719	Documentary
12236	5720	Comedy
12237	5720	Romance
12238	5721	Horror
12239	5721	Sci-Fi
12240	5722	Drama
12241	5722	War
12242	5723	Action
12243	5723	Drama
12244	5724	Action
12245	5724	Adventure
12246	5724	Comedy
12247	5724	Sci-Fi
12248	5725	Action
12249	5725	Comedy
12250	5725	Drama
12251	5726	Action
12252	5726	Adventure
12253	5726	Sci-Fi
12254	5726	IMAX
12255	5727	Drama
12256	5727	Romance
12257	5728	Drama
12258	5728	Thriller
12259	5729	Action
12260	5729	Adventure
12261	5729	Drama
12262	5729	War
12263	5730	Comedy
12264	5731	Comedy
12265	5732	Comedy
12266	5732	Romance
12267	5733	Action
12268	5733	Adventure
12269	5733	Sci-Fi
12270	5733	Thriller
12271	5734	Crime
12272	5734	Drama
12273	5735	Drama
12274	5736	Adventure
12275	5736	Comedy
12276	5736	Musical
12277	5737	Crime
12278	5737	Drama
12279	5738	Western
12280	5739	Drama
12281	5739	Thriller
12282	5740	Adventure
12283	5740	Drama
12284	5740	Western
12285	5741	Action
12286	5741	Drama
12287	5741	War
12288	5742	Comedy
12289	5742	Documentary
12290	5743	Action
12291	5743	Crime
12292	5743	Thriller
12293	5744	Action
12294	5744	Crime
12295	5744	Fantasy
12296	5745	Drama
12297	5745	Romance
12298	5746	Comedy
12299	5746	Drama
12300	5747	Crime
12301	5747	Horror
12302	5747	Mystery
12303	5747	Thriller
12304	5748	Action
12305	5748	Drama
12306	5748	War
12307	5749	Adventure
12308	5749	Drama
12309	5750	Comedy
12310	5750	Crime
12311	5750	Thriller
12312	5751	Comedy
12313	5751	Drama
12314	5751	Sci-Fi
12315	5751	War
12316	5752	Drama
12317	5752	War
12318	5753	Comedy
12319	5753	Musical
12320	5753	Romance
12321	5754	Comedy
12322	5755	Drama
12323	5755	Romance
12324	5756	Drama
12325	5757	Adventure
12326	5757	War
12327	5758	Comedy
12328	5758	Romance
12329	5759	Drama
12330	5759	Romance
12331	5760	Comedy
12332	5761	Comedy
12333	5761	Romance
12334	5762	Comedy
12335	5763	Comedy
12336	5763	Fantasy
12337	5763	Romance
12338	5764	Drama
12339	5764	War
12340	5765	Comedy
12341	5765	Drama
12342	5765	Romance
12343	5766	Comedy
12344	5766	Thriller
12345	5767	Drama
12346	5768	Drama
12347	5769	Drama
12348	5770	Comedy
12349	5771	Comedy
12350	5771	Drama
12351	5771	Musical
12352	5771	Romance
12353	5772	Drama
12354	5773	Comedy
12355	5773	Drama
12356	5774	Thriller
12357	5775	Crime
12358	5775	Horror
12359	5776	Comedy
12360	5777	Drama
12361	5778	Action
12362	5778	Crime
12363	5778	Drama
12364	5779	Crime
12365	5779	Drama
12366	5779	Film-Noir
12367	5780	Drama
12368	5780	Film-Noir
12369	5780	Romance
12370	5781	Drama
12371	5782	Documentary
12372	5783	Crime
12373	5783	Film-Noir
12374	5783	Thriller
12375	5784	Crime
12376	5784	Film-Noir
12377	5784	Thriller
12378	5785	Crime
12379	5785	Drama
12380	5785	Film-Noir
12381	5786	Adventure
12382	5787	Crime
12383	5787	Mystery
12384	5787	Thriller
12385	5788	Drama
12386	5788	Thriller
12387	5789	Crime
12388	5789	Mystery
12389	5789	Thriller
12390	5790	Mystery
12391	5791	Thriller
12392	5791	War
12393	5792	Comedy
12394	5792	Drama
12395	5793	Thriller
12396	5794	Drama
12397	5794	Mystery
12398	5794	Thriller
12399	5795	Comedy
12400	5795	Drama
12401	5795	Romance
12402	5796	Drama
12403	5797	Drama
12404	5798	Action
12405	5798	Sci-Fi
12406	5799	Comedy
12407	5799	Horror
12408	5800	Crime
12409	5800	Drama
12410	5801	Comedy
12411	5801	Musical
12412	5802	Action
12413	5802	Crime
12414	5802	Drama
12415	5802	Thriller
12416	5803	Comedy
12417	5803	Romance
12418	5804	Romance
12419	5804	Sci-Fi
12420	5805	Comedy
12421	5805	Crime
12422	5806	Adventure
12423	5806	Comedy
12424	5807	Comedy
12425	5807	Romance
12426	5808	Comedy
12427	5808	Romance
12428	5809	Action
12429	5809	Horror
12430	5809	Sci-Fi
12431	5809	Thriller
12432	5810	Action
12433	5810	Adventure
12434	5810	Animation
12435	5810	Fantasy
12436	5811	Drama
12437	5812	Comedy
12438	5813	Horror
12439	5813	Thriller
12440	5814	Comedy
12441	5814	Horror
12442	5814	Mystery
12443	5815	Drama
12444	5816	Comedy
12445	5816	Documentary
12446	5817	Drama
12447	5817	Thriller
12448	5818	Adventure
12449	5818	Drama
12450	5818	Horror
12451	5818	Sci-Fi
12452	5818	Thriller
12453	5819	Crime
12454	5819	Thriller
12455	5820	Drama
12456	5820	Romance
12457	5821	Drama
12458	5821	Thriller
12459	5822	Drama
12460	5822	Romance
12461	5822	Thriller
12462	5823	Drama
12463	5823	Romance
12464	5824	Comedy
12465	5825	Drama
12466	5826	Adventure
12467	5826	Drama
12468	5827	Action
12469	5827	Crime
12470	5827	Drama
12471	5827	Mystery
12472	5827	Thriller
12473	5828	Action
12474	5828	Horror
12475	5828	Sci-Fi
12476	5828	Thriller
12477	5829	Comedy
12478	5829	Drama
12479	5830	Action
12480	5830	Adventure
12481	5830	Sci-Fi
12482	5831	Comedy
12483	5831	Romance
12484	5832	Drama
12485	5833	Drama
12486	5833	Romance
12487	5833	War
12488	5834	Comedy
12489	5834	Romance
12490	5835	Drama
12491	5835	Mystery
12492	5835	Sci-Fi
12493	5835	Thriller
12494	5836	Comedy
12495	5837	Comedy
12496	5838	Adventure
12497	5838	Drama
12498	5839	Comedy
12499	5839	Horror
12500	5840	Drama
12501	5841	Crime
12502	5841	Mystery
12503	5841	Thriller
12504	5842	Drama
12505	5843	Crime
12506	5843	Drama
12507	5843	Mystery
12508	5843	Thriller
12509	5844	Adventure
12510	5844	Children
12511	5844	Comedy
12512	5845	Comedy
12513	5845	Thriller
12514	5846	Drama
12515	5846	Horror
12516	5846	Mystery
12517	5846	Thriller
12518	5847	Horror
12519	5847	Sci-Fi
12520	5848	Thriller
12521	5849	Adventure
12522	5849	Drama
12523	5850	Horror
12524	5851	Animation
12525	5851	Children
12526	5851	Comedy
12527	5852	Action
12528	5852	Drama
12529	5852	Thriller
12530	5853	Comedy
12531	5854	Action
12532	5854	Comedy
12533	5855	Drama
12534	5856	Drama
12535	5856	Sci-Fi
12536	5857	Drama
12537	5858	Comedy
12538	5858	Romance
12539	5859	Action
12540	5859	Adventure
12541	5859	Animation
12542	5859	Comedy
12543	5860	Comedy
12544	5860	Drama
12545	5860	Fantasy
12546	5860	Romance
12547	5861	Drama
12548	5862	Drama
12549	5862	Romance
12550	5863	Drama
12551	5863	Romance
12552	5864	Comedy
12553	5864	Horror
12554	5865	Horror
12555	5866	Comedy
12556	5866	Drama
12557	5867	Animation
12558	5867	Children
12559	5867	Comedy
12560	5868	Action
12561	5868	Drama
12562	5869	Documentary
12563	5870	Sci-Fi
12564	5870	Thriller
12565	5871	Comedy
12566	5871	Drama
12567	5872	Comedy
12568	5873	Horror
12569	5873	Mystery
12570	5873	Thriller
12571	5874	Comedy
12572	5874	Drama
12573	5874	Romance
12574	5875	Comedy
12575	5875	Drama
12576	5875	Romance
12577	5876	Drama
12578	5876	Mystery
12579	5876	Thriller
12580	5877	Drama
12581	5878	Crime
12582	5878	Drama
12583	5878	Thriller
12584	5879	Drama
12585	5880	Horror
12586	5880	Mystery
12587	5880	Thriller
12588	5881	Drama
12589	5882	Drama
12590	5882	Mystery
12591	5883	Action
12592	5883	Adventure
12593	5883	Animation
12594	5883	Children
12595	5883	Comedy
12596	5884	Drama
12597	5884	Romance
12598	5884	Sci-Fi
12599	5884	Thriller
12600	5885	Adventure
12601	5885	Animation
12602	5885	Children
12603	5885	Fantasy
12604	5885	IMAX
12605	5886	Drama
12606	5887	Comedy
12607	5887	Horror
12608	5888	Action
12609	5888	Adventure
12610	5888	Comedy
12611	5888	Crime
12612	5888	Thriller
12613	5889	Comedy
12614	5889	Drama
12615	5889	Romance
12616	5890	Drama
12617	5891	Action
12618	5891	Adventure
12619	5891	Drama
12620	5891	Mystery
12621	5891	Thriller
12622	5892	Drama
12623	5892	Thriller
12624	5893	Adventure
12625	5893	Animation
12626	5893	Children
12627	5893	Comedy
12628	5894	Action
12629	5894	Adventure
12630	5894	Drama
12631	5894	War
12632	5895	Children
12633	5895	Comedy
12634	5896	Drama
12635	5896	Romance
12636	5897	Drama
12637	5898	Action
12638	5898	Drama
12639	5898	Romance
12640	5899	Action
12641	5899	Comedy
12642	5899	Crime
12643	5899	Thriller
12644	5900	Action
12645	5900	Fantasy
12646	5900	Horror
12647	5900	Thriller
12648	5901	Comedy
12649	5901	Musical
12650	5902	Comedy
12651	5903	Documentary
12652	5904	Documentary
12653	5905	Drama
12654	5906	Adventure
12655	5906	Children
12656	5906	Sci-Fi
12657	5907	Drama
12658	5907	Mystery
12659	5907	Sci-Fi
12660	5908	Horror
12661	5908	Sci-Fi
12662	5909	Drama
12663	5909	Romance
12664	5910	Drama
12665	5910	Fantasy
12666	5910	Mystery
12667	5910	Romance
12668	5911	Drama
12669	5911	War
12670	5912	Documentary
12671	5912	War
12672	5913	Drama
12673	5913	Horror
12674	5913	Sci-Fi
12675	5914	Drama
12676	5914	Horror
12677	5915	Drama
12678	5915	Thriller
12679	5916	Comedy
12680	5916	Fantasy
12681	5916	Romance
12682	5917	Drama
12683	5918	Drama
12684	5918	Horror
12685	5919	Drama
12686	5919	Horror
12687	5919	Romance
12688	5920	Drama
12689	5921	Comedy
12690	5921	Drama
12691	5921	Romance
12692	5922	Drama
12693	5923	Comedy
12694	5923	Romance
12695	5924	Fantasy
12696	5925	Crime
12697	5925	Drama
12698	5926	Drama
12699	5927	Comedy
12700	5928	Crime
12701	5928	Drama
12702	5928	Mystery
12703	5928	Thriller
12704	5929	Horror
12705	5929	Thriller
12706	5930	Drama
12707	5930	Horror
12708	5930	Thriller
12709	5931	Crime
12710	5931	Drama
12711	5932	Adventure
12712	5932	Drama
12713	5932	Romance
12714	5933	Fantasy
12715	5933	Horror
12716	5934	Comedy
12717	5934	Drama
12718	5934	Romance
12719	5935	Drama
12720	5935	Horror
12721	5936	Musical
12722	5937	Comedy
12723	5938	Comedy
12724	5938	Romance
12725	5939	Horror
12726	5940	Comedy
12727	5940	Drama
12728	5940	Romance
12729	5941	Adventure
12730	5941	Crime
12731	5941	Horror
12732	5941	Thriller
12733	5942	Adventure
12734	5942	Drama
12735	5942	War
12736	5943	Adventure
12737	5943	Comedy
12738	5944	Crime
12739	5944	Drama
12740	5945	Horror
12741	5945	Mystery
12742	5946	Drama
12743	5946	Fantasy
12744	5946	Horror
12745	5946	Sci-Fi
12746	5947	Drama
12747	5947	Film-Noir
12748	5948	Comedy
12749	5948	Romance
12750	5949	Comedy
12751	5949	Romance
12752	5950	Crime
12753	5950	Drama
12754	5950	Romance
12755	5951	Comedy
12756	5951	Drama
12757	5951	Musical
12758	5951	Romance
12759	5952	Drama
12760	5952	Romance
12761	5953	Comedy
12762	5953	Drama
12763	5953	Romance
12764	5954	Drama
12765	5954	Romance
12766	5955	Adventure
12767	5955	Drama
12768	5956	Crime
12769	5956	Drama
12770	5957	Comedy
12771	5957	Drama
12772	5957	Romance
12773	5958	Action
12774	5958	Adventure
12775	5958	Romance
12776	5959	Drama
12777	5960	Comedy
12778	5960	Fantasy
12779	5960	Romance
12780	5961	Drama
12781	5961	War
12782	5962	Comedy
12783	5962	Drama
12784	5962	Romance
12785	5963	Mystery
12786	5963	Thriller
12787	5964	Crime
12788	5964	Drama
12789	5964	Thriller
12790	5965	Drama
12791	5965	Romance
12792	5966	Drama
12793	5967	Adventure
12794	5967	Drama
12795	5967	Romance
12796	5968	Drama
12797	5968	Film-Noir
12798	5969	Action
12799	5969	Adventure
12800	5969	Romance
12801	5970	Comedy
12802	5970	Romance
12803	5971	Drama
12804	5972	Comedy
12805	5972	Fantasy
12806	5972	Romance
12807	5973	Comedy
12808	5973	Musical
12809	5974	Comedy
12810	5975	Action
12811	5975	Adventure
12812	5975	Romance
12813	5975	War
12814	5976	Action
12815	5976	Comedy
12816	5976	Drama
12817	5976	Thriller
12818	5976	War
12819	5977	Comedy
12820	5977	Romance
12821	5977	Thriller
12822	5978	Drama
12823	5978	Romance
12824	5979	Action
12825	5979	War
12826	5980	Comedy
12827	5980	Fantasy
12828	5980	Romance
12829	5981	Comedy
12830	5981	Romance
12831	5982	Drama
12832	5983	Comedy
12833	5983	Musical
12834	5984	Drama
12835	5985	Crime
12836	5985	Drama
12837	5985	Film-Noir
12838	5985	Mystery
12839	5986	Drama
12840	5986	Film-Noir
12841	5986	Thriller
12842	5987	Comedy
12843	5987	Romance
12844	5988	Drama
12845	5988	Romance
12846	5989	Adventure
12847	5989	Drama
12848	5989	War
12849	5990	Crime
12850	5990	Film-Noir
12851	5990	Thriller
12852	5991	Horror
12853	5991	Thriller
12854	5992	Drama
12855	5992	War
12856	5993	Drama
12857	5994	Horror
12858	5995	Crime
12859	5995	Drama
12860	5995	Film-Noir
12861	5995	Mystery
12862	5995	Thriller
12863	5996	Drama
12864	5996	Film-Noir
12865	5996	Thriller
12866	5997	Drama
12867	5998	Drama
12868	5998	Romance
12869	5999	Drama
12870	5999	Film-Noir
12871	5999	Thriller
12872	6000	Drama
12873	6000	Film-Noir
12874	6001	Crime
12875	6001	Drama
12876	6001	Film-Noir
12877	6001	Thriller
12878	6002	Crime
12879	6002	Drama
12880	6002	Film-Noir
12881	6002	Thriller
12882	6003	Drama
12883	6004	Musical
12884	6004	Romance
12885	6005	Western
12886	6006	Drama
12887	6006	Film-Noir
12888	6006	Mystery
12889	6007	Drama
12890	6007	Romance
12891	6008	Crime
12892	6008	Drama
12893	6008	Film-Noir
12894	6008	Mystery
12895	6009	Crime
12896	6009	Film-Noir
12897	6009	Romance
12898	6010	Comedy
12899	6011	Comedy
12900	6011	Musical
12901	6012	Comedy
12902	6012	Drama
12903	6013	Drama
12904	6013	Fantasy
12905	6013	Romance
12906	6014	Action
12907	6014	Western
12908	6015	Action
12909	6015	Adventure
12910	6015	Romance
12911	6016	Crime
12912	6016	Drama
12913	6017	Drama
12914	6017	Romance
12915	6018	Drama
12916	6018	Film-Noir
12917	6019	Drama
12918	6020	Drama
12919	6020	Romance
12920	6021	Drama
12921	6022	Action
12922	6022	Adventure
12923	6022	Drama
12924	6023	Drama
12925	6023	Musical
12926	6024	Drama
12927	6024	Romance
12928	6025	Drama
12929	6026	Drama
12930	6027	Crime
12931	6027	Drama
12932	6027	Mystery
12933	6027	Thriller
12934	6028	Crime
12935	6028	Documentary
12936	6028	War
12937	6029	Action
12938	6029	Adventure
12939	6029	Drama
12940	6030	Drama
12941	6030	War
12942	6031	Musical
12943	6031	Romance
12944	6032	Action
12945	6032	Adventure
12946	6032	Drama
12947	6033	Crime
12948	6033	Drama
12949	6033	Musical
12950	6033	Romance
12951	6034	Drama
12952	6035	Comedy
12953	6035	Romance
12954	6036	Action
12955	6036	Adventure
12956	6037	Crime
12957	6037	Drama
12958	6038	Drama
12959	6039	Crime
12960	6039	Drama
12961	6040	Drama
12962	6041	Drama
12963	6042	Drama
12964	6042	Thriller
12965	6043	Drama
12966	6043	Romance
12967	6044	Drama
12968	6045	Drama
12969	6046	Children
12970	6046	Comedy
12971	6046	Musical
12972	6046	Romance
12973	6047	Adventure
12974	6047	Drama
12975	6047	Romance
12976	6048	Drama
12977	6049	Comedy
12978	6049	Drama
12979	6049	War
12980	6050	Comedy
12981	6050	Western
12982	6051	Comedy
12983	6051	Crime
12984	6051	Drama
12985	6051	Mystery
12986	6051	Thriller
12987	6052	Thriller
12988	6052	War
12989	6053	Drama
12990	6054	Drama
12991	6054	War
12992	6055	Comedy
12993	6055	Drama
12994	6056	Horror
12995	6056	Thriller
12996	6057	Drama
12997	6058	Drama
12998	6058	Horror
12999	6058	War
13000	6059	Sci-Fi
13001	6060	Comedy
13002	6060	Musical
13003	6060	Romance
13004	6061	Drama
13005	6061	War
13006	6062	Animation
13007	6062	Children
13008	6062	Comedy
13009	6063	Horror
13010	6063	Mystery
13011	6064	Comedy
13012	6065	Comedy
13013	6065	Drama
13014	6065	Romance
13015	6066	Action
13016	6066	Thriller
13017	6066	War
13018	6067	Drama
13019	6067	War
13020	6068	Crime
13021	6068	Drama
13022	6069	Action
13023	6069	Adventure
13024	6069	Comedy
13025	6070	Action
13026	6070	Adventure
13027	6070	Drama
13028	6070	War
13029	6071	Horror
13030	6072	Comedy
13031	6072	Drama
13032	6072	War
13033	6073	Action
13034	6073	Crime
13035	6073	Drama
13036	6074	Documentary
13037	6074	Musical
13038	6075	Action
13039	6075	Crime
13040	6075	Drama
13041	6076	Crime
13042	6076	Drama
13043	6077	Comedy
13044	6078	Action
13045	6078	Crime
13046	6078	Drama
13047	6078	Thriller
13048	6079	Crime
13049	6079	Drama
13050	6079	Thriller
13051	6080	Comedy
13052	6080	Drama
13053	6080	Romance
13054	6081	Drama
13055	6082	Action
13056	6082	Western
13057	6083	Drama
13058	6084	Children
13059	6084	Comedy
13060	6085	Comedy
13061	6085	Drama
13062	6086	Drama
13063	6087	Comedy
13064	6087	Drama
13065	6087	Romance
13066	6088	Crime
13067	6088	Drama
13068	6088	Mystery
13069	6089	Action
13070	6089	Crime
13071	6089	Drama
13072	6090	Drama
13073	6090	Fantasy
13074	6091	Comedy
13075	6091	Romance
13076	6092	Crime
13077	6092	Drama
13078	6092	Thriller
13079	6093	Drama
13080	6093	Romance
13081	6094	Drama
13082	6094	Thriller
13083	6094	War
13084	6095	Drama
13085	6096	Action
13086	6096	Mystery
13087	6096	Thriller
13088	6097	Drama
13089	6097	Romance
13090	6098	Drama
13091	6098	War
13092	6099	Western
13093	6100	Comedy
13094	6100	Western
13095	6101	Drama
13096	6101	War
13097	6102	Comedy
13098	6102	Romance
13099	6102	Western
13100	6103	Fantasy
13101	6103	Western
13102	6104	Drama
13103	6105	Adventure
13104	6105	Comedy
13105	6105	Horror
13106	6105	Romance
13107	6106	Comedy
13108	6106	Mystery
13109	6107	Action
13110	6107	Crime
13111	6108	Drama
13112	6108	Musical
13113	6109	Comedy
13114	6109	Crime
13115	6109	Thriller
13116	6110	Crime
13117	6110	Drama
13118	6110	Thriller
13119	6111	Comedy
13120	6111	Sci-Fi
13121	6111	Thriller
13122	6112	Crime
13123	6112	Drama
13124	6113	Comedy
13125	6113	Western
13126	6114	Drama
13127	6115	Drama
13128	6116	Horror
13129	6116	Thriller
13130	6117	Comedy
13131	6117	Horror
13132	6117	Mystery
13133	6118	Action
13134	6118	Crime
13135	6118	Drama
13136	6118	Thriller
13137	6119	Drama
13138	6120	Comedy
13139	6120	Drama
13140	6121	Comedy
13141	6121	Horror
13142	6121	Thriller
13143	6122	Drama
13144	6122	Romance
13145	6123	Comedy
13146	6123	Drama
13147	6124	Comedy
13148	6125	Comedy
13149	6125	Drama
13150	6126	Documentary
13151	6126	War
13152	6127	Drama
13153	6128	Crime
13154	6128	Drama
13155	6128	Romance
13156	6129	Comedy
13157	6129	Romance
13158	6130	Crime
13159	6130	Mystery
13160	6130	Thriller
13161	6131	Action
13162	6131	Crime
13163	6131	Drama
13164	6131	Thriller
13165	6132	Drama
13166	6132	Romance
13167	6133	Drama
13168	6134	Comedy
13169	6134	Drama
13170	6134	Romance
13171	6135	Crime
13172	6135	Thriller
13173	6136	Drama
13174	6137	Drama
13175	6137	War
13176	6138	Comedy
13177	6138	Drama
13178	6139	Sci-Fi
13179	6139	Thriller
13180	6140	Documentary
13181	6141	Drama
13182	6141	Western
13183	6142	Action
13184	6142	Comedy
13185	6142	Crime
13186	6143	Horror
13187	6143	Sci-Fi
13188	6143	Thriller
13189	6144	Comedy
13190	6144	Thriller
13191	6145	Comedy
13192	6145	Drama
13193	6145	Romance
13194	6146	Drama
13195	6146	Musical
13196	6146	Romance
13197	6147	Action
13198	6147	Thriller
13199	6148	Drama
13200	6148	Romance
13201	6149	Action
13202	6150	Documentary
13203	6151	Animation
13204	6151	Children
13205	6151	Fantasy
13206	6152	Horror
13207	6152	Sci-Fi
13208	6153	Comedy
13209	6153	Drama
13210	6154	Documentary
13211	6155	Comedy
13212	6155	Drama
13213	6155	Musical
13214	6156	Action
13215	6156	Comedy
13216	6157	Comedy
13217	6157	Romance
13218	6158	Adventure
13219	6158	Comedy
13220	6158	Sci-Fi
13221	6159	Drama
13222	6159	Mystery
13223	6160	Crime
13224	6160	Drama
13225	6160	Thriller
13226	6161	Action
13227	6161	Crime
13228	6161	Drama
13229	6162	Drama
13230	6162	Sci-Fi
13231	6163	Comedy
13232	6164	Comedy
13233	6164	Documentary
13234	6165	Adventure
13235	6165	Drama
13236	6166	Drama
13237	6166	War
13238	6167	Adventure
13239	6167	Comedy
13240	6167	Musical
13241	6167	Romance
13242	6168	Drama
13243	6169	Drama
13244	6170	Drama
13245	6170	Romance
13246	6170	Sci-Fi
13247	6171	Comedy
13248	6171	Romance
13249	6171	War
13250	6172	Fantasy
13251	6172	Horror
13252	6172	Sci-Fi
13253	6172	Thriller
13254	6173	Drama
13255	6173	Mystery
13256	6173	Thriller
13257	6174	Drama
13258	6175	Action
13259	6175	Adventure
13260	6175	Comedy
13261	6176	Drama
13262	6176	Romance
13263	6177	Comedy
13264	6177	Romance
13265	6178	Comedy
13266	6179	Crime
13267	6179	Drama
13268	6179	Thriller
13269	6180	Action
13270	6180	Adventure
13271	6180	Comedy
13272	6180	Sci-Fi
13273	6181	Documentary
13274	6182	Children
13275	6182	Drama
13276	6183	Comedy
13277	6183	Drama
13278	6183	Romance
13279	6184	Action
13280	6184	Comedy
13281	6184	Crime
13282	6184	Thriller
13283	6185	Drama
13284	6186	Comedy
13285	6187	Comedy
13286	6187	Horror
13287	6187	Mystery
13288	6187	Sci-Fi
13289	6188	Drama
13290	6189	Drama
13291	6189	Musical
13292	6190	Adventure
13293	6190	Animation
13294	6190	Children
13295	6190	Comedy
13296	6191	Comedy
13297	6191	Drama
13298	6192	Comedy
13299	6193	Action
13300	6193	Drama
13301	6193	Sci-Fi
13302	6194	Crime
13303	6194	Drama
13304	6194	Thriller
13305	6195	Crime
13306	6195	Drama
13307	6195	Romance
13308	6196	Fantasy
13309	6196	Horror
13310	6196	Sci-Fi
13311	6196	Thriller
13312	6197	Action
13313	6197	Fantasy
13314	6197	Horror
13315	6197	Romance
13316	6198	Crime
13317	6198	Drama
13318	6199	Crime
13319	6199	Drama
13320	6199	Thriller
13321	6200	Action
13322	6200	Adventure
13323	6200	Drama
13324	6200	Mystery
13325	6200	Thriller
13326	6201	Drama
13327	6202	Comedy
13328	6202	Horror
13329	6202	Sci-Fi
13330	6203	Musical
13331	6204	Drama
13332	6205	Drama
13333	6206	Adventure
13334	6206	Drama
13335	6206	Western
13336	6207	Adventure
13337	6207	Animation
13338	6207	Children
13339	6207	Drama
13340	6207	Fantasy
13341	6208	Crime
13342	6208	Romance
13343	6208	Thriller
13344	6209	Comedy
13345	6209	Musical
13346	6209	Romance
13347	6210	Action
13348	6210	Drama
13349	6210	War
13350	6211	Comedy
13351	6211	Horror
13352	6212	Comedy
13353	6212	Fantasy
13354	6213	Action
13355	6213	Crime
13356	6213	Drama
13357	6214	Drama
13358	6215	Comedy
13359	6215	Drama
13360	6216	Drama
13361	6216	Fantasy
13362	6216	Horror
13363	6216	Mystery
13364	6216	Thriller
13365	6217	Drama
13366	6218	Drama
13367	6219	Crime
13368	6219	Thriller
13369	6220	Comedy
13370	6220	Crime
13371	6221	Action
13372	6221	Animation
13373	6221	Crime
13374	6221	Drama
13375	6221	Film-Noir
13376	6221	Mystery
13377	6221	Sci-Fi
13378	6221	Thriller
13379	6222	Comedy
13380	6222	Drama
13381	6223	Crime
13382	6223	Drama
13383	6223	Thriller
13384	6224	Documentary
13385	6225	Drama
13386	6225	Romance
13387	6226	Drama
13388	6226	Horror
13389	6227	Comedy
13390	6228	Drama
13391	6229	Documentary
13392	6230	Crime
13393	6230	Drama
13394	6230	Thriller
13395	6231	Thriller
13396	6232	Crime
13397	6232	Drama
13398	6233	Drama
13399	6234	Comedy
13400	6234	Drama
13401	6234	Romance
13402	6235	Action
13403	6235	Crime
13404	6235	Drama
13405	6235	Thriller
13406	6236	Drama
13407	6236	Fantasy
13408	6237	Adventure
13409	6237	Drama
13410	6237	Western
13411	6238	Comedy
13412	6238	Drama
13413	6239	Action
13414	6239	Crime
13415	6240	Drama
13416	6240	Romance
13417	6241	Comedy
13418	6241	Horror
13419	6242	Adventure
13420	6242	Animation
13421	6242	Comedy
13422	6242	Fantasy
13423	6242	Romance
13424	6243	Drama
13425	6243	Musical
13426	6244	Crime
13427	6244	Drama
13428	6245	Comedy
13429	6245	Drama
13430	6246	Drama
13431	6246	Romance
13432	6246	Thriller
13433	6246	War
13434	6247	Drama
13435	6247	Romance
13436	6248	Drama
13437	6249	Drama
13438	6250	Action
13439	6250	Sci-Fi
13440	6251	Comedy
13441	6251	Drama
13442	6252	Action
13443	6252	Comedy
13444	6252	Crime
13445	6252	Drama
13446	6253	Comedy
13447	6254	Comedy
13448	6254	Romance
13449	6255	Action
13450	6255	Crime
13451	6255	Horror
13452	6256	Action
13453	6256	Drama
13454	6257	Comedy
13455	6258	Crime
13456	6258	Film-Noir
13457	6258	Mystery
13458	6258	Thriller
13459	6259	Adventure
13460	6259	Western
13461	6260	Animation
13462	6260	Drama
13463	6260	Romance
13464	6261	Action
13465	6261	Animation
13466	6262	Comedy
13467	6262	Horror
13468	6262	Musical
13469	6262	Western
13470	6263	Comedy
13471	6263	Drama
13472	6263	Romance
13473	6264	Comedy
13474	6265	Comedy
13475	6265	Fantasy
13476	6265	Horror
13477	6266	Crime
13478	6266	Thriller
13479	6267	Adventure
13480	6267	Drama
13481	6268	Drama
13482	6268	Thriller
13483	6269	Fantasy
13484	6269	Horror
13485	6270	Drama
13486	6271	Drama
13487	6272	Action
13488	6272	Documentary
13489	6272	Drama
13490	6272	Thriller
13491	6273	Crime
13492	6273	Drama
13493	6273	Mystery
13494	6273	Thriller
13495	6274	Drama
13496	6275	Drama
13497	6275	Romance
13498	6276	Action
13499	6276	Adventure
13500	6276	Comedy
13501	6276	Sci-Fi
13502	6276	Thriller
13503	6277	Drama
13504	6277	Horror
13505	6277	Mystery
13506	6278	Crime
13507	6278	Drama
13508	6279	Comedy
13509	6279	Drama
13510	6280	Action
13511	6280	Crime
13512	6280	Thriller
13513	6281	Action
13514	6281	Animation
13515	6281	Children
13516	6281	Crime
13517	6282	Comedy
13518	6282	War
13519	6283	Comedy
13520	6283	Crime
13521	6283	Thriller
13522	6284	Children
13523	6284	Comedy
13524	6284	Fantasy
13525	6285	Drama
13526	6285	Musical
13527	6286	Action
13528	6286	Crime
13529	6286	Drama
13530	6286	Thriller
13531	6287	Action
13532	6287	Thriller
13533	6288	Comedy
13534	6288	Crime
13535	6289	Action
13536	6289	Adventure
13537	6289	Animation
13538	6289	Children
13539	6289	Fantasy
13540	6289	Sci-Fi
13541	6290	Action
13542	6290	Animation
13543	6290	Drama
13544	6290	Fantasy
13545	6290	Sci-Fi
13546	6291	Comedy
13547	6291	Drama
13548	6291	Romance
13549	6292	Horror
13550	6292	Thriller
13551	6293	Action
13552	6293	Comedy
13553	6294	Crime
13554	6294	Thriller
13555	6295	Comedy
13556	6295	Drama
13557	6296	Documentary
13558	6297	Adventure
13559	6297	Comedy
13560	6297	Fantasy
13561	6298	Drama
13562	6298	Fantasy
13563	6298	Romance
13564	6298	Sci-Fi
13565	6299	Drama
13566	6299	Romance
13567	6300	Action
13568	6300	Animation
13569	6300	Crime
13570	6300	Sci-Fi
13571	6300	Thriller
13572	6301	Drama
13573	6301	Horror
13574	6301	Mystery
13575	6301	Romance
13576	6301	Thriller
13577	6302	Horror
13578	6302	Sci-Fi
13579	6302	Thriller
13580	6303	Action
13581	6303	Comedy
13582	6303	Crime
13583	6303	Fantasy
13584	6303	Thriller
13585	6304	Drama
13586	6304	Horror
13587	6304	Mystery
13588	6304	Thriller
13589	6305	Drama
13590	6305	Romance
13591	6306	Comedy
13592	6306	Romance
13593	6307	Horror
13594	6308	Drama
13595	6309	Adventure
13596	6309	Comedy
13597	6309	Fantasy
13598	6310	Drama
13599	6311	Action
13600	6311	Drama
13601	6311	Thriller
13602	6312	Comedy
13603	6313	Crime
13604	6313	Drama
13605	6313	Mystery
13606	6313	Thriller
13607	6313	War
13608	6314	Fantasy
13609	6314	Horror
13610	6314	Mystery
13611	6314	Thriller
13612	6315	Drama
13613	6315	Thriller
13614	6316	Comedy
13615	6316	Drama
13616	6316	Romance
13617	6317	Drama
13618	6318	Horror
13619	6318	Mystery
13620	6319	Action
13621	6319	Animation
13622	6319	Horror
13623	6320	Adventure
13624	6320	Western
13625	6321	Documentary
13626	6321	IMAX
13627	6322	Comedy
13628	6322	Crime
13629	6322	Horror
13630	6322	Mystery
13631	6322	Thriller
13632	6323	Action
13633	6324	Comedy
13634	6325	Horror
13635	6325	Mystery
13636	6325	Sci-Fi
13637	6326	Action
13638	6326	Comedy
13639	6326	Crime
13640	6327	Horror
13641	6327	Mystery
13642	6327	Thriller
13643	6328	Action
13644	6328	Drama
13645	6328	War
13646	6329	Drama
13647	6329	Romance
13648	6330	Comedy
13649	6330	Romance
13650	6331	Horror
13651	6331	Mystery
13652	6331	Thriller
13653	6332	Adventure
13654	6332	Drama
13655	6333	Comedy
13656	6333	Fantasy
13657	6333	Mystery
13658	6333	Sci-Fi
13659	6334	Comedy
13660	6335	Comedy
13661	6335	Horror
13662	6335	Musical
13663	6336	Comedy
13664	6336	Drama
13665	6336	Romance
13666	6337	Comedy
13667	6337	Horror
13668	6337	Mystery
13669	6337	Thriller
13670	6338	Crime
13671	6338	Drama
13672	6339	Action
13673	6339	Adventure
13674	6339	Animation
13675	6339	Fantasy
13676	6339	Sci-Fi
13677	6340	Drama
13678	6340	Sci-Fi
13679	6340	War
13680	6341	Action
13681	6341	Adventure
13682	6341	Drama
13683	6341	Sci-Fi
13684	6341	Thriller
13685	6342	Drama
13686	6342	Romance
13687	6342	War
13688	6343	Action
13689	6343	Crime
13690	6343	Drama
13691	6344	Comedy
13692	6344	Drama
13693	6344	Romance
13694	6345	Comedy
13695	6345	Drama
13696	6346	Action
13697	6346	Animation
13698	6346	Drama
13699	6346	Sci-Fi
13700	6347	Drama
13701	6348	Horror
13702	6349	Comedy
13703	6349	Crime
13704	6349	Drama
13705	6349	Mystery
13706	6349	Thriller
13707	6350	Comedy
13708	6351	Action
13709	6351	Crime
13710	6351	Thriller
13711	6352	Action
13712	6352	Comedy
13713	6352	Drama
13714	6352	War
13715	6353	Drama
13716	6354	Action
13717	6354	Drama
13718	6354	Thriller
13719	6354	War
13720	6355	Action
13721	6355	Drama
13722	6355	Thriller
13723	6356	Adventure
13724	6356	Children
13725	6356	Comedy
13726	6356	Fantasy
13727	6357	Romance
13728	6358	Drama
13729	6358	Mystery
13730	6358	Romance
13731	6358	War
13732	6359	Drama
13733	6359	Romance
13734	6360	Drama
13735	6360	Romance
13736	6361	Action
13737	6361	Animation
13738	6361	Drama
13739	6361	Sci-Fi
13740	6361	Thriller
13741	6362	Adventure
13742	6362	Animation
13743	6362	Children
13744	6362	Fantasy
13745	6363	Drama
13746	6363	Romance
13747	6364	Horror
13748	6364	Thriller
13749	6365	Drama
13750	6366	Comedy
13751	6367	Drama
13752	6367	Mystery
13753	6367	Thriller
13754	6368	Drama
13755	6369	Horror
13756	6370	Mystery
13757	6370	Thriller
13758	6371	Drama
13759	6372	Horror
13760	6372	Mystery
13761	6373	Drama
13762	6373	Mystery
13763	6373	Sci-Fi
13764	6373	Thriller
13765	6374	Children
13766	6374	Comedy
13767	6374	Crime
13768	6374	Drama
13769	6374	Fantasy
13770	6375	Comedy
13771	6375	Drama
13772	6375	Fantasy
13773	6375	Musical
13774	6375	Romance
13775	6376	Action
13776	6376	Horror
13777	6376	Sci-Fi
13778	6376	War
13779	6377	Adventure
13780	6377	Animation
13781	6377	Fantasy
13782	6377	Musical
13783	6377	Sci-Fi
13784	6378	Action
13785	6378	Thriller
13786	6379	Action
13787	6379	Crime
13788	6379	Drama
13789	6379	Thriller
13790	6380	Drama
13791	6381	Comedy
13792	6381	Drama
13793	6381	Romance
13794	6382	Comedy
13795	6382	Drama
13796	6383	Drama
13797	6384	Action
13798	6384	Adventure
13799	6384	Drama
13800	6384	War
13801	6385	Documentary
13802	6385	Drama
13803	6386	Drama
13804	6386	Thriller
13805	6387	Drama
13806	6387	Thriller
13807	6388	Action
13808	6388	Crime
13809	6388	Drama
13810	6388	Thriller
13811	6389	Drama
13812	6390	Crime
13813	6390	Drama
13814	6390	Thriller
13815	6391	Comedy
13816	6391	Drama
13817	6391	Mystery
13818	6391	Thriller
13819	6392	Drama
13820	6393	Action
13821	6393	Adventure
13822	6394	Drama
13823	6394	Thriller
13824	6395	Drama
13825	6395	Horror
13826	6395	Mystery
13827	6395	Thriller
13828	6396	Documentary
13829	6397	Drama
13830	6398	Documentary
13831	6399	Action
13832	6399	Adventure
13833	6399	Drama
13834	6399	Thriller
13835	6400	Action
13836	6400	Drama
13837	6400	War
13838	6401	Drama
13839	6402	Documentary
13840	6403	Documentary
13841	6404	Documentary
13842	6405	Documentary
13843	6406	Drama
13844	6407	Comedy
13845	6407	Documentary
13846	6407	Drama
13847	6408	Animation
13848	6408	Drama
13849	6408	Mystery
13850	6408	Sci-Fi
13851	6408	Thriller
13852	6409	Action
13853	6409	Drama
13854	6409	Fantasy
13855	6409	Sci-Fi
13856	6410	Documentary
13857	6411	Drama
13858	6412	Crime
13859	6412	Drama
13860	6412	Film-Noir
13861	6413	Drama
13862	6413	War
13863	6414	Horror
13864	6415	Adventure
13865	6415	Children
13866	6415	Comedy
13867	6415	Fantasy
13868	6415	IMAX
13869	6416	Drama
13870	6416	Romance
13871	6417	Adventure
13872	6417	Comedy
13873	6417	Fantasy
13874	6418	Drama
13875	6419	Drama
13876	6419	Musical
13877	6419	Romance
13878	6420	Drama
13879	6420	Musical
13880	6421	Drama
13881	6422	Comedy
13882	6422	Drama
13883	6423	Comedy
13884	6424	Crime
13885	6424	Drama
13886	6424	Thriller
13887	6425	Drama
13888	6426	Drama
13889	6427	Action
13890	6427	Adventure
13891	6427	Drama
13892	6428	Drama
13893	6428	Horror
13894	6428	Mystery
13895	6428	Sci-Fi
13896	6428	Thriller
13897	6429	Comedy
13898	6429	Drama
13899	6429	Romance
13900	6430	Documentary
13901	6430	Musical
13902	6431	Drama
13903	6431	Western
13904	6432	Comedy
13905	6433	Drama
13906	6433	Horror
13907	6433	Musical
13908	6434	Children
13909	6434	Drama
13910	6435	Drama
13911	6436	Drama
13912	6436	Romance
13913	6437	Drama
13914	6437	War
13915	6438	Comedy
13916	6438	Romance
13917	6439	Crime
13918	6439	Drama
13919	6440	Action
13920	6440	Crime
13921	6440	Drama
13922	6441	Drama
13923	6442	Drama
13924	6442	War
13925	6443	Drama
13926	6444	Comedy
13927	6444	Drama
13928	6445	Crime
13929	6445	Drama
13930	6445	Mystery
13931	6445	Thriller
13932	6446	Action
13933	6446	Animation
13934	6446	Fantasy
13935	6446	Sci-Fi
13936	6447	Animation
13937	6447	Children
13938	6447	Musical
13939	6448	Action
13940	6448	Adventure
13941	6448	Crime
13942	6448	Drama
13943	6449	Drama
13944	6450	Drama
13945	6450	Sci-Fi
13946	6451	Action
13947	6451	Thriller
13948	6452	Drama
13949	6453	Drama
13950	6453	Horror
13951	6453	Sci-Fi
13952	6454	Comedy
13953	6454	Musical
13954	6455	Crime
13955	6455	Drama
13956	6456	Drama
13957	6457	Comedy
13958	6457	Romance
13959	6458	Comedy
13960	6458	Fantasy
13961	6458	Romance
13962	6459	Crime
13963	6459	Drama
13964	6459	Mystery
13965	6459	Thriller
13966	6460	Action
13967	6460	Adventure
13968	6460	Comedy
13969	6460	Crime
13970	6460	Romance
13971	6460	Thriller
13972	6461	Comedy
13973	6461	Drama
13974	6461	Romance
13975	6462	Drama
13976	6462	War
13977	6463	Action
13978	6463	Crime
13979	6463	Drama
13980	6463	Thriller
13981	6464	Children
13982	6464	Comedy
13983	6465	Action
13984	6465	Horror
13985	6465	Sci-Fi
13986	6465	Thriller
13987	6466	Horror
13988	6466	Mystery
13989	6466	Thriller
13990	6467	Documentary
13991	6467	IMAX
13992	6468	Drama
13993	6468	Horror
13994	6468	Mystery
13995	6468	Thriller
13996	6469	Comedy
13997	6469	Romance
13998	6470	Drama
13999	6471	Comedy
14000	6471	Drama
14001	6472	Adventure
14002	6472	Children
14003	6472	Fantasy
14004	6473	Action
14005	6473	Drama
14006	6474	Western
14007	6475	Drama
14008	6475	Horror
14009	6475	Mystery
14010	6475	Thriller
14011	6476	Action
14012	6476	Adventure
14013	6476	Drama
14014	6476	War
14015	6477	Crime
14016	6477	Film-Noir
14017	6478	Action
14018	6478	Adventure
14019	6478	Sci-Fi
14020	6479	Drama
14021	6479	War
14022	6480	Crime
14023	6480	Drama
14024	6480	Romance
14025	6481	Crime
14026	6481	Drama
14027	6481	Thriller
14028	6482	Action
14029	6482	Adventure
14030	6482	Drama
14031	6482	Romance
14032	6482	War
14033	6483	Drama
14034	6483	Horror
14035	6483	Mystery
14036	6483	Thriller
14037	6483	War
14038	6484	Action
14039	6484	Adventure
14040	6484	Drama
14041	6485	Adventure
14042	6485	Animation
14043	6485	Fantasy
14044	6485	Romance
14045	6486	Action
14046	6486	Animation
14047	6486	Drama
14048	6486	Sci-Fi
14049	6487	Action
14050	6487	Drama
14051	6488	Comedy
14052	6488	Romance
14053	6489	Documentary
14054	6490	Comedy
14055	6490	Musical
14056	6490	Romance
14057	6491	Action
14058	6491	Fantasy
14059	6491	Horror
14060	6491	Thriller
14061	6492	Adventure
14062	6492	Children
14063	6492	Comedy
14064	6492	Fantasy
14065	6493	Children
14066	6493	Comedy
14067	6493	Drama
14068	6494	Drama
14069	6494	War
14070	6495	Comedy
14071	6496	Comedy
14072	6496	Romance
14073	6497	Film-Noir
14074	6497	Thriller
14075	6498	Drama
14076	6499	Action
14077	6499	Fantasy
14078	6499	Horror
14079	6499	Mystery
14080	6499	Sci-Fi
14081	6499	Thriller
14082	6500	Comedy
14083	6501	Drama
14084	6501	Romance
14085	6502	Action
14086	6502	Comedy
14087	6503	Action
14088	6503	Comedy
14089	6504	Action
14090	6504	Comedy
14091	6504	Mystery
14092	6504	Thriller
14093	6505	Drama
14094	6505	Romance
14095	6506	Adventure
14096	6506	Comedy
14097	6506	Crime
14098	6506	Drama
14099	6506	Mystery
14100	6506	Thriller
14101	6507	Action
14102	6507	Adventure
14103	6507	Comedy
14104	6508	Drama
14105	6509	Crime
14106	6509	Film-Noir
14107	6509	Mystery
14108	6509	Romance
14109	6510	Adventure
14110	6510	War
14111	6511	Fantasy
14112	6511	Horror
14113	6511	Mystery
14114	6512	Comedy
14115	6512	Crime
14116	6512	Drama
14117	6512	Mystery
14118	6513	Drama
14119	6513	War
14120	6514	Crime
14121	6514	Drama
14122	6515	Horror
14123	6515	Thriller
14124	6516	Comedy
14125	6517	Action
14126	6517	Comedy
14127	6518	Comedy
14128	6518	Crime
14129	6518	Musical
14130	6519	Documentary
14131	6519	War
14132	6520	Drama
14133	6520	Thriller
14134	6521	Action
14135	6521	Crime
14136	6521	Drama
14137	6521	Thriller
14138	6522	Adventure
14139	6522	Animation
14140	6522	Children
14141	6522	Comedy
14142	6522	Fantasy
14143	6522	Sci-Fi
14144	6522	IMAX
14145	6523	Drama
14146	6524	Comedy
14147	6525	Western
14148	6526	Comedy
14149	6527	Adventure
14150	6527	Animation
14151	6527	Children
14152	6527	Fantasy
14153	6528	Comedy
14154	6529	Action
14155	6529	Drama
14156	6529	War
14157	6530	Crime
14158	6530	Drama
14159	6530	Thriller
14160	6531	Action
14161	6531	Crime
14162	6531	Drama
14163	6531	Thriller
14164	6532	Action
14165	6532	Crime
14166	6532	Drama
14167	6532	Thriller
14168	6533	Horror
14169	6533	Mystery
14170	6533	Sci-Fi
14171	6533	Thriller
14172	6534	Drama
14173	6535	Drama
14174	6535	War
14175	6536	Action
14176	6536	Comedy
14177	6536	Crime
14178	6536	Thriller
14179	6537	Comedy
14180	6537	Musical
14181	6537	Romance
14182	6538	Children
14183	6538	Comedy
14184	6538	Drama
14185	6539	Comedy
14186	6539	Drama
14187	6540	Adventure
14188	6540	Comedy
14189	6540	Crime
14190	6541	Action
14191	6541	Comedy
14192	6542	Documentary
14193	6543	Drama
14194	6543	Romance
14195	6544	Drama
14196	6545	Drama
14197	6545	Film-Noir
14198	6546	Crime
14199	6546	Drama
14200	6546	Film-Noir
14201	6546	Thriller
14202	6547	Crime
14203	6547	Drama
14204	6547	Film-Noir
14205	6548	Action
14206	6548	Drama
14207	6549	Animation
14208	6549	Comedy
14209	6549	Drama
14210	6549	Fantasy
14211	6550	Action
14212	6550	Comedy
14213	6550	Crime
14214	6550	Drama
14215	6551	Drama
14216	6552	Comedy
14217	6552	Crime
14218	6552	Drama
14219	6553	Drama
14220	6554	Comedy
14221	6554	Romance
14222	6555	Drama
14223	6556	Action
14224	6556	Adventure
14225	6557	Action
14226	6557	Adventure
14227	6557	Fantasy
14228	6557	Horror
14229	6558	Action
14230	6558	Comedy
14231	6559	Animation
14232	6559	Fantasy
14233	6559	Sci-Fi
14234	6559	Thriller
14235	6560	Comedy
14236	6560	Drama
14237	6561	Documentary
14238	6562	Drama
14239	6563	Action
14240	6563	Crime
14241	6563	Film-Noir
14242	6563	Mystery
14243	6563	Thriller
14244	6564	Comedy
14245	6565	Action
14246	6565	Adventure
14247	6565	Comedy
14248	6566	Comedy
14249	6566	Romance
14250	6567	Drama
14251	6568	Comedy
14252	6569	Action
14253	6569	Crime
14254	6570	Documentary
14255	6570	Musical
14256	6571	Drama
14257	6571	War
14258	6572	Animation
14259	6572	Drama
14260	6573	Drama
14261	6573	Thriller
14262	6574	Drama
14263	6574	Thriller
14264	6575	Action
14265	6575	Drama
14266	6575	War
14267	6576	Drama
14268	6576	Mystery
14269	6576	Thriller
14270	6577	Comedy
14271	6578	Drama
14272	6579	Comedy
14273	6579	Crime
14274	6579	Thriller
14275	6580	Adventure
14276	6580	Comedy
14277	6580	Sci-Fi
14278	6581	Drama
14279	6581	Romance
14280	6581	War
14281	6582	Documentary
14282	6583	Documentary
14283	6583	War
14284	6584	Comedy
14285	6584	Romance
14286	6585	Comedy
14287	6586	Comedy
14288	6586	Musical
14289	6587	Drama
14290	6587	War
14291	6588	Action
14292	6588	Adventure
14293	6588	Fantasy
14294	6588	Sci-Fi
14295	6589	Comedy
14296	6589	Drama
14297	6590	Drama
14298	6591	Crime
14299	6591	Drama
14300	6592	Drama
14301	6593	Adventure
14302	6593	Comedy
14303	6593	Sci-Fi
14304	6594	Action
14305	6594	Adventure
14306	6594	Drama
14307	6594	Thriller
14308	6595	Horror
14309	6595	Thriller
14310	6596	Animation
14311	6596	Comedy
14312	6596	Sci-Fi
14313	6597	Drama
14314	6597	Film-Noir
14315	6597	Thriller
14316	6598	Comedy
14317	6598	Western
14318	6599	Drama
14319	6600	Adventure
14320	6600	Comedy
14321	6600	Drama
14322	6601	Comedy
14323	6601	Drama
14324	6601	Romance
14325	6602	Documentary
14326	6603	Action
14327	6603	Crime
14328	6603	Thriller
14329	6604	Action
14330	6604	Drama
14331	6604	Romance
14332	6604	War
14333	6605	Horror
14334	6605	Thriller
14335	6606	Crime
14336	6606	Drama
14337	6607	Drama
14338	6607	Mystery
14339	6608	Drama
14340	6609	Drama
14341	6609	Musical
14342	6609	Romance
14343	6610	Comedy
14344	6610	Drama
14345	6610	Fantasy
14346	6611	Comedy
14347	6611	Drama
14348	6612	Drama
14349	6613	Comedy
14350	6613	Musical
14351	6614	Drama
14352	6615	Comedy
14353	6615	Drama
14354	6616	Action
14355	6616	Crime
14356	6616	Drama
14357	6616	Thriller
14358	6617	Comedy
14359	6617	Drama
14360	6618	Adventure
14361	6618	Animation
14362	6618	Children
14363	6618	Comedy
14364	6618	Fantasy
14365	6619	Drama
14366	6620	Action
14367	6620	Adventure
14368	6620	Sci-Fi
14369	6621	Comedy
14370	6622	Comedy
14371	6622	Romance
14372	6623	Comedy
14373	6624	Comedy
14374	6624	Musical
14375	6624	Romance
14376	6625	Drama
14377	6625	Romance
14378	6626	Drama
14379	6627	Adventure
14380	6627	Animation
14381	6627	Children
14382	6627	Comedy
14383	6628	Adventure
14384	6628	Comedy
14385	6629	Children
14386	6629	Documentary
14387	6630	Horror
14388	6630	Thriller
14389	6631	Comedy
14390	6631	Drama
14391	6632	Drama
14392	6632	Romance
14393	6633	Adventure
14394	6633	Comedy
14395	6633	Drama
14396	6634	Action
14397	6634	Comedy
14398	6634	Drama
14399	6635	Action
14400	6635	Adventure
14401	6635	Comedy
14402	6635	Romance
14403	6636	Action
14404	6636	Adventure
14405	6636	Children
14406	6636	Fantasy
14407	6637	Horror
14408	6637	Thriller
14409	6638	Comedy
14410	6638	Drama
14411	6638	Romance
14412	6639	Comedy
14413	6639	Drama
14414	6639	Musical
14415	6640	Comedy
14416	6641	Drama
14417	6641	Romance
14418	6642	Action
14419	6642	Crime
14420	6642	IMAX
14421	6643	Comedy
14422	6643	Drama
14423	6643	Romance
14424	6644	Drama
14425	6644	Romance
14426	6645	Drama
14427	6646	Drama
14428	6647	Adventure
14429	6647	Comedy
14430	6647	Romance
14431	6648	Drama
14432	6649	Action
14433	6649	Horror
14434	6649	Thriller
14435	6650	Comedy
14436	6650	Fantasy
14437	6650	Romance
14438	6651	Documentary
14439	6652	Comedy
14440	6652	Drama
14441	6653	Horror
14442	6654	Comedy
14443	6654	Crime
14444	6654	Drama
14445	6654	Romance
14446	6655	Action
14447	6655	Crime
14448	6655	Drama
14449	6656	Comedy
14450	6656	Drama
14451	6656	Romance
14452	6657	Crime
14453	6657	Drama
14454	6657	Film-Noir
14455	6658	Adventure
14456	6658	Comedy
14457	6658	Sci-Fi
14458	6659	Thriller
14459	6660	Comedy
14460	6661	Comedy
14461	6661	Musical
14462	6662	Musical
14463	6663	Action
14464	6663	Adventure
14465	6663	Sci-Fi
14466	6663	Thriller
14467	6664	Drama
14468	6664	Romance
14469	6665	Comedy
14470	6665	Crime
14471	6666	Drama
14472	6666	Thriller
14473	6667	Documentary
14474	6668	Documentary
14475	6669	Drama
14476	6669	Horror
14477	6669	Thriller
14478	6670	Drama
14479	6671	Action
14480	6671	Adventure
14481	6671	Sci-Fi
14482	6672	Documentary
14483	6673	Comedy
14484	6673	Romance
14485	6674	Comedy
14486	6674	Drama
14487	6675	Drama
14488	6675	Film-Noir
14489	6676	Comedy
14490	6676	Romance
14491	6677	Crime
14492	6677	Drama
14493	6678	Drama
14494	6678	Film-Noir
14495	6678	War
14496	6679	Action
14497	6679	Sci-Fi
14498	6679	Thriller
14499	6680	Children
14500	6680	Comedy
14501	6681	Action
14502	6681	Crime
14503	6681	Horror
14504	6682	Drama
14505	6683	Drama
14506	6683	Mystery
14507	6684	Action
14508	6684	Adventure
14509	6684	Children
14510	6684	Comedy
14511	6685	Action
14512	6685	Adventure
14513	6685	Sci-Fi
14514	6685	Thriller
14515	6686	Comedy
14516	6686	Romance
14517	6687	Comedy
14518	6687	Documentary
14519	6688	Comedy
14520	6689	Horror
14521	6689	Mystery
14522	6689	Thriller
14523	6690	Action
14524	6690	Adventure
14525	6690	Drama
14526	6690	Thriller
14527	6691	Action
14528	6691	Adventure
14529	6691	Sci-Fi
14530	6692	Comedy
14531	6692	Drama
14532	6693	Drama
14533	6694	Action
14534	6694	Adventure
14535	6694	Comedy
14536	6695	Comedy
14537	6695	Drama
14538	6696	Comedy
14539	6696	Drama
14540	6697	Comedy
14541	6698	Drama
14542	6698	Horror
14543	6698	Mystery
14544	6698	Thriller
14545	6699	Action
14546	6699	Crime
14547	6699	Drama
14548	6700	Action
14549	6700	Drama
14550	6700	War
14551	6701	Romance
14552	6701	Thriller
14553	6702	Comedy
14554	6702	Drama
14555	6703	Documentary
14556	6704	Drama
14557	6704	Romance
14558	6705	Drama
14559	6705	Romance
14560	6706	Children
14561	6706	Comedy
14562	6706	Musical
14563	6707	Horror
14564	6708	Crime
14565	6708	Drama
14566	6709	Comedy
14567	6709	Documentary
14568	6709	Romance
14569	6710	Action
14570	6710	Crime
14571	6710	Drama
14572	6710	Thriller
14573	6711	Adventure
14574	6711	Drama
14575	6712	Animation
14576	6712	Drama
14577	6713	Comedy
14578	6713	Musical
14579	6714	Comedy
14580	6714	Romance
14581	6715	Adventure
14582	6715	Romance
14583	6716	Horror
14584	6716	Thriller
14585	6717	Western
14586	6718	Drama
14587	6718	Mystery
14588	6718	Thriller
14589	6719	Adventure
14590	6719	Animation
14591	6719	Children
14592	6719	Comedy
14593	6719	Fantasy
14594	6719	War
14595	6720	Comedy
14596	6720	Fantasy
14597	6720	Horror
14598	6720	Thriller
14599	6721	Action
14600	6721	Adventure
14601	6721	Horror
14602	6721	Mystery
14603	6721	Sci-Fi
14604	6721	Thriller
14605	6722	Comedy
14606	6723	Drama
14607	6723	Thriller
14608	6724	Action
14609	6724	Crime
14610	6724	Thriller
14611	6725	Comedy
14612	6725	Fantasy
14613	6725	Romance
14614	6726	Drama
14615	6727	Action
14616	6727	Crime
14617	6727	Drama
14618	6727	Thriller
14619	6727	War
14620	6728	Drama
14621	6728	Horror
14622	6728	Mystery
14623	6728	Thriller
14624	6729	Comedy
14625	6729	Drama
14626	6730	Comedy
14627	6730	Drama
14628	6731	Comedy
14629	6732	Action
14630	6732	Drama
14631	6732	Musical
14632	6732	War
14633	6733	Drama
14634	6734	Adventure
14635	6734	Animation
14636	6734	Comedy
14637	6735	Action
14638	6735	Comedy
14639	6735	Crime
14640	6735	Thriller
14641	6736	Crime
14642	6736	Drama
14643	6736	Romance
14644	6736	Thriller
14645	6737	Drama
14646	6738	Comedy
14647	6738	Musical
14648	6738	Western
14649	6739	Documentary
14650	6740	Comedy
14651	6740	Musical
14652	6741	Drama
14653	6741	Romance
14654	6742	Action
14655	6742	Horror
14656	6742	Sci-Fi
14657	6743	Crime
14658	6743	Drama
14659	6743	Thriller
14660	6744	Comedy
14661	6745	Action
14662	6745	Sci-Fi
14663	6746	Drama
14664	6747	Action
14665	6747	Comedy
14666	6747	Crime
14667	6748	Fantasy
14668	6748	Mystery
14669	6748	Romance
14670	6748	Thriller
14671	6749	Drama
14672	6750	Comedy
14673	6751	Drama
14674	6752	Comedy
14675	6752	Drama
14676	6752	Romance
14677	6753	Crime
14678	6753	Drama
14679	6753	Horror
14680	6753	Thriller
14681	6754	Action
14682	6754	Drama
14683	6754	Thriller
14684	6755	Animation
14685	6755	Comedy
14686	6755	Fantasy
14687	6755	Musical
14688	6755	Romance
14689	6756	Crime
14690	6756	Drama
14691	6757	Action
14692	6757	Crime
14693	6757	Drama
14694	6757	Thriller
14695	6758	Drama
14696	6759	Drama
14697	6760	Crime
14698	6760	Drama
14699	6761	Musical
14700	6761	Romance
14701	6761	War
14702	6762	Action
14703	6762	Adventure
14704	6762	Animation
14705	6762	Fantasy
14706	6762	Sci-Fi
14707	6763	Action
14708	6763	Adventure
14709	6763	Crime
14710	6763	Thriller
14711	6764	Drama
14712	6765	Adventure
14713	6765	Children
14714	6765	Drama
14715	6765	Fantasy
14716	6766	Drama
14717	6767	Adventure
14718	6767	Animation
14719	6767	Children
14720	6767	Comedy
14721	6768	Comedy
14722	6768	Crime
14723	6768	Mystery
14724	6768	Thriller
14725	6769	Action
14726	6769	Crime
14727	6769	Drama
14728	6770	Drama
14729	6770	Horror
14730	6770	Thriller
14731	6771	Drama
14732	6771	Romance
14733	6772	Crime
14734	6772	Drama
14735	6772	Mystery
14736	6773	Documentary
14737	6774	Action
14738	6774	Adventure
14739	6774	Drama
14740	6774	Fantasy
14741	6775	Documentary
14742	6776	Comedy
14743	6777	Drama
14744	6777	Fantasy
14745	6778	Drama
14746	6779	Crime
14747	6779	Drama
14748	6779	Thriller
14749	6780	Comedy
14750	6780	Drama
14751	6781	Drama
14752	6781	War
14753	6782	Crime
14754	6782	Drama
14755	6782	Thriller
14756	6783	Comedy
14757	6783	Drama
14758	6784	Drama
14759	6785	Drama
14760	6785	Romance
14761	6785	Thriller
14762	6786	Action
14763	6786	Comedy
14764	6786	Sci-Fi
14765	6787	Drama
14766	6787	Romance
14767	6788	Comedy
14768	6788	Drama
14769	6788	Romance
14770	6789	Drama
14771	6790	Crime
14772	6790	Drama
14773	6791	Children
14774	6791	Drama
14775	6792	Crime
14776	6792	Drama
14777	6792	Film-Noir
14778	6793	Crime
14779	6793	Drama
14780	6793	Western
14781	6794	Drama
14782	6795	Comedy
14783	6795	Drama
14784	6796	Comedy
14785	6796	Drama
14786	6796	Romance
14787	6797	Drama
14788	6797	Thriller
14789	6798	Comedy
14790	6799	Thriller
14791	6800	Action
14792	6800	Adventure
14793	6800	Drama
14794	6800	Western
14795	6801	Comedy
14796	6801	Drama
14797	6802	Horror
14798	6802	Thriller
14799	6803	Comedy
14800	6803	Drama
14801	6803	Romance
14802	6804	Comedy
14803	6805	Drama
14804	6805	Film-Noir
14805	6805	Romance
14806	6806	Action
14807	6806	Adventure
14808	6807	Action
14809	6807	Adventure
14810	6808	Drama
14811	6809	Action
14812	6809	Crime
14813	6809	Drama
14814	6810	Crime
14815	6810	Drama
14816	6810	Thriller
14817	6811	Action
14818	6811	Drama
14819	6811	War
14820	6812	Drama
14821	6813	Action
14822	6813	Adventure
14823	6813	Animation
14824	6813	Children
14825	6813	Comedy
14826	6813	Sci-Fi
14827	6814	Comedy
14828	6814	Drama
14829	6814	Musical
14830	6814	Romance
14831	6815	Crime
14832	6815	Thriller
14833	6816	Drama
14834	6816	War
14835	6817	Horror
14836	6817	Sci-Fi
14837	6817	Thriller
14838	6818	Comedy
14839	6818	Drama
14840	6819	Comedy
14841	6819	Romance
14842	6820	Drama
14843	6820	Thriller
14844	6821	Drama
14845	6821	Thriller
14846	6822	Horror
14847	6822	Thriller
14848	6823	Drama
14849	6823	Romance
14850	6824	Crime
14851	6824	Horror
14852	6824	Thriller
14853	6825	Adventure
14854	6825	Drama
14855	6825	Horror
14856	6825	Thriller
14857	6826	Comedy
14858	6826	Drama
14859	6827	Adventure
14860	6827	Fantasy
14861	6827	Thriller
14862	6827	IMAX
14863	6828	Drama
14864	6828	Musical
14865	6828	Romance
14866	6829	Drama
14867	6829	Musical
14868	6829	Romance
14869	6830	Drama
14870	6831	Action
14871	6831	Adventure
14872	6831	Children
14873	6831	Fantasy
14874	6832	Drama
14875	6832	Romance
14876	6833	Comedy
14877	6833	Musical
14878	6834	Drama
14879	6835	Action
14880	6835	Comedy
14881	6835	Crime
14882	6835	Thriller
14883	6836	Comedy
14884	6836	Romance
14885	6837	Drama
14886	6838	Action
14887	6838	Adventure
14888	6838	Drama
14889	6838	War
14890	6839	Western
14891	6840	Comedy
14892	6840	Drama
14893	6840	Romance
14894	6841	Action
14895	6841	Crime
14896	6841	Film-Noir
14897	6842	Drama
14898	6843	Crime
14899	6843	Drama
14900	6843	Romance
14901	6844	Adventure
14902	6844	Horror
14903	6844	Mystery
14904	6844	Thriller
14905	6845	Drama
14906	6845	Romance
14907	6846	Crime
14908	6846	Drama
14909	6846	Thriller
14910	6846	War
14911	6847	Adventure
14912	6847	Children
14913	6847	Fantasy
14914	6848	Action
14915	6848	Adventure
14916	6848	Drama
14917	6848	Fantasy
14918	6848	Thriller
14919	6849	Drama
14920	6849	Romance
14921	6850	Comedy
14922	6850	Drama
14923	6850	Romance
14924	6851	Action
14925	6851	Drama
14926	6851	Fantasy
14927	6852	Crime
14928	6852	Drama
14929	6852	Film-Noir
14930	6853	Crime
14931	6853	Drama
14932	6853	Romance
14933	6854	Action
14934	6854	Drama
14935	6855	Comedy
14936	6856	Comedy
14937	6856	Drama
14938	6856	Thriller
14939	6857	Action
14940	6857	Crime
14941	6857	Thriller
14942	6858	Action
14943	6858	Adventure
14944	6858	Crime
14945	6858	Thriller
14946	6859	Drama
14947	6859	Film-Noir
14948	6859	Thriller
14949	6860	Comedy
14950	6860	Drama
14951	6860	Romance
14952	6861	Crime
14953	6861	Drama
14954	6861	Thriller
14955	6862	Comedy
14956	6862	Romance
14957	6863	Adventure
14958	6863	Crime
14959	6863	Drama
14960	6864	Crime
14961	6864	Drama
14962	6864	Thriller
14963	6865	Action
14964	6865	Crime
14965	6865	Drama
14966	6865	Thriller
14967	6866	Comedy
14968	6866	Musical
14969	6867	Adventure
14970	6867	Comedy
14971	6867	Drama
14972	6868	Comedy
14973	6868	Drama
14974	6868	Romance
14975	6869	Adventure
14976	6869	Comedy
14977	6870	Comedy
14978	6870	Crime
14979	6871	Comedy
14980	6872	Action
14981	6872	Adventure
14982	6872	Comedy
14983	6872	Drama
14984	6872	Romance
14985	6873	Comedy
14986	6873	Drama
14987	6874	Drama
14988	6875	Comedy
14989	6875	Romance
14990	6876	Drama
14991	6876	Horror
14992	6876	Mystery
14993	6877	Comedy
14994	6877	Documentary
14995	6878	Comedy
14996	6878	Crime
14997	6879	Horror
14998	6879	Thriller
14999	6880	Adventure
15000	6880	Drama
15001	6880	Romance
15002	6881	Adventure
15003	6881	Drama
15004	6881	Romance
15005	6882	Animation
15006	6882	Drama
15007	6882	Romance
15008	6882	Sci-Fi
15009	6883	Children
15010	6883	Drama
15011	6884	Comedy
15012	6884	Drama
15013	6885	Crime
15014	6885	Drama
15015	6885	Mystery
15016	6885	Thriller
15017	6886	Adventure
15018	6886	Drama
15019	6886	Thriller
15020	6886	War
15021	6887	Crime
15022	6887	Drama
15023	6887	Thriller
15024	6888	Action
15025	6888	Crime
15026	6888	Sci-Fi
15027	6889	Action
15028	6889	Fantasy
15029	6890	Horror
15030	6891	Comedy
15031	6892	Drama
15032	6892	Romance
15033	6893	Drama
15034	6894	Comedy
15035	6895	Animation
15036	6895	Children
15037	6895	Comedy
15038	6896	Action
15039	6896	Fantasy
15040	6896	Horror
15041	6897	Comedy
15042	6898	Comedy
15043	6898	Crime
15044	6898	Drama
15045	6898	Thriller
15046	6899	Drama
15047	6899	Horror
15048	6900	Drama
15049	6900	Romance
15050	6901	Drama
15051	6901	War
15052	6902	Comedy
15053	6903	Comedy
15054	6903	Drama
15055	6904	Drama
15056	6905	Action
15057	6905	Comedy
15058	6905	Crime
15059	6905	Western
15060	6906	Comedy
15061	6906	Drama
15062	6907	Drama
15063	6907	Romance
15064	6907	War
15065	6908	Drama
15066	6908	Romance
15067	6909	Drama
15068	6910	Action
15069	6910	Comedy
15070	6910	Crime
15071	6911	Horror
15072	6911	Mystery
15073	6911	Thriller
15074	6912	Thriller
15075	6913	Comedy
15076	6913	Musical
15077	6914	Comedy
15078	6914	Documentary
15079	6915	Horror
15080	6915	Mystery
15081	6915	Thriller
15082	6916	Comedy
15083	6916	Drama
15084	6916	Romance
15085	6917	Drama
15086	6917	Western
15087	6918	Comedy
15088	6918	Drama
15089	6918	Romance
15090	6919	Crime
15091	6919	Drama
15092	6919	Romance
15093	6920	Crime
15094	6920	Drama
15095	6921	Drama
15096	6921	Romance
15097	6921	War
15098	6922	Horror
15099	6922	Thriller
15100	6923	Adventure
15101	6923	Comedy
15102	6923	Crime
15103	6924	Action
15104	6924	Comedy
15105	6924	Crime
15106	6924	Drama
15107	6924	Thriller
15108	6925	Crime
15109	6925	Drama
15110	6925	Thriller
15111	6926	Comedy
15112	6927	Horror
15113	6927	Thriller
15114	6928	Drama
15115	6929	Documentary
15116	6929	Musical
15117	6930	Crime
15118	6930	Drama
15119	6931	Action
15120	6931	Adventure
15121	6931	Drama
15122	6931	Romance
15123	6932	Comedy
15124	6932	Romance
15125	6933	Action
15126	6933	Crime
15127	6933	Thriller
15128	6934	Action
15129	6934	Fantasy
15130	6934	Sci-Fi
15131	6934	Thriller
15132	6935	Comedy
15133	6935	Romance
15134	6936	Action
15135	6936	Drama
15136	6936	Fantasy
15137	6936	Horror
15138	6936	Mystery
15139	6936	Sci-Fi
15140	6936	Thriller
15141	6937	Crime
15142	6937	Thriller
15143	6938	Comedy
15144	6938	Romance
15145	6939	Crime
15146	6939	Drama
15147	6939	Thriller
15148	6940	Romance
15149	6940	Thriller
15150	6941	Comedy
15151	6941	Romance
15152	6942	Adventure
15153	6942	Animation
15154	6942	Children
15155	6942	Comedy
15156	6943	Comedy
15157	6943	Crime
15158	6943	Drama
15159	6944	Drama
15160	6944	Romance
15161	6945	Western
15162	6946	Action
15163	6946	Sci-Fi
15164	6946	Thriller
15165	6946	IMAX
15166	6947	Comedy
15167	6947	Romance
15168	6948	Comedy
15169	6948	Drama
15170	6949	Comedy
15171	6949	Crime
15172	6949	Drama
15173	6950	Crime
15174	6950	Drama
15175	6950	Thriller
15176	6951	Crime
15177	6951	Drama
15178	6952	Comedy
15179	6952	Fantasy
15180	6952	Horror
15181	6953	Comedy
15182	6953	Fantasy
15183	6953	Horror
15184	6954	Comedy
15185	6954	Fantasy
15186	6954	Horror
15187	6954	Sci-Fi
15188	6955	Comedy
15189	6956	Drama
15190	6956	Film-Noir
15191	6957	Drama
15192	6957	Horror
15193	6957	Thriller
15194	6958	Documentary
15195	6959	Drama
15196	6959	Romance
15197	6959	Thriller
15198	6960	Action
15199	6960	Crime
15200	6960	Drama
15201	6960	Thriller
15202	6961	Drama
15203	6961	Fantasy
15204	6962	Crime
15205	6962	Drama
15206	6962	Mystery
15207	6963	Drama
15208	6964	Documentary
15209	6965	Drama
15210	6965	War
15211	6966	Drama
15212	6967	Crime
15213	6967	Drama
15214	6967	Mystery
15215	6968	Comedy
15216	6968	Drama
15217	6969	Drama
15218	6970	Comedy
15219	6971	Horror
15220	6971	Sci-Fi
15221	6971	Thriller
15222	6972	Crime
15223	6972	Drama
15224	6972	Mystery
15225	6972	Thriller
15226	6973	Crime
15227	6973	Drama
15228	6973	Film-Noir
15229	6973	Mystery
15230	6974	Documentary
15231	6975	Horror
15232	6975	Thriller
15233	6976	Drama
15234	6977	Action
15235	6977	Drama
15236	6977	Thriller
15237	6978	Comedy
15238	6978	Horror
15239	6978	Sci-Fi
15240	6979	Comedy
15241	6980	Action
15242	6980	Animation
15243	6980	Film-Noir
15244	6980	Sci-Fi
15245	6980	Thriller
15246	6981	Drama
15247	6981	Horror
15248	6981	Romance
15249	6982	Action
15250	6982	Comedy
15251	6982	Drama
15252	6982	Thriller
15253	6983	Comedy
15254	6983	Drama
15255	6983	Romance
15256	6984	Mystery
15257	6984	Thriller
15258	6985	Drama
15259	6985	Musical
15260	6985	Romance
15261	6986	Drama
15262	6986	Horror
15263	6986	Romance
15264	6986	Thriller
15265	6987	Crime
15266	6987	Drama
15267	6988	Drama
15268	6989	Children
15269	6989	Drama
15270	6990	Comedy
15271	6990	Horror
15272	6991	Drama
15273	6991	Thriller
15274	6992	Horror
15275	6992	War
15276	6992	Western
15277	6993	Fantasy
15278	6993	Horror
15279	6993	Mystery
15280	6993	Thriller
15281	6994	Comedy
15282	6994	Drama
15283	6994	Musical
15284	6995	Crime
15285	6995	Drama
15286	6996	Crime
15287	6996	Drama
15288	6996	Thriller
15289	6997	Mystery
15290	6997	Thriller
15291	6998	Adventure
15292	6998	Animation
15293	6998	Children
15294	6998	Comedy
15295	6998	Fantasy
15296	6999	Fantasy
15297	6999	Horror
15298	6999	Thriller
15299	7000	Comedy
15300	7000	Drama
15301	7001	Drama
15302	7001	Thriller
15303	7002	Drama
15304	7002	Romance
15305	7003	Comedy
15306	7003	Drama
15307	7004	Crime
15308	7004	Drama
15309	7004	Film-Noir
15310	7004	Mystery
15311	7005	Action
15312	7005	Comedy
15313	7005	Crime
15314	7005	Thriller
15315	7006	Action
15316	7006	Adventure
15317	7006	Thriller
15318	7007	Drama
15319	7008	Adventure
15320	7008	Children
15321	7008	Comedy
15322	7009	Crime
15323	7009	Drama
15324	7010	Drama
15325	7011	Western
15326	7012	Comedy
15327	7012	Musical
15328	7012	Romance
15329	7013	Drama
15330	7013	Horror
15331	7013	Mystery
15332	7013	Thriller
15333	7014	Drama
15334	7014	Romance
15335	7015	Adventure
15336	7015	Animation
15337	7015	Children
15338	7015	Comedy
15339	7016	Comedy
15340	7016	Drama
15341	7017	Action
15342	7017	Adventure
15343	7017	Thriller
15344	7017	IMAX
15345	7018	Drama
15346	7018	Mystery
15347	7018	Thriller
15348	7019	Action
15349	7019	Sci-Fi
15350	7019	Thriller
15351	7020	Comedy
15352	7020	Drama
15353	7020	Romance
15354	7021	Comedy
15355	7022	Animation
15356	7022	Children
15357	7022	Comedy
15358	7023	Drama
15359	7024	Mystery
15360	7024	Romance
15361	7024	Western
15362	7025	Adventure
15363	7025	Western
15364	7026	Drama
15365	7027	Comedy
15366	7027	Drama
15367	7028	Drama
15368	7029	Horror
15369	7029	Thriller
15370	7030	Drama
15371	7031	Comedy
15372	7032	Drama
15373	7032	Fantasy
15374	7032	Romance
15375	7033	Adventure
15376	7033	Comedy
15377	7033	Drama
15378	7033	Fantasy
15379	7033	Romance
15380	7034	Drama
15381	7034	Film-Noir
15382	7034	Horror
15383	7034	Mystery
15384	7035	Comedy
15385	7035	Drama
15386	7036	Action
15387	7036	Adventure
15388	7036	Fantasy
15389	7037	Comedy
15390	7038	Comedy
15391	7039	Drama
15392	7039	Fantasy
15393	7039	Mystery
15394	7040	Comedy
15395	7040	Fantasy
15396	7040	Romance
15397	7041	Horror
15398	7042	Drama
15399	7042	Romance
15400	7043	Crime
15401	7043	Drama
15402	7043	Film-Noir
15403	7043	Mystery
15404	7043	Romance
15405	7044	Documentary
15406	7045	Documentary
15407	7046	Action
15408	7046	Horror
15409	7046	Sci-Fi
15410	7046	Thriller
15411	7047	Documentary
15412	7047	Musical
15413	7048	Drama
15414	7048	Musical
15415	7048	Thriller
15416	7049	Children
15417	7049	Comedy
15418	7049	Drama
15419	7049	Musical
15420	7049	Romance
15421	7050	Drama
15422	7051	Crime
15423	7051	Drama
15424	7051	Film-Noir
15425	7052	Action
15426	7052	Drama
15427	7053	Action
15428	7053	Crime
15429	7053	Drama
15430	7053	Thriller
15431	7054	Documentary
15432	7055	Drama
15433	7055	Film-Noir
15434	7055	Thriller
15435	7056	Action
15436	7056	Adventure
15437	7056	Sci-Fi
15438	7056	IMAX
15439	7057	Drama
15440	7057	War
15441	7058	Documentary
15442	7058	Musical
15443	7059	Drama
15444	7059	Thriller
15445	7060	Comedy
15446	7061	Adventure
15447	7061	Comedy
15448	7061	Drama
15449	7062	Comedy
15450	7062	Crime
15451	7062	Mystery
15452	7063	Horror
15453	7063	Sci-Fi
15454	7063	Thriller
15455	7064	Drama
15456	7064	Mystery
15457	7064	Thriller
15458	7065	Crime
15459	7065	Drama
15460	7065	Film-Noir
15461	7066	Drama
15462	7066	Thriller
15463	7067	Comedy
15464	7068	Drama
15465	7069	Drama
15466	7069	Romance
15467	7070	Documentary
15468	7071	Action
15469	7071	Drama
15470	7071	Thriller
15471	7071	War
15472	7072	Drama
15473	7072	War
15474	7073	Horror
15475	7074	Drama
15476	7075	Drama
15477	7075	Romance
15478	7076	Crime
15479	7076	Drama
15480	7077	Animation
15481	7077	Children
15482	7077	Fantasy
15483	7077	Mystery
15484	7078	Comedy
15485	7078	Romance
15486	7079	Comedy
15487	7079	Drama
15488	7080	Action
15489	7080	Comedy
15490	7080	Horror
15491	7080	Thriller
15492	7081	Comedy
15493	7081	Fantasy
15494	7081	Mystery
15495	7082	Action
15496	7082	Comedy
15497	7083	Action
15498	7083	Comedy
15499	7083	Fantasy
15500	7083	IMAX
15501	7084	Drama
15502	7085	Comedy
15503	7085	Drama
15504	7085	Fantasy
15505	7085	Romance
15506	7086	Action
15507	7086	Crime
15508	7086	Drama
15509	7086	Thriller
15510	7087	Crime
15511	7087	Drama
15512	7087	Thriller
15513	7088	Crime
15514	7088	Drama
15515	7088	Film-Noir
15516	7089	Drama
15517	7090	Action
15518	7090	Comedy
15519	7090	Romance
15520	7090	Western
15521	7091	Comedy
15522	7091	Romance
15523	7092	Adventure
15524	7092	Animation
15525	7092	Children
15526	7092	Comedy
15527	7092	Fantasy
15528	7092	IMAX
15529	7093	Comedy
15530	7093	Crime
15531	7094	Comedy
15532	7094	Drama
15533	7095	Action
15534	7095	Thriller
15535	7096	Action
15536	7096	Crime
15537	7096	Drama
15538	7096	Thriller
15539	7097	Fantasy
15540	7097	Mystery
15541	7097	Thriller
15542	7098	Drama
15543	7099	Drama
15544	7100	Drama
15545	7100	Mystery
15546	7100	War
15547	7101	Action
15548	7101	Crime
15549	7101	Drama
15550	7101	Romance
15551	7102	Drama
15552	7102	Romance
15553	7103	Action
15554	7103	Comedy
15555	7103	Crime
15556	7103	Thriller
15557	7104	Drama
15558	7105	Drama
15559	7105	Fantasy
15560	7105	Thriller
15561	7106	Crime
15562	7106	Drama
15563	7107	Fantasy
15564	7107	Musical
15565	7108	Children
15566	7108	Comedy
15567	7108	Drama
15568	7109	Comedy
15569	7110	Crime
15570	7110	Drama
15571	7110	Film-Noir
15572	7111	Drama
15573	7112	Drama
15574	7112	Fantasy
15575	7112	Mystery
15576	7112	Romance
15577	7113	Adventure
15578	7113	Romance
15579	7114	Comedy
15580	7114	Drama
15581	7115	Drama
15582	7116	Action
15583	7116	Crime
15584	7116	Drama
15585	7116	Thriller
15586	7117	Comedy
15587	7118	Children
15588	7118	Drama
15589	7119	Drama
15590	7120	Crime
15591	7120	Drama
15592	7120	Musical
15593	7121	Comedy
15594	7121	Crime
15595	7122	Children
15596	7122	Fantasy
15597	7123	Comedy
15598	7123	Western
15599	7124	Comedy
15600	7124	Drama
15601	7124	Fantasy
15602	7124	Romance
15603	7125	Crime
15604	7125	Mystery
15605	7126	Comedy
15606	7127	Horror
15607	7127	Mystery
15608	7127	Thriller
15609	7128	Crime
15610	7128	Drama
15611	7128	Mystery
15612	7128	Thriller
15613	7129	Drama
15614	7129	War
15615	7130	Drama
15616	7130	War
15617	7131	Comedy
15618	7131	Horror
15619	7131	Thriller
15620	7132	Crime
15621	7132	Drama
15622	7132	Mystery
15623	7132	Thriller
15624	7133	Action
15625	7133	Horror
15626	7133	Thriller
15627	7134	Comedy
15628	7134	Drama
15629	7135	Comedy
15630	7135	Drama
15631	7135	Romance
15632	7136	Adventure
15633	7136	Comedy
15634	7136	Sci-Fi
15635	7136	Thriller
15636	7137	Documentary
15637	7137	Drama
15638	7138	Comedy
15639	7138	Crime
15640	7138	Romance
15641	7138	Thriller
15642	7139	Drama
15643	7139	Fantasy
15644	7139	Romance
15645	7140	Comedy
15646	7140	Drama
15647	7140	Fantasy
15648	7140	Romance
15649	7141	Drama
15650	7142	Crime
15651	7142	Drama
15652	7142	Mystery
15653	7142	Thriller
15654	7143	Horror
15655	7144	Drama
15656	7145	Comedy
15657	7145	Fantasy
15658	7145	Musical
15659	7146	Drama
15660	7146	Mystery
15661	7146	Thriller
15662	7147	Comedy
15663	7147	Drama
15664	7147	Horror
15665	7148	Documentary
15666	7149	Drama
15667	7149	Romance
15668	7150	Comedy
15669	7150	Drama
15670	7151	Adventure
15671	7151	Drama
15672	7151	Thriller
15673	7152	Action
15674	7152	Adventure
15675	7152	Drama
15676	7152	War
15677	7153	Comedy
15678	7153	Documentary
15679	7154	Drama
15680	7155	Comedy
15681	7156	Documentary
15682	7157	Drama
15683	7157	Fantasy
15684	7157	Thriller
15685	7158	Action
15686	7158	Adventure
15687	7158	Drama
15688	7159	Adventure
15689	7159	Animation
15690	7159	Children
15691	7159	Comedy
15692	7159	IMAX
15693	7160	Comedy
15694	7160	Crime
15695	7161	Crime
15696	7161	Drama
15697	7161	Thriller
15698	7162	Horror
15699	7162	Thriller
15700	7163	Comedy
15701	7164	Action
15702	7164	Drama
15703	7165	Crime
15704	7165	Drama
15705	7165	Horror
15706	7165	Thriller
15707	7166	Adventure
15708	7166	Horror
15709	7166	Sci-Fi
15710	7167	Comedy
15711	7167	Drama
15712	7168	Drama
15713	7168	Film-Noir
15714	7168	Thriller
15715	7169	Comedy
15716	7169	Thriller
15717	7170	Action
15718	7170	Drama
15719	7170	Thriller
15720	7171	Drama
15721	7171	Romance
15722	7172	Comedy
15723	7172	Drama
15724	7173	Drama
15725	7173	Romance
15726	7174	Documentary
15727	7175	Drama
15728	7176	Action
15729	7176	Drama
15730	7177	Drama
15731	7177	Thriller
15732	7178	Comedy
15733	7178	Drama
15734	7178	Romance
15735	7179	Action
15736	7179	Adventure
15737	7179	Drama
15738	7179	Sci-Fi
15739	7179	Thriller
15740	7180	Drama
15741	7180	Mystery
15742	7180	Sci-Fi
15743	7180	Thriller
15744	7181	Drama
15745	7181	War
15746	7182	Action
15747	7182	Drama
15748	7182	War
15749	7183	Thriller
15750	7184	Crime
15751	7184	Drama
15752	7185	Crime
15753	7185	Horror
15754	7185	Thriller
15755	7186	Drama
15756	7186	Thriller
15757	7187	Adventure
15758	7187	Drama
15759	7187	Romance
15760	7187	Sci-Fi
15761	7187	Thriller
15762	7188	Action
15763	7188	Adventure
15764	7188	Romance
15765	7188	War
15766	7189	Animation
15767	7189	Comedy
15768	7190	Crime
15769	7190	Drama
15770	7190	Thriller
15771	7191	Comedy
15772	7191	Fantasy
15773	7192	Comedy
15774	7192	Sci-Fi
15775	7193	Comedy
15776	7193	Drama
15777	7194	Comedy
15778	7194	Drama
15779	7194	Romance
15780	7195	Comedy
15781	7195	Romance
15782	7196	Sci-Fi
15783	7196	Thriller
15784	7197	Comedy
15785	7198	Documentary
15786	7199	Comedy
15787	7199	Documentary
15788	7200	Action
15789	7200	Adventure
15790	7200	Thriller
15791	7201	Adventure
15792	7201	Animation
15793	7201	Children
15794	7201	Comedy
15795	7201	IMAX
15796	7202	Comedy
15797	7203	Action
15798	7203	Sci-Fi
15799	7203	Thriller
15800	7204	Drama
15801	7205	Comedy
15802	7205	Drama
15803	7205	Romance
15804	7206	Comedy
15805	7206	Romance
15806	7207	Drama
15807	7208	Action
15808	7208	Crime
15809	7208	Drama
15810	7209	Drama
15811	7210	Drama
15812	7211	Drama
15813	7212	Adventure
15814	7212	Comedy
15815	7212	Musical
15816	7213	Comedy
15817	7213	Crime
15818	7213	Romance
15819	7214	Adventure
15820	7214	Comedy
15821	7214	Crime
15822	7215	Comedy
15823	7216	Drama
15824	7217	Comedy
15825	7218	Adventure
15826	7218	Drama
15827	7218	Horror
15828	7218	Mystery
15829	7218	Thriller
15830	7219	Action
15831	7219	Adventure
15832	7219	Crime
15833	7219	Drama
15834	7219	Thriller
15835	7219	War
15836	7220	Children
15837	7220	Comedy
15838	7220	Drama
15839	7220	Fantasy
15840	7221	Action
15841	7221	Adventure
15842	7221	Fantasy
15843	7222	Action
15844	7222	Drama
15845	7223	Action
15846	7223	Drama
15847	7223	War
15848	7224	Comedy
15849	7224	Romance
15850	7225	Drama
15851	7225	War
15852	7226	Drama
15853	7226	Romance
15854	7227	Drama
15855	7228	Adventure
15856	7228	Animation
15857	7228	Drama
15858	7229	Drama
15859	7229	Thriller
15860	7230	Drama
15861	7230	Musical
15862	7231	Drama
15863	7231	Musical
15864	7231	Thriller
15865	7232	Drama
15866	7233	Drama
15867	7233	Mystery
15868	7233	Thriller
15869	7234	Comedy
15870	7234	Drama
15871	7235	Drama
15872	7236	Action
15873	7236	Adventure
15874	7237	Action
15875	7237	Drama
15876	7238	Comedy
15877	7238	Drama
15878	7238	Fantasy
15879	7238	Mystery
15880	7239	Drama
15881	7239	Mystery
15882	7239	Thriller
15883	7240	Drama
15884	7240	War
15885	7241	Action
15886	7241	Horror
15887	7241	Thriller
15888	7242	Animation
15889	7242	Children
15890	7242	Comedy
15891	7243	Action
15892	7243	Drama
15893	7243	War
15894	7244	Drama
15895	7245	Comedy
15896	7245	Romance
15897	7246	Drama
15898	7246	Romance
15899	7247	Horror
15900	7247	Thriller
15901	7248	Crime
15902	7248	Drama
15903	7249	Action
15904	7249	Horror
15905	7249	Thriller
15906	7250	Drama
15907	7250	Mystery
15908	7250	Thriller
15909	7251	Drama
15910	7252	Horror
15911	7253	Comedy
15912	7253	Drama
15913	7254	Drama
15914	7254	Romance
15915	7255	Adventure
15916	7255	Children
15917	7255	Fantasy
15918	7256	Drama
15919	7256	Fantasy
15920	7257	Comedy
15921	7257	Fantasy
15922	7257	Horror
15923	7258	Comedy
15924	7259	Comedy
15925	7259	Drama
15926	7259	Romance
15927	7260	Documentary
15928	7261	Documentary
15929	7262	Comedy
15930	7262	Drama
15931	7262	Romance
15932	7263	Action
15933	7263	Crime
15934	7263	Drama
15935	7263	Thriller
15936	7264	Drama
15937	7264	Fantasy
15938	7264	Horror
15939	7264	Romance
15940	7265	Adventure
15941	7265	Comedy
15942	7266	Drama
15943	7266	Horror
15944	7266	Thriller
15945	7267	Comedy
15946	7267	Drama
15947	7267	Romance
15948	7268	Drama
15949	7268	Horror
15950	7268	Thriller
15951	7269	Comedy
15952	7269	Romance
15953	7270	Drama
15954	7270	Romance
15955	7270	War
15956	7271	Documentary
15957	7272	Crime
15958	7272	Drama
15959	7272	Thriller
15960	7273	Animation
15961	7273	Children
15962	7273	Drama
15963	7274	Drama
15964	7274	Romance
15965	7275	Romance
15966	7276	Drama
15967	7277	Comedy
15968	7277	Crime
15969	7277	Drama
15970	7278	Comedy
15971	7278	Romance
15972	7279	Action
15973	7279	Adventure
15974	7279	Drama
15975	7279	War
15976	7280	Drama
15977	7280	Mystery
15978	7280	Thriller
15979	7281	Comedy
15980	7281	Musical
15981	7282	Comedy
15982	7282	Crime
15983	7283	Action
15984	7283	Fantasy
15985	7283	Thriller
15986	7284	Drama
15987	7284	Thriller
15988	7285	Comedy
15989	7285	Romance
15990	7286	Comedy
15991	7286	Romance
15992	7287	Drama
15993	7287	Mystery
15994	7287	Thriller
15995	7288	Drama
15996	7289	Comedy
15997	7289	Drama
15998	7289	Romance
15999	7290	Documentary
16000	7291	Drama
16001	7292	Action
16002	7292	Comedy
16003	7292	Crime
16004	7292	Mystery
16005	7293	Horror
16006	7293	Romance
16007	7294	Crime
16008	7294	Drama
16009	7294	Thriller
16010	7295	Adventure
16011	7295	Drama
16012	7295	Romance
16013	7296	Drama
16014	7296	Horror
16015	7296	Mystery
16016	7296	Thriller
16017	7297	Action
16018	7297	Sci-Fi
16019	7297	Thriller
16020	7298	Drama
16021	7299	Drama
16022	7299	Romance
16023	7300	Comedy
16024	7300	Horror
16025	7301	Crime
16026	7301	Drama
16027	7301	Thriller
16028	7302	Adventure
16029	7302	Comedy
16030	7303	Comedy
16031	7303	Romance
16032	7304	Sci-Fi
16033	7305	Western
16034	7306	Drama
16035	7307	Action
16036	7307	Fantasy
16037	7307	War
16038	7307	IMAX
16039	7308	Horror
16040	7308	Mystery
16041	7308	Thriller
16042	7309	Drama
16043	7310	Adventure
16044	7310	Children
16045	7310	Sci-Fi
16046	7311	Comedy
16047	7311	Romance
16048	7312	Comedy
16049	7312	Drama
16050	7312	Horror
16051	7312	Sci-Fi
16052	7312	Thriller
16053	7313	Comedy
16054	7313	Musical
16055	7313	Romance
16056	7314	Drama
16057	7314	Romance
16058	7315	Drama
16059	7315	Thriller
16060	7316	Drama
16061	7317	Drama
16062	7317	Romance
16063	7318	Comedy
16064	7318	Drama
16065	7318	Romance
16066	7319	Crime
16067	7319	Drama
16068	7319	Romance
16069	7320	Drama
16070	7320	Fantasy
16071	7320	Mystery
16072	7320	Thriller
16073	7321	Horror
16074	7321	Mystery
16075	7321	Thriller
16076	7322	Drama
16077	7323	Action
16078	7323	Drama
16079	7323	Thriller
16080	7324	Horror
16081	7324	Thriller
16082	7325	Action
16083	7325	Adventure
16084	7325	Animation
16085	7325	Children
16086	7325	Comedy
16087	7325	Fantasy
16088	7326	Drama
16089	7327	Crime
16090	7327	Drama
16091	7327	Mystery
16092	7327	Thriller
16093	7328	Adventure
16094	7328	Crime
16095	7328	Drama
16096	7328	Thriller
16097	7329	Comedy
16098	7329	Drama
16099	7329	Romance
16100	7330	Drama
16101	7330	Thriller
16102	7330	War
16103	7331	Comedy
16104	7331	Crime
16105	7331	Drama
16106	7331	Film-Noir
16107	7331	Thriller
16108	7332	Crime
16109	7332	Drama
16110	7332	Thriller
16111	7333	Comedy
16112	7333	Romance
16113	7334	Action
16114	7334	Crime
16115	7334	Horror
16116	7334	Sci-Fi
16117	7334	Thriller
16118	7335	Horror
16119	7335	Thriller
16120	7336	Action
16121	7336	Adventure
16122	7336	Animation
16123	7336	Children
16124	7336	Comedy
16125	7336	Sci-Fi
16126	7337	Action
16127	7337	Adventure
16128	7337	Drama
16129	7337	War
16130	7338	Action
16131	7338	Adventure
16132	7338	Drama
16133	7338	War
16134	7338	Western
16135	7339	Adventure
16136	7339	Drama
16137	7339	Sci-Fi
16138	7339	Thriller
16139	7340	Comedy
16140	7340	Drama
16141	7340	Romance
16142	7341	Drama
16143	7341	Musical
16144	7342	Crime
16145	7342	Drama
16146	7343	Drama
16147	7343	Film-Noir
16148	7344	Animation
16149	7344	Comedy
16150	7344	Fantasy
16151	7344	Musical
16152	7345	Drama
16153	7346	Crime
16154	7346	Drama
16155	7346	Mystery
16156	7346	Thriller
16157	7347	Drama
16158	7347	Thriller
16159	7348	Action
16160	7348	Adventure
16161	7348	Drama
16162	7348	Thriller
16163	7348	War
16164	7349	Action
16165	7349	Adventure
16166	7349	Animation
16167	7349	Comedy
16168	7349	Fantasy
16169	7349	Mystery
16170	7349	Sci-Fi
16171	7350	Crime
16172	7350	Drama
16173	7351	Drama
16174	7352	Comedy
16175	7352	Romance
16176	7353	Action
16177	7353	Drama
16178	7353	Thriller
16179	7354	Drama
16180	7354	Musical
16181	7355	Crime
16182	7355	Drama
16183	7355	Mystery
16184	7355	Thriller
16185	7356	Comedy
16186	7356	Crime
16187	7356	Thriller
16188	7357	Horror
16189	7357	Thriller
16190	7358	Comedy
16191	7358	Drama
16192	7358	Romance
16193	7359	Comedy
16194	7360	Crime
16195	7360	Drama
16196	7360	Fantasy
16197	7360	Mystery
16198	7360	Thriller
16199	7361	Comedy
16200	7362	Action
16201	7362	Adventure
16202	7362	Crime
16203	7362	Thriller
16204	7363	Action
16205	7363	Adventure
16206	7363	Sci-Fi
16207	7363	Thriller
16208	7363	IMAX
16209	7364	Comedy
16210	7364	Drama
16211	7365	Documentary
16212	7366	Action
16213	7366	Crime
16214	7366	Horror
16215	7366	Thriller
16216	7367	Comedy
16217	7367	Drama
16218	7367	Romance
16219	7368	Animation
16220	7368	Mystery
16221	7368	Sci-Fi
16222	7369	Drama
16223	7370	Comedy
16224	7370	Drama
16225	7370	Romance
16226	7371	Drama
16227	7372	Drama
16228	7373	Action
16229	7373	Fantasy
16230	7373	Horror
16231	7373	Thriller
16232	7374	Drama
16233	7375	Drama
16234	7376	Comedy
16235	7376	Drama
16236	7376	Romance
16237	7377	Comedy
16238	7377	Drama
16239	7377	Musical
16240	7378	Horror
16241	7378	Sci-Fi
16242	7378	Thriller
16243	7379	Comedy
16244	7379	Drama
16245	7379	Romance
16246	7380	Action
16247	7380	Adventure
16248	7380	Comedy
16249	7381	Documentary
16250	7382	Drama
16251	7383	Adventure
16252	7383	Animation
16253	7383	Children
16254	7383	Comedy
16255	7383	Fantasy
16256	7384	Drama
16257	7384	Musical
16258	7384	Romance
16259	7385	Action
16260	7385	Adventure
16261	7385	Comedy
16262	7385	Fantasy
16263	7386	Drama
16264	7386	Horror
16265	7386	Thriller
16266	7387	Crime
16267	7387	Drama
16268	7387	Thriller
16269	7388	Action
16270	7388	Horror
16271	7388	Mystery
16272	7388	Thriller
16273	7389	Drama
16274	7390	Action
16275	7390	Adventure
16276	7390	Fantasy
16277	7391	Action
16278	7391	Adventure
16279	7391	Comedy
16280	7391	Fantasy
16281	7391	Romance
16282	7392	Action
16283	7392	Thriller
16284	7393	Comedy
16285	7393	Drama
16286	7393	Romance
16287	7393	Sci-Fi
16288	7394	Comedy
16289	7395	Crime
16290	7395	Drama
16291	7395	Mystery
16292	7395	Thriller
16293	7396	Crime
16294	7396	Drama
16295	7396	Thriller
16296	7397	Comedy
16297	7397	Drama
16298	7397	Romance
16299	7398	Crime
16300	7398	Thriller
16301	7399	Crime
16302	7399	Horror
16303	7399	Thriller
16304	7400	Comedy
16305	7400	Drama
16306	7400	Romance
16307	7401	Crime
16308	7401	Drama
16309	7402	Animation
16310	7402	Children
16311	7402	Comedy
16312	7403	Action
16313	7403	Adventure
16314	7403	Sci-Fi
16315	7404	Comedy
16316	7404	Horror
16317	7404	Thriller
16318	7405	Action
16319	7405	Adventure
16320	7405	Crime
16321	7405	Horror
16322	7405	Thriller
16323	7406	Action
16324	7406	Adventure
16325	7406	Drama
16326	7406	War
16327	7407	Comedy
16328	7407	Drama
16329	7408	Comedy
16330	7409	Romance
16331	7409	Western
16332	7410	Comedy
16333	7410	Romance
16334	7411	Comedy
16335	7412	Comedy
16336	7412	Drama
16337	7412	Fantasy
16338	7412	Musical
16339	7413	Documentary
16340	7413	Drama
16341	7414	Comedy
16342	7414	Drama
16343	7415	Documentary
16344	7415	Musical
16345	7416	Adventure
16346	7417	Drama
16347	7417	Thriller
16348	7418	Drama
16349	7418	Horror
16350	7418	Thriller
16351	7419	Comedy
16352	7420	Adventure
16353	7420	Drama
16354	7420	Romance
16355	7420	War
16356	7421	Action
16357	7421	Adventure
16358	7421	Crime
16359	7421	Thriller
16360	7422	Comedy
16361	7422	Fantasy
16362	7423	Action
16363	7423	Sci-Fi
16364	7423	Thriller
16365	7423	IMAX
16366	7424	Adventure
16367	7424	Drama
16368	7424	Fantasy
16369	7424	IMAX
16370	7425	Comedy
16371	7425	Romance
16372	7426	Crime
16373	7426	Thriller
16374	7427	Action
16375	7427	Adventure
16376	7427	Drama
16377	7427	Romance
16378	7427	War
16379	7428	Drama
16380	7428	Thriller
16381	7429	Drama
16382	7429	Romance
16383	7429	Western
16384	7430	Drama
16385	7430	Fantasy
16386	7430	Musical
16387	7430	Romance
16388	7431	Adventure
16389	7431	Drama
16390	7432	Comedy
16391	7433	Adventure
16392	7433	Comedy
16393	7433	Fantasy
16394	7433	Romance
16395	7434	Comedy
16396	7435	Animation
16397	7435	Comedy
16398	7436	Crime
16399	7436	Drama
16400	7436	Thriller
16401	7437	Comedy
16402	7437	Drama
16403	7437	Romance
16404	7438	Comedy
16405	7438	Drama
16406	7439	Action
16407	7439	Crime
16408	7439	Thriller
16409	7440	Comedy
16410	7441	Comedy
16411	7441	Crime
16412	7441	Thriller
16413	7442	Drama
16414	7443	Crime
16415	7443	Drama
16416	7443	Mystery
16417	7443	Thriller
16418	7444	Drama
16419	7444	Romance
16420	7445	Horror
16421	7446	Comedy
16422	7447	Drama
16423	7447	Thriller
16424	7448	Drama
16425	7449	Crime
16426	7449	Drama
16427	7450	Action
16428	7450	Comedy
16429	7450	Crime
16430	7450	Thriller
16431	7451	Action
16432	7451	Adventure
16433	7451	Fantasy
16434	7451	War
16435	7452	Drama
16436	7452	Romance
16437	7453	Comedy
16438	7454	Action
16439	7454	Drama
16440	7454	Thriller
16441	7455	Drama
16442	7455	Horror
16443	7455	Thriller
16444	7456	Comedy
16445	7456	Drama
16446	7457	Action
16447	7457	Drama
16448	7457	Horror
16449	7457	Sci-Fi
16450	7457	Thriller
16451	7458	Action
16452	7458	Thriller
16453	7459	Comedy
16454	7459	Drama
16455	7459	Romance
16456	7460	Horror
16457	7461	Drama
16458	7461	Thriller
16459	7462	Comedy
16460	7462	Drama
16461	7462	Romance
16462	7463	Crime
16463	7463	Drama
16464	7463	Film-Noir
16465	7464	Documentary
16466	7465	Action
16467	7465	Comedy
16468	7466	Comedy
16469	7466	Horror
16470	7466	Thriller
16471	7467	Crime
16472	7467	Drama
16473	7467	Thriller
16474	7468	Drama
16475	7468	Mystery
16476	7469	Drama
16477	7469	Romance
16478	7470	Comedy
16479	7470	Drama
16480	7470	Fantasy
16481	7470	Musical
16482	7470	Romance
16483	7471	Action
16484	7471	Horror
16485	7471	Sci-Fi
16486	7472	Action
16487	7472	Crime
16488	7472	Drama
16489	7472	Western
16490	7473	Action
16491	7473	Comedy
16492	7473	Crime
16493	7474	Comedy
16494	7475	Comedy
16495	7475	Documentary
16496	7476	Drama
16497	7476	Romance
16498	7476	War
16499	7477	Drama
16500	7477	Thriller
16501	7478	Drama
16502	7479	Drama
16503	7479	Romance
16504	7480	Crime
16505	7480	Drama
16506	7480	Thriller
16507	7481	Drama
16508	7481	Mystery
16509	7482	Comedy
16510	7482	Romance
16511	7483	Comedy
16512	7483	Romance
16513	7484	Action
16514	7484	Adventure
16515	7484	Comedy
16516	7484	Drama
16517	7484	Thriller
16518	7485	Crime
16519	7485	Drama
16520	7485	Thriller
16521	7486	Documentary
16522	7487	Action
16523	7487	Adventure
16524	7487	Animation
16525	7487	Crime
16526	7487	Fantasy
16527	7488	Drama
16528	7489	Comedy
16529	7489	Drama
16530	7490	Action
16531	7490	Crime
16532	7490	Drama
16533	7490	Thriller
16534	7491	Action
16535	7491	Horror
16536	7491	Sci-Fi
16537	7491	Thriller
16538	7492	Comedy
16539	7493	Comedy
16540	7493	Romance
16541	7494	Action
16542	7494	Adventure
16543	7494	Drama
16544	7495	Comedy
16545	7496	Drama
16546	7496	Romance
16547	7496	Thriller
16548	7496	War
16549	7497	Drama
16550	7497	Romance
16551	7498	Action
16552	7498	Comedy
16553	7498	Thriller
16554	7499	Comedy
16555	7499	Drama
16556	7499	Romance
16557	7500	Comedy
16558	7500	Drama
16559	7500	Romance
16560	7501	Adventure
16561	7501	Comedy
16562	7501	Drama
16563	7502	Crime
16564	7502	Drama
16565	7503	Drama
16566	7504	Drama
16567	7504	Thriller
16568	7505	Drama
16569	7505	Mystery
16570	7505	Thriller
16571	7506	Comedy
16572	7506	Drama
16573	7507	Horror
16574	7507	Thriller
16575	7508	Drama
16576	7508	Thriller
16577	7509	Drama
16578	7509	Romance
16579	7510	Drama
16580	7510	Thriller
16581	7511	Crime
16582	7511	Drama
16583	7511	Mystery
16584	7512	Crime
16585	7512	Drama
16586	7512	Western
16587	7513	Crime
16588	7513	Drama
16589	7513	Film-Noir
16590	7514	Crime
16591	7514	Drama
16592	7514	Thriller
16593	7515	Drama
16594	7515	Thriller
16595	7516	Crime
16596	7516	Horror
16597	7516	Mystery
16598	7517	Animation
16599	7517	Drama
16600	7518	Drama
16601	7519	Comedy
16602	7519	Drama
16603	7519	Romance
16604	7520	Comedy
16605	7520	Horror
16606	7521	Comedy
16607	7521	Drama
16608	7521	Mystery
16609	7522	Horror
16610	7523	Adventure
16611	7523	Drama
16612	7523	Romance
16613	7524	Drama
16614	7525	Comedy
16615	7526	Comedy
16616	7526	Horror
16617	7527	Drama
16618	7528	Crime
16619	7528	Horror
16620	7528	Thriller
16621	7529	Action
16622	7529	Comedy
16623	7529	Romance
16624	7529	Thriller
16625	7530	Documentary
16626	7531	Adventure
16627	7531	Drama
16628	7532	Documentary
16629	7533	Comedy
16630	7533	Drama
16631	7533	Romance
16632	7534	Drama
16633	7534	Film-Noir
16634	7535	Action
16635	7535	Crime
16636	7535	Drama
16637	7535	Thriller
16638	7536	Comedy
16639	7537	Comedy
16640	7537	Drama
16641	7538	Crime
16642	7538	Drama
16643	7538	Thriller
16644	7539	Animation
16645	7539	Comedy
16646	7540	Crime
16647	7540	Drama
16648	7540	Thriller
16649	7541	Drama
16650	7542	Crime
16651	7542	Drama
16652	7543	Comedy
16653	7544	Documentary
16654	7545	Drama
16655	7545	Musical
16656	7546	Drama
16657	7546	Film-Noir
16658	7546	Thriller
16659	7547	Drama
16660	7547	Sci-Fi
16661	7548	Drama
16662	7548	Thriller
16663	7548	War
16664	7549	Action
16665	7549	Adventure
16666	7549	Animation
16667	7549	Fantasy
16668	7549	IMAX
16669	7550	Drama
16670	7550	Romance
16671	7551	Comedy
16672	7551	Drama
16673	7551	Sci-Fi
16674	7551	Thriller
16675	7552	Comedy
16676	7552	Documentary
16677	7553	Crime
16678	7553	Drama
16679	7553	Film-Noir
16680	7553	Mystery
16681	7554	Drama
16682	7555	Comedy
16683	7555	Drama
16684	7555	Romance
16685	7555	War
16686	7556	Crime
16687	7556	Drama
16688	7556	Thriller
16689	7556	War
16690	7557	Drama
16691	7558	Horror
16692	7558	Sci-Fi
16693	7559	Adventure
16694	7559	Animation
16695	7559	Children
16696	7559	Comedy
16697	7559	Fantasy
16698	7559	Musical
16699	7559	Romance
16700	7560	Action
16701	7560	Crime
16702	7560	Thriller
16703	7561	Comedy
16704	7561	Drama
16705	7561	Romance
16706	7562	Horror
16707	7562	Thriller
16708	7563	Drama
16709	7563	Thriller
16710	7564	Adventure
16711	7564	Children
16712	7564	Fantasy
16713	7565	Action
16714	7565	Horror
16715	7565	Sci-Fi
16716	7565	Thriller
16717	7565	IMAX
16718	7566	Children
16719	7566	Comedy
16720	7567	Animation
16721	7567	Comedy
16722	7567	Sci-Fi
16723	7568	Drama
16724	7569	Drama
16725	7570	Comedy
16726	7570	Drama
16727	7571	Action
16728	7571	Horror
16729	7571	Thriller
16730	7572	Drama
16731	7572	Horror
16732	7572	Mystery
16733	7572	Thriller
16734	7573	Comedy
16735	7573	Drama
16736	7573	Romance
16737	7574	Documentary
16738	7575	Drama
16739	7575	Romance
16740	7576	Documentary
16741	7577	Action
16742	7577	Crime
16743	7577	Drama
16744	7577	War
16745	7578	Documentary
16746	7579	Comedy
16747	7579	Drama
16748	7580	Drama
16749	7581	Action
16750	7581	Crime
16751	7581	Thriller
16752	7582	Crime
16753	7582	Drama
16754	7582	Thriller
16755	7583	Drama
16756	7583	Fantasy
16757	7583	Romance
16758	7584	Drama
16759	7585	Crime
16760	7585	Drama
16761	7586	Drama
16762	7586	Horror
16763	7586	Musical
16764	7586	Thriller
16765	7587	Action
16766	7587	Adventure
16767	7588	Drama
16768	7588	Western
16769	7589	Comedy
16770	7589	Drama
16771	7589	War
16772	7590	Action
16773	7590	Horror
16774	7590	Sci-Fi
16775	7591	Comedy
16776	7591	Musical
16777	7592	Action
16778	7592	Crime
16779	7592	Thriller
16780	7593	Drama
16781	7594	Comedy
16782	7594	Drama
16783	7594	Romance
16784	7595	Adventure
16785	7595	Children
16786	7595	Fantasy
16787	7596	Action
16788	7596	Drama
16789	7596	Sci-Fi
16790	7596	Thriller
16791	7597	Comedy
16792	7597	Drama
16793	7597	Romance
16794	7598	Comedy
16795	7598	Romance
16796	7599	Comedy
16797	7599	Romance
16798	7600	Fantasy
16799	7600	Sci-Fi
16800	7601	Crime
16801	7601	Drama
16802	7601	Thriller
16803	7602	Action
16804	7602	Adventure
16805	7602	Drama
16806	7602	Fantasy
16807	7603	Comedy
16808	7603	Drama
16809	7604	Drama
16810	7604	Horror
16811	7604	Thriller
16812	7605	Action
16813	7605	Adventure
16814	7605	Fantasy
16815	7606	Crime
16816	7606	Drama
16817	7607	Action
16818	7607	Mystery
16819	7607	Sci-Fi
16820	7607	Thriller
16821	7608	Comedy
16822	7608	Crime
16823	7608	Thriller
16824	7609	Crime
16825	7609	Thriller
16826	7610	Drama
16827	7610	Musical
16828	7611	Horror
16829	7611	Mystery
16830	7611	Sci-Fi
16831	7611	Thriller
16832	7612	Animation
16833	7612	Comedy
16834	7612	Drama
16835	7612	Romance
16836	7612	Sci-Fi
16837	7613	Horror
16838	7613	Mystery
16839	7613	Thriller
16840	7614	Crime
16841	7614	Thriller
16842	7615	Action
16843	7615	Drama
16844	7615	Thriller
16845	7615	War
16846	7616	Comedy
16847	7617	Drama
16848	7617	Horror
16849	7617	Thriller
16850	7618	Comedy
16851	7618	Fantasy
16852	7618	Romance
16853	7619	Horror
16854	7619	Sci-Fi
16855	7619	Thriller
16856	7620	Action
16857	7620	Adventure
16858	7620	Fantasy
16859	7620	Sci-Fi
16860	7621	Comedy
16861	7621	Crime
16862	7621	Drama
16863	7621	Thriller
16864	7622	Drama
16865	7622	Fantasy
16866	7622	War
16867	7623	Action
16868	7623	Crime
16869	7623	Drama
16870	7624	Comedy
16871	7624	Horror
16872	7625	Comedy
16873	7626	Action
16874	7626	Adventure
16875	7626	Comedy
16876	7626	Romance
16877	7627	Drama
16878	7628	Documentary
16879	7629	Comedy
16880	7629	Drama
16881	7630	Drama
16882	7630	Horror
16883	7631	Action
16884	7631	Adventure
16885	7631	Drama
16886	7631	Sci-Fi
16887	7631	Thriller
16888	7632	Drama
16889	7633	Comedy
16890	7633	Drama
16891	7633	Romance
16892	7634	Drama
16893	7635	Crime
16894	7635	Drama
16895	7635	Romance
16896	7635	Thriller
16897	7636	Action
16898	7636	Drama
16899	7636	Thriller
16900	7637	Adventure
16901	7637	Children
16902	7637	Drama
16903	7637	Fantasy
16904	7637	IMAX
16905	7638	Drama
16906	7638	Musical
16907	7638	Romance
16908	7639	Fantasy
16909	7639	Romance
16910	7639	Sci-Fi
16911	7640	Comedy
16912	7641	Drama
16913	7641	Romance
16914	7642	Comedy
16915	7643	Comedy
16916	7643	Romance
16917	7644	Documentary
16918	7645	Drama
16919	7646	Drama
16920	7646	Thriller
16921	7647	Comedy
16922	7648	Adventure
16923	7648	Romance
16924	7648	Thriller
16925	7649	Action
16926	7649	Crime
16927	7649	Thriller
16928	7650	Action
16929	7650	Drama
16930	7650	Sci-Fi
16931	7650	Thriller
16932	7651	Adventure
16933	7651	Animation
16934	7651	Children
16935	7651	Comedy
16936	7652	Drama
16937	7652	Thriller
16938	7653	Crime
16939	7653	Drama
16940	7653	War
16941	7654	Drama
16942	7654	War
16943	7655	Comedy
16944	7656	Horror
16945	7656	Sci-Fi
16946	7657	Comedy
16947	7657	Fantasy
16948	7657	Romance
16949	7658	Drama
16950	7659	Mystery
16951	7659	Thriller
16952	7660	Documentary
16953	7660	War
16954	7661	Action
16955	7661	Adventure
16956	7661	Animation
16957	7661	Fantasy
16958	7661	Sci-Fi
16959	7662	Comedy
16960	7662	Drama
16961	7662	Romance
16962	7663	Documentary
16963	7664	Comedy
16964	7664	Drama
16965	7665	Drama
16966	7666	Horror
16967	7666	Romance
16968	7666	Sci-Fi
16969	7667	Comedy
16970	7667	Romance
16971	7668	Drama
16972	7669	Crime
16973	7669	Drama
16974	7669	Romance
16975	7670	Action
16976	7670	Crime
16977	7670	Drama
16978	7670	IMAX
16979	7671	Crime
16980	7671	Mystery
16981	7672	Comedy
16982	7673	Action
16983	7674	Children
16984	7674	Comedy
16985	7674	Sci-Fi
16986	7675	Drama
16987	7675	Fantasy
16988	7675	Romance
16989	7676	Drama
16990	7676	Romance
16991	7676	Sci-Fi
16992	7677	Crime
16993	7677	Drama
16994	7677	Romance
16995	7677	Thriller
16996	7678	Comedy
16997	7678	Drama
16998	7678	Romance
16999	7679	Drama
17000	7679	Romance
17001	7680	Comedy
17002	7680	Drama
17003	7680	Romance
17004	7681	Comedy
17005	7682	Drama
17006	7682	War
17007	7683	Documentary
17008	7683	Musical
17009	7683	IMAX
17010	7684	Drama
17011	7685	Documentary
17012	7686	Drama
17013	7686	Thriller
17014	7687	Adventure
17015	7687	Comedy
17016	7687	Fantasy
17017	7688	Horror
17018	7688	Thriller
17019	7689	Comedy
17020	7689	Romance
17021	7690	Comedy
17022	7690	Drama
17023	7691	Action
17024	7691	Comedy
17025	7691	Sci-Fi
17026	7692	Crime
17027	7692	Drama
17028	7692	Thriller
17029	7693	Drama
17030	7693	Romance
17031	7694	Adventure
17032	7694	Comedy
17033	7695	Comedy
17034	7696	Action
17035	7696	Children
17036	7696	Sci-Fi
17037	7696	IMAX
17038	7697	Action
17039	7697	Horror
17040	7698	Drama
17041	7699	Action
17042	7699	Adventure
17043	7699	Comedy
17044	7699	Fantasy
17045	7700	Documentary
17046	7701	Drama
17047	7701	Thriller
17048	7702	Comedy
17049	7702	Drama
17050	7703	Comedy
17051	7703	Documentary
17052	7704	Action
17053	7704	Horror
17054	7705	Children
17055	7705	Comedy
17056	7705	Drama
17057	7706	Comedy
17058	7706	Documentary
17059	7707	Crime
17060	7707	Horror
17061	7707	Mystery
17062	7708	Action
17063	7708	Drama
17064	7708	Thriller
17065	7709	Western
17066	7710	Action
17067	7710	Drama
17068	7710	Thriller
17069	7711	Comedy
17070	7712	Comedy
17071	7712	Drama
17072	7713	Drama
17073	7714	Horror
17074	7714	Mystery
17075	7714	Thriller
17076	7715	Action
17077	7715	Adventure
17078	7715	Sci-Fi
17079	7716	Comedy
17080	7716	Romance
17081	7717	Action
17082	7717	Drama
17083	7718	Crime
17084	7718	Thriller
17085	7719	Action
17086	7719	Crime
17087	7719	Drama
17088	7719	Thriller
17089	7720	Adventure
17090	7720	Drama
17091	7720	Fantasy
17092	7721	Action
17093	7721	Fantasy
17094	7721	Sci-Fi
17095	7722	Comedy
17096	7722	Drama
17097	7723	Crime
17098	7724	Comedy
17099	7724	Romance
17100	7725	Comedy
17101	7726	Drama
17102	7726	Film-Noir
17103	7726	Romance
17104	7726	Thriller
17105	7727	Documentary
17106	7728	Adventure
17107	7728	Children
17108	7728	Fantasy
17109	7729	Drama
17110	7729	Film-Noir
17111	7729	Thriller
17112	7730	Documentary
17113	7730	Musical
17114	7731	Comedy
17115	7731	Crime
17116	7731	Thriller
17117	7732	Crime
17118	7732	Drama
17119	7732	Horror
17120	7732	Thriller
17121	7733	Action
17122	7733	Adventure
17123	7733	Comedy
17124	7733	Sci-Fi
17125	7734	Comedy
17126	7734	Crime
17127	7734	Mystery
17128	7734	Thriller
17129	7735	Documentary
17130	7736	Crime
17131	7736	Mystery
17132	7736	Romance
17133	7736	Thriller
17134	7737	Comedy
17135	7738	Comedy
17136	7738	Romance
17137	7739	Horror
17138	7739	Thriller
17139	7740	Documentary
17140	7741	Horror
17141	7741	Mystery
17142	7741	Thriller
17143	7742	Action
17144	7742	Animation
17145	7742	Children
17146	7742	Comedy
17147	7742	IMAX
17148	7743	Drama
17149	7744	Crime
17150	7744	Drama
17151	7744	Film-Noir
17152	7745	Western
17153	7746	Crime
17154	7746	Mystery
17155	7746	Thriller
17156	7747	Comedy
17157	7748	Comedy
17158	7749	Drama
17159	7750	Comedy
17160	7750	Crime
17161	7750	Drama
17162	7751	Adventure
17163	7752	Romance
17164	7752	Western
17165	7753	Drama
17166	7754	Comedy
17167	7754	Drama
17168	7754	Romance
17169	7755	Crime
17170	7755	Drama
17171	7756	Action
17172	7756	Drama
17173	7756	War
17174	7757	Drama
17175	7757	Sci-Fi
17176	7757	Thriller
17177	7758	Action
17178	7758	Sci-Fi
17179	7759	Comedy
17180	7759	Drama
17181	7759	Horror
17182	7760	Drama
17183	7760	War
17184	7761	Adventure
17185	7761	Animation
17186	7761	Children
17187	7761	Romance
17188	7761	Sci-Fi
17189	7762	Action
17190	7762	Thriller
17191	7763	Action
17192	7763	Adventure
17193	7763	Comedy
17194	7763	Crime
17195	7763	Fantasy
17196	7764	Crime
17197	7764	Drama
17198	7764	Film-Noir
17199	7765	Action
17200	7765	Comedy
17201	7766	Drama
17202	7767	Documentary
17203	7768	Drama
17204	7769	Action
17205	7769	Animation
17206	7769	Comedy
17207	7769	Romance
17208	7769	Sci-Fi
17209	7770	Crime
17210	7770	Drama
17211	7770	Romance
17212	7771	Comedy
17213	7771	Western
17214	7772	Documentary
17215	7773	Comedy
17216	7773	Drama
17217	7773	Romance
17218	7774	Documentary
17219	7775	Adventure
17220	7776	Western
17221	7777	Western
17222	7778	Documentary
17223	7779	Sci-Fi
17224	7779	Thriller
17225	7780	Comedy
17226	7780	Horror
17227	7781	Documentary
17228	7782	Comedy
17229	7782	Musical
17230	7782	Romance
17231	7783	Drama
17232	7784	Action
17233	7784	Adventure
17234	7784	Horror
17235	7784	Thriller
17236	7785	Drama
17237	7786	Animation
17238	7786	Children
17239	7786	Comedy
17240	7787	Drama
17241	7787	War
17242	7788	Action
17243	7788	Adventure
17244	7788	Sci-Fi
17245	7789	Adventure
17246	7789	Children
17247	7789	Comedy
17248	7789	Romance
17249	7789	Sci-Fi
17250	7790	Drama
17251	7790	Romance
17252	7790	Thriller
17253	7791	Drama
17254	7792	Drama
17255	7793	Crime
17256	7793	Drama
17257	7793	Thriller
17258	7794	Horror
17259	7794	Mystery
17260	7794	Thriller
17261	7795	Adventure
17262	7795	Crime
17263	7795	Drama
17264	7795	Horror
17265	7795	Mystery
17266	7796	Crime
17267	7796	Drama
17268	7796	Thriller
17269	7797	Sci-Fi
17270	7798	Action
17271	7798	Drama
17272	7798	Mystery
17273	7798	Sci-Fi
17274	7798	Thriller
17275	7798	IMAX
17276	7799	Action
17277	7799	Drama
17278	7799	Mystery
17279	7799	Thriller
17280	7799	War
17281	7800	Drama
17282	7800	Thriller
17283	7801	Crime
17284	7801	Drama
17285	7802	Comedy
17286	7803	Drama
17287	7804	Drama
17288	7804	Mystery
17289	7804	Sci-Fi
17290	7804	Thriller
17291	7805	Documentary
17292	7806	Adventure
17293	7806	Comedy
17294	7806	Fantasy
17295	7807	Action
17296	7807	Horror
17297	7807	Thriller
17298	7808	Crime
17299	7808	Horror
17300	7808	Thriller
17301	7809	Drama
17302	7809	Romance
17303	7809	War
17304	7810	Comedy
17305	7810	Drama
17306	7810	Sci-Fi
17307	7811	Action
17308	7811	Adventure
17309	7811	Fantasy
17310	7811	Thriller
17311	7812	Comedy
17312	7812	Drama
17313	7813	Horror
17314	7813	Mystery
17315	7813	Thriller
17316	7814	Drama
17317	7815	Drama
17318	7816	Comedy
17319	7816	Drama
17320	7816	Romance
17321	7817	Action
17322	7817	Animation
17323	7817	Crime
17324	7818	Action
17325	7818	Romance
17326	7818	Thriller
17327	7819	Drama
17328	7819	Mystery
17329	7820	Action
17330	7820	Comedy
17331	7820	Crime
17332	7821	Action
17333	7821	Adventure
17334	7821	Drama
17335	7821	War
17336	7822	Comedy
17337	7823	Comedy
17338	7823	Drama
17339	7823	Romance
17340	7824	Adventure
17341	7824	Comedy
17342	7824	Drama
17343	7824	Romance
17344	7825	Drama
17345	7825	Romance
17346	7826	Comedy
17347	7826	Drama
17348	7826	Musical
17349	7826	Romance
17350	7827	Action
17351	7827	Adventure
17352	7827	Comedy
17353	7827	War
17354	7828	Horror
17355	7828	Sci-Fi
17356	7828	Thriller
17357	7828	War
17358	7829	Action
17359	7829	Adventure
17360	7829	Animation
17361	7829	Sci-Fi
17362	7830	Action
17363	7830	Adventure
17364	7830	Sci-Fi
17365	7831	Animation
17366	7831	Documentary
17367	7831	Drama
17368	7831	War
17369	7832	Drama
17370	7832	Fantasy
17371	7832	Horror
17372	7832	Romance
17373	7833	Comedy
17374	7834	Action
17375	7834	Adventure
17376	7834	Sci-Fi
17377	7834	Thriller
17378	7835	Comedy
17379	7836	Drama
17380	7837	Comedy
17381	7838	Documentary
17382	7839	Horror
17383	7839	Mystery
17384	7839	Thriller
17385	7840	Action
17386	7840	Western
17387	7841	Comedy
17388	7841	Drama
17389	7842	Action
17390	7842	Crime
17391	7842	Mystery
17392	7842	Thriller
17393	7843	Drama
17394	7844	Comedy
17395	7844	Crime
17396	7844	Drama
17397	7845	Comedy
17398	7846	Action
17399	7846	Adventure
17400	7846	Sci-Fi
17401	7846	Thriller
17402	7847	Crime
17403	7847	Drama
17404	7847	Thriller
17405	7848	Comedy
17406	7849	Comedy
17407	7849	Drama
17408	7850	Comedy
17409	7851	Crime
17410	7851	Western
17411	7852	Action
17412	7852	Comedy
17413	7852	Fantasy
17414	7852	Thriller
17415	7853	Drama
17416	7854	Musical
17417	7854	War
17418	7855	Drama
17419	7855	Romance
17420	7856	Drama
17421	7856	War
17422	7857	Action
17423	7857	Crime
17424	7857	Thriller
17425	7858	Comedy
17426	7858	Romance
17427	7859	Drama
17428	7859	War
17429	7860	Horror
17430	7860	Sci-Fi
17431	7860	Thriller
17432	7861	Crime
17433	7861	Mystery
17434	7861	Thriller
17435	7862	Drama
17436	7862	Thriller
17437	7863	Comedy
17438	7863	Fantasy
17439	7863	Romance
17440	7864	Drama
17441	7865	Action
17442	7865	Comedy
17443	7866	Comedy
17444	7866	Drama
17445	7867	Thriller
17446	7868	Western
17447	7869	Drama
17448	7869	Sci-Fi
17449	7870	Action
17450	7870	Crime
17451	7870	Thriller
17452	7870	IMAX
17453	7871	Comedy
17454	7872	Comedy
17455	7872	Drama
17456	7873	Drama
17457	7874	Comedy
17458	7874	Drama
17459	7874	Romance
17460	7875	Documentary
17461	7876	Horror
17462	7877	Drama
17463	7878	Drama
17464	7878	Thriller
17465	7879	Crime
17466	7879	Drama
17467	7880	Comedy
17468	7880	Romance
17469	7881	Drama
17470	7881	Romance
17471	7882	Action
17472	7882	Adventure
17473	7882	Animation
17474	7882	Comedy
17475	7882	Sci-Fi
17476	7883	Animation
17477	7883	Comedy
17478	7883	Fantasy
17479	7883	Sci-Fi
17480	7884	Drama
17481	7884	Romance
17482	7885	Action
17483	7885	Drama
17484	7885	Thriller
17485	7886	Adventure
17486	7886	Children
17487	7886	Sci-Fi
17488	7887	Comedy
17489	7888	Action
17490	7888	Crime
17491	7888	Drama
17492	7888	Thriller
17493	7889	Comedy
17494	7889	Drama
17495	7889	Romance
17496	7890	Drama
17497	7891	Comedy
17498	7891	Romance
17499	7892	Comedy
17500	7892	Drama
17501	7893	Drama
17502	7894	Mystery
17503	7894	Thriller
17504	7895	Drama
17505	7896	Drama
17506	7897	Comedy
17507	7897	Fantasy
17508	7898	Drama
17509	7899	Comedy
17510	7899	Romance
17511	7900	Drama
17512	7900	Horror
17513	7900	Mystery
17514	7900	Thriller
17515	7901	Fantasy
17516	7901	Mystery
17517	7901	Sci-Fi
17518	7901	War
17519	7902	Comedy
17520	7902	Horror
17521	7902	Thriller
17522	7903	Crime
17523	7903	Drama
17524	7904	Drama
17525	7905	Action
17526	7905	Drama
17527	7906	Action
17528	7907	Action
17529	7907	Crime
17530	7908	Action
17531	7908	Adventure
17532	7908	Animation
17533	7908	Comedy
17534	7908	Fantasy
17535	7908	Sci-Fi
17536	7909	Adventure
17537	7909	Fantasy
17538	7909	Sci-Fi
17539	7910	Action
17540	7910	Adventure
17541	7910	Animation
17542	7910	Children
17543	7910	Comedy
17544	7910	IMAX
17545	7911	Drama
17546	7911	Mystery
17547	7911	Romance
17548	7911	Thriller
17549	7912	Crime
17550	7912	Drama
17551	7912	Mystery
17552	7913	Adventure
17553	7913	Drama
17554	7913	Thriller
17555	7914	Crime
17556	7914	Drama
17557	7914	Romance
17558	7915	Action
17559	7915	Adventure
17560	7915	Thriller
17561	7916	Drama
17562	7916	Romance
17563	7917	Comedy
17564	7918	Action
17565	7918	Horror
17566	7919	Horror
17567	7919	Mystery
17568	7920	Action
17569	7920	Drama
17570	7920	Thriller
17571	7921	Comedy
17572	7921	Crime
17573	7922	Action
17574	7922	Adventure
17575	7922	Sci-Fi
17576	7923	Crime
17577	7923	Horror
17578	7923	Thriller
17579	7924	Comedy
17580	7925	Comedy
17581	7925	Musical
17582	7926	Drama
17583	7926	Mystery
17584	7927	Adventure
17585	7927	Children
17586	7927	Comedy
17587	7928	Drama
17588	7929	Action
17589	7929	Horror
17590	7929	Thriller
17591	7930	Adventure
17592	7930	Drama
17593	7930	War
17594	7930	Western
17595	7931	Action
17596	7931	Adventure
17597	7931	Animation
17598	7931	Children
17599	7931	Comedy
17600	7932	Drama
17601	7933	Horror
17602	7933	Sci-Fi
17603	7934	Drama
17604	7934	Fantasy
17605	7934	Romance
17606	7934	Thriller
17607	7935	Horror
17608	7936	Action
17609	7936	Adventure
17610	7936	Crime
17611	7936	Thriller
17612	7937	Comedy
17613	7938	Drama
17614	7938	War
17615	7939	Crime
17616	7939	Mystery
17617	7939	Thriller
17618	7940	Animation
17619	7940	Comedy
17620	7941	Drama
17621	7942	Drama
17622	7942	Musical
17623	7943	Action
17624	7943	Crime
17625	7943	Drama
17626	7943	Thriller
17627	7944	Documentary
17628	7945	Animation
17629	7945	Comedy
17630	7946	Drama
17631	7946	Sci-Fi
17632	7946	Thriller
17633	7946	IMAX
17634	7947	Drama
17635	7947	War
17636	7948	Comedy
17637	7948	Drama
17638	7949	Crime
17639	7949	Drama
17640	7950	Crime
17641	7950	Drama
17642	7950	Film-Noir
17643	7951	Drama
17644	7951	Mystery
17645	7952	Crime
17646	7952	Drama
17647	7953	Drama
17648	7954	Drama
17649	7954	Romance
17650	7955	Drama
17651	7955	Mystery
17652	7956	Drama
17653	7957	Drama
17654	7958	Comedy
17655	7958	Romance
17656	7959	Drama
17657	7959	Fantasy
17658	7959	Mystery
17659	7959	Romance
17660	7960	Comedy
17661	7961	Drama
17662	7961	Thriller
17663	7961	War
17664	7962	Documentary
17665	7963	Animation
17666	7963	Drama
17667	7963	Romance
17668	7964	Action
17669	7964	Sci-Fi
17670	7965	Mystery
17671	7965	Sci-Fi
17672	7965	Thriller
17673	7966	Adventure
17674	7966	Children
17675	7966	Comedy
17676	7967	Crime
17677	7967	Drama
17678	7967	Romance
17679	7968	Comedy
17680	7968	Drama
17681	7969	Drama
17682	7969	Romance
17683	7970	Comedy
17684	7971	Comedy
17685	7972	Comedy
17686	7973	Comedy
17687	7973	Crime
17688	7973	Drama
17689	7973	Thriller
17690	7974	Documentary
17691	7975	Drama
17692	7975	Thriller
17693	7975	War
17694	7976	Documentary
17695	7977	Comedy
17696	7977	Drama
17697	7978	Crime
17698	7978	Drama
17699	7978	Mystery
17700	7979	Adventure
17701	7979	Animation
17702	7979	Children
17703	7979	Fantasy
17704	7980	Drama
17705	7980	Mystery
17706	7980	Thriller
17707	7981	Adventure
17708	7981	Drama
17709	7981	Fantasy
17710	7982	Western
17711	7983	Drama
17712	7984	Drama
17713	7984	Romance
17714	7985	Action
17715	7985	Drama
17716	7985	War
17717	7986	Action
17718	7986	Sci-Fi
17719	7986	Thriller
17720	7987	Drama
17721	7987	Mystery
17722	7987	Thriller
17723	7988	Adventure
17724	7988	Animation
17725	7988	Children
17726	7988	Comedy
17727	7988	Fantasy
17728	7989	Comedy
17729	7989	Romance
17730	7990	Action
17731	7990	Crime
17732	7990	Drama
17733	7990	Thriller
17734	7991	Horror
17735	7991	Thriller
17736	7992	Action
17737	7992	Drama
17738	7993	Sci-Fi
17739	7993	Thriller
17740	7994	Drama
17741	7995	Action
17742	7995	Fantasy
17743	7995	Horror
17744	7995	Thriller
17745	7996	Adventure
17746	7996	Fantasy
17747	7997	Crime
17748	7997	Mystery
17749	7997	Thriller
17750	7998	Comedy
17751	7998	Romance
17752	7999	Action
17753	7999	Comedy
17754	7999	Crime
17755	8000	Drama
17756	8000	Musical
17757	8001	Horror
17758	8001	Mystery
17759	8001	Thriller
17760	8002	Crime
17761	8002	Drama
17762	8003	Fantasy
17763	8003	Horror
17764	8003	Musical
17765	8004	Drama
17766	8004	Horror
17767	8004	Mystery
17768	8004	Thriller
17769	8005	Comedy
17770	8005	Romance
17771	8005	Sci-Fi
17772	8005	Thriller
17773	8006	Action
17774	8006	Mystery
17775	8006	Thriller
17776	8007	Action
17777	8007	Adventure
17778	8007	Sci-Fi
17779	8008	Action
17780	8008	Drama
17781	8008	Romance
17782	8008	War
17783	8009	Drama
17784	8009	Mystery
17785	8010	Horror
17786	8010	Thriller
17787	8011	Animation
17788	8011	Fantasy
17789	8011	Thriller
17790	8012	Documentary
17791	8013	Action
17792	8013	Drama
17793	8014	Thriller
17794	8015	Sci-Fi
17795	8015	Thriller
17796	8016	Drama
17797	8016	Thriller
17798	8017	Drama
17799	8017	Romance
17800	8018	Comedy
17801	8018	Drama
17802	8018	Romance
17803	8019	Crime
17804	8019	Drama
17805	8019	Thriller
17806	8020	Comedy
17807	8020	Fantasy
17808	8021	Action
17809	8021	Animation
17810	8021	Comedy
17811	8021	Sci-Fi
17812	8022	Drama
17813	8022	Horror
17814	8022	Thriller
17815	8023	Documentary
17816	8024	Animation
17817	8025	Drama
17818	8026	Drama
17819	8027	Drama
17820	8027	War
17821	8028	Comedy
17822	8028	Horror
17823	8029	Action
17824	8029	Thriller
17825	8030	Comedy
17826	8030	Drama
17827	8031	Comedy
17828	8031	Drama
17829	8032	Comedy
17830	8033	Comedy
17831	8033	Crime
17832	8033	Mystery
17833	8034	Action
17834	8034	Adventure
17835	8034	Sci-Fi
17836	8034	Thriller
17837	8035	Comedy
17838	8035	Crime
17839	8035	Drama
17840	8036	Comedy
17841	8036	Drama
17842	8036	Romance
17843	8037	Drama
17844	8037	Film-Noir
17845	8037	Thriller
17846	8038	Crime
17847	8039	Drama
17848	8040	Comedy
17849	8040	Drama
17850	8040	Romance
17851	8041	Horror
17852	8042	Action
17853	8042	Adventure
17854	8042	Comedy
17855	8042	Western
17856	8043	Adventure
17857	8043	Comedy
17858	8043	Mystery
17859	8044	Documentary
17860	8045	Action
17861	8045	Adventure
17862	8045	Drama
17863	8046	Comedy
17864	8046	Drama
17865	8046	Musical
17866	8046	Sci-Fi
17867	8047	Horror
17868	8048	Comedy
17869	8049	Adventure
17870	8049	Drama
17871	8049	Film-Noir
17872	8049	Thriller
17873	8050	Horror
17874	8050	Thriller
17875	8051	Crime
17876	8051	Romance
17877	8051	Thriller
17878	8052	Action
17879	8052	Drama
17880	8052	Mystery
17881	8052	Sci-Fi
17882	8052	Thriller
17883	8053	Drama
17884	8054	Action
17885	8055	Crime
17886	8055	Drama
17887	8055	Mystery
17888	8055	Thriller
17889	8056	Comedy
17890	8056	Drama
17891	8057	Action
17892	8057	Animation
17893	8057	Children
17894	8057	Comedy
17895	8058	Action
17896	8058	Mystery
17897	8058	Thriller
17898	8059	Comedy
17899	8059	Drama
17900	8059	Romance
17901	8060	Animation
17902	8060	Sci-Fi
17903	8060	IMAX
17904	8061	Comedy
17905	8061	Drama
17906	8061	War
17907	8062	Action
17908	8062	Crime
17909	8062	Drama
17910	8062	Thriller
17911	8063	Drama
17912	8063	Thriller
17913	8064	Thriller
17914	8065	Documentary
17915	8065	Musical
17916	8066	Action
17917	8066	Comedy
17918	8067	Drama
17919	8067	Film-Noir
17920	8068	Comedy
17921	8068	Drama
17922	8069	Comedy
17923	8069	Drama
17924	8069	Romance
17925	8070	Comedy
17926	8070	Romance
17927	8071	Drama
17928	8071	Fantasy
17929	8071	Sci-Fi
17930	8071	Thriller
17931	8072	Crime
17932	8072	Drama
17933	8072	Romance
17934	8073	Action
17935	8073	Adventure
17936	8073	Fantasy
17937	8073	Sci-Fi
17938	8074	Comedy
17939	8075	Comedy
17940	8075	Musical
17941	8075	Romance
17942	8076	Horror
17943	8076	Thriller
17944	8077	Action
17945	8077	Crime
17946	8077	Drama
17947	8077	Thriller
17948	8078	Comedy
17949	8079	Crime
17950	8079	Drama
17951	8080	Crime
17952	8080	Drama
17953	8080	Film-Noir
17954	8081	Western
17955	8082	Western
17956	8083	Comedy
17957	8083	Drama
17958	8084	Documentary
17959	8085	Comedy
17960	8085	Drama
17961	8086	Action
17962	8086	Drama
17963	8086	War
17964	8087	Crime
17965	8087	Drama
17966	8087	Thriller
17967	8088	Drama
17968	8089	Action
17969	8089	Comedy
17970	8089	Crime
17971	8090	Drama
17972	8090	Mystery
17973	8090	Sci-Fi
17974	8090	Thriller
17975	8091	Drama
17976	8091	Romance
17977	8092	Crime
17978	8092	Drama
17979	8092	Thriller
17980	8093	Action
17981	8093	Sci-Fi
17982	8093	Thriller
17983	8094	Drama
17984	8095	Crime
17985	8095	Drama
17986	8095	Thriller
17987	8096	Action
17988	8096	Adventure
17989	8096	Sci-Fi
17990	8096	IMAX
17991	8097	Comedy
17992	8098	Comedy
17993	8098	Drama
17994	8099	Comedy
17995	8100	Action
17996	8100	Crime
17997	8100	Mystery
17998	8100	Thriller
17999	8101	Action
18000	8101	Drama
18001	8101	War
18002	8102	Crime
18003	8102	Mystery
18004	8102	Sci-Fi
18005	8102	Thriller
18006	8103	Documentary
18007	8104	Drama
18008	8105	Crime
18009	8105	Drama
18010	8105	Mystery
18011	8105	Thriller
18012	8106	Drama
18013	8107	Adventure
18014	8107	Comedy
18015	8107	Drama
18016	8108	Drama
18017	8109	Comedy
18018	8109	Romance
18019	8110	Action
18020	8110	Adventure
18021	8110	Sci-Fi
18022	8110	Thriller
18023	8111	Action
18024	8111	Comedy
18025	8111	IMAX
18026	8112	Documentary
18027	8113	Action
18028	8113	Comedy
18029	8113	Horror
18030	8114	Adventure
18031	8114	Comedy
18032	8114	Crime
18033	8114	Romance
18034	8115	Drama
18035	8115	Romance
18036	8116	Drama
18037	8116	War
18038	8117	Drama
18039	8118	Drama
18040	8118	Musical
18041	8119	Drama
18042	8119	Horror
18043	8119	Thriller
18044	8120	Comedy
18045	8120	Horror
18046	8121	Adventure
18047	8121	Animation
18048	8121	Children
18049	8121	Drama
18050	8122	Action
18051	8122	Adventure
18052	8122	Animation
18053	8122	Drama
18054	8123	Comedy
18055	8123	Romance
18056	8124	Drama
18057	8125	Drama
18058	8125	Romance
18059	8126	Comedy
18060	8126	Drama
18061	8126	Romance
18062	8127	Adventure
18063	8127	Comedy
18064	8128	Adventure
18065	8128	Comedy
18066	8129	Drama
18067	8129	Mystery
18068	8130	Comedy
18069	8130	Crime
18070	8131	Action
18071	8131	Crime
18072	8131	Drama
18073	8131	Thriller
18074	8132	Drama
18075	8132	Fantasy
18076	8133	Comedy
18077	8133	Musical
18078	8134	Comedy
18079	8134	Romance
18080	8135	Action
18081	8135	Adventure
18082	8135	Comedy
18083	8135	Horror
18084	8136	Action
18085	8136	Adventure
18086	8136	Comedy
18087	8136	Sci-Fi
18088	8137	Comedy
18089	8138	Crime
18090	8138	Drama
18091	8138	Thriller
18092	8139	Action
18093	8139	Drama
18094	8139	War
18095	8140	Thriller
18096	8140	War
18097	8141	Drama
18098	8141	Romance
18099	8142	Action
18100	8142	Crime
18101	8142	Thriller
18102	8143	Comedy
18103	8143	Romance
18104	8144	Adventure
18105	8144	Comedy
18106	8145	Comedy
18107	8145	Drama
18108	8146	Adventure
18109	8146	Sci-Fi
18110	8147	Documentary
18111	8148	Action
18112	8148	Drama
18113	8148	Thriller
18114	8148	War
18115	8149	Crime
18116	8149	Drama
18117	8149	Film-Noir
18118	8150	Action
18119	8150	Adventure
18120	8150	Thriller
18121	8151	Action
18122	8151	Adventure
18123	8151	Sci-Fi
18124	8151	IMAX
18125	8152	Documentary
18126	8153	Adventure
18127	8153	Drama
18128	8154	Crime
18129	8154	Drama
18130	8154	Film-Noir
18131	8154	Mystery
18132	8155	Comedy
18133	8155	Romance
18134	8156	Comedy
18135	8156	Fantasy
18136	8156	Romance
18137	8157	Crime
18138	8157	Drama
18139	8157	Mystery
18140	8157	Thriller
18141	8158	Crime
18142	8158	Drama
18143	8158	Thriller
18144	8159	Action
18145	8159	Adventure
18146	8159	Animation
18147	8159	Children
18148	8159	Comedy
18149	8159	Romance
18150	8160	Crime
18151	8160	Drama
18152	8160	Film-Noir
18153	8161	Drama
18154	8162	Action
18155	8162	Adventure
18156	8162	Animation
18157	8162	Horror
18158	8163	Comedy
18159	8163	Drama
18160	8163	Romance
18161	8164	Drama
18162	8164	Romance
18163	8165	Comedy
18164	8166	Documentary
18165	8167	Adventure
18166	8167	Animation
18167	8167	Children
18168	8167	Comedy
18169	8168	Adventure
18170	8168	Fantasy
18171	8168	Mystery
18172	8168	Romance
18173	8168	IMAX
18174	8169	Drama
18175	8169	War
18176	8170	Drama
18177	8170	Thriller
18178	8171	Drama
18179	8172	Comedy
18180	8172	Drama
18181	8172	Romance
18182	8173	Drama
18183	8173	Fantasy
18184	8174	Horror
18185	8174	Thriller
18186	8175	Comedy
18187	8176	Drama
18188	8177	Crime
18189	8177	Drama
18190	8178	Romance
18191	8179	Comedy
18192	8179	Musical
18193	8179	Romance
18194	8180	Drama
18195	8180	Horror
18196	8180	Mystery
18197	8180	Thriller
18198	8181	Comedy
18199	8181	Drama
18200	8181	Romance
18201	8182	Crime
18202	8182	Horror
18203	8182	Thriller
18204	8183	Horror
18205	8183	Thriller
18206	8184	Mystery
18207	8184	Sci-Fi
18208	8184	Thriller
18209	8185	Comedy
18210	8185	Drama
18211	8185	Romance
18212	8186	Crime
18213	8186	Drama
18214	8186	Thriller
18215	8187	Adventure
18216	8187	Children
18217	8187	Fantasy
18218	8187	Sci-Fi
18219	8187	Thriller
18220	8188	Action
18221	8188	Adventure
18222	8188	Sci-Fi
18223	8188	Thriller
18224	8189	Drama
18225	8189	War
18226	8190	Comedy
18227	8190	Drama
18228	8191	Drama
18229	8192	Action
18230	8192	Thriller
18231	8193	Drama
18232	8193	Film-Noir
18233	8193	Romance
18234	8193	Thriller
18235	8194	Action
18236	8194	Drama
18237	8194	War
18238	8195	Action
18239	8195	Animation
18240	8195	Sci-Fi
18241	8196	Comedy
18242	8197	Comedy
18243	8197	Drama
18244	8197	Romance
18245	8198	Comedy
18246	8199	Drama
18247	8199	Romance
18248	8200	Comedy
18249	8201	Drama
18250	8201	Romance
18251	8201	Sci-Fi
18252	8202	Documentary
18253	8203	Comedy
18254	8203	Romance
18255	8204	Crime
18256	8204	Drama
18257	8204	Film-Noir
18258	8205	Crime
18259	8205	Drama
18260	8205	Film-Noir
18261	8206	Action
18262	8206	Drama
18263	8207	Drama
18264	8208	Action
18265	8208	Comedy
18266	8208	Drama
18267	8208	Thriller
18268	8209	Western
18269	8210	Drama
18270	8211	Crime
18271	8211	Thriller
18272	8212	Documentary
18273	8213	Drama
18274	8214	Comedy
18275	8215	Fantasy
18276	8215	Horror
18277	8216	Drama
18278	8216	Musical
18279	8216	Romance
18280	8217	Drama
18281	8217	Romance
18282	8218	Comedy
18283	8219	Horror
18284	8219	Thriller
18285	8220	Thriller
18286	8220	War
18287	8221	Crime
18288	8221	Drama
18289	8221	Film-Noir
18290	8222	Drama
18291	8223	Crime
18292	8223	Drama
18293	8223	Mystery
18294	8223	Romance
18295	8223	Thriller
18296	8224	Adventure
18297	8224	Animation
18298	8224	Sci-Fi
18299	8225	Comedy
18300	8225	Sci-Fi
18301	8226	Drama
18302	8226	Mystery
18303	8227	Action
18304	8227	Adventure
18305	8227	Animation
18306	8227	Fantasy
18307	8227	Sci-Fi
18308	8228	Documentary
18309	8229	Horror
18310	8229	Sci-Fi
18311	8229	Thriller
18312	8230	Adventure
18313	8230	Drama
18314	8230	Romance
18315	8231	Action
18316	8231	Comedy
18317	8231	Drama
18318	8232	Documentary
18319	8233	Comedy
18320	8233	Horror
18321	8233	Sci-Fi
18322	8233	Thriller
18323	8234	Comedy
18324	8234	Crime
18325	8234	Drama
18326	8234	Thriller
18327	8235	Drama
18328	8235	Horror
18329	8235	Thriller
18330	8236	Action
18331	8236	Adventure
18332	8236	Drama
18333	8236	Romance
18334	8236	Western
18335	8237	Comedy
18336	8238	Horror
18337	8238	Thriller
18338	8239	Action
18339	8239	Sci-Fi
18340	8239	Thriller
18341	8240	Animation
18342	8240	Children
18343	8240	Fantasy
18344	8240	IMAX
18345	8241	Documentary
18346	8242	Comedy
18347	8242	Drama
18348	8243	Comedy
18349	8243	Sci-Fi
18350	8244	Drama
18351	8244	Horror
18352	8245	Adventure
18353	8245	Animation
18354	8245	Sci-Fi
18355	8246	Comedy
18356	8246	Drama
18357	8246	Romance
18358	8247	Drama
18359	8247	Romance
18360	8248	Horror
18361	8249	Horror
18362	8249	Thriller
18363	8250	Comedy
18364	8250	Drama
18365	8251	Drama
18366	8252	Documentary
18367	8253	Documentary
18368	8254	Comedy
18369	8254	Drama
18370	8255	Comedy
18371	8255	Drama
18372	8256	Action
18373	8256	Fantasy
18374	8256	Sci-Fi
18375	8257	Action
18376	8257	Comedy
18377	8257	Fantasy
18378	8258	Animation
18379	8258	Sci-Fi
18380	8259	Drama
18381	8259	Horror
18382	8259	Thriller
18383	8260	Comedy
18384	8260	Horror
18385	8260	Thriller
18386	8261	Comedy
18387	8261	Drama
18388	8262	Comedy
18389	8263	Action
18390	8263	Sci-Fi
18391	8263	Thriller
18392	8264	Action
18393	8264	Comedy
18394	8264	Horror
18395	8265	Documentary
18396	8266	Comedy
18397	8266	Drama
18398	8266	Mystery
18399	8267	Horror
18400	8267	Thriller
18401	8268	Action
18402	8268	Crime
18403	8268	Drama
18404	8268	Mystery
18405	8268	Thriller
18406	8269	Comedy
18407	8269	Drama
18408	8270	Drama
18409	8270	Romance
18410	8271	Drama
18411	8272	Comedy
18412	8272	Romance
18413	8273	Comedy
18414	8274	Action
18415	8274	Drama
18416	8274	Thriller
18417	8275	Horror
18418	8276	Comedy
18419	8276	Horror
18420	8277	Drama
18421	8277	Film-Noir
18422	8278	Adventure
18423	8278	Children
18424	8278	Drama
18425	8278	Fantasy
18426	8278	IMAX
18427	8279	Drama
18428	8279	Romance
18429	8280	Drama
18430	8280	Thriller
18431	8281	Action
18432	8281	Adventure
18433	8281	Romance
18434	8282	Drama
18435	8283	Horror
18436	8283	Thriller
18437	8284	Animation
18438	8284	Comedy
18439	8284	Drama
18440	8285	Drama
18441	8285	Romance
18442	8286	Action
18443	8287	Comedy
18444	8287	Drama
18445	8288	Drama
18446	8288	Romance
18447	8289	Drama
18448	8290	Drama
18449	8291	Drama
18450	8291	Romance
18451	8292	Drama
18452	8293	Animation
18453	8293	Comedy
18454	8293	Sci-Fi
18455	8294	Drama
18456	8294	Romance
18457	8295	Crime
18458	8295	Horror
18459	8295	Mystery
18460	8295	Thriller
18461	8296	Action
18462	8296	Comedy
18463	8296	Drama
18464	8296	Romance
18465	8297	Action
18466	8297	Adventure
18467	8297	Comedy
18468	8297	Fantasy
18469	8297	Horror
18470	8297	Thriller
18471	8298	Action
18472	8298	Crime
18473	8298	Drama
18474	8298	Thriller
18475	8299	Comedy
18476	8299	Documentary
18477	8300	Action
18478	8300	Comedy
18479	8301	Comedy
18480	8301	Crime
18481	8301	Drama
18482	8302	Action
18483	8302	Animation
18484	8302	Children
18485	8302	Sci-Fi
18486	8303	Adventure
18487	8303	Animation
18488	8303	Children
18489	8303	Comedy
18490	8303	Crime
18491	8304	Drama
18492	8304	Romance
18493	8305	Animation
18494	8305	Children
18495	8305	Drama
18496	8305	Fantasy
18497	8305	IMAX
18498	8306	Action
18499	8306	Adventure
18500	8306	Drama
18501	8306	Sci-Fi
18502	8307	Animation
18503	8307	Children
18504	8307	Comedy
18505	8307	Fantasy
18506	8308	Drama
18507	8309	Action
18508	8309	Drama
18509	8309	Sci-Fi
18510	8309	Thriller
18511	8310	Drama
18512	8310	Horror
18513	8310	Mystery
18514	8310	Sci-Fi
18515	8310	Thriller
18516	8311	Drama
18517	8311	Romance
18518	8311	Thriller
18519	8312	Horror
18520	8312	Mystery
18521	8312	Sci-Fi
18522	8312	Thriller
18523	8313	Drama
18524	8314	Crime
18525	8314	Drama
18526	8314	Film-Noir
18527	8314	Romance
18528	8315	Crime
18529	8315	Drama
18530	8316	Drama
18531	8316	Fantasy
18532	8316	Horror
18533	8316	Romance
18534	8316	Thriller
18535	8317	Drama
18536	8317	Romance
18537	8317	War
18538	8318	Action
18539	8318	Crime
18540	8318	Drama
18541	8318	Thriller
18542	8319	Comedy
18543	8319	Crime
18544	8319	Drama
18545	8320	Comedy
18546	8320	Drama
18547	8321	Action
18548	8321	Drama
18549	8322	Comedy
18550	8322	Thriller
18551	8323	Adventure
18552	8323	Comedy
18553	8324	Comedy
18554	8324	Romance
18555	8325	Action
18556	8325	Adventure
18557	8325	Animation
18558	8325	Comedy
18559	8325	Thriller
18560	8326	Animation
18561	8327	Drama
18562	8327	Thriller
18563	8327	War
18564	8328	Sci-Fi
18565	8329	Drama
18566	8330	Horror
18567	8330	Thriller
18568	8331	Drama
18569	8332	Comedy
18570	8333	Adventure
18571	8333	Animation
18572	8333	Children
18573	8333	Comedy
18574	8333	Sci-Fi
18575	8334	Drama
18576	8335	Documentary
18577	8336	Drama
18578	8337	Drama
18579	8338	Crime
18580	8338	Drama
18581	8338	Fantasy
18582	8338	Horror
18583	8338	Thriller
18584	8339	Drama
18585	8340	Animation
18586	8340	Children
18587	8340	Fantasy
18588	8340	Musical
18589	8340	Romance
18590	8341	Drama
18591	8342	Western
18592	8343	Action
18593	8343	Drama
18594	8343	Thriller
18595	8344	Horror
18596	8344	Sci-Fi
18597	8345	Drama
18598	8345	Romance
18599	8346	Action
18600	8347	Drama
18601	8347	Romance
18602	8348	Comedy
18603	8348	Crime
18604	8348	Drama
18605	8348	Romance
18606	8349	Drama
18607	8349	Romance
18608	8350	Action
18609	8350	Adventure
18610	8350	Fantasy
18611	8351	Action
18612	8351	Adventure
18613	8351	Sci-Fi
18614	8351	IMAX
18615	8352	Drama
18616	8352	Musical
18617	8352	Romance
18618	8353	Comedy
18619	8353	Romance
18620	8354	Action
18621	8354	Crime
18622	8354	Mystery
18623	8354	Thriller
18624	8355	Drama
18625	8355	Romance
18626	8356	Drama
18627	8357	Animation
18628	8357	Children
18629	8357	Comedy
18630	8357	Musical
18631	8358	Action
18632	8358	Crime
18633	8358	Drama
18634	8358	Fantasy
18635	8358	Romance
18636	8359	Film-Noir
18637	8359	Thriller
18638	8360	Drama
18639	8360	Mystery
18640	8361	Comedy
18641	8361	Drama
18642	8361	Fantasy
18643	8362	Comedy
18644	8363	Drama
18645	8364	Comedy
18646	8364	Drama
18647	8364	Romance
18648	8365	Drama
18649	8365	Horror
18650	8365	Thriller
18651	8366	Crime
18652	8366	Drama
18653	8366	Thriller
18654	8367	Horror
18655	8367	Thriller
18656	8368	Drama
18657	8369	Comedy
18658	8369	Drama
18659	8369	Romance
18660	8370	Action
18661	8370	Drama
18662	8370	Horror
18663	8370	Thriller
18664	8371	Action
18665	8371	Adventure
18666	8372	Drama
18667	8373	Comedy
18668	8373	Romance
18669	8374	Action
18670	8374	Adventure
18671	8374	Drama
18672	8375	Action
18673	8375	Crime
18674	8375	Mystery
18675	8376	Crime
18676	8376	Drama
18677	8376	Film-Noir
18678	8376	Thriller
18679	8377	Drama
18680	8377	Romance
18681	8378	Crime
18682	8378	Drama
18683	8379	Documentary
18684	8380	Comedy
18685	8380	Drama
18686	8381	Comedy
18687	8381	Crime
18688	8382	Action
18689	8382	Mystery
18690	8382	Thriller
18691	8383	Children
18692	8383	Comedy
18693	8383	Drama
18694	8384	Documentary
18695	8385	Comedy
18696	8385	Romance
18697	8386	Crime
18698	8386	Drama
18699	8386	Horror
18700	8386	Mystery
18701	8386	Thriller
18702	8387	Drama
18703	8388	Comedy
18704	8388	Drama
18705	8388	Romance
18706	8389	Comedy
18707	8389	Drama
18708	8390	Drama
18709	8391	Adventure
18710	8391	Children
18711	8391	Comedy
18712	8391	Fantasy
18713	8392	Crime
18714	8392	Drama
18715	8392	Thriller
18716	8393	Adventure
18717	8393	Animation
18718	8393	Children
18719	8393	Fantasy
18720	8393	Musical
18721	8394	Drama
18722	8395	Horror
18723	8395	Sci-Fi
18724	8395	Thriller
18725	8396	Action
18726	8396	Drama
18727	8397	Comedy
18728	8397	Drama
18729	8397	Romance
18730	8398	Comedy
18731	8399	Action
18732	8399	Adventure
18733	8399	Drama
18734	8400	Action
18735	8400	Fantasy
18736	8400	Horror
18737	8400	Thriller
18738	8401	Action
18739	8401	Drama
18740	8401	War
18741	8402	Crime
18742	8402	Drama
18743	8402	Thriller
18744	8403	Drama
18745	8404	Children
18746	8404	Fantasy
18747	8404	Musical
18748	8405	Animation
18749	8405	Fantasy
18750	8405	Horror
18751	8405	Sci-Fi
18752	8406	Drama
18753	8407	Drama
18754	8408	Comedy
18755	8408	Documentary
18756	8409	Comedy
18757	8409	Romance
18758	8410	Drama
18759	8410	Thriller
18760	8411	Drama
18761	8411	Horror
18762	8411	Mystery
18763	8411	Thriller
18764	8412	Drama
18765	8413	Comedy
18766	8413	Drama
18767	8413	Romance
18768	8414	Drama
18769	8415	Drama
18770	8416	Comedy
18771	8416	Crime
18772	8416	Drama
18773	8416	Romance
18774	8417	Horror
18775	8417	Thriller
18776	8418	Crime
18777	8418	Drama
18778	8419	Drama
18779	8420	Comedy
18780	8420	Romance
18781	8421	Horror
18782	8421	Thriller
18783	8422	Drama
18784	8422	Mystery
18785	8422	Thriller
18786	8423	Drama
18787	8423	Mystery
18788	8423	Thriller
18789	8424	Drama
18790	8424	Fantasy
18791	8424	Romance
18792	8425	Drama
18793	8425	Romance
18794	8426	Action
18795	8426	Crime
18796	8426	Drama
18797	8426	Mystery
18798	8426	Thriller
18799	8427	Adventure
18800	8427	Fantasy
18801	8428	Action
18802	8428	Comedy
18803	8428	Crime
18804	8429	Comedy
18805	8429	Crime
18806	8430	Drama
18807	8430	Mystery
18808	8430	Thriller
18809	8431	Drama
18810	8431	War
18811	8432	Animation
18812	8432	Fantasy
18813	8433	Comedy
18814	8433	Drama
18815	8433	War
18816	8434	Action
18817	8434	Children
18818	8434	Comedy
18819	8435	Comedy
18820	8436	Drama
18821	8436	Film-Noir
18822	8437	Crime
18823	8437	Drama
18824	8437	Romance
18825	8438	Adventure
18826	8438	Drama
18827	8438	Romance
18828	8439	Comedy
18829	8440	Crime
18830	8440	Drama
18831	8440	Thriller
18832	8441	Action
18833	8441	Sci-Fi
18834	8442	Documentary
18835	8443	Action
18836	8443	Drama
18837	8443	Horror
18838	8443	Sci-Fi
18839	8443	Thriller
18840	8444	Drama
18841	8444	Romance
18842	8444	War
18843	8445	Comedy
18844	8445	Fantasy
18845	8446	Documentary
18846	8447	Comedy
18847	8447	Crime
18848	8447	Drama
18849	8447	Mystery
18850	8448	Horror
18851	8448	Mystery
18852	8448	Sci-Fi
18853	8448	Thriller
18854	8449	Mystery
18855	8449	Thriller
18856	8450	Horror
18857	8450	Thriller
18858	8451	Horror
18859	8451	Thriller
18860	8452	Adventure
18861	8452	Fantasy
18862	8452	IMAX
18863	8453	Action
18864	8453	Drama
18865	8453	Thriller
18866	8453	War
18867	8454	Crime
18868	8454	Drama
18869	8455	Crime
18870	8455	Drama
18871	8456	Action
18872	8456	Crime
18873	8457	Comedy
18874	8458	Drama
18875	8458	Horror
18876	8458	Sci-Fi
18877	8459	Comedy
18878	8459	Drama
18879	8460	Crime
18880	8460	Drama
18881	8460	Thriller
18882	8461	Comedy
18883	8462	Crime
18884	8462	Drama
18885	8462	Thriller
18886	8463	Adventure
18887	8463	Comedy
18888	8463	Drama
18889	8464	Drama
18890	8464	Romance
18891	8465	Drama
18892	8465	Romance
18893	8466	Action
18894	8466	Horror
18895	8466	Thriller
18896	8467	Horror
18897	8467	Thriller
18898	8467	Western
18899	8468	Drama
18900	8468	Horror
18901	8468	Thriller
18902	8469	Action
18903	8469	Adventure
18904	8469	Comedy
18905	8470	Action
18906	8470	Animation
18907	8470	Comedy
18908	8470	Crime
18909	8470	Drama
18910	8470	Mystery
18911	8470	Romance
18912	8470	Thriller
18913	8471	Horror
18914	8472	Comedy
18915	8473	Comedy
18916	8474	Action
18917	8474	Comedy
18918	8474	Romance
18919	8475	Comedy
18920	8475	Crime
18921	8475	Drama
18922	8475	Thriller
18923	8476	Documentary
18924	8477	Drama
18925	8477	Film-Noir
18926	8477	Thriller
18927	8478	Drama
18928	8479	Adventure
18929	8479	Drama
18930	8480	Action
18931	8480	Sci-Fi
18932	8480	Thriller
18933	8481	Comedy
18934	8481	Drama
18935	8482	Drama
18936	8483	Horror
18937	8483	Thriller
18938	8484	Documentary
18939	8484	Drama
18940	8485	Comedy
18941	8485	Sci-Fi
18942	8486	Drama
18943	8486	Thriller
18944	8487	Drama
18945	8487	Romance
18946	8488	Crime
18947	8488	Drama
18948	8488	Mystery
18949	8488	Thriller
18950	8489	Adventure
18951	8489	Animation
18952	8489	Children
18953	8489	Fantasy
18954	8489	IMAX
18955	8490	Thriller
18956	8491	Action
18957	8491	Drama
18958	8491	Sci-Fi
18959	8491	Thriller
18960	8492	Comedy
18961	8492	Romance
18962	8493	Action
18963	8493	Animation
18964	8493	Comedy
18965	8493	Crime
18966	8493	Drama
18967	8493	Mystery
18968	8493	Romance
18969	8493	Thriller
18970	8494	Drama
18971	8495	Comedy
18972	8495	Crime
18973	8496	Action
18974	8496	Adventure
18975	8496	Drama
18976	8496	Fantasy
18977	8497	Sci-Fi
18978	8497	Thriller
18979	8498	Comedy
18980	8498	Crime
18981	8498	Drama
18982	8499	Drama
18983	8499	Romance
18984	8499	Thriller
18985	8499	War
18986	8500	Action
18987	8500	Comedy
18988	8501	Crime
18989	8501	Drama
18990	8501	Thriller
18991	8502	Crime
18992	8502	Drama
18993	8502	Thriller
18994	8503	Crime
18995	8503	Drama
18996	8503	Thriller
18997	8504	Action
18998	8504	Comedy
18999	8504	Romance
19000	8505	Comedy
19001	8505	Crime
19002	8505	Drama
19003	8506	Drama
19004	8506	Horror
19005	8506	Thriller
19006	8507	Documentary
19007	8508	Drama
19008	8508	Horror
19009	8508	Thriller
19010	8509	Thriller
19011	8510	Drama
19012	8510	Musical
19013	8511	Drama
19014	8511	Thriller
19015	8512	Documentary
19016	8512	Mystery
19017	8513	Horror
19018	8513	Sci-Fi
19019	8513	Thriller
19020	8514	Action
19021	8514	Crime
19022	8514	Thriller
19023	8515	Documentary
19024	8516	Comedy
19025	8517	Action
19026	8517	Drama
19027	8517	War
19028	8518	Children
19029	8518	Comedy
19030	8519	Drama
19031	8519	Mystery
19032	8520	Crime
19033	8520	Drama
19034	8520	Film-Noir
19035	8521	Comedy
19036	8521	Musical
19037	8522	Drama
19038	8522	Romance
19039	8523	Drama
19040	8524	Comedy
19041	8524	Drama
19042	8525	Crime
19043	8525	Drama
19044	8525	Thriller
19045	8526	Drama
19046	8527	Crime
19047	8527	Drama
19048	8527	Mystery
19049	8527	Thriller
19050	8528	Crime
19051	8528	Drama
19052	8528	Mystery
19053	8529	Comedy
19054	8529	Drama
19055	8530	Comedy
19056	8531	Crime
19057	8531	Drama
19058	8531	Mystery
19059	8532	Action
19060	8532	Adventure
19061	8532	Drama
19062	8532	Mystery
19063	8532	Thriller
19064	8533	Drama
19065	8533	Romance
19066	8534	Action
19067	8534	Crime
19068	8534	Drama
19069	8534	Thriller
19070	8535	Comedy
19071	8535	Drama
19072	8535	Romance
19073	8536	Horror
19074	8537	Horror
19075	8537	Thriller
19076	8538	Comedy
19077	8538	Documentary
19078	8539	Thriller
19079	8540	Film-Noir
19080	8540	Thriller
19081	8540	War
19082	8541	Action
19083	8541	Adventure
19084	8541	Fantasy
19085	8541	Horror
19086	8542	Drama
19087	8543	Action
19088	8543	Adventure
19089	8543	Sci-Fi
19090	8543	Thriller
19091	8543	IMAX
19092	8544	Drama
19093	8544	War
19094	8545	Crime
19095	8545	Drama
19096	8545	Film-Noir
19097	8546	Documentary
19098	8547	Comedy
19099	8548	Action
19100	8548	Comedy
19101	8549	Horror
19102	8549	Mystery
19103	8550	Comedy
19104	8551	Action
19105	8551	Crime
19106	8551	Thriller
19107	8552	Comedy
19108	8553	Drama
19109	8553	Sci-Fi
19110	8553	Thriller
19111	8554	Comedy
19112	8554	Drama
19113	8554	Romance
19114	8555	Drama
19115	8556	Sci-Fi
19116	8557	Fantasy
19117	8557	Horror
19118	8557	Thriller
19119	8558	Comedy
19120	8558	Drama
19121	8559	Drama
19122	8560	Comedy
19123	8561	Drama
19124	8562	Thriller
19125	8563	Crime
19126	8563	Drama
19127	8564	Action
19128	8564	Adventure
19129	8564	Drama
19130	8564	Romance
19131	8564	War
19132	8565	Action
19133	8565	Drama
19134	8566	Horror
19135	8566	Mystery
19136	8566	Thriller
19137	8567	Drama
19138	8567	Western
19139	8568	Action
19140	8568	Crime
19141	8568	Thriller
19142	8569	Action
19143	8569	Animation
19144	8569	Sci-Fi
19145	8570	Horror
19146	8571	Comedy
19147	8571	Drama
19148	8571	Romance
19149	8572	Drama
19150	8572	Romance
19151	8573	Action
19152	8573	Comedy
19153	8574	Mystery
19154	8574	Thriller
19155	8575	Action
19156	8575	Adventure
19157	8575	Fantasy
19158	8575	Romance
19159	8575	IMAX
19160	8576	Comedy
19161	8576	Drama
19162	8577	Action
19163	8577	Drama
19164	8578	Comedy
19165	8579	Comedy
19166	8580	Comedy
19167	8580	Drama
19168	8580	Romance
19169	8581	Comedy
19170	8582	Drama
19171	8582	Thriller
19172	8583	Drama
19173	8583	Thriller
19174	8584	Drama
19175	8584	Romance
19176	8585	Animation
19177	8585	Comedy
19178	8586	Comedy
19179	8586	Romance
19180	8587	Horror
19181	8587	Sci-Fi
19182	8587	Thriller
19183	8588	Drama
19184	8589	Comedy
19185	8590	Drama
19186	8590	Romance
19187	8591	Comedy
19188	8592	Mystery
19189	8592	Thriller
19190	8593	Drama
19191	8593	Musical
19192	8593	Romance
19193	8594	Drama
19194	8594	Film-Noir
19195	8594	Mystery
19196	8594	Thriller
19197	8595	Comedy
19198	8595	Drama
19199	8596	Drama
19200	8596	Film-Noir
19201	8597	Action
19202	8597	Drama
19203	8597	Thriller
19204	8597	Western
19205	8598	Action
19206	8598	Comedy
19207	8598	Thriller
19208	8599	Comedy
19209	8600	Adventure
19210	8600	Animation
19211	8600	Children
19212	8600	Comedy
19213	8600	Fantasy
19214	8600	IMAX
19215	8601	Documentary
19216	8602	Crime
19217	8602	Drama
19218	8602	Romance
19219	8603	Comedy
19220	8604	Drama
19221	8604	Thriller
19222	8605	Drama
19223	8605	Horror
19224	8605	Sci-Fi
19225	8605	Thriller
19226	8606	Action
19227	8606	Romance
19228	8607	Adventure
19229	8607	Animation
19230	8607	Children
19231	8607	Comedy
19232	8607	Fantasy
19233	8607	IMAX
19234	8608	Crime
19235	8608	Drama
19236	8608	Thriller
19237	8608	Western
19238	8609	Comedy
19239	8609	Drama
19240	8609	Fantasy
19241	8609	Romance
19242	8610	Drama
19243	8611	Action
19244	8611	Adventure
19245	8611	Crime
19246	8611	Drama
19247	8611	Thriller
19248	8612	Documentary
19249	8613	Drama
19250	8614	Drama
19251	8615	Drama
19252	8616	Fantasy
19253	8616	Romance
19254	8616	Thriller
19255	8616	IMAX
19256	8617	Comedy
19257	8617	Drama
19258	8618	Fantasy
19259	8619	Documentary
19260	8620	Action
19261	8620	Adventure
19262	8620	Fantasy
19263	8621	Drama
19264	8621	Thriller
19265	8622	Crime
19266	8622	Drama
19267	8622	Film-Noir
19268	8622	Mystery
19269	8623	Documentary
19270	8623	Drama
19271	8623	War
19272	8624	Adventure
19273	8624	Fantasy
19274	8624	Horror
19275	8624	Romance
19276	8624	Sci-Fi
19277	8624	Thriller
19278	8625	Drama
19279	8625	Romance
19280	8626	Comedy
19281	8626	Crime
19282	8626	Drama
19283	8626	Mystery
19284	8627	Animation
19285	8627	Comedy
19286	8627	Fantasy
19287	8628	Action
19288	8628	Sci-Fi
19289	8628	Thriller
19290	8629	Animation
19291	8629	Children
19292	8629	Comedy
19293	8629	Crime
19294	8630	Action
19295	8630	Crime
19296	8630	Drama
19297	8630	Mystery
19298	8630	Sci-Fi
19299	8630	Thriller
19300	8630	IMAX
19301	8631	Comedy
19302	8632	Action
19303	8632	Adventure
19304	8632	Children
19305	8632	Comedy
19306	8632	Fantasy
19307	8633	Action
19308	8633	Comedy
19309	8633	Romance
19310	8634	Drama
19311	8634	Mystery
19312	8635	Action
19313	8635	Children
19314	8635	Drama
19315	8636	Comedy
19316	8636	Drama
19317	8637	Horror
19318	8637	Thriller
19319	8638	Action
19320	8638	Animation
19321	8639	Action
19322	8639	Thriller
19323	8640	Comedy
19324	8640	Documentary
19325	8641	Crime
19326	8641	Drama
19327	8641	Film-Noir
19328	8642	Drama
19329	8642	Fantasy
19330	8642	Romance
19331	8642	Sci-Fi
19332	8643	Action
19333	8643	Adventure
19334	8643	Drama
19335	8643	War
19336	8644	Comedy
19337	8645	Comedy
19338	8646	Comedy
19339	8646	Drama
19340	8647	Drama
19341	8648	Comedy
19342	8648	Drama
19343	8649	Action
19344	8649	Crime
19345	8649	Thriller
19346	8650	Animation
19347	8650	Children
19348	8650	Comedy
19349	8651	Comedy
19350	8651	Drama
19351	8652	Action
19352	8653	Comedy
19353	8653	Romance
19354	8654	Action
19355	8654	Comedy
19356	8655	Crime
19357	8655	Drama
19358	8655	Film-Noir
19359	8656	Action
19360	8656	Drama
19361	8656	Horror
19362	8656	Mystery
19363	8657	Drama
19364	8658	Comedy
19365	8659	Drama
19366	8659	War
19367	8660	Crime
19368	8660	Documentary
19369	8661	Action
19370	8661	Adventure
19371	8661	Thriller
19372	8662	Action
19373	8662	Comedy
19374	8662	Fantasy
19375	8662	Musical
19376	8662	Romance
19377	8663	Drama
19378	8663	Horror
19379	8664	Crime
19380	8664	Drama
19381	8665	Action
19382	8665	Adventure
19383	8665	Drama
19384	8665	Thriller
19385	8665	War
19386	8666	Comedy
19387	8666	Drama
19388	8667	Comedy
19389	8667	Romance
19390	8668	Drama
19391	8668	War
19392	8669	Comedy
19393	8669	Romance
19394	8670	Drama
19395	8670	Thriller
19396	8671	Adventure
19397	8671	Drama
19398	8671	Horror
19399	8671	Thriller
19400	8672	Fantasy
19401	8672	Horror
19402	8672	Mystery
19403	8672	Thriller
19404	8673	Action
19405	8673	Horror
19406	8673	Thriller
19407	8674	Comedy
19408	8674	Drama
19409	8674	Mystery
19410	8675	Crime
19411	8675	Drama
19412	8675	Film-Noir
19413	8675	Thriller
19414	8676	Drama
19415	8676	Horror
19416	8676	Thriller
19417	8677	Comedy
19418	8677	Drama
19419	8678	Drama
19420	8679	Drama
19421	8679	Romance
19422	8680	Action
19423	8680	Sci-Fi
19424	8681	Adventure
19425	8681	Comedy
19426	8681	Drama
19427	8681	Romance
19428	8682	Action
19429	8682	Adventure
19430	8682	Animation
19431	8682	Fantasy
19432	8682	Sci-Fi
19433	8683	Horror
19434	8683	Thriller
19435	8684	Comedy
19436	8684	Drama
19437	8685	Drama
19438	8685	Thriller
19439	8686	Comedy
19440	8686	Documentary
19441	8687	Drama
19442	8688	Comedy
19443	8688	Romance
19444	8689	Documentary
19445	8690	Action
19446	8690	Adventure
19447	8690	Comedy
19448	8690	Crime
19449	8690	Thriller
19450	8691	Drama
19451	8691	Romance
19452	8692	Comedy
19453	8692	Romance
19454	8693	Drama
19455	8693	War
19456	8694	Comedy
19457	8694	Documentary
19458	8695	Crime
19459	8695	Drama
19460	8695	Film-Noir
19461	8695	Thriller
19462	8696	Drama
19463	8696	Mystery
19464	8696	Thriller
19465	8697	Documentary
19466	8698	Drama
19467	8698	Romance
19468	8698	War
19469	8699	Comedy
19470	8700	Action
19471	8700	Horror
19472	8700	Sci-Fi
19473	8700	Thriller
19474	8700	IMAX
19475	8701	Comedy
19476	8701	Fantasy
19477	8702	Action
19478	8702	Crime
19479	8702	Thriller
19480	8703	Drama
19481	8704	Crime
19482	8704	Drama
19483	8704	Thriller
19484	8705	Comedy
19485	8705	Romance
19486	8706	Drama
19487	8706	Romance
19488	8707	Comedy
19489	8707	Drama
19490	8708	Drama
19491	8709	Adventure
19492	8709	Animation
19493	8709	Fantasy
19494	8709	IMAX
19495	8710	Musical
19496	8710	Romance
19497	8711	Drama
19498	8711	Film-Noir
19499	8711	Mystery
19500	8712	Crime
19501	8712	Drama
19502	8712	Film-Noir
19503	8712	Romance
19504	8712	Thriller
19505	8713	Comedy
19506	8713	Drama
19507	8714	Comedy
19508	8714	Crime
19509	8714	Drama
19510	8715	Horror
19511	8715	Mystery
19512	8715	Thriller
19513	8716	Adventure
19514	8716	Children
19515	8716	Fantasy
19516	8717	Comedy
19517	8717	Drama
19518	8718	Comedy
19519	8718	Drama
19520	8718	Romance
19521	8719	Comedy
19522	8719	Drama
19523	8720	Comedy
19524	8720	Romance
19525	8721	Drama
19526	8721	Horror
19527	8721	Mystery
19528	8722	Adventure
19529	8722	Drama
19530	8723	Horror
19531	8723	Mystery
19532	8723	Thriller
19533	8724	Comedy
19534	8725	Comedy
19535	8725	Romance
19536	8726	Documentary
19537	8726	Mystery
19538	8727	Comedy
19539	8727	Romance
19540	8728	Drama
19541	8728	Thriller
19542	8729	Documentary
19543	8730	Drama
19544	8730	Sci-Fi
19545	8731	Drama
19546	8732	Comedy
19547	8732	Romance
19548	8733	Drama
19549	8733	Romance
19550	8733	Sci-Fi
19551	8734	Animation
19552	8735	Horror
19553	8735	Thriller
19554	8736	Documentary
19555	8737	Action
19556	8737	Adventure
19557	8737	Comedy
19558	8737	Crime
19559	8737	Drama
19560	8737	Film-Noir
19561	8737	Horror
19562	8737	Mystery
19563	8737	Thriller
19564	8737	Western
19565	8738	Horror
19566	8738	Mystery
19567	8738	Thriller
19568	8739	Action
19569	8739	Comedy
19570	8739	Documentary
19571	8740	Documentary
19572	8740	War
19573	8741	Horror
19574	8741	Thriller
19575	8742	Horror
19576	8742	Thriller
19577	8743	Documentary
19578	8744	Action
19579	8744	Comedy
19580	8744	Crime
19581	8744	Drama
19582	8745	Drama
19583	8746	Action
19584	8746	Comedy
19585	8747	Comedy
19586	8747	Drama
19587	8748	Drama
19588	8749	Horror
19589	8749	Thriller
19590	8750	Documentary
19591	8751	Comedy
19592	8751	Romance
19593	8752	Drama
19594	8753	Horror
19595	8753	IMAX
19596	8754	Crime
19597	8754	Drama
19598	8754	Thriller
19599	8755	Drama
19600	8755	Fantasy
19601	8756	Adventure
19602	8756	Drama
19603	8756	Horror
19604	8756	Mystery
19605	8757	Horror
19606	8757	Mystery
19607	8757	Thriller
19608	8758	Comedy
19609	8759	Drama
19610	8759	Romance
19611	8760	Adventure
19612	8760	Drama
19613	8760	Thriller
19614	8761	Action
19615	8761	Animation
19616	8761	Children
19617	8761	Comedy
19618	8761	Sci-Fi
19619	8761	IMAX
19620	8762	Drama
19621	8762	Thriller
19622	8763	Drama
19623	8763	Thriller
19624	8764	Drama
19625	8764	Romance
19626	8765	Drama
19627	8765	Musical
19628	8765	Romance
19629	8765	Sci-Fi
19630	8766	Drama
19631	8766	Romance
19632	8766	Western
19633	8767	Drama
19634	8768	Drama
19635	8768	Romance
19636	8768	Thriller
19637	8769	Drama
19638	8769	Fantasy
19639	8770	Action
19640	8770	Drama
19641	8770	Thriller
19642	8771	Comedy
19643	8771	Drama
19644	8771	Romance
19645	8772	Drama
19646	8773	Crime
19647	8773	Drama
19648	8773	Romance
19649	8773	Thriller
19650	8774	Drama
19651	8775	Comedy
19652	8775	Drama
19653	8775	Romance
19654	8775	Thriller
19655	8776	Crime
19656	8776	Drama
19657	8776	Thriller
19658	8777	Drama
19659	8778	Action
19660	8778	Adventure
19661	8778	Fantasy
19662	8778	IMAX
19663	8779	Drama
19664	8780	Animation
19665	8780	Children
19666	8780	Comedy
19667	8780	Fantasy
19668	8780	Musical
19669	8780	Romance
19670	8780	IMAX
19671	8781	Documentary
19672	8782	Drama
19673	8783	Comedy
19674	8783	Drama
19675	8783	Romance
19676	8784	Comedy
19677	8785	Documentary
19678	8786	Horror
19679	8787	Comedy
19680	8787	Crime
19681	8788	Thriller
19682	8789	Crime
19683	8789	Romance
19684	8790	Sci-Fi
19685	8790	Thriller
19686	8791	Crime
19687	8791	Drama
19688	8791	Film-Noir
19689	8791	Mystery
19690	8791	Thriller
19691	8792	Thriller
19692	8793	Crime
19693	8793	Drama
19694	8794	Drama
19695	8794	Fantasy
19696	8794	Romance
19697	8795	Comedy
19698	8795	Drama
19699	8795	Romance
19700	8796	Adventure
19701	8796	Children
19702	8796	Fantasy
19703	8797	Drama
19704	8797	Thriller
19705	8798	Thriller
19706	8799	Drama
19707	8800	Drama
19708	8800	Horror
19709	8801	Drama
19710	8801	Mystery
19711	8801	Thriller
19712	8802	Drama
19713	8802	Romance
19714	8803	Action
19715	8803	Adventure
19716	8803	Drama
19717	8804	Western
19718	8805	Action
19719	8805	Adventure
19720	8805	Sci-Fi
19721	8805	IMAX
19722	8806	Drama
19723	8807	Comedy
19724	8807	Drama
19725	8807	Romance
19726	8808	Drama
19727	8809	Drama
19728	8810	Adventure
19729	8810	Drama
19730	8810	War
19731	8811	Crime
19732	8811	Drama
19733	8812	Drama
19734	8812	Romance
19735	8813	Comedy
19736	8813	Drama
19737	8813	Romance
19738	8814	Drama
19739	8815	Crime
19740	8815	Thriller
19741	8816	Action
19742	8816	Crime
19743	8816	Drama
19744	8817	Drama
19745	8818	Comedy
19746	8818	Drama
19747	8818	Romance
19748	8819	Comedy
19749	8820	Adventure
19750	8820	Comedy
19751	8820	Fantasy
19752	8821	Comedy
19753	8821	Crime
19754	8821	Drama
19755	8821	Mystery
19756	8821	Thriller
19757	8822	Drama
19758	8822	Mystery
19759	8822	Thriller
19760	8822	War
19761	8823	Horror
19762	8823	Thriller
19763	8824	Drama
19764	8824	Musical
19765	8824	Romance
19766	8825	Animation
19767	8825	Children
19768	8825	Fantasy
19769	8826	Comedy
19770	8826	Horror
19771	8827	Children
19772	8827	Comedy
19773	8828	Comedy
19774	8829	Crime
19775	8829	Drama
19776	8830	Adventure
19777	8830	Drama
19778	8830	War
19779	8831	Documentary
19780	8832	Crime
19781	8832	Drama
19782	8833	Comedy
19783	8833	Drama
19784	8834	Drama
19785	8834	Romance
19786	8835	Action
19787	8835	Comedy
19788	8835	Crime
19789	8835	Fantasy
19790	8835	Thriller
19791	8835	IMAX
19792	8836	Drama
19793	8837	Action
19794	8837	Fantasy
19795	8837	Western
19796	8838	Crime
19797	8838	Drama
19798	8839	Action
19799	8840	Adventure
19800	8840	Drama
19801	8840	Fantasy
19802	8841	Comedy
19803	8842	Crime
19804	8842	Drama
19805	8843	Comedy
19806	8843	Drama
19807	8844	Drama
19808	8845	Thriller
19809	8845	War
19810	8846	Action
19811	8846	Sci-Fi
19812	8846	Thriller
19813	8846	Western
19814	8846	IMAX
19815	8847	Horror
19816	8847	Sci-Fi
19817	8848	Drama
19818	8848	Romance
19819	8848	Thriller
19820	8849	Animation
19821	8849	Children
19822	8850	Comedy
19823	8850	Drama
19824	8851	Drama
19825	8852	Comedy
19826	8852	Drama
19827	8853	Documentary
19828	8854	Drama
19829	8855	Drama
19830	8855	Romance
19831	8856	Thriller
19832	8857	Drama
19833	8857	Film-Noir
19834	8857	Thriller
19835	8858	Sci-Fi
19836	8858	Thriller
19837	8859	Documentary
19838	8860	Documentary
19839	8861	Action
19840	8861	Animation
19841	8861	Drama
19842	8861	Sci-Fi
19843	8862	Crime
19844	8862	Horror
19845	8862	Thriller
19846	8863	Drama
19847	8863	Mystery
19848	8863	Thriller
19849	8864	Drama
19850	8865	Documentary
19851	8866	Drama
19852	8867	Children
19853	8867	Comedy
19854	8867	Crime
19855	8868	Comedy
19856	8868	Romance
19857	8869	Comedy
19858	8869	Drama
19859	8870	Crime
19860	8870	Drama
19861	8870	Thriller
19862	8871	Drama
19863	8871	Horror
19864	8871	Thriller
19865	8872	Drama
19866	8873	Action
19867	8873	Adventure
19868	8873	Animation
19869	8873	Sci-Fi
19870	8874	Drama
19871	8875	Comedy
19872	8875	Romance
19873	8876	Drama
19874	8876	Mystery
19875	8876	Thriller
19876	8877	Action
19877	8877	Adventure
19878	8877	Drama
19879	8877	Thriller
19880	8877	IMAX
19881	8878	Comedy
19882	8879	Adventure
19883	8879	Animation
19884	8879	Children
19885	8879	Comedy
19886	8879	Fantasy
19887	8879	Romance
19888	8880	Drama
19889	8881	Comedy
19890	8881	Thriller
19891	8882	Comedy
19892	8882	Drama
19893	8882	Romance
19894	8883	Drama
19895	8883	Thriller
19896	8883	War
19897	8884	Horror
19898	8884	Mystery
19899	8884	Thriller
19900	8885	Adventure
19901	8885	Comedy
19902	8885	Sci-Fi
19903	8886	Crime
19904	8886	Drama
19905	8887	Drama
19906	8888	Crime
19907	8888	Drama
19908	8889	Comedy
19909	8889	Drama
19910	8890	Comedy
19911	8890	Musical
19912	8890	Romance
19913	8891	Comedy
19914	8892	Western
19915	8893	Action
19916	8893	Fantasy
19917	8893	Thriller
19918	8894	Action
19919	8894	Adventure
19920	8894	Animation
19921	8894	Children
19922	8894	Comedy
19923	8894	Western
19924	8895	Comedy
19925	8895	Drama
19926	8896	Romance
19927	8896	Sci-Fi
19928	8896	Thriller
19929	8897	Comedy
19930	8897	Drama
19931	8897	Fantasy
19932	8897	Romance
19933	8898	Documentary
19934	8899	Comedy
19935	8899	Drama
19936	8900	Drama
19937	8900	Thriller
19938	8900	War
19939	8901	Documentary
19940	8901	Horror
19941	8902	Action
19942	8902	Drama
19943	8902	Thriller
19944	8903	Comedy
19945	8904	Adventure
19946	8904	Drama
19947	8905	Action
19948	8905	Sci-Fi
19949	8905	Thriller
19950	8905	IMAX
19951	8906	Action
19952	8906	Sci-Fi
19953	8906	War
19954	8907	Adventure
19955	8907	Animation
19956	8907	Comedy
19957	8907	Sci-Fi
19958	8908	Documentary
19959	8909	Drama
19960	8909	Romance
19961	8910	Drama
19962	8911	Action
19963	8911	Adventure
19964	8911	Animation
19965	8911	Children
19966	8911	Comedy
19967	8911	Sci-Fi
19968	8911	IMAX
19969	8912	Comedy
19970	8912	Fantasy
19971	8912	Mystery
19972	8913	Drama
19973	8914	Crime
19974	8914	Drama
19975	8915	Drama
19976	8915	Romance
19977	8916	Action
19978	8916	Crime
19979	8916	Drama
19980	8917	Action
19981	8917	Crime
19982	8918	Comedy
19983	8918	Romance
19984	8919	Comedy
19985	8920	Documentary
19986	8921	Fantasy
19987	8921	Horror
19988	8921	Mystery
19989	8921	Thriller
19990	8922	Comedy
19991	8923	Action
19992	8923	Comedy
19993	8923	Drama
19994	8924	Fantasy
19995	8924	Horror
19996	8925	Action
19997	8925	Drama
19998	8925	Mystery
19999	8925	Sci-Fi
20000	8925	Thriller
20001	8926	Drama
20002	8926	Romance
20003	8927	Action
20004	8927	Fantasy
20005	8927	Thriller
20006	8927	IMAX
20007	8928	Drama
20008	8929	Drama
20009	8929	Thriller
20010	8930	Thriller
20011	8931	Adventure
20012	8931	Animation
20013	8931	Children
20014	8931	Sci-Fi
20015	8932	Drama
20016	8932	War
20017	8933	Thriller
20018	8934	Documentary
20019	8935	Animation
20020	8935	Comedy
20021	8935	Sci-Fi
20022	8936	Fantasy
20023	8936	Horror
20024	8936	Thriller
20025	8937	Western
20026	8938	Action
20027	8938	Adventure
20028	8938	Crime
20029	8938	Thriller
20030	8939	Comedy
20031	8939	Drama
20032	8940	Drama
20033	8940	Romance
20034	8941	Western
20035	8942	Comedy
20036	8942	Drama
20037	8943	Comedy
20038	8944	Comedy
20039	8944	Crime
20040	8945	Animation
20041	8945	Children
20042	8945	Comedy
20043	8946	Drama
20044	8947	Action
20045	8948	Action
20046	8948	Adventure
20047	8948	Mystery
20048	8948	Thriller
20049	8949	Crime
20050	8949	Drama
20051	8949	Film-Noir
20052	8949	Mystery
20053	8950	Action
20054	8950	Comedy
20055	8951	Action
20056	8951	Thriller
20057	8952	Comedy
20058	8952	Documentary
20059	8953	Comedy
20060	8954	Comedy
20061	8954	Horror
20062	8954	Mystery
20063	8954	Thriller
20064	8955	Adventure
20065	8955	Animation
20066	8955	Children
20067	8955	Comedy
20068	8956	Action
20069	8956	Drama
20070	8956	Romance
20071	8957	Drama
20072	8957	Sci-Fi
20073	8958	Action
20074	8958	Adventure
20075	8958	Drama
20076	8958	Fantasy
20077	8958	IMAX
20078	8959	Comedy
20079	8960	Comedy
20080	8961	Drama
20081	8962	Drama
20082	8962	Romance
20083	8963	Comedy
20084	8964	Drama
20085	8964	Horror
20086	8964	Thriller
20087	8965	Crime
20088	8965	Film-Noir
20089	8966	Crime
20090	8966	Drama
20091	8966	War
20092	8967	Drama
20093	8968	Documentary
20094	8969	Drama
20095	8969	Romance
20096	8970	Documentary
20097	8970	Musical
20098	8971	Drama
20099	8972	Animation
20100	8972	Drama
20101	8973	Comedy
20102	8973	Drama
20103	8974	Action
20104	8974	Crime
20105	8975	Crime
20106	8975	Film-Noir
20107	8975	Mystery
20108	8975	Thriller
20109	8976	Drama
20110	8977	Action
20111	8977	Crime
20112	8977	Drama
20113	8977	Thriller
20114	8977	IMAX
20115	8978	Drama
20116	8978	Mystery
20117	8979	Animation
20118	8979	Drama
20119	8979	Fantasy
20120	8980	Drama
20121	8980	Horror
20122	8981	Crime
20123	8981	Drama
20124	8982	Drama
20125	8982	Mystery
20126	8982	War
20127	8983	Action
20128	8983	Drama
20129	8984	Comedy
20130	8984	Drama
20131	8984	Romance
20132	8985	Comedy
20133	8986	Action
20134	8986	Horror
20135	8986	Sci-Fi
20136	8986	Thriller
20137	8987	Drama
20138	8988	Crime
20139	8988	Drama
20140	8988	Romance
20141	8989	Adventure
20142	8989	Fantasy
20143	8989	Sci-Fi
20144	8990	Action
20145	8990	Adventure
20146	8990	Fantasy
20147	8990	IMAX
20148	8991	Comedy
20149	8991	Fantasy
20150	8991	Romance
20151	8992	Drama
20152	8993	Action
20153	8993	Crime
20154	8993	Thriller
20155	8994	Comedy
20156	8994	Crime
20157	8994	Romance
20158	8995	Drama
20159	8996	Comedy
20160	8997	Drama
20161	8997	Romance
20162	8997	War
20163	8998	Documentary
20164	8999	Drama
20165	8999	War
20166	9000	Drama
20167	9000	Thriller
20168	9001	Documentary
20169	9001	Musical
20170	9002	Drama
20171	9002	Thriller
20172	9003	Crime
20173	9003	Drama
20174	9003	Horror
20175	9004	Drama
20176	9004	Thriller
20177	9005	Comedy
20178	9006	Sci-Fi
20179	9006	Thriller
20180	9007	Crime
20181	9007	Drama
20182	9007	Mystery
20183	9007	Thriller
20184	9008	Drama
20185	9009	Crime
20186	9009	Drama
20187	9009	Mystery
20188	9009	Romance
20189	9009	Thriller
20190	9010	Action
20191	9010	Comedy
20192	9010	Sci-Fi
20193	9011	Action
20194	9011	Comedy
20195	9012	Comedy
20196	9012	Drama
20197	9012	Romance
20198	9013	Action
20199	9013	Adventure
20200	9013	Animation
20201	9013	Children
20202	9013	Comedy
20203	9013	IMAX
20204	9014	Action
20205	9014	Adventure
20206	9014	Sci-Fi
20207	9014	Thriller
20208	9014	War
20209	9015	Comedy
20210	9015	Drama
20211	9015	Romance
20212	9016	Adventure
20213	9016	Crime
20214	9016	Drama
20215	9016	Romance
20216	9016	Thriller
20217	9017	Drama
20218	9018	Comedy
20219	9018	Drama
20220	9019	Drama
20221	9019	Mystery
20222	9019	Romance
20223	9020	Drama
20224	9021	Mystery
20225	9021	Sci-Fi
20226	9021	Thriller
20227	9021	IMAX
20228	9022	Comedy
20229	9023	Drama
20230	9023	Romance
20231	9024	Action
20232	9024	Adventure
20233	9024	Sci-Fi
20234	9025	Drama
20235	9026	Documentary
20236	9027	Comedy
20237	9028	Comedy
20238	9029	Action
20239	9029	Adventure
20240	9029	Sci-Fi
20241	9029	War
20242	9029	IMAX
20243	9030	Comedy
20244	9030	Drama
20245	9030	Romance
20246	9031	Action
20247	9031	Adventure
20248	9031	Comedy
20249	9031	Fantasy
20250	9032	Action
20251	9032	Crime
20252	9032	Drama
20253	9032	Thriller
20254	9033	Comedy
20255	9033	Romance
20256	9034	Drama
20257	9035	Action
20258	9035	Crime
20259	9035	Thriller
20260	9036	Comedy
20261	9037	Comedy
20262	9037	Crime
20263	9038	Adventure
20264	9038	Animation
20265	9038	Children
20266	9038	Comedy
20267	9038	IMAX
20268	9039	Drama
20269	9039	Thriller
20270	9040	Horror
20271	9040	Thriller
20272	9041	Documentary
20273	9042	Drama
20274	9043	Crime
20275	9043	Drama
20276	9043	Mystery
20277	9043	Thriller
20278	9044	Crime
20279	9044	Drama
20280	9044	Mystery
20281	9045	Drama
20282	9046	Film-Noir
20283	9046	Thriller
20284	9047	Documentary
20285	9048	Crime
20286	9048	Drama
20287	9048	Thriller
20288	9049	Action
20289	9049	Adventure
20290	9049	Drama
20291	9049	Fantasy
20292	9049	Mystery
20293	9049	IMAX
20294	9050	Documentary
20295	9051	Crime
20296	9051	Drama
20297	9051	Film-Noir
20298	9051	Thriller
20299	9052	Crime
20300	9052	Mystery
20301	9052	Thriller
20302	9053	Action
20303	9053	Adventure
20304	9053	Sci-Fi
20305	9053	Thriller
20306	9053	War
20307	9054	Comedy
20308	9054	Drama
20309	9054	Romance
20310	9055	Drama
20311	9055	Romance
20312	9056	Comedy
20313	9056	Crime
20314	9057	Comedy
20315	9057	Drama
20316	9057	Romance
20317	9058	Horror
20318	9058	Mystery
20319	9058	Sci-Fi
20320	9059	Drama
20321	9059	Fantasy
20322	9059	Romance
20323	9060	Animation
20324	9060	Children
20325	9060	Comedy
20326	9061	Comedy
20327	9061	Romance
20328	9062	Action
20329	9062	Crime
20330	9062	Thriller
20331	9063	Drama
20332	9063	Mystery
20333	9064	Crime
20334	9064	Drama
20335	9064	Thriller
20336	9065	Drama
20337	9065	Romance
20338	9066	Drama
20339	9067	Drama
20340	9068	Crime
20341	9068	Drama
20342	9069	Comedy
20343	9070	Action
20344	9070	Drama
20345	9070	Sci-Fi
20346	9070	Thriller
20347	9071	Comedy
20348	9072	Comedy
20349	9073	Drama
20350	9074	Action
20351	9074	Comedy
20352	9074	Crime
20353	9075	Drama
20354	9075	Mystery
20355	9075	Thriller
20356	9076	Comedy
20357	9077	Crime
20358	9077	Drama
20359	9077	Romance
20360	9077	Thriller
20361	9078	Crime
20362	9078	Drama
20363	9079	Documentary
20364	9080	Horror
20365	9080	Thriller
20366	9080	IMAX
20367	9081	Drama
20368	9081	Romance
20369	9082	Drama
20370	9083	Comedy
20371	9084	Drama
20372	9085	Crime
20373	9085	Drama
20374	9085	Romance
20375	9086	Horror
20376	9086	Thriller
20377	9087	Comedy
20378	9087	Horror
20379	9088	Drama
20380	9088	Romance
20381	9088	Sci-Fi
20382	9089	Comedy
20383	9090	Drama
20384	9091	Action
20385	9091	Horror
20386	9091	Mystery
20387	9091	Thriller
20388	9092	Horror
20389	9093	Documentary
20390	9094	Drama
20391	9094	Thriller
20392	9095	Action
20393	9095	Adventure
20394	9095	Drama
20395	9095	Thriller
20396	9096	Documentary
20397	9097	Documentary
20398	9098	Drama
20399	9099	Crime
20400	9099	Drama
20401	9099	Mystery
20402	9099	Thriller
20403	9100	Documentary
20404	9100	Musical
20405	9101	Crime
20406	9101	Thriller
20407	9102	Comedy
20408	9103	Action
20409	9103	Adventure
20410	9103	Fantasy
20411	9104	Documentary
20412	9105	Documentary
20413	9106	Drama
20414	9106	Thriller
20415	9107	Adventure
20416	9107	Comedy
20417	9108	Action
20418	9108	Crime
20419	9108	Horror
20420	9108	Thriller
20421	9109	Drama
20422	9110	Comedy
20423	9111	Sci-Fi
20424	9111	Thriller
20425	9111	IMAX
20426	9112	Drama
20427	9113	Drama
20428	9114	Thriller
20429	9115	Drama
20430	9116	Horror
20431	9116	Thriller
20432	9117	Comedy
20433	9117	Drama
20434	9118	Drama
20435	9118	Thriller
20436	9119	Action
20437	9119	Crime
20438	9119	Thriller
20439	9120	Drama
20440	9121	Horror
20441	9121	Thriller
20442	9122	Action
20443	9122	Adventure
20444	9122	Sci-Fi
20445	9122	IMAX
20446	9123	Crime
20447	9123	Drama
20448	9123	Romance
20449	9124	Drama
20450	9124	Film-Noir
20451	9124	Thriller
20452	9125	Drama
20453	9126	Drama
20454	9126	Thriller
20455	9127	Drama
20456	9127	Film-Noir
20457	9127	Mystery
20458	9128	Drama
20459	9129	Mystery
20460	9129	Sci-Fi
20461	9130	Drama
20462	9131	Horror
20463	9131	Mystery
20464	9131	Thriller
20465	9132	Action
20466	9132	Thriller
20467	9133	Comedy
20468	9133	Crime
20469	9133	Drama
20470	9134	Action
20471	9134	Drama
20472	9134	Romance
20473	9135	Comedy
20474	9135	Drama
20475	9136	Drama
20476	9137	Drama
20477	9138	Comedy
20478	9138	Drama
20479	9138	Romance
20480	9139	Horror
20481	9139	Sci-Fi
20482	9140	Drama
20483	9141	Drama
20484	9142	Documentary
20485	9143	Action
20486	9143	Drama
20487	9143	Sci-Fi
20488	9143	IMAX
20489	9144	Documentary
20490	9145	Documentary
20491	9146	Comedy
20492	9146	Drama
20493	9146	Musical
20494	9147	Horror
20495	9147	Mystery
20496	9147	Sci-Fi
20497	9147	Thriller
20498	9148	Drama
20499	9149	Drama
20500	9150	Crime
20501	9150	Drama
20502	9150	Film-Noir
20503	9151	Drama
20504	9151	Thriller
20505	9152	Drama
20506	9152	Thriller
20507	9153	Documentary
20508	9154	Action
20509	9154	Thriller
20510	9154	War
20511	9155	Action
20512	9155	Adventure
20513	9156	Crime
20514	9156	Sci-Fi
20515	9156	Thriller
20516	9157	Drama
20517	9158	Crime
20518	9158	Drama
20519	9158	Thriller
20520	9159	Drama
20521	9160	Comedy
20522	9160	Drama
20523	9161	Action
20524	9161	Thriller
20525	9162	Drama
20526	9162	Thriller
20527	9163	Crime
20528	9163	Drama
20529	9164	Adventure
20530	9164	Comedy
20531	9164	Thriller
20532	9165	Action
20533	9165	Drama
20534	9165	Mystery
20535	9165	Thriller
20536	9166	Crime
20537	9166	Drama
20538	9166	Thriller
20539	9167	Drama
20540	9168	Comedy
20541	9168	Drama
20542	9169	Comedy
20543	9169	Romance
20544	9170	Drama
20545	9170	Mystery
20546	9170	Thriller
20547	9171	Documentary
20548	9171	Drama
20549	9172	Action
20550	9172	Crime
20551	9172	Thriller
20552	9173	Action
20553	9173	Animation
20554	9173	Crime
20555	9174	Action
20556	9174	Adventure
20557	9174	Drama
20558	9174	Romance
20559	9175	Action
20560	9175	Crime
20561	9176	Drama
20562	9177	Adventure
20563	9177	Animation
20564	9177	Comedy
20565	9177	Fantasy
20566	9177	IMAX
20567	9178	Action
20568	9178	Comedy
20569	9178	Crime
20570	9179	Drama
20571	9180	Action
20572	9180	Crime
20573	9180	Drama
20574	9180	Mystery
20575	9180	Thriller
20576	9181	Action
20577	9181	Animation
20578	9181	Mystery
20579	9181	IMAX
20580	9182	Action
20581	9182	Crime
20582	9182	Thriller
20583	9183	Drama
20584	9183	Romance
20585	9184	Drama
20586	9185	Adventure
20587	9185	Drama
20588	9186	Documentary
20589	9187	Children
20590	9187	Drama
20591	9187	Mystery
20592	9188	Drama
20593	9189	Crime
20594	9189	Drama
20595	9189	Thriller
20596	9190	Action
20597	9190	Drama
20598	9190	Fantasy
20599	9191	Comedy
20600	9192	Documentary
20601	9193	Action
20602	9193	Crime
20603	9193	Drama
20604	9194	Drama
20605	9195	Drama
20606	9195	Romance
20607	9196	Horror
20608	9196	Thriller
20609	9197	Documentary
20610	9198	Drama
20611	9199	Drama
20612	9200	Drama
20613	9201	Crime
20614	9201	Horror
20615	9201	Thriller
20616	9202	Action
20617	9202	Romance
20618	9202	Western
20619	9203	Drama
20620	9204	Horror
20621	9205	Comedy
20622	9205	Drama
20623	9206	Drama
20624	9206	Romance
20625	9207	Children
20626	9207	Comedy
20627	9207	Musical
20628	9208	Adventure
20629	9208	Drama
20630	9208	Fantasy
20631	9208	Romance
20632	9209	Drama
20633	9209	War
20634	9210	Comedy
20635	9210	Drama
20636	9210	Thriller
20637	9211	Drama
20638	9212	Adventure
20639	9212	Drama
20640	9213	Action
20641	9213	Drama
20642	9213	Fantasy
20643	9214	Drama
20644	9215	Drama
20645	9216	Adventure
20646	9216	Animation
20647	9216	Children
20648	9216	Comedy
20649	9216	Fantasy
20650	9217	Documentary
20651	9218	Comedy
20652	9218	Romance
20653	9219	Action
20654	9219	Crime
20655	9219	Drama
20656	9219	Thriller
20657	9220	Animation
20658	9220	Children
20659	9220	Comedy
20660	9220	Drama
20661	9221	Action
20662	9221	Adventure
20663	9221	Drama
20664	9221	Thriller
20665	9222	Comedy
20666	9222	Crime
20667	9223	Action
20668	9223	Crime
20669	9223	Film-Noir
20670	9224	Action
20671	9224	Adventure
20672	9225	Action
20673	9225	Adventure
20674	9225	Drama
20675	9225	Sci-Fi
20676	9225	Thriller
20677	9226	Drama
20678	9226	Romance
20679	9226	Sci-Fi
20680	9227	Action
20681	9227	Adventure
20682	9227	Crime
20683	9227	IMAX
20684	9228	Action
20685	9228	Adventure
20686	9228	Drama
20687	9228	Thriller
20688	9228	IMAX
20689	9229	Drama
20690	9230	Action
20691	9230	Adventure
20692	9230	Comedy
20693	9230	Crime
20694	9230	Mystery
20695	9230	Thriller
20696	9231	Drama
20697	9231	Thriller
20698	9232	Comedy
20699	9232	Drama
20700	9233	Comedy
20701	9233	Romance
20702	9234	Action
20703	9234	Adventure
20704	9234	Thriller
20705	9234	IMAX
20706	9235	Comedy
20707	9235	Drama
20708	9236	Drama
20709	9236	Thriller
20710	9237	Action
20711	9237	Horror
20712	9237	Sci-Fi
20713	9237	Thriller
20714	9238	Drama
20715	9239	Horror
20716	9239	Thriller
20717	9240	Horror
20718	9240	Thriller
20719	9241	Film-Noir
20720	9242	Drama
20721	9242	Romance
20722	9242	War
20723	9243	Comedy
20724	9243	Drama
20725	9243	War
20726	9244	Comedy
20727	9244	Drama
20728	9244	Fantasy
20729	9245	Drama
20730	9246	Horror
20731	9246	Thriller
20732	9247	Action
20733	9247	Crime
20734	9247	Drama
20735	9247	Thriller
20736	9248	Animation
20737	9248	Musical
20738	9248	Romance
20739	9249	Drama
20740	9250	Drama
20741	9251	Comedy
20742	9251	Horror
20743	9252	Drama
20744	9253	Drama
20745	9254	Action
20746	9254	Fantasy
20747	9254	Horror
20748	9254	IMAX
20749	9255	Action
20750	9255	Drama
20751	9256	Crime
20752	9256	Thriller
20753	9257	Action
20754	9257	Thriller
20755	9258	Drama
20756	9258	Thriller
20757	9259	Horror
20758	9260	Comedy
20759	9261	Comedy
20760	9262	Horror
20761	9262	Thriller
20762	9263	Horror
20763	9263	Sci-Fi
20764	9263	Thriller
20765	9264	Action
20766	9264	Drama
20767	9264	Thriller
20768	9265	Action
20769	9265	Adventure
20770	9265	Drama
20771	9266	Action
20772	9266	Adventure
20773	9266	Drama
20774	9266	War
20775	9267	Drama
20776	9268	Drama
20777	9268	War
20778	9269	Comedy
20779	9269	Drama
20780	9270	Action
20781	9270	Comedy
20782	9270	Crime
20783	9271	Horror
20784	9271	Thriller
20785	9272	Horror
20786	9273	Action
20787	9273	Crime
20788	9273	Mystery
20789	9274	Action
20790	9274	Sci-Fi
20791	9274	Thriller
20792	9275	Drama
20793	9275	Horror
20794	9275	Thriller
20795	9276	Comedy
20796	9276	Drama
20797	9277	Drama
20798	9277	Mystery
20799	9277	Thriller
20800	9278	Action
20801	9278	Crime
20802	9278	Mystery
20803	9278	Thriller
20804	9279	Drama
20805	9279	Romance
20806	9280	Comedy
20807	9281	Children
20808	9281	Comedy
20809	9281	Drama
20810	9282	Comedy
20811	9282	Drama
20812	9282	Romance
20813	9283	Drama
20814	9283	Musical
20815	9284	Drama
20816	9284	Romance
20817	9284	Sci-Fi
20818	9285	Drama
20819	9285	War
20820	9286	Drama
20821	9287	Action
20822	9287	Fantasy
20823	9287	Thriller
20824	9288	Comedy
20825	9288	Romance
20826	9289	Comedy
20827	9289	Musical
20828	9290	Comedy
20829	9290	Musical
20830	9291	Drama
20831	9292	Documentary
20832	9292	War
20833	9293	Drama
20834	9294	Drama
20835	9294	Romance
20836	9295	Comedy
20837	9296	Crime
20838	9296	Thriller
20839	9296	Western
20840	9297	Drama
20841	9297	Thriller
20842	9298	Comedy
20843	9299	Animation
20844	9299	Fantasy
20845	9299	Musical
20846	9299	IMAX
20847	9300	Comedy
20848	9301	Action
20849	9301	Thriller
20850	9301	War
20851	9302	Action
20852	9302	Comedy
20853	9302	Romance
20854	9303	Action
20855	9303	Adventure
20856	9303	Sci-Fi
20857	9303	IMAX
20858	9304	Comedy
20859	9304	Drama
20860	9305	Horror
20861	9305	Mystery
20862	9306	Horror
20863	9306	Thriller
20864	9307	Drama
20865	9308	Action
20866	9308	Comedy
20867	9308	Crime
20868	9309	Comedy
20869	9309	Drama
20870	9310	Drama
20871	9310	Horror
20872	9310	Thriller
20873	9311	Action
20874	9311	Sci-Fi
20875	9311	Thriller
20876	9312	Crime
20877	9312	Drama
20878	9312	Horror
20879	9313	Comedy
20880	9314	Documentary
20881	9315	Documentary
20882	9316	Action
20883	9316	Adventure
20884	9316	Fantasy
20885	9316	IMAX
20886	9317	Drama
20887	9317	Fantasy
20888	9317	Sci-Fi
20889	9318	Action
20890	9318	Comedy
20891	9318	Sci-Fi
20892	9319	Horror
20893	9320	Comedy
20894	9321	Action
20895	9321	Crime
20896	9322	Comedy
20897	9322	Horror
20898	9322	Sci-Fi
20899	9322	Thriller
20900	9323	Comedy
20901	9323	Drama
20902	9324	Drama
20903	9325	Comedy
20904	9326	Horror
20905	9326	Thriller
20906	9327	Comedy
20907	9328	Mystery
20908	9328	Thriller
20909	9329	Action
20910	9329	Thriller
20911	9330	Action
20912	9330	Sci-Fi
20913	9330	Thriller
20914	9330	IMAX
20915	9331	Crime
20916	9331	Horror
20917	9331	Mystery
20918	9332	Comedy
20919	9332	Drama
20920	9333	Documentary
20921	9334	Comedy
20922	9334	Romance
20923	9335	Comedy
20924	9335	Romance
20925	9336	Comedy
20926	9336	Mystery
20927	9336	Thriller
20928	9337	Comedy
20929	9338	Drama
20930	9339	Drama
20931	9339	Musical
20932	9340	Drama
20933	9341	Action
20934	9341	Crime
20935	9341	Thriller
20936	9342	Comedy
20937	9343	Drama
20938	9343	Sci-Fi
20939	9344	Comedy
20940	9344	Horror
20941	9344	IMAX
20942	9345	Horror
20943	9345	Thriller
20944	9346	Drama
20945	9346	Thriller
20946	9347	Comedy
20947	9347	Romance
20948	9348	Drama
20949	9349	Drama
20950	9350	Crime
20951	9350	Drama
20952	9351	Documentary
20953	9351	Musical
20954	9352	Comedy
20955	9353	Adventure
20956	9353	Thriller
20957	9354	Action
20958	9354	Comedy
20959	9354	Sci-Fi
20960	9354	IMAX
20961	9355	Action
20962	9355	Adventure
20963	9355	Drama
20964	9356	Drama
20965	9356	Mystery
20966	9356	Sci-Fi
20967	9357	Crime
20968	9357	Drama
20969	9358	Drama
20970	9359	Adventure
20971	9359	Animation
20972	9359	Children
20973	9359	Comedy
20974	9360	Action
20975	9360	Horror
20976	9360	Sci-Fi
20977	9360	IMAX
20978	9361	Horror
20979	9361	Mystery
20980	9361	Thriller
20981	9362	Comedy
20982	9362	Crime
20983	9362	Drama
20984	9363	Drama
20985	9363	Romance
20986	9364	Crime
20987	9364	Mystery
20988	9364	Romance
20989	9365	Crime
20990	9365	Drama
20991	9366	Drama
20992	9366	Thriller
20993	9367	Drama
20994	9367	Romance
20995	9368	Comedy
20996	9369	Comedy
20997	9369	Drama
20998	9369	Romance
20999	9370	Crime
21000	9370	Drama
21001	9370	Thriller
21002	9371	Action
21003	9371	Animation
21004	9372	Children
21005	9372	Drama
21006	9373	Action
21007	9373	Crime
21008	9373	Drama
21009	9373	Thriller
21010	9374	Action
21011	9374	Drama
21012	9374	War
21013	9375	Drama
21014	9376	Comedy
21015	9376	Documentary
21016	9377	Crime
21017	9377	Drama
21018	9377	Film-Noir
21019	9378	Drama
21020	9379	Comedy
21021	9379	Drama
21022	9380	Comedy
21023	9380	Drama
21024	9381	Adventure
21025	9381	Animation
21026	9381	Children
21027	9381	Comedy
21028	9381	IMAX
21029	9382	Action
21030	9382	Animation
21031	9382	Fantasy
21032	9383	Action
21033	9383	Adventure
21034	9383	Animation
21035	9383	Children
21036	9384	Drama
21037	9384	Fantasy
21038	9384	Romance
21039	9385	Drama
21040	9385	Romance
21041	9386	Comedy
21042	9387	Comedy
21043	9388	Action
21044	9388	Fantasy
21045	9388	Horror
21046	9388	Thriller
21047	9389	Documentary
21048	9390	Comedy
21049	9390	Horror
21050	9391	Drama
21051	9392	Drama
21052	9392	Thriller
21053	9393	Comedy
21054	9393	Drama
21055	9393	Musical
21056	9393	IMAX
21057	9394	Comedy
21058	9394	Drama
21059	9394	Romance
21060	9395	Animation
21061	9395	Children
21062	9395	Comedy
21063	9395	Fantasy
21064	9396	Adventure
21065	9396	Animation
21066	9396	Children
21067	9396	Comedy
21068	9397	Comedy
21069	9397	Fantasy
21070	9398	Drama
21071	9398	Romance
21072	9399	Adventure
21073	9399	Drama
21074	9400	Action
21075	9400	Adventure
21076	9400	Sci-Fi
21077	9400	IMAX
21078	9401	Adventure
21079	9401	Animation
21080	9401	Comedy
21081	9402	Drama
21082	9402	Fantasy
21083	9403	Drama
21084	9404	Crime
21085	9404	Drama
21086	9404	Thriller
21087	9405	Drama
21088	9406	Documentary
21089	9407	Comedy
21090	9407	Thriller
21091	9408	Comedy
21092	9408	Sci-Fi
21093	9409	Comedy
21094	9410	Animation
21095	9410	Children
21096	9411	Crime
21097	9411	Thriller
21098	9412	Comedy
21099	9412	Drama
21100	9413	Animation
21101	9413	Children
21102	9413	Comedy
21103	9414	Comedy
21104	9414	Fantasy
21105	9414	Romance
21106	9415	Action
21107	9415	Sci-Fi
21108	9415	Thriller
21109	9416	Comedy
21110	9416	Drama
21111	9417	Documentary
21112	9418	Action
21113	9418	Adventure
21114	9418	Thriller
21115	9418	IMAX
21116	9419	Comedy
21117	9420	Crime
21118	9420	Thriller
21119	9421	Comedy
21120	9421	Drama
21121	9422	Documentary
21122	9423	Adventure
21123	9423	Animation
21124	9423	Comedy
21125	9424	Children
21126	9424	Comedy
21127	9425	Drama
21128	9426	Action
21129	9426	Comedy
21130	9426	Romance
21131	9427	Action
21132	9427	Thriller
21133	9428	Comedy
21134	9428	Drama
21135	9428	Fantasy
21136	9429	Crime
21137	9429	Drama
21138	9430	Comedy
21139	9430	Drama
21140	9431	Documentary
21141	9432	Horror
21142	9432	Thriller
21143	9433	Documentary
21144	9434	Comedy
21145	9435	Drama
21146	9435	Romance
21147	9436	Comedy
21148	9436	Musical
21149	9437	Documentary
21150	9438	Action
21151	9438	Crime
21152	9438	Sci-Fi
21153	9439	Drama
21154	9439	Thriller
21155	9440	Comedy
21156	9441	Horror
21157	9441	Thriller
21158	9442	Comedy
21159	9442	Drama
21160	9442	Sci-Fi
21161	9443	Documentary
21162	9444	Action
21163	9444	Horror
21164	9444	Sci-Fi
21165	9444	IMAX
21166	9445	Drama
21167	9446	Drama
21168	9447	Drama
21169	9448	Action
21170	9448	Sci-Fi
21171	9449	Drama
21172	9450	Drama
21173	9450	Thriller
21174	9451	Crime
21175	9451	Drama
21176	9451	Thriller
21177	9452	Horror
21178	9452	Thriller
21179	9453	Drama
21180	9453	Romance
21181	9454	Drama
21182	9455	Drama
21183	9455	Fantasy
21184	9455	Musical
21185	9455	Mystery
21186	9455	Sci-Fi
21187	9456	Thriller
21188	9457	Documentary
21189	9458	Drama
21190	9458	Musical
21191	9459	Comedy
21192	9459	Crime
21193	9459	Drama
21194	9460	Drama
21195	9460	Mystery
21196	9460	Thriller
21197	9461	Action
21198	9461	Crime
21199	9461	Drama
21200	9461	Thriller
21201	9462	Thriller
21202	9463	Drama
21203	9463	Romance
21204	9464	Comedy
21205	9464	Drama
21206	9465	Drama
21207	9466	Drama
21208	9466	Romance
21209	9467	Comedy
21210	9467	Drama
21211	9467	Musical
21212	9468	Drama
21213	9468	Romance
21214	9469	Horror
21215	9469	Thriller
21216	9470	Adventure
21217	9470	Documentary
21218	9470	Drama
21219	9471	Documentary
21220	9472	Animation
21221	9472	Comedy
21222	9472	Horror
21223	9472	IMAX
21224	9473	Horror
21225	9473	Thriller
21226	9474	Animation
21227	9474	Children
21228	9474	Comedy
21229	9475	Documentary
21230	9476	Comedy
21231	9477	Drama
21232	9477	Thriller
21233	9478	Comedy
21234	9478	Crime
21235	9479	Drama
21236	9480	Drama
21237	9480	Romance
21238	9481	Comedy
21239	9481	Sci-Fi
21240	9482	Drama
21241	9482	Thriller
21242	9483	Drama
21243	9484	Action
21244	9484	Drama
21245	9484	Thriller
21246	9485	Horror
21247	9485	Thriller
21248	9486	Drama
21249	9486	War
21250	9487	Drama
21251	9488	Drama
21252	9489	Comedy
21253	9489	Musical
21254	9490	Documentary
21255	9491	Drama
21256	9491	Sci-Fi
21257	9491	IMAX
21258	9492	Action
21259	9492	Adventure
21260	9492	Comedy
21261	9492	Documentary
21262	9492	Fantasy
21263	9493	Drama
21264	9494	Horror
21265	9494	Mystery
21266	9494	Thriller
21267	9495	Documentary
21268	9496	Drama
21269	9496	War
21270	9497	Action
21271	9497	Comedy
21272	9498	Crime
21273	9498	Drama
21274	9498	Thriller
21275	9499	Documentary
21276	9500	Drama
21277	9501	Drama
21278	9501	Romance
21279	9501	War
21280	9502	Drama
21281	9503	Horror
21282	9504	Drama
21283	9505	Animation
21284	9505	Comedy
21285	9506	Comedy
21286	9506	Drama
21287	9507	Drama
21288	9508	Drama
21289	9509	Adventure
21290	9509	Drama
21291	9509	IMAX
21292	9510	Action
21293	9510	Adventure
21294	9510	Crime
21295	9511	Drama
21296	9511	Thriller
21297	9512	Horror
21298	9512	Sci-Fi
21299	9512	Thriller
21300	9513	Drama
21301	9514	Action
21302	9514	Crime
21303	9514	Thriller
21304	9515	Action
21305	9515	Crime
21306	9515	Thriller
21307	9516	Drama
21308	9516	Romance
21309	9517	Comedy
21310	9517	Documentary
21311	9518	Drama
21312	9518	Horror
21313	9518	Thriller
21314	9519	Documentary
21315	9520	Action
21316	9520	Animation
21317	9520	Sci-Fi
21318	9521	Drama
21319	9521	War
21320	9522	Adventure
21321	9522	Drama
21322	9522	Fantasy
21323	9522	Romance
21324	9522	IMAX
21325	9523	Comedy
21326	9523	Drama
21327	9524	Action
21328	9524	War
21329	9525	Adventure
21330	9525	Animation
21331	9525	Children
21332	9525	Fantasy
21333	9525	IMAX
21334	9526	Adventure
21335	9526	Romance
21336	9526	War
21337	9527	Horror
21338	9527	Sci-Fi
21339	9528	Crime
21340	9528	Drama
21341	9528	Thriller
21342	9529	Drama
21343	9530	Drama
21344	9530	Fantasy
21345	9530	Thriller
21346	9531	Musical
21347	9532	Animation
21348	9532	Comedy
21349	9532	Romance
21350	9533	Drama
21351	9534	Drama
21352	9535	Comedy
21353	9535	Documentary
21354	9535	Musical
21355	9536	Drama
21356	9536	Romance
21357	9536	Western
21358	9537	Drama
21359	9538	Adventure
21360	9538	Fantasy
21361	9538	IMAX
21362	9539	Drama
21363	9540	Action
21364	9540	Drama
21365	9540	Thriller
21366	9541	Action
21367	9541	Crime
21368	9541	Drama
21369	9542	Comedy
21370	9542	Horror
21371	9542	Romance
21372	9543	Horror
21373	9543	Thriller
21374	9544	Drama
21375	9544	Horror
21376	9544	Romance
21377	9545	Comedy
21378	9546	Action
21379	9546	Crime
21380	9546	Thriller
21381	9547	Action
21382	9547	Drama
21383	9547	Western
21384	9548	Drama
21385	9549	Horror
21386	9550	Drama
21387	9550	Thriller
21388	9551	Drama
21389	9551	Musical
21390	9551	Romance
21391	9551	IMAX
21392	9552	Comedy
21393	9552	Documentary
21394	9553	Comedy
21395	9553	Drama
21396	9554	Horror
21397	9554	Thriller
21398	9555	Comedy
21399	9556	Comedy
21400	9556	Fantasy
21401	9556	Horror
21402	9557	Drama
21403	9558	Action
21404	9558	Drama
21405	9559	Drama
21406	9559	Sci-Fi
21407	9560	Drama
21408	9561	Comedy
21409	9562	Comedy
21410	9563	Comedy
21411	9564	Drama
21412	9564	Thriller
21413	9565	Crime
21414	9565	Drama
21415	9566	Action
21416	9566	Crime
21417	9566	Drama
21418	9567	Thriller
21419	9568	Crime
21420	9568	Drama
21421	9568	Thriller
21422	9569	Comedy
21423	9569	Horror
21424	9570	Documentary
21425	9571	Action
21426	9571	Animation
21427	9572	Crime
21428	9572	Drama
21429	9572	Mystery
21430	9573	Crime
21431	9573	Drama
21432	9573	Mystery
21433	9574	Crime
21434	9574	Drama
21435	9575	Crime
21436	9575	Mystery
21437	9576	Action
21438	9576	Crime
21439	9576	Thriller
21440	9577	Horror
21441	9578	Romance
21442	9578	Sci-Fi
21443	9578	Thriller
21444	9579	Crime
21445	9579	Drama
21446	9579	Thriller
21447	9580	Crime
21448	9580	Drama
21449	9580	Thriller
21450	9581	Comedy
21451	9581	Drama
21452	9582	Documentary
21453	9582	Musical
21454	9583	Comedy
21455	9584	Drama
21456	9584	War
21457	9585	Documentary
21458	9586	Crime
21459	9586	Thriller
21460	9587	Drama
21461	9588	Comedy
21462	9589	Action
21463	9589	Fantasy
21464	9589	Horror
21465	9589	IMAX
21466	9590	Adventure
21467	9590	Documentary
21468	9591	Documentary
21469	9592	Drama
21470	9593	Drama
21471	9594	Drama
21472	9595	Action
21473	9595	Thriller
21474	9596	Drama
21475	9597	Action
21476	9597	Comedy
21477	9597	Crime
21478	9598	Comedy
21479	9598	Crime
21480	9599	Drama
21481	9600	Crime
21482	9600	Drama
21483	9600	Mystery
21484	9600	Thriller
21485	9601	Drama
21486	9602	Comedy
21487	9602	Crime
21488	9603	Documentary
21489	9604	Drama
21490	9604	Thriller
21491	9604	War
21492	9605	Drama
21493	9605	Fantasy
21494	9605	Romance
21495	9606	Action
21496	9606	Crime
21497	9606	Thriller
21498	9606	IMAX
21499	9607	Comedy
21500	9608	Drama
21501	9608	Mystery
21502	9608	Romance
21503	9609	Documentary
21504	9610	Action
21505	9610	Sci-Fi
21506	9610	Thriller
21507	9611	Drama
21508	9611	Romance
21509	9612	Comedy
21510	9612	Drama
21511	9612	Romance
21512	9613	Action
21513	9613	Drama
21514	9613	Thriller
21515	9614	Documentary
21516	9615	Horror
21517	9615	Sci-Fi
21518	9615	Thriller
21519	9616	Adventure
21520	9616	Comedy
21521	9616	Fantasy
21522	9616	Romance
21523	9616	IMAX
21524	9617	Action
21525	9617	Horror
21526	9617	Thriller
21527	9618	Adventure
21528	9618	Fantasy
21529	9618	IMAX
21530	9619	Horror
21531	9619	Thriller
21532	9620	Action
21533	9620	Romance
21534	9620	War
21535	9621	Action
21536	9621	Adventure
21537	9621	Sci-Fi
21538	9621	Thriller
21539	9621	IMAX
21540	9622	Drama
21541	9622	Mystery
21542	9622	Thriller
21543	9623	Action
21544	9623	Adventure
21545	9623	Fantasy
21546	9623	IMAX
21547	9624	Action
21548	9624	Crime
21549	9624	Drama
21550	9624	Romance
21551	9624	Thriller
21552	9625	Adventure
21553	9625	Animation
21554	9625	Comedy
21555	9626	Drama
21556	9627	Drama
21557	9627	War
21558	9628	Crime
21559	9628	Drama
21560	9628	Thriller
21561	9629	Comedy
21562	9630	Comedy
21563	9630	Crime
21564	9630	Drama
21565	9631	Drama
21566	9631	Thriller
21567	9632	Action
21568	9632	Thriller
21569	9633	Drama
21570	9634	Crime
21571	9634	Drama
21572	9635	Comedy
21573	9635	Fantasy
21574	9635	Thriller
21575	9636	Drama
21576	9637	Comedy
21577	9637	Romance
21578	9638	Crime
21579	9638	Drama
21580	9639	Horror
21581	9640	Crime
21582	9640	Thriller
21583	9641	Action
21584	9641	Adventure
21585	9641	Crime
21586	9641	Thriller
21587	9642	Documentary
21588	9643	Action
21589	9643	Adventure
21590	9643	Sci-Fi
21591	9643	IMAX
21592	9644	Drama
21593	9644	Romance
21594	9645	Drama
21595	9646	Documentary
21596	9646	Drama
21597	9647	Animation
21598	9647	Fantasy
21599	9648	Documentary
21600	9649	Drama
21601	9649	Thriller
21602	9650	Comedy
21603	9651	Action
21604	9651	Comedy
21605	9651	Crime
21606	9652	Comedy
21607	9652	Romance
21608	9653	Horror
21609	9653	Thriller
21610	9654	Comedy
21611	9654	Horror
21612	9654	Sci-Fi
21613	9655	Action
21614	9655	Animation
21615	9655	Fantasy
21616	9656	Action
21617	9656	Drama
21618	9656	IMAX
21619	9657	Comedy
21620	9657	Crime
21621	9657	Drama
21622	9658	Action
21623	9658	Comedy
21624	9659	Action
21625	9659	Sci-Fi
21626	9659	Thriller
21627	9659	IMAX
21628	9660	Action
21629	9660	Thriller
21630	9661	Adventure
21631	9661	Crime
21632	9661	Drama
21633	9662	Action
21634	9662	Drama
21635	9663	Horror
21636	9663	Thriller
21637	9664	Crime
21638	9664	Thriller
21639	9665	Drama
21640	9666	Drama
21641	9667	Comedy
21642	9667	Drama
21643	9668	Drama
21644	9668	Mystery
21645	9668	Thriller
21646	9669	Drama
21647	9670	Film-Noir
21648	9670	Mystery
21649	9670	Thriller
21650	9671	Action
21651	9671	Adventure
21652	9671	Sci-Fi
21653	9671	IMAX
21654	9672	Comedy
21655	9673	Drama
21656	9673	Thriller
21657	9674	Crime
21658	9675	Adventure
21659	9675	Comedy
21660	9676	Drama
21661	9676	Thriller
21662	9677	Comedy
21663	9678	Documentary
21664	9678	War
21665	9679	Action
21666	9679	Crime
21667	9679	Thriller
21668	9679	IMAX
21669	9680	Adventure
21670	9680	Animation
21671	9680	Fantasy
21672	9681	Drama
21673	9681	Mystery
21674	9681	Romance
21675	9682	Comedy
21676	9682	Crime
21677	9682	Drama
21678	9683	Comedy
21679	9683	Drama
21680	9684	Drama
21681	9685	Drama
21682	9685	Musical
21683	9686	Action
21684	9686	Adventure
21685	9686	Sci-Fi
21686	9686	IMAX
21687	9687	Crime
21688	9687	Mystery
21689	9687	Thriller
21690	9688	Horror
21691	9689	Drama
21692	9690	Drama
21693	9691	Drama
21694	9691	Horror
21695	9691	Thriller
21696	9692	Comedy
21697	9692	Drama
21698	9693	Comedy
21699	9693	Crime
21700	9693	Drama
21701	9694	Comedy
21702	9694	Drama
21703	9694	Romance
21704	9695	Action
21705	9695	Adventure
21706	9695	Fantasy
21707	9695	Sci-Fi
21708	9695	IMAX
21709	9696	Comedy
21710	9697	Crime
21711	9697	Horror
21712	9697	Thriller
21713	9698	Documentary
21714	9699	Crime
21715	9699	Drama
21716	9700	Adventure
21717	9700	Animation
21718	9700	Comedy
21719	9701	Action
21720	9701	Adventure
21721	9701	Animation
21722	9702	Horror
21723	9702	Thriller
21724	9703	Action
21725	9703	Adventure
21726	9703	Sci-Fi
21727	9703	IMAX
21728	9704	Thriller
21729	9705	Action
21730	9705	Drama
21731	9705	Horror
21732	9705	IMAX
21733	9706	Action
21734	9706	Drama
21735	9706	Sci-Fi
21736	9706	IMAX
21737	9707	Drama
21738	9708	Horror
21739	9708	Thriller
21740	9709	Sci-Fi
21741	9709	Thriller
21742	9710	Drama
21743	9710	Fantasy
21744	9710	Mystery
21745	9710	Thriller
21746	9711	Comedy
21747	9712	Animation
21748	9712	Children
21749	9712	Comedy
21750	9712	IMAX
21751	9713	Action
21752	9713	Drama
21753	9713	Thriller
21754	9713	IMAX
21755	9714	Action
21756	9714	Comedy
21757	9714	Sci-Fi
21758	9715	Action
21759	9715	Crime
21760	9715	Thriller
21761	9716	Action
21762	9716	Comedy
21763	9716	Crime
21764	9717	Action
21765	9717	Adventure
21766	9717	Western
21767	9717	IMAX
21768	9718	Action
21769	9718	Crime
21770	9719	Documentary
21771	9720	Horror
21772	9720	Thriller
21773	9721	Documentary
21774	9722	Comedy
21775	9722	Drama
21776	9722	Romance
21777	9723	Drama
21778	9723	Thriller
21779	9724	Western
21780	9725	Documentary
21781	9726	Horror
21782	9727	Sci-Fi
21783	9728	Drama
21784	9729	Action
21785	9729	Comedy
21786	9729	Fantasy
21787	9730	Action
21788	9730	Adventure
21789	9730	Animation
21790	9730	Fantasy
21791	9730	Sci-Fi
21792	9731	Action
21793	9731	Thriller
21794	9732	Horror
21795	9732	Thriller
21796	9733	Adventure
21797	9733	Animation
21798	9733	Children
21799	9733	Comedy
21800	9733	Fantasy
21801	9734	Action
21802	9734	Adventure
21803	9734	Fantasy
21804	9734	Sci-Fi
21805	9735	Comedy
21806	9735	Drama
21807	9735	Romance
21808	9736	Action
21809	9736	Comedy
21810	9736	Crime
21811	9736	Thriller
21812	9737	Crime
21813	9737	Drama
21814	9737	Mystery
21815	9738	Thriller
21816	9739	Thriller
21817	9740	Comedy
21818	9741	Comedy
21819	9741	Drama
21820	9742	Mystery
21821	9742	Romance
21822	9742	Thriller
21823	9743	Action
21824	9743	Comedy
21825	9743	Crime
21826	9744	Drama
21827	9745	Comedy
21828	9745	Drama
21829	9746	Documentary
21830	9747	Comedy
21831	9748	Adventure
21832	9748	Children
21833	9748	Fantasy
21834	9749	Comedy
21835	9750	Drama
21836	9751	Action
21837	9751	Animation
21838	9751	Crime
21839	9752	Documentary
21840	9753	Action
21841	9753	IMAX
21842	9754	Comedy
21843	9755	Documentary
21844	9756	Comedy
21845	9756	Crime
21846	9757	Comedy
21847	9758	Crime
21848	9759	Action
21849	9759	Comedy
21850	9759	Crime
21851	9760	Action
21852	9760	Sci-Fi
21853	9760	Thriller
21854	9760	IMAX
21855	9761	Documentary
21856	9762	Crime
21857	9762	Horror
21858	9762	Thriller
21859	9763	Animation
21860	9763	Drama
21861	9763	Romance
21862	9764	Action
21863	9764	Adventure
21864	9764	Drama
21865	9764	IMAX
21866	9765	Drama
21867	9766	Documentary
21868	9767	Drama
21869	9768	Drama
21870	9769	Drama
21871	9770	Drama
21872	9770	Fantasy
21873	9770	Romance
21874	9771	Drama
21875	9772	Action
21876	9772	Animation
21877	9772	Sci-Fi
21878	9773	Crime
21879	9773	Drama
21880	9773	Thriller
21881	9774	Horror
21882	9774	Thriller
21883	9775	Adventure
21884	9775	Comedy
21885	9776	Adventure
21886	9776	Comedy
21887	9776	Romance
21888	9777	Thriller
21889	9777	War
21890	9778	Crime
21891	9778	Drama
21892	9778	Mystery
21893	9779	Drama
21894	9780	Action
21895	9780	Sci-Fi
21896	9780	IMAX
21897	9781	Comedy
21898	9781	Drama
21899	9782	Crime
21900	9782	Horror
21901	9782	Thriller
21902	9783	Drama
21903	9783	Mystery
21904	9783	Thriller
21905	9784	Drama
21906	9784	Thriller
21907	9785	Comedy
21908	9785	Romance
21909	9786	Horror
21910	9786	Thriller
21911	9787	Action
21912	9787	Drama
21913	9788	Action
21914	9788	Comedy
21915	9788	Crime
21916	9789	Drama
21917	9790	Drama
21918	9790	Thriller
21919	9791	Comedy
21920	9792	Adventure
21921	9792	Drama
21922	9793	Comedy
21923	9793	Drama
21924	9793	Romance
21925	9794	Comedy
21926	9794	Drama
21927	9794	Romance
21928	9795	Western
21929	9796	Documentary
21930	9797	Crime
21931	9797	Drama
21932	9797	Thriller
21933	9798	Drama
21934	9798	Romance
21935	9799	Action
21936	9799	Drama
21937	9800	Horror
21938	9800	Thriller
21939	9801	Drama
21940	9802	Animation
21941	9802	Children
21942	9802	Comedy
21943	9802	Fantasy
21944	9803	Crime
21945	9803	Drama
21946	9803	Mystery
21947	9804	Comedy
21948	9804	Documentary
21949	9805	Adventure
21950	9805	Drama
21951	9805	Thriller
21952	9805	IMAX
21953	9806	Comedy
21954	9806	Crime
21955	9806	Drama
21956	9807	Action
21957	9807	Mystery
21958	9807	Thriller
21959	9808	Drama
21960	9809	Comedy
21961	9809	Crime
21962	9809	Drama
21963	9810	Drama
21964	9810	Horror
21965	9811	Drama
21966	9811	Mystery
21967	9811	Thriller
21968	9812	Crime
21969	9812	Drama
21970	9812	Thriller
21971	9813	Comedy
21972	9813	Drama
21973	9813	Thriller
21974	9814	Drama
21975	9815	Drama
21976	9816	Action
21977	9816	Adventure
21978	9816	Drama
21979	9817	Action
21980	9817	Adventure
21981	9817	Sci-Fi
21982	9817	IMAX
21983	9818	Comedy
21984	9818	Musical
21985	9819	Crime
21986	9819	Drama
21987	9820	Comedy
21988	9821	Action
21989	9821	Adventure
21990	9821	Fantasy
21991	9821	IMAX
21992	9822	Drama
21993	9823	Drama
21994	9824	Drama
21995	9825	Action
21996	9825	Adventure
21997	9825	Crime
21998	9826	Action
21999	9826	Drama
22000	9826	Thriller
22001	9827	Comedy
22002	9828	Comedy
22003	9829	Drama
22004	9830	Action
22005	9830	Adventure
22006	9830	Animation
22007	9830	Children
22008	9830	Comedy
22009	9830	Sci-Fi
22010	9831	Comedy
22011	9831	Drama
22012	9831	Romance
22013	9832	Drama
22014	9833	Drama
22015	9834	Comedy
22016	9834	Documentary
22017	9835	Comedy
22018	9835	Drama
22019	9836	Children
22020	9836	Drama
22021	9836	War
22022	9837	Drama
22023	9838	Action
22024	9838	Adventure
22025	9838	Sci-Fi
22026	9838	IMAX
22027	9839	Adventure
22028	9839	Fantasy
22029	9839	IMAX
22030	9840	Action
22031	9840	Adventure
22032	9840	Fantasy
22033	9841	Adventure
22034	9841	Fantasy
22035	9842	Mystery
22036	9842	Thriller
22037	9843	Crime
22038	9843	Drama
22039	9843	Film-Noir
22040	9843	Thriller
22041	9844	Adventure
22042	9844	Drama
22043	9844	Sci-Fi
22044	9845	Adventure
22045	9845	Animation
22046	9845	Comedy
22047	9845	Fantasy
22048	9845	Musical
22049	9845	Romance
22050	9846	Drama
22051	9847	Comedy
22052	9847	Crime
22053	9847	Drama
22054	9848	Action
22055	9848	Crime
22056	9848	Thriller
22057	9849	Drama
22058	9850	Comedy
22059	9850	Drama
22060	9851	Action
22061	9851	Animation
22062	9851	Drama
22063	9852	Comedy
22064	9852	Drama
22065	9853	Crime
22066	9853	Drama
22067	9854	Adventure
22068	9854	Comedy
22069	9854	Drama
22070	9855	Drama
22071	9855	Romance
22072	9855	Sci-Fi
22073	9856	Documentary
22074	9857	Action
22075	9857	Drama
22076	9857	Thriller
22077	9857	War
22078	9858	Comedy
22079	9858	Drama
22080	9859	Action
22081	9859	Drama
22082	9860	Animation
22083	9860	Documentary
22084	9861	Action
22085	9861	Drama
22086	9861	Mystery
22087	9862	Comedy
22088	9863	Action
22089	9863	Drama
22090	9863	Sci-Fi
22091	9864	Action
22092	9864	Horror
22093	9864	Sci-Fi
22094	9865	Action
22095	9865	Comedy
22096	9865	Crime
22097	9866	Drama
22098	9866	Horror
22099	9866	Romance
22100	9867	Drama
22101	9867	Romance
22102	9868	Drama
22103	9868	Romance
22104	9869	Drama
22105	9870	Drama
22106	9871	Drama
22107	9872	Drama
22108	9872	Horror
22109	9872	Mystery
22110	9872	Thriller
22111	9873	Comedy
22112	9873	Romance
22113	9874	Action
22114	9874	Comedy
22115	9875	Comedy
22116	9875	Drama
22117	9875	Mystery
22118	9875	Romance
22119	9876	Action
22120	9876	Drama
22121	9876	Thriller
22122	9876	IMAX
22123	9877	Adventure
22124	9877	Romance
22125	9877	Sci-Fi
22126	9877	IMAX
22127	9878	Drama
22128	9879	Action
22129	9879	Drama
22130	9879	Fantasy
22131	9879	Horror
22132	9880	Documentary
22133	9881	Crime
22134	9881	Drama
22135	9881	Film-Noir
22136	9881	Thriller
22137	9882	Comedy
22138	9882	Drama
22139	9882	Romance
22140	9883	Action
22141	9883	Adventure
22142	9883	Animation
22143	9883	Fantasy
22144	9883	Sci-Fi
22145	9884	Horror
22146	9885	Comedy
22147	9886	Comedy
22148	9887	Comedy
22149	9887	Drama
22150	9888	Comedy
22151	9888	Drama
22152	9889	Drama
22153	9890	Mystery
22154	9890	Thriller
22155	9891	Drama
22156	9891	Romance
22157	9892	Drama
22158	9892	Romance
22159	9893	Adventure
22160	9893	Children
22161	9893	Drama
22162	9894	Action
22163	9894	Crime
22164	9894	Thriller
22165	9895	Comedy
22166	9895	Drama
22167	9896	Action
22168	9896	Drama
22169	9896	War
22170	9897	Action
22171	9897	Adventure
22172	9897	Animation
22173	9897	Children
22174	9897	Comedy
22175	9897	Fantasy
22176	9898	Drama
22177	9899	Crime
22178	9899	Drama
22179	9899	Horror
22180	9899	Thriller
22181	9900	Action
22182	9900	Crime
22183	9900	Sci-Fi
22184	9900	IMAX
22185	9901	Crime
22186	9902	Animation
22187	9902	Crime
22188	9902	Drama
22189	9902	Horror
22190	9902	Mystery
22191	9903	Action
22192	9903	Adventure
22193	9903	Animation
22194	9903	Crime
22195	9903	Sci-Fi
22196	9904	Drama
22197	9904	Mystery
22198	9905	Action
22199	9905	Crime
22200	9905	Drama
22201	9906	Comedy
22202	9906	Drama
22203	9907	Drama
22204	9907	Fantasy
22205	9907	Mystery
22206	9908	Adventure
22207	9908	Drama
22208	9908	Romance
22209	9909	Comedy
22210	9909	Drama
22211	9910	Comedy
22212	9911	Crime
22213	9911	Drama
22214	9911	Mystery
22215	9911	Thriller
22216	9912	Drama
22217	9912	Romance
22218	9913	Thriller
22219	9914	Comedy
22220	9914	Romance
22221	9915	Sci-Fi
22222	9915	IMAX
22223	9916	Action
22224	9916	Crime
22225	9916	Drama
22226	9917	Action
22227	9917	Mystery
22228	9917	Thriller
22229	9918	Thriller
22230	9919	Animation
22231	9919	Romance
22232	9920	Action
22233	9920	Drama
22234	9920	War
22235	9920	IMAX
22236	9921	Comedy
22237	9922	Drama
22238	9922	Horror
22239	9922	Thriller
22240	9923	Comedy
22241	9923	Thriller
22242	9924	Horror
22243	9924	Sci-Fi
22244	9924	Thriller
22245	9925	Action
22246	9925	Crime
22247	9925	Drama
22248	9925	IMAX
22249	9926	Comedy
22250	9926	Crime
22251	9926	Drama
22252	9927	Drama
22253	9927	War
22254	9928	Animation
22255	9928	Sci-Fi
22256	9929	Action
22257	9929	Adventure
22258	9929	Sci-Fi
22259	9929	IMAX
22260	9930	Drama
22261	9931	Adventure
22262	9931	Drama
22263	9931	IMAX
22264	9932	Drama
22265	9932	Thriller
22266	9933	Crime
22267	9933	Drama
22268	9933	Thriller
22269	9934	Action
22270	9934	Adventure
22271	9934	Fantasy
22272	9934	Horror
22273	9935	Comedy
22274	9935	Crime
22275	9935	Drama
22276	9936	Drama
22277	9937	Sci-Fi
22278	9937	Thriller
22279	9938	Drama
22280	9939	Children
22281	9939	Comedy
22282	9939	Drama
22283	9940	Action
22284	9940	Crime
22285	9940	Thriller
22286	9941	Action
22287	9941	Sci-Fi
22288	9941	IMAX
22289	9942	Crime
22290	9942	Drama
22291	9942	Thriller
22292	9943	Comedy
22293	9943	Drama
22294	9944	Horror
22295	9945	Drama
22296	9945	Thriller
22297	9946	Mystery
22298	9946	Romance
22299	9947	Adventure
22300	9947	Animation
22301	9947	Children
22302	9947	Comedy
22303	9948	Comedy
22304	9949	Drama
22305	9949	Sci-Fi
22306	9949	IMAX
22307	9950	Comedy
22308	9950	Romance
22309	9951	Action
22310	9951	Comedy
22311	9951	Fantasy
22312	9952	Action
22313	9952	Crime
22314	9952	Drama
22315	9953	Crime
22316	9953	Drama
22317	9953	Thriller
22318	9954	Drama
22319	9955	Comedy
22320	9956	Documentary
22321	9956	Sci-Fi
22322	9957	Drama
22323	9958	Drama
22324	9958	Romance
22325	9959	Crime
22326	9959	Film-Noir
22327	9959	Mystery
22328	9960	Action
22329	9960	Sci-Fi
22330	9961	Action
22331	9961	Adventure
22332	9961	Sci-Fi
22333	9962	Action
22334	9962	Adventure
22335	9962	Sci-Fi
22336	9962	IMAX
22337	9963	Thriller
22338	9964	Drama
22339	9965	Drama
22340	9966	Comedy
22341	9967	Drama
22342	9968	Horror
22343	9968	Thriller
22344	9969	Comedy
22345	9970	Comedy
22346	9970	Romance
22347	9971	Action
22348	9971	Adventure
22349	9971	Children
22350	9971	IMAX
22351	9972	Thriller
22352	9973	Drama
22353	9973	Fantasy
22354	9974	Comedy
22355	9974	Western
22356	9975	Drama
22357	9975	Romance
22358	9976	Action
22359	9976	Sci-Fi
22360	9976	IMAX
22361	9977	Action
22362	9977	Adventure
22363	9977	Thriller
22364	9978	Drama
22365	9978	Romance
22366	9979	Comedy
22367	9979	Drama
22368	9980	Action
22369	9980	Animation
22370	9980	Children
22371	9981	Drama
22372	9982	Comedy
22373	9982	Drama
22374	9983	Action
22375	9983	Comedy
22376	9983	Crime
22377	9984	Action
22378	9984	Crime
22379	9984	Thriller
22380	9985	Action
22381	9985	Adventure
22382	9985	Animation
22383	9986	Comedy
22384	9986	Drama
22385	9987	Romance
22386	9987	Thriller
22387	9988	Documentary
22388	9989	Drama
22389	9990	Comedy
22390	9991	Drama
22391	9991	Musical
22392	9992	Documentary
22393	9993	Drama
22394	9993	Film-Noir
22395	9993	Mystery
22396	9994	Action
22397	9994	Adventure
22398	9994	Sci-Fi
22399	9995	Comedy
22400	9995	Romance
22401	9996	Drama
22402	9997	Comedy
22403	9998	Comedy
22404	9999	Drama
22405	9999	Horror
22406	9999	Thriller
22407	10000	Drama
22408	10001	Drama
22409	10001	Thriller
22410	10002	Documentary
22411	10003	Sci-Fi
22412	10004	Crime
22413	10004	Horror
22414	10004	Thriller
22415	10005	Comedy
22416	10005	Drama
22417	10005	Romance
22418	10006	Action
22419	10006	Adventure
22420	10006	Sci-Fi
22421	10007	Sci-Fi
22422	10007	Thriller
22423	10008	Action
22424	10008	Adventure
22425	10009	Thriller
22426	10010	Comedy
22427	10010	Drama
22428	10011	Drama
22429	10011	War
22430	10012	Drama
22431	10013	Crime
22432	10013	Drama
22433	10014	Action
22434	10014	Thriller
22435	10015	Comedy
22436	10015	Drama
22437	10015	Romance
22438	10016	Drama
22439	10017	Action
22440	10017	Comedy
22441	10017	Crime
22442	10017	Thriller
22443	10018	Comedy
22444	10018	Horror
22445	10018	Thriller
22446	10019	Comedy
22447	10019	Drama
22448	10020	Action
22449	10020	Animation
22450	10020	Crime
22451	10020	Thriller
22452	10021	Crime
22453	10021	Drama
22454	10021	Film-Noir
22455	10022	Action
22456	10022	Adventure
22457	10022	Sci-Fi
22458	10023	Action
22459	10023	Adventure
22460	10023	Comedy
22461	10024	Crime
22462	10024	Drama
22463	10025	Drama
22464	10025	Sci-Fi
22465	10026	Comedy
22466	10026	Crime
22467	10027	Comedy
22468	10028	Action
22469	10028	Crime
22470	10028	Thriller
22471	10029	Comedy
22472	10029	Drama
22473	10029	Romance
22474	10030	Drama
22475	10030	Thriller
22476	10031	Crime
22477	10031	Drama
22478	10032	Drama
22479	10033	Drama
22480	10033	Mystery
22481	10033	Sci-Fi
22482	10033	Thriller
22483	10034	Comedy
22484	10034	Crime
22485	10035	Thriller
22486	10036	Documentary
22487	10037	Comedy
22488	10037	Drama
22489	10038	Action
22490	10038	Thriller
22491	10039	Drama
22492	10040	Crime
22493	10040	Drama
22494	10040	Thriller
22495	10041	Drama
22496	10042	Comedy
22497	10042	Drama
22498	10042	Romance
22499	10043	Action
22500	10043	Mystery
22501	10043	Sci-Fi
22502	10044	Thriller
22503	10045	Action
22504	10045	Crime
22505	10045	Mystery
22506	10045	Thriller
22507	10046	Documentary
22508	10046	Musical
22509	10047	Drama
22510	10047	Thriller
22511	10047	War
22512	10048	Drama
22513	10049	Drama
22514	10049	Western
22515	10050	Action
22516	10050	Crime
22517	10050	Thriller
22518	10051	Comedy
22519	10051	Documentary
22520	10052	Thriller
22521	10053	Adventure
22522	10053	Animation
22523	10053	Children
22524	10053	Comedy
22525	10053	Fantasy
22526	10054	Animation
22527	10054	Drama
22528	10054	Fantasy
22529	10055	Comedy
22530	10055	Drama
22531	10056	Action
22532	10056	War
22533	10057	Comedy
22534	10057	Drama
22535	10057	Horror
22536	10058	Adventure
22537	10058	Comedy
22538	10058	Drama
22539	10059	Crime
22540	10059	Drama
22541	10060	Horror
22542	10060	Mystery
22543	10061	Horror
22544	10062	Comedy
22545	10062	Drama
22546	10063	Comedy
22547	10063	Romance
22548	10064	Action
22549	10064	Drama
22550	10064	Fantasy
22551	10065	Sci-Fi
22552	10065	Thriller
22553	10066	Action
22554	10066	Thriller
22555	10067	Action
22556	10067	Mystery
22557	10067	Sci-Fi
22558	10067	Thriller
22559	10068	Comedy
22560	10068	Horror
22561	10069	Action
22562	10069	Thriller
22563	10070	Drama
22564	10071	Drama
22565	10072	Action
22566	10072	Drama
22567	10072	War
22568	10073	Drama
22569	10073	Western
22570	10074	Comedy
22571	10075	Drama
22572	10075	Sci-Fi
22573	10075	Western
22574	10076	Comedy
22575	10076	Romance
22576	10077	Crime
22577	10077	Drama
22578	10077	Thriller
22579	10078	Action
22580	10078	Animation
22581	10078	Comedy
22582	10079	Drama
22583	10079	Sci-Fi
22584	10079	Thriller
22585	10080	Drama
22586	10081	Action
22587	10081	Fantasy
22588	10081	Horror
22589	10082	Action
22590	10082	Drama
22591	10082	War
22592	10083	Horror
22593	10083	Thriller
22594	10084	Horror
22595	10085	Drama
22596	10086	Drama
22597	10087	Drama
22598	10088	Drama
22599	10089	Drama
22600	10090	Drama
22601	10090	Thriller
22602	10090	War
22603	10091	Comedy
22604	10091	Crime
22605	10091	Drama
22606	10091	Mystery
22607	10091	Romance
22608	10092	Adventure
22609	10092	Sci-Fi
22610	10092	Thriller
22611	10093	Action
22612	10093	Adventure
22613	10093	Drama
22614	10094	Comedy
22615	10094	Drama
22616	10094	Thriller
22617	10095	Comedy
22618	10096	Drama
22619	10097	Comedy
22620	10097	Drama
22621	10098	Drama
22622	10098	Romance
22623	10099	Documentary
22624	10099	War
22625	10100	Animation
22626	10100	Comedy
22627	10101	Animation
22628	10101	Drama
22629	10102	Action
22630	10102	Adventure
22631	10102	Comedy
22632	10103	Animation
22633	10103	Children
22634	10103	Fantasy
22635	10104	Drama
22636	10105	Comedy
22637	10106	Drama
22638	10107	Action
22639	10107	Adventure
22640	10107	Sci-Fi
22641	10107	Thriller
22642	10108	Documentary
22643	10109	Comedy
22644	10109	Crime
22645	10110	Horror
22646	10111	War
22647	10112	Adventure
22648	10112	Animation
22649	10112	Children
22650	10112	Comedy
22651	10113	Action
22652	10113	Drama
22653	10113	Thriller
22654	10113	War
22655	10114	Drama
22656	10115	Children
22657	10115	Comedy
22658	10116	Action
22659	10116	Thriller
22660	10117	Comedy
22661	10117	Crime
22662	10117	Thriller
22663	10118	Drama
22664	10119	Drama
22665	10119	Thriller
22666	10120	Sci-Fi
22667	10121	Crime
22668	10121	Drama
22669	10121	Mystery
22670	10121	Thriller
22671	10122	Drama
22672	10123	Adventure
22673	10123	Fantasy
22674	10124	Drama
22675	10125	Drama
22676	10125	War
22677	10126	Adventure
22678	10126	Mystery
22679	10126	Thriller
22680	10127	Drama
22681	10128	Horror
22682	10128	Romance
22683	10128	Thriller
22684	10129	Comedy
22685	10130	Action
22686	10130	Crime
22687	10130	Drama
22688	10130	Thriller
22689	10131	Drama
22690	10132	Comedy
22691	10133	Comedy
22692	10134	Horror
22693	10134	Mystery
22694	10134	Sci-Fi
22695	10135	Drama
22696	10136	Children
22697	10136	Comedy
22698	10136	Fantasy
22699	10136	Musical
22700	10137	Action
22701	10137	Comedy
22702	10138	Action
22703	10138	Adventure
22704	10138	Comedy
22705	10138	Crime
22706	10139	Adventure
22707	10139	Children
22708	10139	Comedy
22709	10139	Fantasy
22710	10140	Comedy
22711	10140	Drama
22712	10141	Drama
22713	10141	Western
22714	10142	Children
22715	10142	Comedy
22716	10142	Drama
22717	10142	Musical
22718	10143	Comedy
22719	10143	Drama
22720	10143	Fantasy
22721	10143	Mystery
22722	10143	Romance
22723	10144	Action
22724	10144	Drama
22725	10144	Thriller
22726	10145	Action
22727	10145	Thriller
22728	10146	Documentary
22729	10147	Drama
22730	10148	Action
22731	10148	Crime
22732	10148	Thriller
22733	10149	Action
22734	10149	Crime
22735	10149	Drama
22736	10149	Mystery
22737	10149	Thriller
22738	10150	Action
22739	10150	Adventure
22740	10150	Sci-Fi
22741	10150	Thriller
22742	10151	Horror
22743	10151	Thriller
22744	10152	Horror
22745	10153	Documentary
22746	10154	Drama
22747	10155	Drama
22748	10155	Romance
22749	10156	Comedy
22750	10157	Comedy
22751	10157	Romance
22752	10158	Action
22753	10158	Adventure
22754	10158	Sci-Fi
22755	10158	Thriller
22756	10159	Action
22757	10159	Adventure
22758	10159	Fantasy
22759	10159	Sci-Fi
22760	10160	Action
22761	10160	Adventure
22762	10160	Sci-Fi
22763	10161	Action
22764	10161	Adventure
22765	10161	Sci-Fi
22766	10162	Action
22767	10162	Adventure
22768	10162	Fantasy
22769	10162	Sci-Fi
22770	10163	Drama
22771	10163	Mystery
22772	10163	Romance
22773	10163	Thriller
22774	10164	Crime
22775	10164	Drama
22776	10165	Crime
22777	10165	Drama
22778	10165	Thriller
22779	10166	Crime
22780	10166	Drama
22781	10166	Thriller
22782	10167	Crime
22783	10167	Drama
22784	10167	Thriller
22785	10168	Action
22786	10168	Animation
22787	10169	Drama
22788	10170	Adventure
22789	10170	Comedy
22790	10170	Mystery
22791	10170	Romance
22792	10171	Drama
22793	10171	Romance
22794	10172	Action
22795	10172	Adventure
22796	10172	Drama
22797	10172	War
22798	10173	Other
22799	10174	Documentary
22800	10175	Comedy
22801	10175	Crime
22802	10175	Romance
22803	10176	Sci-Fi
22804	10176	Thriller
22805	10177	Comedy
22806	10178	Comedy
22807	10178	Drama
22808	10178	Romance
22809	10179	Drama
22810	10180	Comedy
22811	10180	Drama
22812	10181	Documentary
22813	10182	Documentary
22814	10183	Documentary
22815	10184	Drama
22816	10185	Comedy
22817	10185	Drama
22818	10186	Drama
22819	10187	Comedy
22820	10187	Romance
22821	10188	Action
22822	10188	Sci-Fi
22823	10188	Thriller
22824	10189	Action
22825	10189	Adventure
22826	10189	Sci-Fi
22827	10189	Thriller
22828	10190	Western
22829	10191	Action
22830	10191	Crime
22831	10191	Drama
22832	10191	Thriller
22833	10192	Drama
22834	10193	Western
22835	10194	Horror
22836	10195	Comedy
22837	10195	Sci-Fi
22838	10196	Animation
22839	10196	Comedy
22840	10196	Sci-Fi
22841	10197	Comedy
22842	10198	Action
22843	10199	Comedy
22844	10199	Crime
22845	10199	Drama
22846	10199	Romance
22847	10200	Comedy
22848	10200	Documentary
22849	10201	Comedy
22850	10201	Drama
22851	10202	Comedy
22852	10203	Adventure
22853	10203	Horror
22854	10203	Sci-Fi
22855	10204	Action
22856	10204	Crime
22857	10204	Drama
22858	10204	Thriller
22859	10205	Action
22860	10205	Crime
22861	10205	Drama
22862	10205	Thriller
22863	10206	Comedy
22864	10206	Drama
22865	10207	Action
22866	10207	Sci-Fi
22867	10207	Thriller
22868	10208	Action
22869	10208	Adventure
22870	10208	Animation
22871	10208	Comedy
22872	10208	Sci-Fi
22873	10209	Adventure
22874	10209	Animation
22875	10209	Children
22876	10209	Comedy
22877	10209	Fantasy
22878	10209	Sci-Fi
22879	10210	Action
22880	10210	Thriller
22881	10211	Action
22882	10211	Crime
22883	10211	Thriller
22884	10212	Horror
22885	10212	Mystery
22886	10212	Sci-Fi
22887	10212	Thriller
22888	10213	Horror
22889	10213	Romance
22890	10213	Sci-Fi
22891	10214	Crime
22892	10214	Thriller
22893	10215	Comedy
22894	10216	Drama
22895	10216	Romance
22896	10217	Comedy
22897	10217	Crime
22898	10218	Adventure
22899	10218	Sci-Fi
22900	10218	Thriller
22901	10219	Adventure
22902	10220	Action
22903	10220	Adventure
22904	10220	Drama
22905	10221	Action
22906	10221	Adventure
22907	10221	Animation
22908	10221	Drama
22909	10222	Drama
22910	10222	Thriller
22911	10223	Adventure
22912	10223	Animation
22913	10223	Children
22914	10224	Documentary
22915	10225	Action
22916	10225	Adventure
22917	10225	Animation
22918	10226	Drama
22919	10227	Thriller
22920	10228	Comedy
22921	10228	Drama
22922	10229	Adventure
22923	10229	Sci-Fi
22924	10230	Drama
22925	10230	Thriller
22926	10231	Action
22927	10231	Comedy
22928	10231	Crime
22929	10232	Action
22930	10232	Drama
22931	10232	War
22932	10233	Crime
22933	10233	Mystery
22934	10233	Thriller
22935	10234	Drama
22936	10235	Documentary
22937	10236	Action
22938	10236	Drama
22939	10236	Thriller
22940	10237	Comedy
22941	10237	Drama
22942	10238	Drama
22943	10238	War
22944	10239	Drama
22945	10240	Action
22946	10240	Thriller
22947	10241	Action
22948	10241	Crime
22949	10241	Thriller
22950	10242	Drama
22951	10242	Horror
22952	10242	Romance
22953	10243	Comedy
22954	10244	Comedy
22955	10244	Drama
22956	10245	Drama
22957	10246	Action
22958	10246	Comedy
22959	10247	Horror
22960	10247	Thriller
22961	10248	Action
22962	10248	Adventure
22963	10248	Sci-Fi
22964	10249	Action
22965	10249	Comedy
22966	10249	Fantasy
22967	10249	Sci-Fi
22968	10250	Action
22969	10250	Crime
22970	10250	Thriller
22971	10251	Documentary
22972	10252	Action
22973	10252	Comedy
22974	10253	Comedy
22975	10254	Documentary
22976	10255	Comedy
22977	10256	Animation
22978	10256	Children
22979	10256	Comedy
22980	10257	Drama
22981	10258	Adventure
22982	10259	Crime
22983	10259	Drama
22984	10259	Mystery
22985	10260	Action
22986	10260	Animation
22987	10260	Crime
22988	10260	Sci-Fi
22989	10261	Other
22990	10262	Comedy
22991	10262	Drama
22992	10262	War
22993	10263	Action
22994	10263	Adventure
22995	10263	Fantasy
22996	10264	Comedy
22997	10264	Fantasy
22998	10264	Horror
22999	10265	Comedy
23000	10266	Adventure
23001	10266	Animation
23002	10266	Children
23003	10266	Comedy
23004	10267	Crime
23005	10267	Drama
23006	10268	Action
23007	10268	Adventure
23008	10268	Crime
23009	10269	Comedy
23010	10270	Comedy
23011	10271	Drama
23012	10272	Drama
23013	10273	Adventure
23014	10273	Comedy
23015	10274	Drama
23016	10275	Action
23017	10275	Adventure
23018	10275	Sci-Fi
23019	10276	Drama
23020	10277	Action
23021	10277	Adventure
23022	10277	Comedy
23023	10278	Action
23024	10278	Animation
23025	10279	Drama
23026	10279	Thriller
23027	10279	Western
23028	10280	Animation
23029	10280	Children
23030	10280	Comedy
23031	10280	Drama
23032	10280	Romance
23033	10281	Other
23034	10282	Horror
23035	10283	Animation
23036	10283	Children
23037	10284	Adventure
23038	10284	Drama
23039	10285	Drama
23040	10286	Adventure
23041	10286	Children
23042	10286	Comedy
23043	10286	Drama
23044	10287	Action
23045	10287	Drama
23046	10288	Crime
23047	10288	Drama
23048	10288	Mystery
23049	10289	Romance
23050	10290	Action
23051	10290	Adventure
23052	10290	Sci-Fi
23053	10291	Drama
23054	10292	Comedy
23055	10293	Drama
23056	10293	Horror
23057	10294	Comedy
23058	10295	Action
23059	10295	Comedy
23060	10296	Drama
23061	10297	Thriller
23062	10298	Action
23063	10298	Fantasy
23064	10298	Mystery
23065	10299	Drama
23066	10300	Comedy
23067	10300	Drama
23068	10301	Sci-Fi
23069	10301	Thriller
23070	10302	Other
23071	10303	Drama
23072	10304	Other
23073	10305	Crime
23074	10305	Thriller
23075	10306	Horror
23076	10306	Thriller
23077	10307	Adventure
23078	10307	Drama
23079	10307	Thriller
23080	10308	Thriller
23081	10309	Drama
23082	10310	Drama
23083	10311	Action
23084	10311	Comedy
23085	10312	Documentary
23086	10313	Animation
23087	10314	Documentary
23088	10315	Comedy
23089	10315	Drama
23090	10315	Romance
23091	10316	Comedy
23092	10316	Drama
23093	10317	Drama
23094	10317	Thriller
23095	10318	Other
23096	10319	Action
23097	10319	Drama
23098	10319	Thriller
23099	10320	Drama
23100	10320	Horror
23101	10320	Sci-Fi
23102	10321	Drama
23103	10322	Horror
23104	10322	Western
23105	10323	Comedy
23106	10323	Drama
23107	10324	Drama
23108	10325	Animation
23109	10325	Children
23110	10325	Comedy
23111	10326	Comedy
23112	10327	Comedy
23113	10328	Drama
23114	10329	Other
\.


--
-- Name: movie_genres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('movie_genres_id_seq', 23114, true);


--
-- Data for Name: movie_ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY movie_ratings (id, user_id, movie_id, rating) FROM stdin;
1	1	16	4
2	1	24	1.5
3	1	32	4
4	1	45	4
5	1	48	4
6	1	99	4
7	1	127	3
8	1	138	4
9	1	142	3
10	1	177	0.5
11	1	195	4
12	1	227	0.5
13	1	231	4.5
14	1	232	1.5
15	1	247	0.5
16	1	261	4
17	1	280	4
18	1	310	4.5
19	1	317	3
20	1	337	2.5
21	1	340	3
22	1	406	4
23	1	427	3.5
24	1	472	4.5
25	1	523	3.5
26	1	524	3.5
27	1	525	2.5
28	1	526	5
29	1	530	3
30	1	538	3.5
31	1	565	3.5
32	1	611	0.5
33	1	614	3.5
34	1	622	3
35	1	647	3.5
36	1	696	5
37	1	734	5
38	1	788	4.5
39	1	864	4
40	1	887	4.5
41	1	923	5
42	1	959	4.5
43	1	961	4
44	1	972	4.5
45	1	975	5
46	1	982	4
47	1	983	5
48	1	984	5
49	1	994	4.5
50	1	1003	3.5
51	1	1018	4.5
52	1	1025	3
53	1	1027	4
54	1	1030	3
55	1	1047	4.5
56	1	1261	3.5
57	1	1296	3.5
58	1	1368	1.5
59	1	1494	1.5
60	1	1528	3
61	1	1584	4
62	1	1591	4.5
63	1	1665	1.5
64	1	1717	1.5
65	1	1749	4.5
66	1	1907	4
67	1	1917	2.5
68	1	1963	2
69	1	1973	4.5
70	1	2002	4
71	1	2034	4.5
72	1	2057	4.5
73	1	2099	3
74	1	2172	3.5
75	1	2184	5
76	1	2210	3
77	1	2282	4
78	1	2358	3.5
79	1	2366	5
80	1	2597	5
81	1	2713	4.5
82	1	2837	4
83	1	3163	4.5
84	1	3177	3.5
85	1	3183	3.5
86	1	3219	3.5
87	1	3345	5
88	1	3380	4
89	1	3860	3.5
90	1	3886	4.5
91	1	3888	4
92	1	4109	3
93	1	4127	3.5
94	1	4154	4
95	1	4173	3.5
96	1	4458	4.5
97	1	4697	4.5
98	1	4909	3.5
99	1	4968	4
100	1	5207	4.5
101	1	5814	2.5
102	1	5883	4
103	1	6563	4.5
104	1	6620	4.5
105	1	6642	4.5
106	1	6649	4.5
107	1	7045	0.5
108	1	7161	5
109	1	7180	4
110	1	7200	3.5
111	1	7376	3.5
112	1	7439	4
113	1	7625	0.5
114	2	1	5
115	2	3	2
116	2	5	3
117	2	14	4
118	2	17	5
119	2	25	3
120	2	32	3
121	2	36	5
122	2	49	4
123	2	54	4
124	2	58	5
125	2	73	4
126	2	88	4
127	2	101	3
128	2	231	4
129	2	336	4
130	2	440	4
131	2	538	5
132	2	560	3
133	2	565	4
134	2	572	4
135	2	622	4
136	2	647	4
137	2	651	2
138	2	654	4
139	2	659	4
140	2	662	5
141	2	873	4
142	2	1103	4
143	3	5	3
144	3	7	3
145	3	11	4
146	3	21	5
147	3	34	5
148	3	36	4
149	3	37	4
150	3	43	5
151	3	48	5
152	3	96	3
153	3	121	3
154	3	122	4
155	3	127	4
156	3	142	3
157	3	161	3
158	3	194	5
159	3	195	5
160	3	204	4
161	3	217	5
162	3	232	3
163	3	242	5
164	3	247	4
165	3	251	3
166	3	258	3
167	3	261	5
168	3	264	4
169	3	300	3
170	3	303	5
171	3	306	5
172	3	309	3
173	3	310	3
174	3	311	3
175	3	317	3
176	3	318	4
177	3	327	4
178	3	328	3
179	3	333	3
180	3	337	3
181	3	340	3
182	3	360	3
183	3	366	4
184	3	403	3
185	3	406	4
186	3	419	3
187	3	425	4
188	3	427	4
189	3	431	3
190	3	443	4
191	3	446	4
192	3	453	3
193	3	454	5
194	3	460	5
195	3	472	4
196	3	474	5
197	3	476	3
198	3	481	3
199	3	482	4
200	3	483	3
201	3	520	4
202	3	521	3
203	3	522	3
204	3	523	3
205	3	524	4
206	3	525	3
207	3	526	5
208	3	528	4
209	3	530	3
210	3	538	5
211	3	543	4
212	3	565	4
213	3	622	3
214	3	657	5
215	3	932	4
216	4	30	4
217	4	32	5
218	4	100	4
219	4	131	4
220	4	186	4
221	4	261	4
222	4	270	5
223	4	271	5
224	4	272	5
225	4	280	4
226	4	454	3
227	4	472	4
228	4	512	4
229	4	526	4
230	4	538	4
231	4	696	5
232	4	720	4
233	4	721	5
234	4	726	4
235	4	727	5
236	4	731	4
237	4	732	5
238	4	734	5
239	4	735	5
240	4	738	4
241	4	741	5
242	4	744	5
243	4	749	4
244	4	757	4
245	4	758	5
246	4	761	5
247	4	764	4
248	4	766	4
249	4	767	4
250	4	768	4
251	4	772	5
252	4	883	5
253	4	892	4
254	4	942	4
255	4	949	4
256	4	950	3
257	4	959	4
258	4	966	5
259	4	967	5
260	4	969	5
261	4	971	4
262	4	981	3
263	4	986	4
264	4	987	5
265	4	991	4
266	4	994	5
267	4	1004	4
268	4	1007	4
269	4	1010	5
270	4	1012	4
271	4	1014	5
272	4	1016	5
273	4	1027	3
274	4	1036	5
275	4	1037	4
276	4	1041	5
277	4	1043	4
278	4	1044	4
279	4	1055	4
280	4	1083	3
281	4	1105	4
282	4	1132	4
283	4	1149	4
284	4	1173	4
285	4	1221	3
286	4	1296	4
287	4	1308	5
288	4	1367	5
289	4	1375	2
290	4	1377	4
291	4	1499	4
292	4	1503	5
293	4	1511	3
294	4	1512	4
295	4	1515	4
296	4	1516	5
297	4	1561	5
298	4	1582	4
299	4	1689	5
300	4	1716	4
301	4	1741	4
302	4	1765	4
303	4	1821	3
304	4	1839	5
305	4	2095	4
306	4	2100	4
307	4	2135	4
308	4	2144	1
309	4	2146	5
310	4	2149	4
311	4	2151	4
312	4	2170	2
313	4	2179	2
314	4	2180	3
315	4	2181	5
316	4	2184	5
317	4	2195	5
318	4	2207	3
319	4	2209	4
320	4	2211	4
321	4	2217	4
322	4	2262	2
323	4	2277	4
324	4	2294	3
325	4	2297	4
326	4	2346	4
327	4	2359	3
328	4	2362	3
329	4	2374	4
330	4	2389	5
331	4	2426	5
332	4	2471	5
333	4	2478	5
334	4	2497	5
335	4	2502	5
336	4	2556	5
337	4	2601	4
338	4	2612	3
339	4	3934	5
340	5	1	4
341	5	59	3
342	5	99	0.5
343	5	146	2
344	5	151	4
345	5	203	0.5
346	5	281	1
347	5	305	1
348	5	324	3
349	5	427	3
350	5	446	0.5
351	5	522	3.5
352	5	525	0.5
353	5	528	4
354	5	645	4
355	5	821	0.5
356	5	968	4.5
357	5	1226	3.5
358	5	1261	3.5
359	5	1481	4.5
360	5	1652	3.5
361	5	1820	4
362	5	1833	3.5
363	5	1937	0.5
364	5	1989	3
365	5	1992	0.5
366	5	2057	1.5
367	5	2122	5
368	5	2144	4
369	5	2146	3.5
370	5	2210	3.5
371	5	2234	2
372	5	2247	2.5
373	5	2294	1.5
374	5	2366	1.5
375	5	2862	3.5
376	5	3056	2
377	5	3167	4
378	5	3169	2.5
379	5	3281	2.5
380	5	3380	4
381	5	3816	3.5
382	5	3939	1
383	5	4129	5
384	5	4200	3.5
385	5	4705	3.5
386	5	5126	2.5
387	5	5339	4
388	5	5618	4
389	5	6517	3.5
390	5	6622	4
391	5	6935	3
392	5	6947	3.5
393	5	7015	4
394	5	7083	5
395	5	7377	3.5
396	5	7433	4
397	5	7559	4.5
398	5	7742	3.5
399	5	7765	4
400	5	7931	5
401	5	8060	4.5
402	5	8111	5
403	5	8121	5
404	5	8240	5
405	5	8340	4.5
406	5	8607	3.5
407	5	8780	5
408	6	427	3.5
409	6	693	3
410	6	873	5
411	6	895	4
412	6	962	4
413	6	985	5
414	6	1344	4
415	6	1375	4.5
416	6	1463	3.5
417	6	1532	5
418	6	1758	4
419	6	1844	5
420	6	1849	3
421	6	2058	5
422	6	2078	4.5
423	6	2153	3.5
424	6	2282	5
425	6	2332	4
426	6	2366	5
427	6	2467	4
428	6	2603	4
429	6	3073	4
430	6	3199	3.5
431	6	3221	4
432	6	3333	4
433	6	3424	2.5
434	6	3704	3
435	6	3807	4
436	6	3812	3
437	6	3860	5
438	6	3903	4
439	6	4485	5
440	6	4705	3.5
441	6	4909	4
442	6	5005	5
443	6	5202	3
444	6	5329	5
445	6	5365	5
446	6	5795	5
447	6	6417	5
448	6	6593	5
449	6	6850	4
450	6	6866	4
451	6	6946	3
452	6	6948	4.5
453	6	7036	4
454	6	7061	5
455	6	7085	5
456	6	7157	3
457	6	7200	4
458	6	7494	4.5
459	6	7538	5
460	6	7573	5
461	6	7761	5
462	6	8036	5
463	6	8121	4
464	6	8130	3
465	6	8291	4
466	6	8500	3
467	6	8572	3
468	6	9360	4.5
469	7	10	4
470	7	32	5
471	7	45	5
472	7	65	4.5
473	7	123	4
474	7	142	5
475	7	170	2
476	7	203	4
477	7	231	5
478	7	254	4.5
479	7	259	4
480	7	261	3.5
481	7	278	4
482	7	305	1
483	7	317	5
484	7	327	1
485	7	337	3.5
486	7	431	3.5
487	7	472	2.5
488	7	485	4
489	7	490	2.5
490	7	523	4.5
491	7	526	5
492	7	565	3.5
493	7	581	2.5
494	7	620	4.5
495	7	624	3.5
496	7	647	4
497	7	696	3.5
498	7	844	5
499	7	878	5
500	7	887	3
501	7	915	3
502	7	923	5
503	7	959	5
504	7	961	5
505	7	963	5
506	7	968	3
507	7	970	5
508	7	972	5
509	7	976	5
510	7	983	3.5
511	7	984	5
512	7	1000	5
513	7	1018	4
514	7	1051	4
515	7	1071	4.5
516	7	1112	4
517	7	1131	5
518	7	1144	5
519	7	1226	4.5
520	7	1233	4
521	7	1261	4
522	7	1290	4.5
523	7	1340	5
524	7	1348	4.5
525	7	1351	5
526	7	1369	4
527	7	1375	3.5
528	7	1381	4
529	7	1446	2
530	7	1521	0.5
531	7	1555	3.5
532	7	1591	5
533	7	1675	4.5
534	7	1717	3.5
535	7	1723	5
536	7	1811	3.5
537	7	1844	5
538	7	1865	4
539	7	1973	4
540	7	1976	3
541	7	2057	5
542	7	2091	2.5
543	7	2099	2.5
544	7	2136	2.5
545	7	2144	5
546	7	2151	4
547	7	2158	1.5
548	7	2159	5
549	7	2160	3
550	7	2167	3
551	7	2169	1.5
552	7	2230	4.5
553	7	2249	4
554	7	2313	4
555	7	2330	3
556	7	2366	5
557	7	2424	4
558	7	2442	4.5
559	7	2466	4
560	7	2543	4
561	7	2594	3.5
562	7	2616	5
563	7	2733	3.5
564	7	2800	3
565	7	2869	2.5
566	7	3000	4
567	7	3132	3.5
568	7	3149	3.5
569	7	3163	5
570	7	3380	3
571	7	3405	1.5
572	7	3425	2.5
573	7	3435	4
574	7	3561	3.5
575	7	3807	4
576	7	3860	4.5
577	7	3886	3
578	7	4109	3
579	7	4127	2.5
580	7	4154	4
581	7	4272	2.5
582	7	4313	4
583	7	4436	5
584	7	4458	3
585	7	4681	4.5
586	7	4697	3
587	7	4779	2.5
588	7	4803	2.5
589	7	4958	0.5
590	7	4968	4.5
591	7	5005	2.5
592	7	5037	3
593	7	5207	3
594	7	5365	2.5
595	7	5726	2
596	7	5839	2
597	7	6340	4.5
598	7	6563	5
599	7	6620	3
600	7	6642	3.5
601	7	6727	1.5
602	7	6742	3.5
603	7	6946	4
604	7	6967	5
605	7	7112	4
606	7	7136	4.5
607	7	7157	2
608	7	7179	2.5
609	7	7334	3.5
610	7	7616	1.5
611	7	7670	5
612	7	7715	2
613	7	7765	4.5
614	7	7769	3.5
615	7	7798	3.5
616	7	7908	3
617	7	7915	4
618	7	8055	3.5
619	7	8086	2
620	7	8110	3.5
621	7	8130	3.5
622	7	8264	2
623	7	8422	3.5
624	7	8627	4
625	7	8630	2
626	7	8858	3.5
627	7	9014	2
628	7	9070	2
629	7	9173	3.5
630	8	1	5
631	8	3	4
632	8	5	3
633	8	25	5
634	8	32	3
635	8	36	5
636	8	49	5
637	8	54	3
638	8	58	4
639	8	80	4
640	8	88	3
641	8	95	3
642	8	97	3
643	8	120	4
644	8	121	3
645	8	231	4
646	8	336	3
647	8	565	5
648	8	581	3
649	8	614	3
650	8	616	5
651	8	618	1
652	8	620	3
653	8	622	3
654	8	642	5
655	8	645	4
656	8	647	4
657	8	650	5
658	8	652	2
659	8	653	3
660	8	654	5
661	8	659	4
662	8	661	4
663	8	662	4
664	8	665	4
665	8	669	3
666	8	677	3
667	8	708	1
668	8	804	5
669	8	849	5
670	8	853	4
671	8	860	3
672	8	862	4
673	8	864	4
674	8	873	5
675	8	909	5
676	8	947	1
677	8	972	5
678	8	1100	2
679	8	1104	3
680	8	1105	5
681	8	1133	5
682	8	1144	5
683	8	1146	3
684	8	1147	5
685	8	1151	3
686	8	1153	4
687	8	1191	5
688	8	1196	5
689	9	3	3
690	9	6	4
691	9	10	3
692	9	14	3
693	9	16	4
694	9	19	2
695	9	21	3
696	9	23	3
697	9	25	4
698	9	32	3
699	9	45	3
700	9	48	2
701	9	49	2
702	9	54	3
703	9	88	3
704	9	99	3
705	9	109	2
706	9	127	4
707	9	130	3
708	9	138	4
709	9	140	3
710	9	142	3
711	9	148	3
712	9	149	2
713	9	161	2
714	9	168	4
715	9	169	1
716	9	171	3
717	9	177	2
718	9	195	4
719	9	199	2
720	9	202	3
721	9	203	4
722	9	207	4
723	9	217	3
724	9	219	2
725	9	224	3
726	9	231	4
727	9	237	1
728	9	251	3
729	9	254	4
730	9	259	4
731	9	261	5
732	9	264	3
733	9	269	2
734	9	277	2
735	9	278	3
736	9	280	3
737	9	281	3
738	9	290	1
739	9	294	3
740	9	298	2
741	9	305	2
742	9	306	2
743	9	309	3
744	9	310	3
745	9	311	2
746	9	314	3
747	9	316	2
748	9	317	3
749	9	318	3
750	9	321	3
751	9	327	3
752	9	328	3
753	9	330	2
754	9	331	2
755	9	332	2
756	9	336	3
757	9	337	3
758	9	340	3
759	9	360	2
760	9	361	2
761	9	364	2
762	9	366	3
763	9	368	2
764	9	376	2
765	9	380	3
766	9	381	2
767	9	383	3
768	9	389	2
769	9	391	3
770	9	403	2
771	9	404	1
772	9	406	3
773	9	414	2
774	9	419	3
775	9	422	3
776	9	423	3
777	9	425	2
778	9	427	3
779	9	428	3
780	9	431	3
781	9	435	2
782	9	440	3
783	9	443	4
784	9	446	3
785	9	453	3
786	9	454	1
787	9	459	2
788	9	460	3
789	9	464	1
790	9	472	3
791	9	476	3
792	9	479	3
793	9	481	2
794	9	483	2
795	9	484	2
796	9	487	2
797	9	499	4
798	9	519	3
799	9	520	2
800	9	521	2
801	9	523	4
802	9	524	3
803	9	525	3
804	9	526	3
805	9	530	1
806	9	540	1
807	9	565	3
808	9	620	3
809	9	651	3
810	10	37	5
811	10	156	2.5
812	10	224	4
813	10	288	2.5
814	10	317	4
815	10	427	2
816	10	755	1
817	10	891	4
818	10	1057	0.5
819	10	1371	3.5
820	10	1641	5
821	10	1703	2
822	10	1901	4
823	10	2021	4.5
824	10	2058	5
825	10	2065	2
826	10	2530	3.5
827	10	2551	3.5
828	10	2668	4.5
829	10	3809	4
830	10	5370	3.5
831	10	5374	5
832	10	8762	4
833	11	1	4
834	11	10	3
835	11	17	3
836	11	19	3
837	11	34	3
838	11	46	2
839	11	97	2
840	11	100	4
841	11	127	4
842	11	130	3
843	11	131	3
844	11	142	3
845	11	231	5
846	11	235	4
847	11	258	4
848	11	270	3
849	11	278	4
850	11	279	2
851	11	290	5
852	11	305	3
853	11	310	4
854	11	311	3
855	11	318	2
856	11	322	3
857	11	324	3
858	11	327	3
859	11	328	3
860	11	330	3
861	11	337	3
862	11	360	3
863	11	369	2
864	11	383	3
865	11	403	3
866	11	427	4
867	11	446	3
868	11	483	3
869	11	485	4
870	11	496	3
871	11	508	3
872	11	520	3
873	11	521	5
874	11	522	4
875	11	523	3
876	11	524	3
877	11	525	3
878	11	526	5
879	11	527	4
880	11	529	3
881	11	530	4
882	11	546	3
883	11	572	3
884	11	612	5
885	11	627	5
886	11	631	3
887	11	654	2
888	11	662	3
889	11	725	3
890	11	726	4
891	11	730	4
892	11	732	3
893	11	734	3
894	11	741	5
895	11	746	5
896	11	789	3
897	11	828	3
898	11	832	4
899	11	836	4
900	11	843	3
901	11	844	3
902	11	873	3
903	11	877	4
904	11	878	3
905	11	880	3
906	11	882	4
907	11	884	3
908	11	895	3
909	11	915	4
910	11	923	4
911	11	926	5
912	11	957	5
913	11	959	5
914	11	961	4
915	11	962	3
916	11	963	4
917	11	968	3
918	11	972	4
919	11	976	4
920	11	981	3
921	11	982	3
922	11	1000	4
923	11	1029	4
924	11	1038	4
925	11	1042	5
926	11	1051	4
927	11	1103	5
928	11	1116	4
929	11	3934	5
930	12	3	3
931	12	16	1.5
932	12	207	3
933	12	236	4
934	12	311	1
935	12	497	3
936	12	527	4.5
937	12	602	4
938	12	631	2.5
939	12	878	4
940	12	898	4
941	12	970	1
942	12	987	1
943	12	1018	2.5
944	12	1489	2
945	12	1575	4
946	12	1730	4
947	12	2167	4
948	12	2239	4
949	12	4458	4
950	13	20	3.5
951	13	48	4
952	13	100	4.5
953	13	247	3
954	13	926	3
955	13	975	4
956	13	985	3.5
957	13	1106	4.5
958	13	1369	2.5
959	13	1491	3
960	13	1690	3.5
961	13	2101	3.5
962	13	2366	4
963	13	2393	3.5
964	13	2467	4
965	13	2496	2.5
966	13	3157	3
967	13	3807	4
968	13	4160	1.5
969	13	4422	3
970	13	5718	5
971	13	5730	3.5
972	13	6671	2.5
973	13	6804	3
974	13	7029	2.5
975	13	7157	4
976	13	7347	4
977	13	7551	3.5
978	14	1	4
979	14	3	3
980	14	5	3
981	14	7	3
982	14	17	5
983	14	58	3
984	14	95	3
985	14	121	5
986	14	538	5
987	14	565	3
988	14	611	3
989	14	614	3
990	14	622	3
991	14	638	2
992	14	647	4
993	14	651	2
994	14	653	3
995	14	694	3
996	14	873	5
997	14	1103	4
998	14	1111	4
999	15	48	5
1000	15	92	5
1001	15	207	5
1002	15	259	5
1003	15	261	5
1004	15	477	5
1005	15	485	5
1006	15	505	5
1007	15	686	5
1008	15	773	5
1009	15	923	4
1010	15	962	5
1011	15	968	5
1012	15	1018	5
1013	15	1463	4
1014	15	1498	5
1015	15	1730	5
1016	15	1811	5
1017	15	1875	5
1018	15	1906	5
1019	15	2014	5
1020	15	2040	5
1021	15	2112	5
1022	15	2124	4
1023	15	2210	4.5
1024	15	2226	5
1025	15	2366	4
1026	15	2373	4
1027	15	2633	5
1028	15	2727	5
1029	15	2751	5
1030	15	2805	5
1031	15	3052	4
1032	15	3109	5
1033	15	3149	5
1034	15	3491	5
1035	15	3823	5
1036	15	3874	5
1037	15	4636	5
1038	15	4861	5
1039	15	4968	4
1040	15	5005	3.5
1041	15	5076	5
1042	15	5268	5
1043	15	5337	5
1044	15	5455	5
1045	15	5589	5
1046	15	5839	5
1047	15	5920	5
1048	15	6111	5
1049	15	6417	5
1050	15	6528	5
1051	15	6558	5
1052	15	7105	4
1053	15	7157	5
1054	15	7200	5
1055	15	7501	5
1056	15	7761	5
1057	15	7832	5
1058	15	8046	5
1059	15	8121	5
1060	15	8303	5
1061	15	8345	5
1062	15	8487	5
1063	15	8663	5
1064	15	8989	5
1065	15	9065	5
1066	15	9369	5
1067	15	9418	5
1068	15	9547	5
1069	15	9878	5
1070	15	9909	5
1071	15	10194	4
1072	16	2	3
1073	16	9	4
1074	16	19	3
1075	16	29	5
1076	16	32	5
1077	16	45	5
1078	16	48	4
1079	16	88	5
1080	16	121	4
1081	16	137	5
1082	16	138	5
1083	16	142	4
1084	16	148	4
1085	16	149	5
1086	16	170	5
1087	16	177	4
1088	16	181	5
1089	16	190	4
1090	16	203	2
1091	16	207	3
1092	16	224	5
1093	16	227	3
1094	16	236	4
1095	16	243	5
1096	16	258	4
1097	16	261	3
1098	16	267	4
1099	16	277	4
1100	16	278	5
1101	16	279	3
1102	16	289	4
1103	16	290	4
1104	16	293	4
1105	16	299	3
1106	16	305	1
1107	16	310	5
1108	16	311	4
1109	16	314	4
1110	16	317	3
1111	16	318	3
1112	16	324	2
1113	16	327	4
1114	16	330	5
1115	16	337	4
1116	16	340	4
1117	16	343	3
1118	16	356	5
1119	16	360	3
1120	16	369	4
1121	16	375	5
1122	16	381	4
1123	16	383	5
1124	16	384	4
1125	16	389	3
1126	16	391	5
1127	16	403	3
1128	16	406	4
1129	16	422	4
1130	16	427	4
1131	16	440	5
1132	16	446	4
1133	16	465	3
1134	16	472	5
1135	16	477	3
1136	16	483	3
1137	16	484	5
1138	16	520	4
1139	16	521	4
1140	16	523	4
1141	16	525	3
1142	16	526	5
1143	16	530	5
1144	16	540	5
1145	16	565	5
1146	16	568	4
1147	16	647	5
1148	16	653	4
1149	16	680	5
1150	16	684	5
1151	16	845	4
1152	16	1111	2
1153	17	1	5
1154	17	19	5
1155	17	99	1.5
1156	17	117	4
1157	17	127	4
1158	17	195	5
1159	17	231	5
1160	17	261	4
1161	17	280	4
1162	17	305	4
1163	17	317	5
1164	17	414	1.5
1165	17	427	4
1166	17	485	4
1167	17	523	4.5
1168	17	647	4.5
1169	17	696	1
1170	17	888	4.5
1171	17	923	5
1172	17	959	5
1173	17	972	5
1174	17	983	1
1175	17	987	3
1176	17	993	4.5
1177	17	994	3.5
1178	17	1018	3.5
1179	17	1025	4.5
1180	17	1030	5
1181	17	1233	5
1182	17	1261	4.5
1183	17	1368	4
1184	17	1375	5
1185	17	1397	1.5
1186	17	1427	4
1187	17	1481	4.5
1188	17	1489	3
1189	17	1564	3.5
1190	17	1574	5
1191	17	1575	5
1192	17	1707	5
1193	17	1708	5
1194	17	1839	5
1195	17	1867	4.5
1196	17	2057	4
1197	17	2099	5
1198	17	2172	4
1199	17	2191	4.5
1200	17	2239	4
1201	17	2366	4.5
1202	17	2621	4.5
1203	17	2633	4
1204	17	2740	5
1205	17	2873	4.5
1206	17	3151	3.5
1207	17	3177	5
1208	17	3219	4
1209	17	3320	3
1210	17	3351	3.5
1211	17	3380	5
1212	17	3424	4
1213	17	3480	2.5
1214	17	3566	4.5
1215	17	3860	4
1216	17	3886	5
1217	17	4033	5
1218	17	4127	5
1219	17	4154	4
1220	17	4184	3.5
1221	17	4424	3.5
1222	17	4458	5
1223	17	4662	4
1224	17	4697	4
1225	17	4801	3.5
1226	17	4803	4.5
1227	17	4818	4.5
1228	17	4852	4.5
1229	17	5042	3.5
1230	17	5075	4
1231	17	5207	5
1232	17	5334	5
1233	17	5561	1
1234	17	5706	3.5
1235	17	5839	5
1236	17	5849	4
1237	17	5894	2.5
1238	17	5899	3
1239	17	6340	4.5
1240	17	6492	3
1241	17	6499	4
1242	17	6550	4.5
1243	17	6593	4
1244	17	6599	4
1245	17	6606	4
1246	17	6620	5
1247	17	6627	4.5
1248	17	6847	3
1249	17	6942	4.5
1250	17	6946	5
1251	17	7036	4
1252	17	7085	3.5
1253	17	7089	1
1254	17	7102	3
1255	17	7179	4
1256	17	7286	4.5
1257	17	7292	5
1258	17	7307	0.5
1259	17	7373	4
1260	17	7385	4
1261	17	7398	4
1262	17	7404	4.5
1263	17	7423	4
1264	17	7424	2.5
1265	17	7439	2.5
1266	17	7494	3.5
1267	17	7512	2.5
1268	17	7549	4.5
1269	17	7564	4
1270	17	7620	4
1271	17	7638	0.5
1272	17	7654	2
1273	17	7670	4
1274	17	7733	3.5
1275	17	7761	5
1276	17	7810	4
1277	17	7811	3.5
1278	17	7910	4.5
1279	17	7956	3.5
1280	17	7960	4
1281	17	8007	4.5
1282	17	8184	5
1283	17	8264	4
1284	17	8351	4
1285	17	8354	4.5
1286	17	8360	5
1287	17	8447	5
1288	17	8500	3
1289	17	8543	3.5
1290	17	8885	5
1291	17	8925	3.5
1292	17	8954	4.5
1293	18	19	3
1294	18	34	1.5
1295	18	45	4.5
1296	18	48	4.5
1297	18	140	3
1298	18	148	2
1299	18	203	4
1300	18	261	4.5
1301	18	278	2
1302	18	280	4.5
1303	18	317	4
1304	18	324	3
1305	18	330	3.5
1306	18	340	2
1307	18	427	2.5
1308	18	472	1.5
1309	18	523	4
1310	18	525	4
1311	18	620	4
1312	18	647	3
1313	18	653	1
1314	18	677	3.5
1315	18	887	4
1316	18	898	1
1317	18	926	4.5
1318	18	963	4
1319	18	968	2
1320	18	970	1
1321	18	976	3.5
1322	18	984	3
1323	18	1071	3
1324	18	1144	3
1325	18	1203	2
1326	18	1226	4
1327	18	1260	4
1328	18	1265	4
1329	18	1288	1.5
1330	18	1296	4
1331	18	1302	4.5
1332	18	1322	4.5
1333	18	1340	3.5
1334	18	1386	4
1335	18	1482	3.5
1336	18	1489	3.5
1337	18	1521	2
1338	18	1730	4
1339	18	1814	4.5
1340	18	2057	4.5
1341	18	2091	1.5
1342	18	2158	1
1343	18	2159	4
1344	18	2210	4
1345	18	2233	4
1346	18	2366	5
1347	18	2442	4.5
1348	18	2466	4
1349	18	2497	4.5
1350	18	3163	4.5
1351	18	3173	2
1352	18	3323	4.5
1353	18	3380	4.5
1354	18	3405	2.5
1355	18	3422	2
1356	18	3424	2
1357	18	3738	4.5
1358	18	3769	1
1359	18	3812	2.5
1360	18	3860	4.5
1361	18	3868	4.5
1362	18	3870	5
1363	18	3886	3.5
1364	18	3888	4.5
1365	18	3970	3
1366	18	4062	3.5
1367	18	4213	3.5
1368	18	4286	3
1369	18	4319	5
1370	18	4458	3.5
1371	18	4461	2.5
1372	18	4697	4
1373	18	4779	4.5
1374	18	4803	2
1375	18	5005	4
1376	18	5037	2.5
1377	18	5042	5
1378	18	5167	2
1379	18	5202	5
1380	18	5328	4
1381	18	5366	1.5
1382	18	5542	4.5
1383	18	5618	4
1384	18	5701	4.5
1385	18	5793	4
1386	18	5794	2.5
1387	18	5802	4.5
1388	18	5883	4.5
1389	18	5899	2.5
1390	19	472	5
1391	19	1265	5
1392	19	1839	5
1393	19	2704	3
1394	19	2822	4
1395	19	2837	0.5
1396	19	3000	0.5
1397	19	3087	4
1398	19	3108	0.5
1399	19	3173	4
1400	19	3342	4
1401	19	3380	0.5
1402	19	3638	1.5
1403	19	3738	3.5
1404	19	3824	3.5
1405	19	3860	0.5
1406	19	3886	0.5
1407	19	3888	5
1408	19	3899	4
1409	19	3999	4
1410	19	4080	4.5
1411	19	4109	0.5
1412	19	4154	4
1413	19	4156	4
1414	19	4383	4
1415	19	4386	0.5
1416	19	4458	0.5
1417	19	4461	4
1418	19	4681	0.5
1419	19	4768	4
1420	19	4803	0.5
1421	19	4818	4
1422	19	4998	3.5
1423	19	5046	4
1424	19	5201	4
1425	19	5207	0.5
1426	19	5210	4
1427	19	5215	4.5
1428	19	5275	4
1429	19	5306	0.5
1430	19	5377	4
1431	19	5391	5
1432	19	5618	0.5
1433	19	5624	0.5
1434	19	5682	4.5
1435	19	5719	4.5
1436	19	5726	0.5
1437	19	5743	3
1438	19	5875	3.5
1439	19	5881	4.5
1440	19	5891	3
1441	19	5899	3.5
1442	19	6411	4.5
1443	19	6418	4.5
1444	19	6419	4.5
1445	19	6462	4
1446	19	6606	5
1447	19	6663	3.5
1448	19	6823	4
1449	19	6848	3
1450	19	6865	4
1451	19	7009	3
1452	19	7018	4.5
1453	19	7035	3.5
1454	19	7115	4
1455	19	7161	4
1456	19	7219	5
1457	19	7240	4.5
1458	19	7307	0.5
1459	19	7494	4
1460	19	7504	4
1461	19	7538	4
1462	19	7573	3.5
1463	19	7579	4
1464	19	7670	0.5
1465	19	7914	4
1466	19	7932	4
1467	19	7952	4
1468	19	7953	4
1469	19	7957	4
1470	19	8086	3.5
1471	19	8130	0.5
1472	19	8329	3
1473	19	8351	0.5
1474	19	8703	4
1475	19	8779	5
1476	19	9070	4
1477	19	9073	5
1478	19	9115	4
1479	19	9205	4
1480	19	9477	4
1481	19	9509	4
1482	19	9547	4
1483	19	9822	4.5
1484	19	9847	4.5
1485	19	9853	3.5
1486	19	9909	3.5
1487	19	10000	4
1488	19	10090	5
1489	19	10267	4
1490	20	755	3
1491	20	821	0.5
1492	20	822	3
1493	20	1239	4
1494	20	1454	2
1495	20	1577	3
1496	20	1702	5
1497	20	1923	4
1498	20	2126	1
1499	20	2245	4
1500	20	2364	2.5
1501	20	2483	1.5
1502	20	3165	4
1503	20	3938	4
1504	20	4491	4
1505	20	4803	4
1506	20	5275	1.5
1507	20	5630	0.5
1508	20	5682	2.5
1509	20	5883	3.5
1510	20	5890	3
1511	20	6084	3.5
1512	20	6182	3.5
1513	20	6632	2
1514	20	7039	3.5
1515	20	7074	3
1516	20	7085	3.5
1517	20	7089	3
1518	20	7112	4
1519	20	7180	4
1520	20	7200	4
1521	20	7244	2
1522	20	7273	3
1523	20	7299	3
1524	20	7360	5
1525	20	7573	3
1526	20	7670	4
1527	20	7715	4
1528	20	7719	4
1529	20	7914	3.5
1530	20	8036	4.5
1531	20	8091	4
1532	20	8121	4
1533	20	8148	3.5
1534	20	8163	5
1535	20	8185	5
1536	20	8270	4.5
1537	20	8291	5
1538	20	8329	4
1539	20	8351	4
1540	20	8630	5
1541	21	19	3.5
1542	21	231	4.5
1543	21	261	4
1544	21	472	4.5
1545	21	923	4.5
1546	21	959	4.5
1547	21	961	3.5
1548	21	964	4
1549	21	972	4.5
1550	21	1041	4
1551	21	1042	4.5
1552	21	1051	3.5
1553	21	1322	4
1554	21	1582	4
1555	21	2057	4.5
1556	21	2099	4.5
1557	21	2399	5
1558	21	2530	4.5
1559	21	3807	4
1560	21	3818	4
1561	21	3868	3.5
1562	21	3886	5
1563	21	4279	5
1564	21	4328	4
1565	21	4458	5
1566	21	4473	4.5
1567	21	4491	4.5
1568	21	4692	4.5
1569	21	4697	4
1570	21	4803	4
1571	21	4968	4
1572	21	5053	4
1573	21	5167	3
1574	21	5173	5
1575	21	5207	4.5
1576	21	6127	4
1577	21	6207	4.5
1578	21	6242	4.5
1579	21	6485	4.5
1580	21	6999	1
1581	21	7036	3.5
1582	21	7049	0.5
1583	21	7179	3.5
1584	21	7307	3.5
1585	21	7385	4
1586	21	7424	4
1587	21	7430	3.5
1588	21	7446	3.5
1589	21	7492	2.5
1590	21	7566	1
1591	21	7573	3
1592	21	7612	4
1593	21	7670	3
1594	21	7715	3
1595	21	7733	4
1596	21	7826	0.5
1597	21	7829	1
1598	21	7908	3.5
1599	21	7914	4
1600	21	7934	2.5
1601	21	7959	3.5
1602	21	8011	3.5
1603	21	8096	4.5
1604	21	8168	4
1605	21	8316	2
1606	21	8351	4
1607	21	8357	1
1608	21	8422	4
1609	21	8630	4
1610	21	8662	4
1611	21	8778	4
1612	21	8805	4.5
1613	21	8907	4
1614	21	8925	3.5
1615	21	8968	4.5
1616	21	9014	3.5
1617	21	9049	4
1618	21	9122	3.5
1619	21	9225	4
1620	21	9538	4
1621	21	9647	4
1622	21	9763	4.5
1623	21	9764	3.5
1624	21	9817	3.5
1625	21	9839	4
1626	21	9855	4
1627	21	9877	4
1628	21	9915	4
1629	21	9960	2.5
1630	21	9976	4
1631	21	10001	2
1632	21	10006	3
1633	21	10025	3
1634	21	10043	4
1635	21	10079	4
1636	21	10090	4.5
1637	21	10092	4.5
1638	21	10123	4
1639	21	10137	3.5
1640	21	10207	2.5
1641	22	3	2.5
1642	22	5	2.5
1643	22	25	3.5
1644	22	32	2.5
1645	22	36	4.5
1646	22	45	4.5
1647	22	46	2.5
1648	22	48	3.5
1649	22	130	2.5
1650	22	138	2.5
1651	22	140	1.5
1652	22	162	3
1653	22	203	3.5
1654	22	261	4
1655	22	286	3
1656	22	298	2.5
1657	22	303	2.5
1658	22	316	1
1659	22	317	5
1660	22	318	3.5
1661	22	322	2.5
1662	22	324	4.5
1663	22	330	1.5
1664	22	337	4.5
1665	22	402	2
1666	22	427	3
1667	22	446	3.5
1668	22	453	3.5
1669	22	465	2.5
1670	22	472	3
1671	22	485	2.5
1672	22	492	2.5
1673	22	496	0.5
1674	22	509	2
1675	22	521	4.5
1676	22	522	4
1677	22	525	2.5
1678	22	530	2.5
1679	22	577	2.5
1680	22	622	2.5
1681	22	638	2
1682	22	678	3
1683	22	741	2
1684	22	854	3.5
1685	22	882	3.5
1686	22	888	1.5
1687	22	909	4
1688	22	959	2.5
1689	22	976	1.5
1690	22	977	5
1691	22	1021	2.5
1692	22	1022	2
1693	22	1023	4.5
1694	22	1034	4.5
1695	22	1122	1
1696	22	1203	2.5
1697	22	1215	2.5
1698	22	1244	3
1699	22	1261	3
1700	22	1272	1.5
1701	22	1278	3.5
1702	22	1296	3.5
1703	22	1340	3
1704	22	1343	1
1705	22	1344	3.5
1706	22	1361	5
1707	22	1362	2.5
1708	22	1372	4.5
1709	22	1375	2.5
1710	22	1463	5
1711	22	1482	2.5
1712	22	1494	3.5
1713	22	1521	1.5
1714	22	1569	3.5
1715	22	1575	2.5
1716	22	1581	2.5
1717	22	1591	2.5
1718	22	1615	0.5
1719	22	1638	3
1720	22	1642	3.5
1721	22	1697	3
1722	22	1707	3.5
1723	22	1711	3
1724	22	1723	2.5
1725	22	1749	4
1726	22	1814	3
1727	22	1867	3.5
1728	22	1875	2
1729	22	1896	2.5
1730	22	1907	4
1731	22	1917	3
1732	22	1976	1
1733	22	2031	4
1734	22	2033	2.5
1735	22	2108	1.5
1736	22	2135	3.5
1737	22	2159	2
1738	22	2163	3.5
1739	22	2164	2.5
1740	22	2169	3
1741	22	2172	3
1742	22	2191	2
1743	22	2210	4
1744	22	2247	3.5
1745	22	2259	3
1746	22	2327	3.5
1747	22	2330	2.5
1748	22	2361	1.5
1749	22	2364	3.5
1750	22	2387	2
1751	22	2491	3.5
1752	22	2527	4.5
1753	22	2540	2.5
1754	22	2594	3.5
1755	22	2599	3
1756	22	2629	3.5
1757	22	2693	2.5
1758	22	2713	3
1759	22	2766	4.5
1760	22	2864	3
1761	22	2869	2.5
1762	22	2870	1.5
1763	22	2925	2.5
1764	22	2926	3
1765	22	3000	1.5
1766	22	3003	5
1767	22	3020	2.5
1768	22	3026	3.5
1769	22	3051	3.5
1770	22	3073	3
1771	22	3075	2.5
1772	22	3087	4.5
1773	22	3108	4.5
1774	22	3125	4.5
1775	22	3132	2.5
1776	22	3133	4
1777	22	3135	3
1778	22	3141	2.5
1779	22	3150	2.5
1780	22	3163	5
1781	22	3176	3.5
1782	22	3184	3
1783	22	3219	2
1784	22	3244	2.5
1785	22	3277	3.5
1786	22	3323	3
1787	22	3337	4
1788	22	3380	4
1789	22	3389	2.5
1790	22	3425	3.5
1791	22	3510	3.5
1792	22	3566	2.5
1793	22	3633	2.5
1794	22	3696	4
1795	22	3709	1.5
1796	22	3738	3
1797	22	3767	4.5
1798	22	3804	5
1799	22	3807	3.5
1800	22	3812	4.5
1801	22	3851	3
1802	22	3874	5
1803	22	3888	5
1804	22	3934	1.5
1805	22	3956	4
1806	22	3988	4.5
1807	22	4033	5
1808	22	4086	2
1809	22	4109	3.5
1810	22	4171	3
1811	22	4188	5
1812	22	4200	2.5
1813	22	4213	3.5
1814	22	4371	3.5
1815	22	4418	2.5
1816	22	4434	4
1817	22	4458	4
1818	22	4461	3.5
1819	22	4485	5
1820	22	4586	4
1821	22	4622	2.5
1822	22	4633	3.5
1823	22	4646	3
1824	22	4695	3
1825	22	4705	4.5
1826	22	4706	4.5
1827	22	4820	2
1828	22	4909	4
1829	22	5003	3.5
1830	22	5005	4
1831	22	5019	4
1832	22	5201	1
1833	22	5207	4
1834	22	5221	3
1835	22	5334	4
1836	22	5364	3.5
1837	22	5365	4.5
1838	22	5537	4
1839	22	5680	0.5
1840	22	6361	4.5
1841	22	6396	2.5
1842	23	48	4
1843	23	231	3
1844	23	526	3.5
1845	23	607	3.5
1846	23	696	4
1847	23	877	3.5
1848	23	941	4
1849	23	959	3
1850	23	963	4
1851	23	975	3
1852	23	1000	4
1853	23	1344	3.5
1854	23	1375	3.5
1855	23	2057	4
1856	23	2092	4
1857	23	2366	4
1858	23	2398	3.5
1859	23	2607	3.5
1860	23	3083	0.5
1861	23	3323	4
1862	23	3863	3.5
1863	23	3868	4
1864	23	3886	2
1865	23	3888	3.5
1866	23	4154	4
1867	23	4313	4
1868	23	4491	5
1869	23	4504	4
1870	23	5201	3.5
1871	23	5838	3.5
1872	23	5898	4
1873	23	6411	4
1874	23	6413	3.5
1875	23	6948	3.5
1876	23	7137	3.5
1877	23	7200	3.5
1878	23	7439	3.5
1879	23	7719	3
1880	23	7798	3.5
1881	23	7914	4
1882	23	8121	3
1883	23	8148	3.5
1884	23	8184	4
1885	23	8415	3.5
1886	23	8538	3.5
1887	23	8630	3.5
1888	23	8779	3.5
1889	23	8804	3
1890	23	8925	3
1891	23	8934	3.5
1892	23	8952	4
1893	23	9051	2.5
1894	23	9138	3
1895	23	9225	2.5
1896	23	9236	3.5
1897	23	9269	4
1898	23	9477	3.5
1899	23	9611	3.5
1900	23	9704	4
1901	23	9745	3.5
1902	23	9855	4
1903	23	9909	4
1904	23	9976	3
1905	23	10006	2.5
1906	24	16	4
1907	24	21	4
1908	24	22	5
1909	24	40	3
1910	24	45	5
1911	24	75	2
1912	24	99	5
1913	24	100	5
1914	24	231	4
1915	24	254	3
1916	24	258	5
1917	24	261	4
1918	24	311	4
1919	24	328	3
1920	24	340	4
1921	24	403	4
1922	24	406	4
1923	24	422	5
1924	24	427	4
1925	24	462	4
1926	24	472	4
1927	24	487	2
1928	24	524	4
1929	24	525	3
1930	24	526	4
1931	24	531	4
1932	24	582	3
1933	24	601	3
1934	24	631	3
1935	24	634	4
1936	24	639	3
1937	24	696	5
1938	24	703	2
1939	24	719	4
1940	24	725	5
1941	24	726	5
1942	24	730	5
1943	24	731	4
1944	24	732	5
1945	24	733	5
1946	24	734	5
1947	24	735	5
1948	24	742	5
1949	24	744	5
1950	24	745	5
1951	24	747	5
1952	24	751	4
1953	24	752	4
1954	24	754	5
1955	24	761	4
1956	24	762	4
1957	24	763	5
1958	24	767	5
1959	24	769	4
1960	24	770	4
1961	24	771	5
1962	24	784	4
1963	24	785	5
1964	24	787	2
1965	24	789	5
1966	24	791	4
1967	24	799	4
1968	24	807	3
1969	24	817	3
1970	24	844	4
1971	24	869	4
1972	24	878	2
1973	24	879	4
1974	24	882	4
1975	24	884	5
1976	24	888	4
1977	24	890	5
1978	24	899	4
1979	24	915	4
1980	24	923	4
1981	24	944	5
1982	24	945	4
1983	24	961	4
1984	24	963	3
1985	24	964	4
1986	24	966	4
1987	24	969	5
1988	24	970	2
1989	24	971	4
1990	24	974	5
1991	24	975	4
1992	24	976	3
1993	24	981	5
1994	24	983	4
1995	24	989	5
1996	24	994	4
1997	24	995	4
1998	24	1007	4
1999	24	1008	5
2000	24	1009	5
2001	24	1010	4
2002	24	1012	5
2003	24	1020	5
2004	24	1022	4
2005	24	1023	4
2006	24	1026	4
2007	24	1027	5
2008	24	1029	5
2009	24	1030	5
2010	24	1032	5
2011	24	1036	4
2012	24	1038	4
2013	24	1043	4
2014	24	1044	5
2015	24	1047	4
2016	24	1051	4
2017	24	1062	4
2018	24	1063	4
2019	24	1090	3
2020	24	1091	4
2021	24	1127	5
2022	24	1128	2
2023	24	1129	1
2024	24	1157	3
2025	24	1167	3
2026	24	1183	3
2027	24	1214	2
2028	24	1244	2
2029	24	1250	2
2030	24	1268	4
2031	24	1290	4
2032	24	1296	5
2033	24	1298	3
2034	24	1338	4
2035	24	1348	3
2036	24	1372	4
2037	24	1406	2
2038	24	1412	3
2039	24	1469	3
2040	24	1497	4
2041	24	1507	3
2042	24	1509	5
2043	24	1511	5
2044	24	1512	4
2045	24	1515	4
2046	24	1516	4
2047	24	1517	4
2048	24	1519	3
2049	24	1520	5
2050	24	1521	4
2051	24	1531	4
2052	24	1535	3
2053	24	1564	4
2054	24	1574	3
2055	24	1576	3
2056	24	1586	2
2057	24	1625	4
2058	24	1627	5
2059	24	1636	3
2060	24	1675	3
2061	24	1687	4
2062	24	1716	4
2063	24	1731	3
2064	24	1734	3
2065	24	1735	3
2066	24	1736	3
2067	24	1738	4
2068	24	1739	3
2069	24	1741	5
2070	24	1749	4
2071	24	1756	5
2072	24	1759	5
2073	24	1796	4
2074	24	1820	5
2075	24	1821	1
2076	24	1823	4
2077	24	1864	4
2078	24	1878	4
2079	24	1885	3
2080	24	1915	4
2081	24	1916	4
2082	24	1919	3
2083	24	1924	3
2084	24	1973	2
2085	24	1975	3
2086	24	1976	4
2087	24	1981	4
2088	24	1982	3
2089	24	2018	3
2090	24	2022	4
2091	24	2090	3
2092	24	2091	1
2093	24	2108	3
2094	24	2160	3
2095	24	2186	4
2096	24	2201	4
2097	24	2203	3
2098	24	2212	5
2099	24	2258	4
2100	24	2294	4
2101	24	2317	3
2102	24	2331	5
2103	24	2336	3
2104	24	2355	4
2105	24	2356	2
2106	24	2359	4
2107	24	2362	4
2108	24	2374	4
2109	24	2387	5
2110	24	2407	4
2111	24	2426	5
2112	24	2427	4
2113	24	2428	3
2114	24	2435	5
2115	24	2450	4
2116	24	2453	5
2117	24	2478	4
2118	24	2484	4
2119	24	2509	4
2120	24	2524	5
2121	24	2537	4
2122	24	2539	4
2123	24	2556	4
2124	24	2557	3
2125	24	2564	4
2126	24	2573	4
2127	24	2579	4
2128	24	2590	3
2129	24	2597	4
2130	24	2598	4
2131	24	2650	4
2132	24	2651	4
2133	24	2653	3
2134	24	2669	5
2135	24	2670	4
2136	24	2671	5
2137	24	2684	3
2138	24	2701	3
2139	24	2703	4
2140	24	2719	3
2141	24	2722	4
2142	24	2723	3
2143	24	2724	1
2144	24	2727	5
2145	24	2737	4
2146	24	2750	4
2147	24	2753	4
2148	24	2754	4
2149	24	2755	5
2150	24	2774	4
2151	24	2783	4
2152	24	2784	4
2153	24	2786	4
2154	24	2812	4
2155	24	2813	4
2156	24	2818	4
2157	24	2824	4
2158	24	2841	4
2159	24	2872	4
2160	24	2880	4
2161	24	2886	5
2162	24	2898	3
2163	24	2904	4
2164	24	2907	4
2165	24	2910	4
2166	24	2911	4
2167	24	2925	3
2168	24	2953	4
2169	24	2958	3
2170	24	2960	5
2171	24	2981	3
2172	24	2995	4
2173	24	2996	4
2174	24	2999	4
2175	24	3005	4
2176	24	3008	2
2177	24	3013	4
2178	24	3934	4
2179	25	3	2
2180	25	19	2
2181	25	21	2
2182	25	34	4
2183	25	59	1
2184	25	61	1
2185	25	82	3
2186	25	95	4
2187	25	121	3
2188	25	122	3
2189	25	189	3
2190	25	203	5
2191	25	294	4
2192	25	300	4
2193	25	305	4
2194	25	317	5
2195	25	318	3
2196	25	327	2
2197	25	330	1
2198	25	340	3
2199	25	360	2
2200	25	366	1
2201	25	378	3
2202	25	384	1
2203	25	387	3
2204	25	389	3
2205	25	390	2
2206	25	414	3
2207	25	445	2
2208	25	446	2
2209	25	465	3
2210	25	483	4
2211	25	486	1
2212	25	487	3
2213	25	494	2
2214	25	520	3
2215	25	521	3
2216	25	651	2
2217	25	652	3
2218	25	661	1
2219	25	694	2
2220	25	730	4
2221	25	755	3
2222	25	829	2
2223	25	830	1
2224	25	836	4
2225	25	873	4
2226	25	877	3
2227	25	878	3
2228	25	879	2
2229	25	889	3
2230	25	913	1
2231	25	914	1
2232	25	922	3
2233	25	923	5
2234	25	958	1
2235	25	960	2
2236	25	982	3
2237	25	1017	2
2238	25	1019	3
2239	25	1025	4
2240	25	1030	4
2241	25	1036	3
2242	25	1048	2
2243	25	1066	5
2244	25	1119	3
2245	25	1120	4
2246	25	1122	4
2247	25	1123	1
2248	25	1131	2
2249	25	1134	3
2250	25	1142	3
2251	25	1177	2
2252	25	1185	3
2253	25	1190	1
2254	25	1196	3
2255	25	1203	3
2256	25	1226	3
2257	25	1241	1
2258	25	1257	3
2259	25	1262	2
2260	25	1293	3
2261	25	1311	4
2262	25	1316	2
2263	25	1330	4
2264	25	1331	1
2265	25	1363	3
2266	25	1364	2
2267	25	1381	3
2268	25	1391	3
2269	25	1399	2
2270	25	1402	5
2271	25	1463	2
2272	25	1472	2
2273	25	1490	3
2274	25	1494	3
2275	25	1535	3
2276	25	1564	4
2277	25	1565	3
2278	25	1566	3
2279	25	1567	2
2280	25	1574	3
2281	25	1575	2
2282	25	1604	1
2283	25	1615	3
2284	25	1621	1
2285	25	1632	3
2286	25	1638	3
2287	25	1640	4
2288	25	1641	3
2289	25	1642	1
2290	25	1648	3
2291	25	1660	3
2292	25	1668	2
2293	25	1669	5
2294	25	1684	3
2295	25	1690	3
2296	25	1691	2
2297	25	1698	4
2298	25	1701	3
2299	25	1702	3
2300	25	1705	3
2301	25	1730	2
2302	25	1778	2
2303	25	1779	2
2304	25	1780	2
2305	25	1781	2
2306	25	1783	2
2307	25	1784	1
2308	25	1786	2
2309	25	1790	3
2310	25	1822	3
2311	25	1836	2
2312	25	1881	2
2313	25	1883	5
2314	25	1884	2
2315	25	1887	2
2316	25	1890	4
2317	25	1892	1
2318	25	1893	1
2319	25	1895	1
2320	25	1916	2
2321	25	1917	2
2322	25	1923	2
2323	25	1926	3
2324	25	1933	4
2325	25	1971	2
2326	25	1974	2
2327	25	1976	3
2328	25	1984	3
2329	26	19	2.5
2330	26	311	2
2331	26	328	3
2332	26	360	3.5
2333	26	391	1.5
2334	26	422	3
2335	26	602	2.5
2336	26	653	1.5
2337	26	734	4
2338	26	975	5
2339	26	983	4.5
2340	26	1233	2
2341	26	1290	3.5
2342	26	1402	3.5
2343	26	1494	1.5
2344	26	1528	3
2345	26	2144	3
2346	26	2389	4
2347	26	2398	4.5
2348	26	3380	3
2349	27	24	2
2350	27	524	4
2351	27	654	4
2352	27	754	5
2353	27	755	3
2354	27	830	4
2355	27	875	4
2356	27	876	4
2357	27	877	5
2358	27	923	4
2359	27	941	5
2360	27	972	3
2361	27	995	4
2362	27	1016	4
2363	27	1025	5
2364	27	1038	5
2365	27	1048	5
2366	27	1134	5
2367	27	1367	5
2368	27	1377	4
2369	27	1584	4
2370	27	1605	4
2371	27	1660	3
2372	27	1730	4
2373	27	1812	5
2374	27	1820	4
2375	27	1839	5
2376	27	1906	4
2377	27	1907	3
2378	27	2078	5
2379	27	2099	3
2380	27	2135	3
2381	27	2144	2
2382	27	2230	4
2383	27	2233	5
2384	27	2239	4
2385	27	2282	5
2386	27	2339	4
2387	27	2378	4
2388	27	2398	4
2389	27	2459	4
2390	28	1	3
2391	28	10	3
2392	28	17	4
2393	28	28	5
2394	28	34	4
2395	28	37	4
2396	28	73	1
2397	28	88	2
2398	28	121	3
2399	28	127	5
2400	28	130	2
2401	28	138	3
2402	28	194	5
2403	28	217	4
2404	28	231	5
2405	28	236	1
2406	28	276	4
2407	28	280	4
2408	28	300	4
2409	28	310	3
2410	28	311	2
2411	28	317	3
2412	28	324	4
2413	28	328	4
2414	28	337	4
2415	28	340	3
2416	28	389	3
2417	28	406	5
2418	28	422	3
2419	28	440	3
2420	28	443	4
2421	28	472	4
2422	28	482	5
2423	28	485	4
2424	28	497	4
2425	28	522	5
2426	28	523	4
2427	28	525	3
2428	28	526	4
2429	28	528	3
2430	28	543	5
2431	28	564	4
2432	28	602	4
2433	28	620	4
2434	28	631	3
2435	28	647	5
2436	28	652	1
2437	28	653	2
2438	28	655	2
2439	28	659	3
2440	28	662	5
2441	28	677	4
2442	28	683	4
2443	28	694	3
2444	28	725	4
2445	28	726	4
2446	28	734	4
2447	28	742	3
2448	28	743	2
2449	28	746	4
2450	28	774	5
2451	28	789	4
2452	28	791	3
2453	28	844	3
2454	28	853	2
2455	28	873	2
2456	28	877	5
2457	28	878	5
2458	28	888	4
2459	28	895	4
2460	28	898	4
2461	28	923	4
2462	28	940	1
2463	28	957	4
2464	28	959	4
2465	28	960	3
2466	28	961	5
2467	28	963	4
2468	28	964	3
2469	28	968	2
2470	28	969	5
2471	28	970	3
2472	28	972	3
2473	28	982	4
2474	28	984	2
2475	28	986	4
2476	28	992	3
2477	28	994	3
2478	28	995	5
2479	28	996	4
2480	28	1000	4
2481	28	1005	4
2482	28	1007	4
2483	28	1017	3
2484	28	1018	4
2485	28	1019	4
2486	28	1025	4
2487	28	1026	4
2488	28	1028	2
2489	28	1030	4
2490	28	1031	4
2491	28	1035	1
2492	28	1038	3
2493	28	1045	4
2494	28	1048	5
2495	28	1052	4
2496	28	1053	4
2497	28	1055	4
2498	28	1056	4
2499	28	1057	4
2500	28	1063	3
2501	28	1066	5
2502	28	1090	4
2503	28	1103	4
2504	28	1108	3
2505	28	1116	3
2506	28	1117	2
2507	28	1118	4
2508	28	1119	1
2509	28	1127	4
2510	28	1133	4
2511	28	1134	2
2512	28	1136	3
2513	28	1162	3
2514	28	1170	1
2515	28	1183	4
2516	28	1198	4
2517	28	1233	2
2518	28	1250	3
2519	28	1254	2
2520	28	1257	4
2521	28	1261	4
2522	28	1265	5
2523	28	1290	4
2524	28	1369	4
2525	29	1	4
2526	29	2	4
2527	29	6	4
2528	29	7	2
2529	29	9	3
2530	29	10	4
2531	29	11	3
2532	29	12	3
2533	29	15	3
2534	29	16	3
2535	29	19	3
2536	29	20	3
2537	29	21	4
2538	29	22	3
2539	29	23	3
2540	29	31	3
2541	29	32	4
2542	29	36	1
2543	29	37	3
2544	29	43	1
2545	29	45	4
2546	29	46	3
2547	29	48	4
2548	29	65	3
2549	29	66	2
2550	29	71	3
2551	29	73	3
2552	29	75	2
2553	29	80	3
2554	29	83	4
2555	29	88	3
2556	29	96	2
2557	29	99	3
2558	29	102	3
2559	29	108	3
2560	29	116	3
2561	29	121	3
2562	29	123	3
2563	29	127	3
2564	29	128	3
2565	29	130	2
2566	29	132	3
2567	29	135	3
2568	29	137	3
2569	29	138	4
2570	29	140	3
2571	29	141	3
2572	29	142	3
2573	29	144	3
2574	29	148	3
2575	29	149	3
2576	29	161	4
2577	29	162	3
2578	29	169	3
2579	29	170	3
2580	29	177	3
2581	29	181	3
2582	29	197	4
2583	29	199	3
2584	29	203	4
2585	29	208	3
2586	29	209	3
2587	29	219	3
2588	29	227	3
2589	29	231	5
2590	29	244	4
2591	29	254	2
2592	29	258	4
2593	29	261	4
2594	29	264	2
2595	29	267	3
2596	29	277	3
2597	29	278	3
2598	29	279	3
2599	29	280	4
2600	29	286	1
2601	29	290	4
2602	29	298	4
2603	29	300	3
2604	29	305	3
2605	29	310	3
2606	29	311	4
2607	29	316	3
2608	29	317	4
2609	29	318	3
2610	29	320	3
2611	29	321	3
2612	29	322	4
2613	29	324	5
2614	29	327	3
2615	29	328	3
2616	29	330	3
2617	29	331	3
2618	29	334	3
2619	29	336	3
2620	29	337	4
2621	29	339	3
2622	29	340	3
2623	29	343	3
2624	29	353	2
2625	29	356	3
2626	29	364	3
2627	29	369	2
2628	29	372	3
2629	29	381	3
2630	29	383	3
2631	29	386	3
2632	29	391	3
2633	29	403	4
2634	29	406	4
2635	29	412	3
2636	29	414	3
2637	29	416	3
2638	29	422	4
2639	29	423	4
2640	29	427	5
2641	29	431	3
2642	29	433	3
2643	29	435	3
2644	29	437	3
2645	29	440	4
2646	29	446	3
2647	29	448	3
2648	29	449	3
2649	29	450	3
2650	29	452	4
2651	29	453	3
2652	29	462	3
2653	29	464	3
2654	29	465	3
2655	29	472	3
2656	29	477	3
2657	29	483	3
2658	29	485	4
2659	29	487	3
2660	29	488	3
2661	29	490	3
2662	29	492	3
2663	29	496	3
2664	29	497	3
2665	29	520	4
2666	29	521	4
2667	29	522	3
2668	29	523	5
2669	29	524	3
2670	29	525	3
2671	29	526	4
2672	29	527	3
2673	29	528	3
2674	29	529	3
2675	29	530	3
2676	29	538	4
2677	29	553	4
2678	29	565	3
2679	29	581	3
2680	29	611	3
2681	29	616	3
2682	29	620	4
2683	29	622	3
2684	29	623	1
2685	29	626	2
2686	29	638	3
2687	29	641	4
2688	29	647	3
2689	29	649	3
2690	29	651	3
2691	29	653	3
2692	29	654	3
2693	29	655	2
2694	29	659	4
2695	29	662	3
2696	29	677	4
2697	29	681	2
2698	29	696	2
2699	29	746	4
2700	29	803	3
2701	29	807	3
2702	29	812	3
2703	29	844	4
2704	29	853	3
2705	29	862	2
2706	29	864	3
2707	29	877	4
2708	29	887	4
2709	29	888	3
2710	29	890	3
2711	29	895	3
2712	29	897	3
2713	29	898	3
2714	29	913	3
2715	29	915	4
2716	29	917	3
2717	29	947	3
2718	29	957	4
2719	29	959	5
2720	29	961	5
2721	29	963	5
2722	29	972	5
2723	29	976	4
2724	29	983	2
2725	29	984	3
2726	29	987	3
2727	29	1000	4
2728	29	1001	3
2729	29	1019	4
2730	29	1025	4
2731	29	1030	4
2732	29	1035	3
2733	29	1051	5
2734	29	1066	4
2735	29	1103	5
2736	29	1106	3
2737	29	1111	3
2738	29	1112	3
2739	29	1113	3
2740	29	1114	4
2741	29	1115	4
2742	29	1116	4
2743	29	1117	3
2744	29	1118	4
2745	29	1125	3
2746	29	1127	4
2747	29	1131	4
2748	29	1133	3
2749	29	1136	4
2750	29	1159	3
2751	29	1160	2
2752	29	1165	3
2753	29	1167	3
2754	29	1183	4
2755	29	1198	3
2756	29	1206	3
2757	29	1582	3
2758	30	1	4.5
2759	30	99	4
2760	30	142	4
2761	30	203	4
2762	30	231	4.5
2763	30	280	4.5
2764	30	317	4
2765	30	324	4
2766	30	406	4
2767	30	427	3.5
2768	30	472	4
2769	30	520	3
2770	30	522	3
2771	30	530	4
2772	30	565	4
2773	30	631	3.5
2774	30	647	4
2775	30	696	4
2776	30	826	2
2777	30	844	4
2778	30	873	3.5
2779	30	959	5
2780	30	960	3.5
2781	30	961	5
2782	30	969	4
2783	30	972	4.5
2784	30	1025	3.5
2785	30	1030	4.5
2786	30	1051	4.5
2787	30	1111	2
2788	30	1127	4
2789	30	1261	4
2790	30	1290	4.5
2791	30	1344	4
2792	30	1361	3
2793	30	1364	4
2794	30	1368	4
2795	30	1524	5
2796	30	1528	4.5
2797	30	1675	4.5
2798	30	1867	4
2799	30	1883	0.5
2800	30	2057	4
2801	30	2099	4
2802	30	2144	3
2803	30	2210	4
2804	30	2332	4
2805	30	2497	4.5
2806	30	2837	4.5
2807	30	3000	4
2808	30	3150	4
2809	30	3155	4
2810	30	3812	4
2811	30	3860	4.5
2812	30	3886	4.5
2813	30	4109	4
2814	30	4127	4
2815	30	4154	5
2816	30	4198	2.5
2817	30	4458	4.5
2818	30	4705	4
2819	30	4803	4.5
2820	30	4942	2.5
2821	30	5207	4.5
2822	30	5275	4.5
2823	30	5730	4
2824	30	5883	4
2825	30	6200	5
2826	30	6618	3
2827	30	6620	4
2828	30	6642	5
2829	30	7157	4
2830	30	7161	4
2831	30	7180	3
2832	30	7200	4.5
2833	30	7273	3.5
2834	30	7307	3.5
2835	30	7439	5
2836	30	7573	4
2837	30	7670	5
2838	30	7710	2.5
2839	30	7715	4.5
2840	30	7733	3
2841	30	7761	3
2842	30	8057	3
2843	30	8086	4
2844	30	8096	4.5
2845	30	8121	4.5
2846	30	8184	3.5
2847	30	8187	0.5
2848	30	8351	4.5
2849	30	8489	4
2850	30	8543	4
2851	30	8600	4
2852	30	8629	4
2853	30	8630	5
2854	30	8645	3
2855	31	1	4
2856	31	2	4
2857	31	6	4
2858	31	11	4
2859	31	16	4
2860	31	17	5
2861	31	21	4
2862	31	36	4
2863	31	58	5
2864	31	96	4
2865	31	99	5
2866	31	100	4
2867	31	121	4
2868	31	127	4
2869	31	128	5
2870	31	130	4
2871	31	138	3
2872	31	142	4
2873	31	161	3
2874	31	181	4
2875	31	202	4
2876	31	207	3
2877	31	224	4
2878	31	232	5
2879	31	236	4
2880	31	242	3
2881	31	252	4
2882	31	254	4
2883	31	261	3
2884	31	264	3
2885	31	278	3
2886	31	279	4
2887	31	280	5
2888	31	290	4
2889	31	298	4
2890	31	305	3
2891	31	309	4
2892	31	310	4
2893	31	340	3
2894	31	406	4
2895	31	416	4
2896	31	497	3
2897	31	522	4
2898	31	524	4
2899	31	525	4
2900	31	526	4
2901	31	528	3
2902	32	1	4
2903	32	2	3
2904	32	3	4
2905	32	10	5
2906	32	11	4
2907	32	34	4
2908	32	100	5
2909	32	112	4
2910	32	122	3
2911	32	130	4
2912	32	131	4
2913	32	137	2
2914	32	138	4
2915	32	145	3
2916	32	231	5
2917	32	278	4
2918	32	317	5
2919	32	318	4
2920	32	337	5
2921	32	340	4
2922	32	381	3
2923	32	389	4
2924	32	404	4
2925	32	406	4
2926	32	414	3
2927	32	422	4
2928	32	427	4
2929	32	472	5
2930	32	485	4
2931	32	500	4
2932	32	522	4
2933	32	524	5
2934	32	525	5
2935	32	526	5
2936	32	529	4
2937	32	531	4
2938	32	538	4
2939	32	564	4
2940	32	582	4
2941	32	596	4
2942	32	603	4
2943	32	622	4
2944	32	631	4
2945	32	647	4
2946	32	696	5
2947	32	720	4
2948	32	721	4
2949	32	722	4
2950	32	724	4
2951	32	726	5
2952	32	727	5
2953	32	728	4
2954	32	730	5
2955	32	731	4
2956	32	732	5
2957	32	734	5
2958	32	735	5
2959	32	736	5
2960	32	737	4
2961	32	738	4
2962	32	741	5
2963	32	742	5
2964	32	743	4
2965	32	744	4
2966	32	745	5
2967	32	746	4
2968	32	747	5
2969	32	753	3
2970	32	759	4
2971	32	765	5
2972	32	770	4
2973	32	773	5
2974	32	775	5
2975	32	789	5
2976	32	819	4
2977	32	820	4
2978	32	824	4
2979	32	828	4
2980	32	831	4
2981	32	836	4
2982	32	837	4
2983	32	838	3
2984	32	843	5
2985	32	844	5
2986	32	873	4
2987	32	875	4
2988	32	876	3
2989	32	879	4
2990	32	880	4
2991	32	881	5
2992	32	882	4
2993	32	886	5
2994	32	888	5
2995	32	889	3
2996	32	894	4
2997	32	895	5
2998	32	898	3
2999	32	900	5
3000	32	912	5
3001	32	913	4
3002	32	917	4
3003	32	918	3
3004	32	922	4
3005	32	933	3
3006	32	940	4
3007	32	947	5
3008	32	949	4
3009	32	950	4
3010	32	957	5
3011	32	959	5
3012	32	961	5
3013	32	962	3
3014	32	966	5
3015	32	968	5
3016	32	969	5
3017	32	970	5
3018	32	972	5
3019	32	981	4
3020	32	982	4
3021	32	983	5
3022	32	984	4
3023	32	987	5
3024	32	989	4
3025	32	990	5
3026	32	991	4
3027	32	992	4
3028	32	994	4
3029	32	995	5
3030	32	996	4
3031	32	999	4
3032	32	1000	4
3033	32	1002	4
3034	32	1004	3
3035	32	1006	4
3036	32	1007	5
3037	32	1009	4
3038	32	1010	5
3039	32	1012	5
3040	32	1018	4
3041	32	1019	4
3042	32	1022	5
3043	32	1023	4
3044	32	1024	5
3045	32	1025	4
3046	32	1029	4
3047	32	1030	5
3048	32	1032	5
3049	32	1035	3
3050	32	1036	4
3051	32	1038	5
3052	32	1042	5
3053	32	1046	5
3054	32	1047	5
3055	32	1051	5
3056	32	1052	5
3057	32	1054	4
3058	32	1055	4
3059	32	1057	3
3060	32	1058	4
3061	32	1061	5
3062	32	1062	4
3063	32	1063	5
3064	32	1066	4
3065	32	1072	4
3066	32	1078	4
3067	32	1084	4
3068	32	1092	4
3069	32	1093	4
3070	32	1097	4
3071	32	1119	3
3072	32	1122	4
3073	32	1127	5
3074	32	1128	3
3075	32	1129	3
3076	32	1131	2
3077	32	1134	3
3078	32	1135	3
3079	32	1145	4
3080	32	1203	4
3081	32	1288	4
3082	32	1290	4
3083	32	1296	5
3084	32	1309	4
3085	32	1330	4
3086	32	1338	5
3087	32	1368	5
3088	32	1381	4
3089	32	1402	5
3090	32	1484	3
3091	32	1494	4
3092	32	1498	4
3093	32	1499	5
3094	32	1503	5
3095	32	1506	5
3096	32	1507	5
3097	32	1511	5
3098	32	1512	5
3099	32	1513	5
3100	32	1514	5
3101	32	1515	5
3102	32	1516	5
3103	32	1517	5
3104	32	1518	3
3105	32	1519	5
3106	32	1520	5
3107	32	1521	5
3108	32	1522	5
3109	32	1523	5
3110	32	1524	4
3111	32	1525	5
3112	32	1528	5
3113	32	1529	5
3114	32	1530	4
3115	32	1531	5
3116	32	1532	3
3117	32	1535	4
3118	32	1542	2
3119	32	1549	3
3120	32	1550	3
3121	32	1558	4
3122	32	1561	5
3123	32	1564	5
3124	32	1565	4
3125	32	1567	4
3126	32	1568	4
3127	32	1569	2
3128	32	1573	4
3129	32	1574	3
3130	32	1575	4
3131	32	1576	4
3132	32	1581	3
3133	32	1582	4
3134	32	1604	3
3135	32	1606	3
3136	32	1608	3
3137	32	1611	4
3138	32	1612	4
3139	32	1615	4
3140	32	1623	4
3141	32	1624	4
3142	32	1625	3
3143	32	1627	5
3144	32	1628	3
3145	32	1629	3
3146	32	1630	4
3147	32	1632	2
3148	32	1636	4
3149	32	1640	4
3150	32	1641	5
3151	32	1642	3
3152	32	1648	2
3153	32	1660	4
3154	32	1669	3
3155	32	1670	4
3156	32	1674	3
3157	32	1675	3
3158	32	1676	4
3159	32	1684	4
3160	32	1687	4
3161	32	1689	5
3162	32	1694	4
3163	32	1698	5
3164	32	1702	3
3165	32	1703	3
3166	32	1707	4
3167	32	1716	5
3168	32	1717	5
3169	32	1719	2
3170	32	1730	4
3171	32	1732	3
3172	32	1733	4
3173	32	1749	4
3174	32	1800	4
3175	32	1819	4
3176	32	1836	4
3177	32	3934	5
3178	33	48	5
3179	33	231	3
3180	33	283	4
3181	33	472	5
3182	33	474	5
3183	33	538	2
3184	33	594	1
3185	33	631	5
3186	33	696	5
3187	33	721	3
3188	33	726	5
3189	33	729	4
3190	33	734	5
3191	33	742	4
3192	33	747	3
3193	33	749	4
3194	33	771	5
3195	33	773	4
3196	33	801	4
3197	33	846	4
3198	33	875	4
3199	33	881	3
3200	33	882	4
3201	33	895	4
3202	33	900	4
3203	33	926	4
3204	33	957	5
3205	33	961	4
3206	33	969	5
3207	33	983	5
3208	33	987	5
3209	33	991	5
3210	33	994	5
3211	33	996	5
3212	33	1009	4
3213	33	1012	4
3214	33	1014	3
3215	33	1027	3
3216	33	1029	4
3217	33	1032	4
3218	33	1036	4
3219	33	1062	4
3220	33	1066	5
3221	33	1087	4
3222	33	1105	5
3223	33	1134	3
3224	33	1137	4
3225	33	1296	5
3226	33	1337	5
3227	33	1517	5
3228	33	1535	4
3229	33	1561	3
3230	33	1591	4
3231	33	1624	5
3232	33	1812	4
3233	33	1820	4
3234	33	1839	5
3235	33	1869	5
3236	33	1907	3
3237	33	2086	3
3238	33	2195	4
3239	33	2246	5
3240	33	2282	3
3241	33	2398	5
3242	33	2429	4
3243	33	2455	4
3244	33	2459	5
3245	33	2484	4
3246	33	2587	5
3247	33	2639	5
3248	33	2643	3
3249	33	2660	5
3250	33	2665	4
3251	33	2666	4
3252	33	2668	5
3253	33	2727	5
3254	33	2751	4
3255	33	2754	5
3256	33	2766	4
3257	33	2873	4
3258	33	3150	5
3259	33	3165	4
3260	33	3177	5
3261	33	3291	5
3262	33	3295	5
3263	33	3314	4
3264	33	3396	4
3265	33	3586	5
3266	33	3610	3
3267	33	3669	5
3268	33	3686	5
3269	33	3745	4
3270	33	3749	3
3271	33	3769	3
3272	33	3795	2
3273	33	3830	3
3274	34	5	3
3275	34	167	1
3276	34	231	5
3277	34	631	5
3278	34	726	5
3279	34	753	5
3280	34	755	4
3281	34	771	5
3282	34	841	4
3283	34	915	5
3284	34	972	5
3285	34	1044	5
3286	34	1117	5
3287	34	1268	3
3288	34	1528	4
3289	34	1565	3
3290	34	1642	4
3291	34	1910	2
3292	34	2080	3
3293	34	2146	5
3294	34	2198	5
3295	34	2210	4
3296	34	2424	3
3297	34	2792	3
3298	34	2816	5
3299	34	2844	3
3300	34	2850	4
3301	34	2855	4
3302	35	3	3
3303	35	5	3
3304	35	6	5
3305	35	14	1
3306	35	88	2
3307	35	97	5
3308	35	121	5
3309	35	336	3
3310	35	440	3
3311	35	538	5
3312	35	565	2
3313	35	568	3
3314	35	574	5
3315	35	592	5
3316	35	620	5
3317	35	622	5
3318	35	639	3
3319	35	647	5
3320	35	651	3
3321	35	652	4
3322	35	653	4
3323	35	654	4
3324	35	659	3
3325	35	675	5
3326	35	677	4
3327	35	684	4
3328	35	696	5
3329	35	708	1
3330	35	864	5
3331	35	873	2
3332	35	1103	3
3333	35	1142	4
3334	36	10	3
3335	36	21	4
3336	36	48	5
3337	36	99	5
3338	36	127	3
3339	36	130	3
3340	36	138	3
3341	36	161	4
3342	36	197	5
3343	36	258	3
3344	36	264	4
3345	36	278	3
3346	36	280	5
3347	36	290	3
3348	36	300	3
3349	36	305	3
3350	36	310	4
3351	36	317	3
3352	36	324	4
3353	36	340	3
3354	36	403	4
3355	36	406	5
3356	36	446	3
3357	36	472	5
3358	36	483	3
3359	36	521	4
3360	36	522	4
3361	36	523	4
3362	36	524	4
3363	36	525	3
3364	36	528	4
3365	36	530	4
3366	37	54	3.5
3367	37	217	4.5
3368	37	280	5
3369	37	419	3
3370	37	472	4
3371	37	538	4.5
3372	37	612	4
3373	37	631	4
3374	37	696	5
3375	37	726	4.5
3376	37	727	3.5
3377	37	730	4.5
3378	37	732	5
3379	37	734	5
3380	37	735	5
3381	37	744	4.5
3382	37	745	4.5
3383	37	892	3.5
3384	37	925	3.5
3385	37	926	4
3386	37	957	4
3387	37	961	4
3388	37	966	4
3389	37	969	5
3390	37	981	4.5
3391	37	983	4.5
3392	37	985	3.5
3393	37	1012	5
3394	37	1044	4.5
3395	37	1118	3
3396	37	1122	3.5
3397	37	1512	4.5
3398	37	1517	4.5
3399	37	1565	3.5
3400	37	1660	4.5
3401	37	1741	3.5
3402	37	1916	3.5
3403	37	2159	2
3404	37	2721	5
3405	37	2727	5
3406	37	2908	4.5
3407	37	2948	3.5
3408	37	3005	4.5
3409	37	3451	3.5
3410	37	3934	1.5
3411	37	4458	4
3412	37	4491	3.5
3413	37	4679	4
3414	37	5168	3.5
3415	37	5186	5
3416	37	5195	3.5
3417	37	5410	3.5
3418	37	5434	3.5
3419	37	5435	4
3420	37	5465	3.5
3421	37	5587	5
3422	37	5687	4
3423	37	5950	4
3424	38	1	5
3425	38	2	2
3426	38	34	3
3427	38	46	3.5
3428	38	48	4.5
3429	38	54	3.5
3430	38	58	4
3431	38	81	2
3432	38	95	2.5
3433	38	127	3.5
3434	38	229	1
3435	38	231	3.5
3436	38	261	3.5
3437	38	279	2.5
3438	38	280	4
3439	38	290	4
3440	38	316	1
3441	38	317	4.5
3442	38	324	4.5
3443	38	427	4
3444	38	446	3.5
3445	38	465	5
3446	38	520	2
3447	38	522	4.5
3448	38	523	2.5
3449	38	526	4
3450	38	527	2.5
3451	38	528	4.5
3452	38	529	2.5
3453	38	538	3
3454	38	546	4
3455	38	572	0.5
3456	38	631	3
3457	38	647	1.5
3458	38	650	3
3459	38	713	1.5
3460	38	721	4.5
3461	38	734	1.5
3462	38	736	3.5
3463	38	741	3.5
3464	38	746	2.5
3465	38	766	3
3466	38	775	3
3467	38	816	2.5
3468	38	826	2
3469	38	831	2
3470	38	834	1.5
3471	38	836	3.5
3472	38	837	2
3473	38	840	2.5
3474	38	843	3.5
3475	38	866	4.5
3476	38	873	3.5
3477	38	886	3.5
3478	38	895	4
3479	38	923	4.5
3480	38	952	4
3481	38	957	3
3482	38	959	3.5
3483	38	960	5
3484	38	961	4
3485	38	962	3.5
3486	38	970	4
3487	38	972	4
3488	38	982	4.5
3489	38	1000	2.5
3490	38	1002	2
3491	38	1006	4.5
3492	38	1018	4.5
3493	38	1023	3.5
3494	38	1030	3.5
3495	38	1042	3
3496	38	1051	3
3497	38	1053	0.5
3498	38	1061	2
3499	38	1066	3
3500	38	1103	3.5
3501	38	1106	2.5
3502	38	1113	1.5
3503	38	1114	2
3504	38	1115	2.5
3505	38	1116	3.5
3506	38	1117	2.5
3507	38	1118	4.5
3508	38	1122	3
3509	38	1127	2
3510	38	1244	1
3511	38	1254	1.5
3512	38	1256	4.5
3513	38	1261	3
3514	38	1290	3.5
3515	38	1349	3.5
3516	38	1359	2.5
3517	38	1361	3
3518	38	1362	1.5
3519	38	1368	1.5
3520	38	1415	3
3521	38	1481	4
3522	38	1484	1
3523	38	1492	3.5
3524	38	1514	4
3525	38	1524	3
3526	38	1535	4
3527	38	1572	2.5
3528	38	1581	2.5
3529	38	1591	2
3530	38	1609	3
3531	38	1615	0.5
3532	38	1638	4
3533	38	1640	3.5
3534	38	1641	3.5
3535	38	1645	2.5
3536	38	1647	4
3537	38	1652	2.5
3538	38	1656	2.5
3539	38	1675	3.5
3540	38	1694	2
3541	38	1698	3.5
3542	38	1749	4
3543	38	1866	0.5
3544	38	1867	3
3545	38	1904	2
3546	38	1905	2.5
3547	38	1916	3
3548	38	1976	3.5
3549	38	2022	2.5
3550	38	2047	1
3551	38	2052	2.5
3552	38	2057	3.5
3553	38	2099	3
3554	38	2144	3
3555	38	2146	4
3556	38	2176	3
3557	38	2209	4.5
3558	38	2210	4.5
3559	38	2299	1.5
3560	38	2332	4
3561	38	2353	3.5
3562	38	2364	1.5
3563	38	2424	3.5
3564	38	2425	3
3565	38	2497	2.5
3566	38	2528	3.5
3567	38	2570	2
3568	38	2588	3
3569	38	2623	2
3570	38	2628	2
3571	38	2740	3.5
3572	38	2757	2
3573	38	2767	3.5
3574	38	2770	4.5
3575	38	2816	2.5
3576	38	2819	3.5
3577	38	2861	0.5
3578	38	2877	2.5
3579	38	2898	4
3580	38	2965	2.5
3581	38	2998	3.5
3582	38	3000	3.5
3583	38	3097	0.5
3584	38	3108	2.5
3585	38	3150	0.5
3586	38	3167	1
3587	38	3173	4.5
3588	38	3177	4
3589	38	3221	1.5
3590	38	3271	1.5
3591	38	3293	2
3592	38	3323	4.5
3593	38	3380	2.5
3594	38	3382	4
3595	38	3421	1.5
3596	38	3479	1.5
3597	38	3536	3
3598	38	3633	1
3599	38	3769	3.5
3600	38	3793	4.5
3601	38	3807	4.5
3602	38	3812	5
3603	38	3818	4
3604	38	3860	3.5
3605	38	3886	4
3606	38	3888	5
3607	38	3959	1
3608	38	4002	2.5
3609	38	4033	3.5
3610	38	4109	2
3611	38	4127	1
3612	38	4154	4
3613	38	4155	1
3614	38	4172	4
3615	38	4184	2.5
3616	38	4212	2.5
3617	38	4236	0.5
3618	38	4379	3
3619	38	4386	3
3620	38	4425	3.5
3621	38	4458	3.5
3622	38	4485	4
3623	38	4567	2
3624	38	4681	2.5
3625	38	4684	2.5
3626	38	4697	3.5
3627	38	4705	4.5
3628	38	4803	4.5
3629	38	4819	0.5
3630	38	4880	3.5
3631	38	4934	4
3632	38	4998	3.5
3633	38	5017	1
3634	38	5037	4
3635	38	5039	3.5
3636	38	5068	3
3637	38	5207	4
3638	38	5214	2
3639	38	5306	2
3640	38	5311	3.5
3641	38	5335	1
3642	38	5338	1
3643	38	5348	1
3644	38	5374	3
3645	38	5414	3.5
3646	38	5618	2
3647	38	5624	3.5
3648	38	5726	1
3649	38	5730	3.5
3650	38	5743	3
3651	38	5883	4.5
3652	38	5891	3
3653	38	6046	2.5
3654	38	6062	4
3655	38	6069	5
3656	38	6172	2
3657	38	6413	1.5
3658	38	6419	4.5
3659	38	6423	1.5
3660	38	6485	3.5
3661	38	6517	3.5
3662	38	6620	2.5
3663	38	6627	1.5
3664	38	6632	2
3665	38	6642	4.5
3666	38	6663	2
3667	38	6667	2.5
3668	38	6684	1.5
3669	38	6691	3
3670	38	6767	2.5
3671	38	6813	2
3672	38	6827	3
3673	38	6895	1.5
3674	38	6923	3
3675	38	6946	4.5
3676	38	7015	2
3677	38	7019	2
3678	38	7022	1.5
3679	38	7036	3
3680	38	7049	0.5
3681	38	7066	0.5
3682	38	7083	2.5
3683	38	7102	2
3684	38	7180	4.5
3685	38	7189	3
3686	38	7201	2
3687	38	7220	3.5
3688	38	7273	3
3689	38	7283	1
3690	38	7301	3.5
3691	38	7344	3.5
3692	38	7385	3
3693	38	7422	2.5
3694	38	7423	0.5
3695	38	7424	2.5
3696	38	7439	4
3697	38	7545	4
3698	38	7559	2
3699	38	7565	2.5
3700	38	7587	2.5
3701	38	7651	2.5
3702	38	7670	5
3703	38	7715	3.5
3704	38	7733	0.5
3705	38	7742	3
3706	38	7761	3.5
3707	38	7765	3.5
3708	38	7786	3
3709	38	7798	4.5
3710	38	7910	1
3711	38	7914	3
3712	38	7961	2
3713	38	8043	3
3714	38	8046	5
3715	38	8093	2.5
3716	38	8096	4.5
3717	38	8118	4
3718	38	8121	5
3719	38	8130	2.5
3720	38	8151	0.5
3721	38	8163	3.5
3722	38	8168	3.5
3723	38	8264	1
3724	38	8340	3.5
3725	38	8351	3.5
3726	38	8354	3.5
3727	38	8393	2.5
3728	38	8422	4
3729	38	8489	3.5
3730	38	8543	3
3731	38	8600	4.5
3732	38	8629	4
3733	38	8630	5
3734	38	8645	3.5
3735	38	8705	2.5
3736	38	8761	2
3737	38	8762	4.5
3738	38	8778	4
3739	38	8779	4
3740	38	8780	4.5
3741	38	8819	1.5
3742	38	8868	3
3743	38	8958	2.5
3744	38	8990	3
3745	38	9014	2.5
3746	38	9029	0.5
3747	38	9049	4
3748	38	9061	3
3749	38	9073	2
3750	38	9122	2.5
3751	38	9138	4
3752	38	9225	2
3753	38	9227	4.5
3754	38	9230	3.5
3755	38	9287	1
3756	38	9289	3.5
3757	38	9290	4
3758	38	9308	3
3759	38	9396	3
3760	38	9418	2.5
3761	38	9427	3.5
3762	38	9438	4.5
3763	38	9453	4.5
3764	38	9506	4
3765	38	9509	3.5
3766	38	9521	3
3767	38	9538	3.5
3768	38	9546	3
3769	38	9551	1.5
3770	38	9659	3.5
3771	38	9671	4.5
3772	38	9695	2.5
3773	38	9700	3.5
3774	38	9712	4
3775	38	9734	2
3776	38	9770	4
3777	38	9817	3
3778	38	9838	3
3779	38	9839	2
3780	38	9844	4
3781	38	9845	3
3782	38	9876	3.5
3783	38	9897	3
3784	38	9915	4
3785	38	9985	3.5
3786	38	9994	0.5
3787	38	10123	3
3788	38	10256	3.5
3789	39	88	3
3790	39	127	5
3791	39	231	4
3792	39	261	5
3793	39	280	3
3794	39	317	4
3795	39	327	4
3796	39	406	3
3797	39	427	3
3798	39	525	3
3799	39	526	5
3800	39	746	5
3801	39	926	5
3802	39	941	5
3803	39	959	5
3804	39	2022	4
3805	39	2209	4
3806	39	2497	4
3807	39	2628	3
3808	39	2837	5
3809	39	3000	3
3810	39	3150	5
3811	39	3351	3
3812	39	3638	2
3813	40	1144	5
3814	40	1157	4
3815	40	1167	4
3816	40	1198	3
3817	40	1203	4
3818	40	1265	3
3819	40	1267	1
3820	40	1269	4
3821	40	1272	1
3822	40	1276	1
3823	40	1278	2
3824	40	1285	4
3825	40	1286	3
3826	40	1288	2
3827	40	1295	4
3828	40	1302	3
3829	40	1311	3
3830	40	1314	2
3831	40	1315	3
3832	40	1316	3
3833	40	1340	4
3834	40	1343	1
3835	40	1350	4
3836	40	1361	5
3837	40	1362	2
3838	40	1366	2
3839	40	1368	4
3840	40	1369	3
3841	40	1387	4
3842	41	37	5
3843	41	43	4.5
3844	41	46	4
3845	41	58	5
3846	41	69	1.5
3847	41	188	4.5
3848	41	195	4
3849	41	220	4
3850	41	261	4
3851	41	280	5
3852	41	294	1
3853	41	324	4.5
3854	41	427	5
3855	41	487	4.5
3856	41	528	5
3857	41	529	5
3858	41	530	4
3859	41	538	4
3860	41	627	5
3861	41	862	2.5
3862	41	923	5
3863	41	926	5
3864	41	960	5
3865	41	985	4
3866	41	987	5
3867	41	1018	2
3868	41	1025	4.5
3869	41	1092	4
3870	41	1131	3
3871	41	1213	2.5
3872	41	1226	4.5
3873	41	1233	4
3874	41	1261	4.5
3875	41	1310	4
3876	41	1311	4
3877	41	1375	4.5
3878	41	1494	4.5
3879	41	1641	5
3880	41	1656	4.5
3881	41	1730	3.5
3882	41	1822	4
3883	41	1844	1.5
3884	41	1906	4
3885	41	1907	4.5
3886	41	2002	4
3887	41	2078	4.5
3888	41	2146	3.5
3889	41	2169	3
3890	41	2210	4
3891	41	2233	3.5
3892	41	2246	5
3893	41	2282	4.5
3894	41	2398	5
3895	41	2497	5
3896	41	2520	4.5
3897	41	2704	4
3898	41	2766	3.5
3899	41	2965	4.5
3900	41	3073	3.5
3901	41	3083	4.5
3902	41	3177	4.5
3903	41	3323	2.5
3904	41	3337	4.5
3905	41	3380	5
3906	41	3636	4
3907	41	3803	0.5
3908	41	3812	5
3909	41	3818	4
3910	41	3824	4
3911	41	3860	4.5
3912	41	3868	5
3913	41	3873	3
3914	41	3874	4.5
3915	41	3904	3
3916	41	4062	4
3917	41	4076	3.5
3918	41	4080	4.5
3919	41	4135	4
3920	41	4137	4
3921	41	4173	4
3922	41	4258	3.5
3923	41	4283	4.5
3924	41	4313	5
3925	41	4316	3.5
3926	41	4386	4.5
3927	41	4435	3
3928	41	4453	4
3929	41	4487	5
3930	41	4600	4.5
3931	41	4624	4
3932	41	4653	4
3933	41	4832	4
3934	41	4837	4.5
3935	41	4854	3
3936	41	4906	4.5
3937	41	4909	5
3938	41	4922	3.5
3939	41	4932	4
3940	41	4971	2.5
3941	41	4990	4
3942	41	4998	4
3943	41	5004	4.5
3944	41	5005	4.5
3945	42	5	5
3946	42	17	5
3947	42	32	0.5
3948	42	209	5
3949	42	261	2
3950	42	280	4
3951	42	472	4
3952	42	530	4.5
3953	42	536	4.5
3954	42	736	5
3955	42	738	5
3956	42	741	4.5
3957	42	886	5
3958	42	947	5
3959	42	952	4
3960	42	961	4.5
3961	42	1100	5
3962	42	1115	4
3963	42	1368	4.5
3964	42	1797	4
3965	42	1852	0.5
3966	42	1892	1.5
3967	42	1915	5
3968	42	2135	4.5
3969	42	2595	0.5
3970	42	2704	4.5
3971	42	2903	4.5
3972	42	3125	4.5
3973	42	3153	3
3974	42	3419	4.5
3975	42	3482	4
3976	42	3498	5
3977	42	3510	5
3978	42	3566	5
3979	42	3667	3
3980	42	3860	4.5
3981	42	3886	4.5
3982	42	4085	5
3983	42	4180	4
3984	42	4200	3.5
3985	42	4279	5
3986	42	4368	0.5
3987	42	4458	4.5
3988	42	4705	5
3989	42	4957	4.5
3990	42	5016	0.5
3991	42	5042	4.5
3992	42	5043	4.5
3993	42	5203	5
3994	42	5207	4.5
3995	42	5427	5
3996	42	5727	5
3997	42	5899	4.5
3998	42	6423	5
3999	42	6485	4.5
4000	42	7155	0.5
4001	42	7267	4.5
4002	42	7398	4.5
4003	42	7494	1.5
4004	42	7761	4.5
4005	42	7914	5
4006	42	8351	5
4007	42	8779	5
4008	42	8819	5
4009	42	9269	5
4010	42	9785	5
4011	43	45	4
4012	43	130	0.5
4013	43	278	3
4014	43	612	3.5
4015	43	961	4.5
4016	43	1043	5
4017	43	1591	3
4018	43	1668	2.5
4019	43	1676	3
4020	43	1685	2.5
4021	43	1854	1.5
4022	43	1907	3
4023	43	2057	3.5
4024	43	2146	2
4025	43	2210	4.5
4026	43	2239	5
4027	43	2478	5
4028	43	2661	2
4029	43	3143	2.5
4030	43	4033	3.5
4031	43	4126	3.5
4032	43	4803	2
4033	43	6413	4
4034	44	1	1.5
4035	44	32	4
4036	44	45	3
4037	44	48	4
4038	44	156	4.5
4039	44	195	5
4040	44	207	4.5
4041	44	231	4
4042	44	242	3
4043	44	250	4.5
4044	44	256	3.5
4045	44	259	4
4046	44	261	4
4047	44	280	3
4048	44	281	3.5
4049	44	288	5
4050	44	443	3.5
4051	44	485	4.5
4052	44	495	4.5
4053	44	526	2.5
4054	44	538	3
4055	44	580	0.5
4056	44	617	4
4057	44	624	4
4058	44	631	4.5
4059	44	645	4
4060	44	696	2
4061	44	734	5
4062	44	735	4.5
4063	44	745	3.5
4064	44	789	3.5
4065	44	835	1
4066	44	877	3
4067	44	878	3
4068	44	887	3.5
4069	44	899	4
4070	44	923	3
4071	44	957	4
4072	44	959	4
4073	44	960	4
4074	44	961	4.5
4075	44	962	4
4076	44	963	3.5
4077	44	964	2.5
4078	44	968	3
4079	44	975	4
4080	44	976	5
4081	44	977	3
4082	44	982	3.5
4083	44	995	4
4084	44	1000	2.5
4085	44	1003	4
4086	44	1009	4.5
4087	44	1013	3.5
4088	44	1018	3
4089	44	1021	2.5
4090	44	1022	3
4091	44	1025	3
4092	44	1026	3
4093	44	1029	3.5
4094	44	1034	4
4095	44	1036	3.5
4096	44	1038	3
4097	44	1042	4.5
4098	44	1045	3
4099	44	1060	3
4100	44	1066	2.5
4101	44	1071	4.5
4102	44	1072	4.5
4103	44	1088	4.5
4104	44	1117	1.5
4105	44	1127	2
4106	44	1134	4
4107	44	1189	3.5
4108	44	1215	4
4109	44	1296	4
4110	44	1338	3
4111	44	1351	4.5
4112	44	1375	4
4113	44	1382	4.5
4114	44	1402	4
4115	44	1528	4.5
4116	44	1549	1
4117	44	1558	2
4118	44	1561	3
4119	44	1583	4.5
4120	44	1591	3.5
4121	44	1696	3
4122	44	1702	2.5
4123	44	1716	2.5
4124	44	1749	2.5
4125	44	1811	3.5
4126	44	1814	4
4127	44	1830	3.5
4128	44	1878	5
4129	44	1907	3.5
4130	44	1930	0.5
4131	44	1973	3
4132	44	2022	1
4133	44	2034	1
4134	44	2052	1.5
4135	44	2057	0.5
4136	44	2112	3.5
4137	44	2126	4
4138	44	2172	3.5
4139	44	2184	3.5
4140	44	2209	4
4141	44	2210	3
4142	44	2230	2
4143	44	2282	3.5
4144	44	2294	4
4145	44	2313	3
4146	44	2332	2
4147	44	2335	3.5
4148	44	2358	0.5
4149	44	2366	4
4150	44	2398	4.5
4151	44	2399	3
4152	44	2428	4
4153	44	2471	3.5
4154	44	2525	4
4155	44	2542	4.5
4156	44	2558	3
4157	44	2570	4
4158	44	2612	4
4159	44	2646	3
4160	44	2713	2.5
4161	44	2757	2
4162	44	2766	4
4163	44	2778	1
4164	44	2792	2.5
4165	44	2809	4.5
4166	44	2924	4
4167	44	2926	3
4168	44	3117	3
4169	44	3163	1.5
4170	44	3165	2.5
4171	44	3177	4.5
4172	44	3233	3
4173	44	3323	4
4174	44	3340	3.5
4175	44	3380	4
4176	44	3393	3
4177	44	3698	1
4178	44	3724	4.5
4179	44	3793	1
4180	44	3807	4
4181	44	3812	3
4182	44	3860	3.5
4183	44	3868	4.5
4184	44	3886	3.5
4185	44	3996	2
4186	44	4025	3.5
4187	44	4113	3
4188	44	4126	3.5
4189	44	4188	4
4190	44	4211	3.5
4191	44	4269	4.5
4192	44	4278	2
4193	44	4458	3
4194	44	4473	5
4195	44	4474	4
4196	44	4562	0.5
4197	44	4617	3
4198	44	4662	3
4199	44	4705	3.5
4200	44	4731	2
4201	44	4779	4
4202	44	4934	4.5
4203	44	4936	4.5
4204	44	4960	1
4205	44	4979	3.5
4206	44	4994	3
4207	44	5005	4
4208	44	5027	3
4209	44	5046	2
4210	44	5151	4
4211	44	5184	3.5
4212	44	5202	4
4213	44	5337	4
4214	44	5453	4.5
4215	44	5582	2
4216	44	5663	3.5
4217	44	5743	0.5
4218	44	5802	2
4219	44	5809	4
4220	44	5839	4
4221	44	5883	3.5
4222	44	5890	4
4223	44	6166	2.5
4224	44	6207	3.5
4225	44	6507	3
4226	44	6563	5
4227	44	6642	0.5
4228	44	6663	0.5
4229	44	6691	5
4230	44	6765	4
4231	44	6968	0.5
4232	44	7038	4
4233	44	7157	4.5
4234	44	7292	3.5
4235	44	7334	4.5
4236	44	7471	4.5
4237	44	7567	1.5
4238	44	7586	3.5
4239	44	7590	0.5
4240	44	7670	0.5
4241	45	1	4
4242	45	46	1.5
4243	45	48	4
4244	45	54	2
4245	45	231	4.5
4246	45	261	4.5
4247	45	280	3
4248	45	431	2.5
4249	45	465	3.5
4250	45	472	5
4251	45	485	4.5
4252	45	487	2
4253	45	612	4
4254	45	627	4.5
4255	45	631	4.5
4256	45	696	5
4257	45	923	4
4258	45	926	4.5
4259	45	957	4
4260	45	959	5
4261	45	960	4
4262	45	969	3
4263	45	983	5
4264	45	985	4
4265	45	994	3.5
4266	45	995	3.5
4267	45	1010	4
4268	45	1012	4.5
4269	45	1022	4
4270	45	1038	4
4271	45	1048	4
4272	45	1310	3.5
4273	45	1340	2.5
4274	45	1399	0.5
4275	45	2209	3.5
4276	45	2230	4.5
4277	45	2239	4
4278	45	2389	4
4279	45	2403	4.5
4280	45	2497	3.5
4281	45	2721	4
4282	45	2751	3
4283	45	2965	3.5
4284	45	3150	4
4285	45	3155	3
4286	45	3323	3.5
4287	45	3812	1.5
4288	45	3868	3.5
4289	45	3886	4
4290	45	4218	2.5
4291	45	4279	4.5
4292	45	4458	4
4293	45	4705	1.5
4294	45	4954	4.5
4295	45	5000	4
4296	45	5207	3.5
4297	45	5582	4
4298	45	5883	2
4299	45	5912	4
4300	45	6462	4
4301	45	6760	4
4302	45	6767	4
4303	45	6790	4
4304	45	6946	4
4305	45	6948	4
4306	46	24	5
4307	46	25	4
4308	46	34	4
4309	46	36	4
4310	46	231	5
4311	46	261	5
4312	46	319	3
4313	46	357	4
4314	46	472	4
4315	46	485	5
4316	46	526	4
4317	46	652	3
4318	46	696	5
4319	46	741	4
4320	46	788	4
4321	46	957	5
4322	46	961	5
4323	46	970	5
4324	46	975	5
4325	46	981	4
4326	46	987	5
4327	46	1042	4
4328	46	1084	3
4329	46	1127	4
4330	46	1296	4
4331	46	1337	4
4332	46	1341	3
4333	46	1378	4
4334	46	1422	4
4335	46	1484	2
4336	46	1528	4
4337	46	1591	5
4338	46	1743	3
4339	46	1819	3
4340	46	1905	3
4341	46	1906	4
4342	46	1907	3
4343	46	1989	4
4344	46	1992	3
4345	46	2054	1
4346	46	2065	4
4347	46	2080	4
4348	46	2144	4
4349	46	2158	2
4350	46	2160	1
4351	46	2163	5
4352	46	2167	2
4353	46	2175	2
4354	46	2179	2
4355	46	2180	3
4356	46	2209	4
4357	46	2210	5
4358	46	2217	2
4359	46	2247	2
4360	46	2271	3
4361	46	2366	5
4362	46	2389	4
4363	46	2410	4
4364	46	2413	4
4365	46	2515	5
4366	46	2750	4
4367	46	2757	5
4368	46	2761	4
4369	46	2762	3
4370	46	2763	5
4371	46	2765	4
4372	46	2778	3
4373	46	2798	5
4374	46	2799	4
4375	46	2800	4
4376	46	2811	4
4377	46	2817	3
4378	46	2819	3
4379	47	16	4
4380	47	21	3
4381	47	25	5
4382	47	26	3
4383	47	28	3
4384	47	29	5
4385	47	32	4
4386	47	34	5
4387	47	36	5
4388	47	39	5
4389	47	45	3
4390	47	48	5
4391	47	77	3
4392	47	79	3
4393	47	90	3
4394	47	99	5
4395	47	100	4
4396	47	101	3
4397	47	106	3
4398	47	121	3
4399	47	125	3
4400	47	127	3
4401	47	128	3
4402	47	130	3
4403	47	131	4
4404	47	139	4
4405	47	141	3
4406	47	151	4
4407	47	168	3
4408	47	186	4
4409	47	187	4
4410	47	202	3
4411	47	207	4
4412	47	217	5
4413	47	218	4
4414	47	220	4
4415	47	231	5
4416	47	233	5
4417	47	235	3
4418	47	242	5
4419	47	249	4
4420	47	256	5
4421	47	259	3
4422	47	261	5
4423	47	264	4
4424	47	266	4
4425	47	270	4
4426	47	271	3
4427	47	272	3
4428	47	276	5
4429	47	278	3
4430	47	280	4
4431	47	281	4
4432	47	284	4
4433	47	298	4
4434	47	303	4
4435	47	305	3
4436	47	333	4
4437	47	380	4
4438	47	406	4
4439	47	419	4
4440	47	423	4
4441	47	439	4
4442	47	453	3
4443	47	475	5
4444	47	495	4
4445	47	497	3
4446	47	499	4
4447	47	503	4
4448	47	520	3
4449	47	522	4
4450	47	525	3
4451	47	526	5
4452	47	527	5
4453	47	529	5
4454	47	538	5
4455	47	554	3
4456	47	627	3
4457	47	642	3
4458	47	645	5
4459	47	652	3
4460	47	657	5
4461	47	693	4
4462	47	696	5
4463	47	873	5
4464	47	882	3
4465	47	968	5
4466	47	1201	4
4467	48	19	0.5
4468	48	223	4
4469	48	328	4
4470	48	391	1
4471	48	414	1
4472	48	440	1
4473	48	474	5
4474	48	487	4
4475	48	877	5
4476	48	962	5
4477	48	1002	4.5
4478	48	1136	3.5
4479	48	1215	3.5
4480	48	1233	4
4481	48	1244	2
4482	48	1340	2.5
4483	48	1675	2
4484	48	2091	1.5
4485	48	2169	3.5
4486	48	3073	4
4487	49	101	5
4488	49	130	3
4489	49	327	5
4490	49	383	4
4491	49	525	4
4492	49	538	5
4493	49	701	1
4494	49	945	1
4495	49	1119	3
4496	49	1127	4
4497	49	1270	4
4498	49	1296	3
4499	49	1375	3
4500	49	1490	3
4501	49	1561	4
4502	49	1564	5
4503	49	1590	1
4504	49	1686	4
4505	49	1770	3
4506	49	1796	4
4507	49	1803	3
4508	49	1902	4
4509	49	2032	2
4510	49	2040	4
4511	49	2049	2
4512	49	2080	2
4513	49	2090	2
4514	50	1	4
4515	50	17	3
4516	50	34	3
4517	50	36	5
4518	50	45	3
4519	50	48	2
4520	50	90	4
4521	50	127	3
4522	50	165	3
4523	50	218	4
4524	50	231	3
4525	50	261	2
4526	50	270	5
4527	50	280	2
4528	50	281	2
4529	50	317	2
4530	50	335	4
4531	50	406	2
4532	50	439	5
4533	50	443	2
4534	50	472	4
4535	50	474	4
4536	50	485	3
4537	50	493	4
4538	50	500	3
4539	50	522	3
4540	50	526	3
4541	50	531	3
4542	50	538	4
4543	50	613	4
4544	50	631	3
4545	50	645	5
4546	50	696	4
4547	50	720	4
4548	50	726	4
4549	50	732	4
4550	50	772	4
4551	50	848	4
4552	50	863	2
4553	50	887	3
4554	50	899	2
4555	50	900	4
4556	50	926	1
4557	50	941	4
4558	50	947	1
4559	50	957	4
4560	50	959	3
4561	50	960	4
4562	50	961	3
4563	50	966	4
4564	50	969	4
4565	50	970	4
4566	50	973	2
4567	50	975	4
4568	50	981	5
4569	50	986	4
4570	50	987	4
4571	50	990	5
4572	50	991	4
4573	50	995	4
4574	50	998	5
4575	50	1004	1
4576	50	1007	4
4577	50	1029	4
4578	50	1036	4
4579	50	1048	4
4580	50	1051	2
4581	50	1053	4
4582	50	1060	2
4583	50	1066	2
4584	50	1134	5
4585	50	1144	4
4586	50	1265	1
4587	50	1290	2
4588	50	1296	3
4589	50	1310	4
4590	50	1311	4
4591	50	1312	2
4592	50	1326	1
4593	50	1337	3
4594	50	1344	3
4595	50	1354	4
4596	50	1361	4
4597	50	1368	4
4598	50	1382	1
4599	50	1399	4
4600	50	1402	2
4601	50	1414	2
4602	50	1417	4
4603	50	1432	2
4604	50	1464	1
4605	50	1485	4
4606	50	1488	4
4607	50	1492	1
4608	50	1529	3
4609	50	1530	2
4610	50	1532	2
4611	50	1535	2
4612	50	1564	3
4613	50	1565	2
4614	50	1569	2
4615	50	1591	3
4616	50	1596	3
4617	50	1629	4
4618	50	1636	4
4619	50	1637	3
4620	50	1638	3
4621	50	1641	4
4622	50	1653	3
4623	50	1669	4
4624	50	1690	3
4625	50	1696	4
4626	50	1707	4
4627	50	1717	3
4628	50	1741	4
4629	50	1749	4
4630	50	1791	1
4631	50	1796	3
4632	50	1797	3
4633	50	2363	2
4634	51	10	5
4635	51	99	5
4636	51	130	4
4637	51	138	3
4638	51	142	4
4639	51	181	4
4640	51	203	3
4641	51	224	4
4642	51	258	4
4643	51	261	3
4644	51	278	5
4645	51	280	5
4646	51	290	4
4647	51	340	2
4648	51	383	5
4649	51	406	5
4650	51	522	4
4651	51	524	4
4652	51	526	5
4653	51	528	3
4654	52	1	3
4655	52	37	2
4656	52	99	4
4657	52	317	4.5
4658	52	526	3.5
4659	52	1025	4
4660	52	1344	4.5
4661	52	1368	3.5
4662	52	1867	3.5
4663	52	3380	4
4664	52	3812	5
4665	52	3860	4
4666	52	3886	3.5
4667	52	4033	4
4668	52	4279	3.5
4669	52	4328	3.5
4670	52	4458	3.5
4671	52	4473	4
4672	52	4643	1.5
4673	52	4702	3
4674	52	4705	4
4675	52	4909	3.5
4676	52	5039	4
4677	52	5207	3.5
4678	52	5678	4.5
4679	52	5730	3.5
4680	52	5883	4
4681	52	6627	3.5
4682	52	6714	3.5
4683	52	7061	4
4684	52	7435	4
4685	52	7500	3.5
4686	52	7930	2.5
4687	52	8011	4
4688	52	8121	3.5
4689	52	8130	4
4690	52	8291	4
4691	52	8303	3.5
4692	52	8600	4.5
4693	52	8629	4
4694	52	8761	4
4695	52	9070	3.5
4696	52	9073	4
4697	52	9225	3.5
4698	52	9438	4
4699	52	9477	4.5
4700	52	9661	4
4701	52	9712	3.5
4702	52	9756	2.5
4703	52	9822	4
4704	52	9897	4
4705	52	9909	4
4706	52	9944	3.5
4707	52	10256	4
4708	53	148	3.5
4709	53	177	4
4710	53	280	5
4711	53	384	0.5
4712	53	696	4
4713	53	923	4.5
4714	53	957	4.5
4715	53	969	3.5
4716	53	983	3.5
4717	53	1094	5
4718	53	1520	3.5
4719	53	1570	3
4720	53	1581	3.5
4721	53	1584	3
4722	53	1878	4
4723	53	1976	4
4724	53	2158	3
4725	53	2173	1
4726	53	2366	5
4727	53	2819	5
4728	53	2898	4.5
4729	53	3083	4.5
4730	53	4217	1.5
4731	53	4697	2
4732	53	4968	5
4733	53	6603	0.5
4734	53	7670	4
4735	53	7715	4
4736	53	7932	4
4737	53	8500	5
4738	53	8600	4
4739	53	8630	3
4740	53	8662	5
4741	54	1	3
4742	54	2	4
4743	54	19	2.5
4744	54	32	4
4745	54	34	1
4746	54	42	2.5
4747	54	99	4
4748	54	130	3
4749	54	135	3
4750	54	149	2
4751	54	203	3
4752	54	224	4
4753	54	231	3
4754	54	278	4
4755	54	305	2.5
4756	54	314	2
4757	54	316	1
4758	54	317	3.5
4759	54	324	2.5
4760	54	327	3
4761	54	328	3.5
4762	54	334	2.5
4763	54	337	3
4764	54	353	2
4765	54	360	3.5
4766	54	391	4
4767	54	427	3
4768	54	472	4
4769	54	520	3
4770	54	521	3
4771	54	522	3.5
4772	54	523	3.5
4773	54	528	3
4774	54	565	3.5
4775	54	568	1.5
4776	54	572	1
4777	54	581	2.5
4778	54	620	4
4779	54	622	2.5
4780	54	624	4
4781	54	647	3.5
4782	54	650	3
4783	54	651	2
4784	54	667	0.5
4785	54	682	4.5
4786	54	691	2.5
4787	54	696	5
4788	54	721	4
4789	54	840	3.5
4790	54	895	3
4791	54	898	3
4792	54	959	3
4793	54	972	3
4794	54	983	4
4795	54	1000	3.5
4796	54	1006	3.5
4797	54	1030	3.5
4798	54	1051	3.5
4799	54	1087	2.5
4800	54	1111	1
4801	54	1127	3.5
4802	54	1133	4.5
4803	54	1144	3.5
4804	54	1167	2.5
4805	54	1203	3
4806	54	1233	4
4807	54	1244	2.5
4808	54	1253	2
4809	54	1272	2.5
4810	54	1288	3
4811	54	1297	2.5
4812	54	1315	3.5
4813	54	1343	1.5
4814	54	1344	4.5
4815	54	1362	1.5
4816	54	1366	2.5
4817	54	1368	2
4818	54	1456	3
4819	54	1481	3
4820	54	1484	1.5
4821	54	1489	3.5
4822	54	1490	3.5
4823	54	1521	3
4824	54	1561	2.5
4825	54	1564	4
4826	54	1574	4
4827	54	1575	3
4828	54	1591	4
4829	54	1614	3
4830	54	1684	3.5
4831	54	1723	4
4832	54	1730	3.5
4833	54	1771	3
4834	54	1800	4
4835	54	1814	3.5
4836	54	1816	2
4837	54	1869	2.5
4838	54	1907	3
4839	54	1934	4.5
4840	54	2057	5
4841	54	2058	3
4842	54	2091	3.5
4843	54	2099	2
4844	54	2153	2
4845	54	2159	3.5
4846	54	2160	3.5
4847	54	2167	1
4848	54	2209	2
4849	54	2210	4
4850	54	2247	2.5
4851	54	2313	3
4852	54	2332	5
4853	54	2337	3
4854	54	2361	2.5
4855	54	2364	2.5
4856	54	2387	2.5
4857	54	2399	4
4858	54	2466	4
4859	54	2497	2.5
4860	54	2520	4
4861	54	2531	4
4862	54	2541	3.5
4863	54	2545	4.5
4864	54	2609	1.5
4865	54	2614	2
4866	54	2662	3
4867	54	2704	3
4868	54	2736	3
4869	54	2740	4
4870	54	2744	3
4871	54	2770	3
4872	54	2837	4.5
4873	54	2869	2
4874	54	2870	3
4875	54	2965	2
4876	54	2967	4
4877	54	3000	3
4878	54	3132	1
4879	54	3143	3
4880	54	3149	3
4881	54	3150	3.5
4882	54	3166	1.5
4883	54	3176	3
4884	54	3265	3.5
4885	54	3337	3
4886	54	3351	3
4887	54	3380	4
4888	54	3383	3
4889	54	3406	4
4890	54	3633	1.5
4891	54	3638	3
4892	54	3683	4
4893	54	3812	4
4894	54	3818	3
4895	54	3860	4
4896	54	3868	4.5
4897	54	3886	5
4898	54	3888	4.5
4899	54	3899	3.5
4900	54	3938	3.5
4901	54	3972	2.5
4902	54	3985	2.5
4903	54	4033	1.5
4904	54	4056	3.5
4905	54	4109	3.5
4906	54	4127	2
4907	54	4172	2
4908	54	4213	4
4909	54	4319	4
4910	54	4328	4.5
4911	54	4330	3.5
4912	54	4386	3
4913	54	4402	2
4914	54	4458	5
4915	54	4461	3
4916	54	4488	3
4917	54	4491	3.5
4918	54	4504	3.5
4919	54	4561	3.5
4920	54	4643	4.5
4921	54	4681	3
4922	54	4697	4
4923	54	4705	2.5
4924	54	4780	0.5
4925	54	4803	4
4926	54	4837	3
4927	54	4909	0.5
4928	54	4975	3
4929	54	5005	4.5
4930	54	5037	3
4931	54	5046	4.5
4932	54	5201	4
4933	54	5202	4
4934	54	5203	2.5
4935	54	5207	5
4936	54	5269	3
4937	54	5286	2
4938	54	5323	2
4939	54	5329	1.5
4940	54	5365	3
4941	54	5374	4
4942	54	5377	3.5
4943	54	5618	4
4944	54	5619	4.5
4945	54	5624	3
4946	54	5719	3
4947	54	5726	3
4948	54	5794	4.5
4949	54	5802	3.5
4950	54	5881	4
4951	54	5883	2
4952	54	5889	3
4953	54	5890	4.5
4954	54	5898	4
4955	54	5899	1.5
4956	54	6209	3
4957	54	6415	4
4958	54	6563	4
4959	54	6593	3.5
4960	54	6604	4
4961	54	6647	2
4962	54	6823	4.5
4963	54	6827	3.5
4964	55	31	1
4965	55	156	5
4966	55	231	0.5
4967	55	280	4
4968	55	526	3
4969	55	580	3.5
4970	55	864	3
4971	55	959	0.5
4972	55	961	5
4973	55	966	3.5
4974	55	1090	3
4975	55	1146	4
4976	55	1215	3
4977	55	1330	4
4978	55	1414	2.5
4979	55	1566	3.5
4980	55	1669	4.5
4981	55	1844	3.5
4982	55	1930	5
4983	55	1984	5
4984	55	2057	4
4985	55	2173	5
4986	55	2294	4
4987	55	2490	4
4988	55	2568	3.5
4989	55	3389	4
4990	55	3510	5
4991	56	100	5
4992	56	317	4
4993	56	410	4
4994	56	427	3
4995	56	696	5
4996	56	923	5
4997	56	968	4
4998	56	975	4
4999	56	983	5
5000	56	984	5
5001	56	1032	5
5002	56	1368	4
5003	56	2224	3
5004	56	2330	4
5005	56	2740	4
5006	56	3139	4
5007	56	3380	4
5008	56	3482	3
5009	56	3608	2
5010	56	3792	4
5011	56	3812	4
5012	56	3822	4
5013	56	3824	4
5014	56	3873	5
5015	56	3874	5
5016	56	3902	5
5017	57	45	4.5
5018	57	48	5
5019	57	195	4
5020	57	259	4.5
5021	57	261	4.5
5022	57	280	4.5
5023	57	317	4.5
5024	57	465	3
5025	57	472	4.5
5026	57	814	3.5
5027	57	887	4
5028	57	923	4.5
5029	57	968	4
5030	57	984	4.5
5031	57	1297	3.5
5032	57	1361	4.5
5033	57	1364	3.5
5034	57	1375	4
5035	57	1437	3.5
5036	57	1818	3.5
5037	57	1839	4
5038	57	1844	4.5
5039	57	1973	3.5
5040	57	1976	3
5041	57	2002	4.5
5042	57	2034	4
5043	57	2057	4.5
5044	57	2155	4.5
5045	57	2366	4.5
5046	57	2468	4.5
5047	57	2616	3.5
5048	57	2791	4
5049	57	2837	4.5
5050	57	3159	4.5
5051	57	3163	4.5
5052	57	3218	4
5053	57	3323	4
5054	57	3807	4.5
5055	57	3818	3.5
5056	57	3868	4
5057	57	3886	4
5058	57	3888	4.5
5059	57	4040	4.5
5060	57	4126	4
5061	57	4365	4.5
5062	57	4504	4.5
5063	57	4523	3.5
5064	57	4700	4.5
5065	57	4906	4
5066	57	4940	4
5067	57	4968	4
5068	57	5004	4
5069	57	5202	4.5
5070	57	5271	4
5071	57	5329	4
5072	57	5795	4.5
5073	57	5838	4.5
5074	57	5909	5
5075	57	6200	4
5076	57	6383	4
5077	57	6413	4
5078	57	6891	2.5
5079	57	6948	3.5
5080	57	6950	4.5
5081	57	6959	4.5
5082	57	6967	4
5083	57	6968	4.5
5084	57	7061	4.5
5085	57	7157	4.5
5086	57	7161	4
5087	57	7177	4.5
5088	57	7180	4
5089	57	7219	4.5
5090	57	7494	3.5
5091	57	7535	4.5
5092	57	7538	3.5
5093	57	7670	4.5
5094	57	7715	3.5
5095	57	7761	4.5
5096	57	7898	4.5
5097	57	7914	4
5098	57	7952	4
5099	57	8061	4
5100	57	8086	3.5
5101	57	8378	4.5
5102	57	8600	3
5103	57	8627	4.5
5104	57	8630	4.5
5105	57	8654	4
5106	57	8703	4.5
5107	57	8729	4.5
5108	57	8762	4.5
5109	57	8779	4
5110	57	8782	4
5111	57	8858	3.5
5112	57	8917	4.5
5113	58	135	2.5
5114	58	148	4
5115	58	487	0.5
5116	58	496	0.5
5117	58	529	2.5
5118	58	659	1
5119	58	735	3
5120	58	892	2.5
5121	58	977	1
5122	58	994	2
5123	58	1002	1.5
5124	58	1042	3.5
5125	58	1118	0.5
5126	58	1338	4
5127	58	1482	2.5
5128	58	1660	1.5
5129	58	1906	0.5
5130	58	2211	3
5131	58	2313	2
5132	58	2484	1
5133	59	32	3.5
5134	59	280	4.5
5135	59	406	4
5136	59	485	4.5
5137	59	523	4.5
5138	59	526	3.5
5139	59	631	4.5
5140	59	696	3.5
5141	59	746	4
5142	59	878	5
5143	59	923	5
5144	59	960	2.5
5145	59	961	4.5
5146	59	962	5
5147	59	963	5
5148	59	1030	5
5149	59	1322	4
5150	59	1340	2.5
5151	59	1344	5
5152	59	1573	4
5153	59	2034	4
5154	59	2159	2
5155	59	4485	4.5
5156	59	4803	4.5
5157	59	5391	3
5158	59	6340	2
5159	59	6356	4.5
5160	59	7439	4
5161	59	7883	0.5
5162	59	8090	4.5
5163	59	8351	3
5164	59	8630	5
5165	59	8779	4
5166	59	8925	3.5
5167	59	9269	4.5
5168	59	9885	2
5169	59	9886	4.5
5170	59	9909	4.5
5171	59	9915	4
5172	59	10006	5
5173	59	10067	4
5174	59	10079	4
5175	59	10260	5
5176	60	1	3
5177	60	11	2
5178	60	16	4
5179	60	32	4.5
5180	60	45	4
5181	60	48	4.5
5182	60	64	4
5183	60	99	3.5
5184	60	149	0.5
5185	60	156	4
5186	60	195	3
5187	60	220	4
5188	60	231	5
5189	60	264	3
5190	60	280	5
5191	60	284	4.5
5192	60	298	4
5193	60	324	3
5194	60	330	1.5
5195	60	380	4
5196	60	381	3
5197	60	390	4
5198	60	406	3.5
5199	60	419	4
5200	60	427	4
5201	60	469	2.5
5202	60	495	3
5203	60	497	4
5204	60	522	4
5205	60	523	3
5206	60	526	4.5
5207	60	580	3.5
5208	60	612	2
5209	60	620	4
5210	60	627	2
5211	60	677	1
5212	60	844	3
5213	60	863	3
5214	60	873	4
5215	60	895	1.5
5216	60	909	4.5
5217	60	913	0.5
5218	60	923	3.5
5219	60	926	2.5
5220	60	957	4
5221	60	960	3.5
5222	60	961	4.5
5223	60	963	2
5224	60	969	3
5225	60	977	4
5226	60	982	3
5227	60	985	2.5
5228	60	1000	2.5
5229	60	1002	3
5230	60	1012	5
5231	60	1017	3.5
5232	60	1019	3.5
5233	60	1021	2
5234	60	1025	4.5
5235	60	1030	4.5
5236	60	1038	4
5237	60	1045	3
5238	60	1048	4.5
5239	60	1051	4
5240	60	1056	3
5241	60	1061	1
5242	60	1072	4
5243	60	1116	4
5244	60	1122	4
5245	60	1127	3
5246	60	1133	4
5247	60	1136	4.5
5248	60	1189	2.5
5249	60	1203	1.5
5250	60	1215	5
5251	60	1290	4
5252	60	1310	4
5253	60	1322	4
5254	60	1330	3.5
5255	60	1337	4
5256	60	1344	3.5
5257	60	1382	4
5258	60	1402	4
5259	60	1411	4
5260	60	1435	4
5261	60	1485	4
5262	60	1535	3
5263	60	1669	3.5
5264	60	1674	4
5265	60	1678	3
5266	60	1696	4
5267	60	1701	4
5268	60	1770	4.5
5269	60	1773	4.5
5270	60	1780	3.5
5271	60	1796	3.5
5272	60	1821	4
5273	60	1844	4.5
5274	60	1867	2.5
5275	60	1916	1
5276	60	1933	3
5277	60	2002	4.5
5278	60	2057	4.5
5279	60	2064	3
5280	60	2078	5
5281	60	2108	4.5
5282	60	2159	4
5283	60	2172	4.5
5284	60	2233	3
5285	60	2246	4
5286	60	2282	3.5
5287	60	2313	4
5288	60	2332	4
5289	60	2366	4.5
5290	60	2430	3.5
5291	60	2442	3.5
5292	60	2488	2.5
5293	60	2497	2
5294	60	2542	2.5
5295	60	2568	3
5296	60	2612	4
5297	60	2639	5
5298	60	2669	3
5299	60	2693	3.5
5300	60	2713	4.5
5301	60	2740	3
5302	60	2757	4.5
5303	60	2766	4.5
5304	60	2778	4
5305	60	2799	3
5306	60	2819	4.5
5307	60	2898	3.5
5308	60	3055	2
5309	60	3073	3.5
5310	60	3083	4.5
5311	60	3155	4
5312	60	3184	5
5313	60	3230	4.5
5314	60	3248	2.5
5315	60	3308	3
5316	60	3323	4
5317	60	3517	4
5318	60	3860	4
5319	60	3874	5
5320	60	3886	4.5
5321	60	3966	3.5
5322	60	4074	3.5
5323	60	4076	4
5324	60	4109	4
5325	60	4126	4.5
5326	60	4154	3.5
5327	60	4173	3
5328	60	4188	4
5329	60	4211	2.5
5330	60	4302	3.5
5331	60	4458	5
5332	60	4485	4
5333	60	4487	4.5
5334	60	4496	4.5
5335	60	4504	5
5336	60	4525	4.5
5337	60	4583	4.5
5338	60	4647	4
5339	60	4654	4
5340	60	4676	5
5341	60	4681	4.5
5342	60	4706	3
5343	60	4865	3
5344	60	4908	4
5345	60	4998	4
5346	60	5068	4
5347	60	5111	4
5348	60	5207	4
5349	60	5275	1.5
5350	60	5329	4.5
5351	60	5374	4
5352	60	5418	2.5
5353	60	5423	3
5354	60	5466	3.5
5355	60	5497	2.5
5356	60	5622	4
5357	60	5661	2
5358	60	5694	4.5
5359	60	5703	1
5360	60	5710	2
5361	60	5726	4.5
5362	60	5802	4
5363	60	5886	4.5
5364	60	6096	2
5365	60	6418	4.5
5366	60	6552	1
5367	60	6620	4.5
5368	60	6642	4.5
5369	60	6673	2.5
5370	60	6714	4.5
5371	60	6757	0.5
5372	60	6768	4.5
5373	60	6811	4
5374	60	6948	4.5
5375	60	7061	5
5376	60	7155	5
5377	60	7180	5
5378	61	32	4.5
5379	61	76	0.5
5380	61	92	2.5
5381	61	126	2
5382	61	127	3
5383	61	136	4
5384	61	202	2.5
5385	61	218	3.5
5386	61	231	3
5387	61	259	4
5388	61	261	4.5
5389	61	270	3
5390	61	271	3.5
5391	61	272	2
5392	61	330	2.5
5393	61	472	3
5394	61	474	3.5
5395	61	538	4
5396	61	617	3
5397	61	631	3
5398	61	645	4
5399	61	694	3
5400	61	696	4.5
5401	61	746	4.5
5402	61	858	3.5
5403	61	940	4.5
5404	61	954	3.5
5405	61	959	3
5406	61	962	4.5
5407	61	968	4.5
5408	61	970	4
5409	61	972	3
5410	61	973	3
5411	61	975	4
5412	61	979	4
5413	61	980	4
5414	61	981	4
5415	61	982	3.5
5416	61	983	4.5
5417	61	984	4
5418	61	987	3.5
5419	61	990	3.5
5420	61	991	4
5421	61	993	4.5
5422	61	994	3.5
5423	61	997	4
5424	61	998	3.5
5425	61	1005	3.5
5426	61	1006	3.5
5427	61	1007	4
5428	61	1008	4
5429	61	1011	3.5
5430	61	1018	4
5431	61	1020	4
5432	61	1023	4.5
5433	61	1024	4
5434	61	1034	4
5435	61	1036	3.5
5436	61	1037	4
5437	61	1040	4
5438	61	1043	3.5
5439	61	1045	3.5
5440	61	1048	4
5441	61	1049	3
5442	61	1057	4
5443	61	1066	3
5444	61	1071	2.5
5445	61	1072	4
5446	61	1092	3.5
5447	61	1096	3
5448	61	1097	3.5
5449	61	1101	4
5450	61	1102	3.5
5451	61	1105	3.5
5452	61	1111	2.5
5453	61	1112	3
5454	61	1119	2.5
5455	61	1127	3.5
5456	61	1144	3.5
5457	61	1226	3
5458	61	1417	3
5459	61	1432	4
5460	61	1478	3.5
5461	61	1519	4.5
5462	61	1520	3.5
5463	61	1549	3.5
5464	61	1575	2
5465	61	1675	3
5466	61	1688	4.5
5467	61	1730	4
5468	61	1814	4.5
5469	61	1834	3.5
5470	61	1839	3.5
5471	61	1906	2.5
5472	61	2008	1.5
5473	61	2009	1
5474	61	2074	3
5475	61	2078	2
5476	61	2099	1
5477	61	2108	2.5
5478	61	2144	1.5
5479	61	2163	1.5
5480	61	2169	4
5481	61	2182	3.5
5482	61	2186	4.5
5483	61	2187	3.5
5484	61	2281	3
5485	61	2282	4.5
5486	61	2366	4.5
5487	61	2421	3.5
5488	61	2466	3.5
5489	61	2468	4.5
5490	61	2472	4
5491	61	2531	4
5492	61	2613	1
5493	61	2779	0.5
5494	61	2783	4.5
5495	61	2882	3.5
5496	61	2908	3.5
5497	61	2953	3.5
5498	61	2959	3.5
5499	61	3046	2
5500	61	3083	2.5
5501	61	3109	4
5502	61	3132	3.5
5503	61	3150	4
5504	61	3168	3.5
5505	61	3184	3.5
5506	61	3323	4
5507	61	3636	4.5
5508	61	3696	1.5
5509	61	3788	3.5
5510	61	3807	4.5
5511	61	3810	4.5
5512	61	3830	4
5513	61	3900	3
5514	61	3996	3.5
5515	61	3997	4.5
5516	61	4040	3.5
5517	61	4127	1
5518	61	4197	1.5
5519	61	4272	3.5
5520	61	4316	4
5521	61	4328	3
5522	61	4421	4.5
5523	61	4435	4.5
5524	61	4448	4
5525	61	4459	4.5
5526	61	4485	2.5
5527	61	4491	1.5
5528	61	4617	3.5
5529	61	4658	4.5
5530	61	4679	3.5
5531	61	4682	1
5532	61	4740	4
5533	61	4801	0.5
5534	61	4813	2
5535	61	4884	3.5
5536	62	1	2
5537	62	2	1.5
5538	62	3	1
5539	62	5	3.5
5540	62	6	4.5
5541	62	16	4.5
5542	62	19	0.5
5543	62	22	2
5544	62	24	2
5545	62	25	3.5
5546	62	29	5
5547	62	31	1
5548	62	32	3.5
5549	62	34	0.5
5550	62	37	0.5
5551	62	40	1.5
5552	62	42	0.5
5553	62	43	3.5
5554	62	45	4
5555	62	48	3
5556	62	61	0.5
5557	62	65	1.5
5558	62	66	0.5
5559	62	70	0.5
5560	62	71	2.5
5561	62	81	0.5
5562	62	82	0.5
5563	62	85	3.5
5564	62	88	0.5
5565	62	92	3
5566	62	95	2
5567	62	99	3
5568	62	100	3.5
5569	62	101	0.5
5570	62	117	0.5
5571	62	122	0.5
5572	62	123	0.5
5573	62	130	0.5
5574	62	135	0.5
5575	62	140	2.5
5576	62	142	3.5
5577	62	146	1.5
5578	62	148	0.5
5579	62	149	2.5
5580	62	153	2
5581	62	156	2
5582	62	157	0.5
5583	62	161	0.5
5584	62	162	2.5
5585	62	167	2
5586	62	170	2
5587	62	181	3.5
5588	62	189	0.5
5589	62	195	3
5590	62	202	3
5591	62	203	1
5592	62	207	3.5
5593	62	218	3.5
5594	62	219	0.5
5595	62	224	3
5596	62	227	0.5
5597	62	230	3
5598	62	231	2.5
5599	62	232	0.5
5600	62	236	2
5601	62	243	3
5602	62	252	2
5603	62	254	3.5
5604	62	259	3.5
5605	62	261	5
5606	62	267	3
5607	62	277	1
5608	62	278	2
5609	62	279	2.5
5610	62	280	4.5
5611	62	281	2.5
5612	62	288	1.5
5613	62	293	2.5
5614	62	294	3
5615	62	298	3
5616	62	305	0.5
5617	62	311	2
5618	62	314	3.5
5619	62	316	1.5
5620	62	317	4
5621	62	318	2.5
5622	62	324	1.5
5623	62	326	1
5624	62	327	0.5
5625	62	328	1
5626	62	330	0.5
5627	62	332	2
5628	62	334	0.5
5629	62	336	2
5630	62	337	1
5631	62	340	3.5
5632	62	360	0.5
5633	62	362	3
5634	62	365	0.5
5635	62	368	0.5
5636	62	372	3.5
5637	62	376	3
5638	62	381	0.5
5639	62	384	3
5640	62	385	0.5
5641	62	389	1.5
5642	62	390	1.5
5643	62	391	3
5644	62	404	0.5
5645	62	406	1
5646	62	414	1
5647	62	422	2
5648	62	427	3
5649	62	428	3
5650	62	431	2
5651	62	446	1
5652	62	453	4.5
5653	62	454	4
5654	62	465	3
5655	62	469	1
5656	62	472	5
5657	62	474	3
5658	62	475	0.5
5659	62	476	3
5660	62	485	4.5
5661	62	487	2
5662	62	495	3
5663	62	499	3
5664	62	503	4
5665	62	519	0.5
5666	62	520	1.5
5667	62	521	1.5
5668	62	522	0.5
5669	62	523	4
5670	62	524	3
5671	62	525	3
5672	62	526	4.5
5673	62	527	2
5674	62	528	2.5
5675	62	530	0.5
5676	62	535	0.5
5677	62	538	5
5678	62	540	3
5679	62	553	3.5
5680	62	564	2
5681	62	565	2
5682	62	568	1
5683	62	572	1.5
5684	62	581	1.5
5685	62	602	2
5686	62	614	1
5687	62	620	1.5
5688	62	622	0.5
5689	62	623	0.5
5690	62	625	0.5
5691	62	630	2
5692	62	639	1.5
5693	62	645	4
5694	62	647	2
5695	62	650	0.5
5696	62	651	3
5697	62	652	2.5
5698	62	653	1.5
5699	62	656	3.5
5700	62	659	3
5701	62	669	0.5
5702	62	677	3
5703	62	682	2
5704	62	684	0.5
5705	62	691	2.5
5706	62	696	3
5707	62	700	3.5
5708	62	712	0.5
5709	62	741	5
5710	62	742	0.5
5711	62	774	4
5712	62	788	3
5713	62	828	1
5714	62	835	1.5
5715	62	837	3.5
5716	62	840	5
5717	62	844	3
5718	62	845	0.5
5719	62	849	4
5720	62	853	1.5
5721	62	862	3
5722	62	863	1.5
5723	62	864	3
5724	62	873	1.5
5725	62	877	2.5
5726	62	886	0.5
5727	62	887	3.5
5728	62	888	3.5
5729	62	890	3
5730	62	891	2.5
5731	62	892	3
5732	62	895	1.5
5733	62	897	0.5
5734	62	909	3.5
5735	62	923	3
5736	62	957	4
5737	62	959	3
5738	62	960	2
5739	62	961	1
5740	62	962	3.5
5741	62	963	3.5
5742	62	968	5
5743	62	972	2.5
5744	62	975	4
5745	62	976	3.5
5746	62	977	1
5747	62	981	4
5748	62	984	4
5749	62	996	4
5750	62	1000	3
5751	62	1002	3.5
5752	62	1012	3
5753	62	1013	5
5754	62	1018	4.5
5755	62	1019	3
5756	62	1021	1
5757	62	1025	3.5
5758	62	1028	2
5759	62	1030	3.5
5760	62	1031	3.5
5761	62	1034	3.5
5762	62	1038	2
5763	62	1042	3
5764	62	1045	2
5765	62	1048	3.5
5766	62	1051	0.5
5767	62	1057	2.5
5768	62	1061	3
5769	62	1071	3
5770	62	1078	1
5771	62	1083	3.5
5772	62	1087	1.5
5773	62	1090	3
5774	62	1094	1.5
5775	62	1105	3
5776	62	1112	0.5
5777	62	1117	1.5
5778	62	1119	3
5779	62	1120	0.5
5780	62	1122	0.5
5781	62	1125	0.5
5782	62	1127	3
5783	62	1131	3.5
5784	62	1133	3
5785	62	1134	3.5
5786	62	1142	0.5
5787	62	1144	0.5
5788	62	1145	2.5
5789	62	1146	1
5790	62	1153	0.5
5791	62	1167	1.5
5792	62	1190	0.5
5793	62	1196	2.5
5794	62	1198	2.5
5795	62	1203	0.5
5796	62	1214	0.5
5797	62	1215	3.5
5798	62	1222	0.5
5799	62	1224	1
5800	62	1226	0.5
5801	62	1233	3
5802	62	1244	2.5
5803	62	1250	2
5804	62	1253	0.5
5805	62	1254	0.5
5806	62	1257	0.5
5807	62	1260	1.5
5808	62	1261	2
5809	62	1265	3
5810	62	1267	3
5811	62	1268	3
5812	62	1269	0.5
5813	62	1271	3
5814	62	1272	0.5
5815	62	1278	3
5816	62	1293	3
5817	62	1296	4
5818	62	1298	2
5819	62	1302	3.5
5820	62	1310	3.5
5821	62	1311	4
5822	62	1315	2
5823	62	1331	0.5
5824	62	1337	3.5
5825	62	1340	3
5826	62	1343	0.5
5827	62	1344	2.5
5828	62	1349	3
5829	62	1351	2.5
5830	62	1354	0.5
5831	62	1356	3.5
5832	62	1361	2.5
5833	62	1363	2.5
5834	62	1368	2.5
5835	62	1372	3.5
5836	62	1375	4
5837	62	1382	3
5838	62	1399	2
5839	62	1400	2
5840	62	1402	4
5841	62	1412	0.5
5842	62	1414	2.5
5843	62	1430	2
5844	62	1451	0.5
5845	62	1461	0.5
5846	62	1463	4.5
5847	62	1465	0.5
5848	62	1484	0.5
5849	62	1489	1
5850	62	1492	4
5851	62	1494	3
5852	62	1514	1.5
5853	62	1519	3.5
5854	62	1521	4
5855	62	1528	3.5
5856	62	1529	4
5857	62	1534	3
5858	62	1535	1
5859	62	1536	1
5860	62	1538	1
5861	62	1541	0.5
5862	62	1542	1
5863	62	1549	2
5864	62	1558	3
5865	62	1561	4
5866	62	1564	1.5
5867	62	1565	1.5
5868	62	1567	2
5869	62	1569	0.5
5870	62	1574	4
5871	62	1575	2
5872	62	1591	5
5873	62	1615	0.5
5874	62	1619	3
5875	62	1621	2.5
5876	62	1632	3.5
5877	62	1636	3.5
5878	62	1638	1.5
5879	62	1640	0.5
5880	62	1641	1.5
5881	62	1654	1
5882	62	1660	2
5883	62	1669	3.5
5884	62	1675	1.5
5885	62	1680	3
5886	62	1682	2
5887	62	1683	0.5
5888	62	1684	0.5
5889	62	1691	0.5
5890	62	1694	3
5891	62	1697	1.5
5892	62	1710	1
5893	62	1716	5
5894	62	1717	2
5895	62	1723	1.5
5896	62	1730	3
5897	62	1743	3
5898	62	1750	0.5
5899	62	1770	3
5900	62	1771	3
5901	62	1780	2.5
5902	62	1796	2
5903	62	1800	0.5
5904	62	1804	0.5
5905	62	1811	3
5906	62	1814	4
5907	62	1818	0.5
5908	62	1822	3.5
5909	62	1832	0.5
5910	62	1834	4
5911	62	1835	2
5912	62	1836	3.5
5913	62	1844	3
5914	62	1849	2
5915	62	1851	3.5
5916	62	1852	0.5
5917	62	1854	2
5918	62	1865	2
5919	62	1893	0.5
5920	62	1906	4
5921	62	1907	0.5
5922	62	1916	1
5923	62	1917	0.5
5924	62	1919	3
5925	62	1920	2.5
5926	62	1921	3
5927	62	1922	1.5
5928	62	1930	2
5929	62	1931	0.5
5930	62	1934	4.5
5931	62	1938	1.5
5932	62	1941	2
5933	62	1963	2.5
5934	62	1971	1
5935	62	1976	0.5
5936	62	1977	0.5
5937	62	1989	1.5
5938	62	1992	4
5939	62	1996	3
5940	62	2002	3.5
5941	62	2004	3.5
5942	62	2009	0.5
5943	62	2019	1.5
5944	62	2031	2.5
5945	62	2033	0.5
5946	62	2034	4.5
5947	62	2053	3
5948	62	2057	1.5
5949	62	2058	2
5950	62	2064	3.5
5951	62	2065	1.5
5952	62	2078	3.5
5953	62	2079	4
5954	62	2080	0.5
5955	62	2081	0.5
5956	62	2090	2
5957	62	2091	0.5
5958	62	2099	2
5959	62	2144	0.5
5960	62	2153	1.5
5961	62	2158	0.5
5962	62	2159	3
5963	62	2160	2
5964	62	2161	3.5
5965	62	2163	0.5
5966	62	2164	3
5967	62	2167	1.5
5968	62	2169	4
5969	62	2172	2
5970	62	2173	0.5
5971	62	2178	2
5972	62	2179	1.5
5973	62	2195	3
5974	62	2210	3.5
5975	62	2217	0.5
5976	62	2219	2.5
5977	62	2233	2.5
5978	62	2234	1.5
5979	62	2235	1
5980	62	2239	2
5981	62	2246	5
5982	62	2271	2
5983	62	2272	3
5984	62	2275	0.5
5985	62	2282	3.5
5986	62	2294	4
5987	62	2313	2.5
5988	62	2327	3
5989	62	2329	2
5990	62	2330	3
5991	62	2332	0.5
5992	62	2361	1.5
5993	62	2364	0.5
5994	62	2366	4
5995	62	2372	3.5
5996	62	2381	4
5997	62	2387	4
5998	62	2388	3
5999	62	2389	2
6000	62	2398	4.5
6001	62	2402	2
6002	62	2413	3
6003	62	2414	3.5
6004	62	2424	2.5
6005	62	2442	3
6006	62	2457	2.5
6007	62	2466	3.5
6008	62	2470	4
6009	62	2483	1.5
6010	62	2490	3
6011	62	2496	1
6012	62	2497	2
6013	62	2520	3.5
6014	62	2527	3.5
6015	62	2531	3.5
6016	62	2540	3
6017	62	2541	3.5
6018	62	2542	3
6019	62	2551	1.5
6020	62	2568	0.5
6021	62	2570	2.5
6022	62	2584	0.5
6023	62	2593	3
6024	62	2594	2
6025	62	2595	1
6026	62	2596	3
6027	62	2598	0.5
6028	62	2604	3
6029	62	2605	0.5
6030	62	2607	4
6031	62	2610	2
6032	62	2613	4.5
6033	62	2615	3
6034	62	2616	1.5
6035	62	2621	3
6036	62	2628	2.5
6037	62	2629	2.5
6038	62	2645	3
6039	62	2661	1.5
6040	62	2684	4.5
6041	62	2705	0.5
6042	62	2711	1.5
6043	62	2716	1.5
6044	62	2730	0.5
6045	62	2736	0.5
6046	62	2742	2
6047	62	2761	4
6048	62	2766	3
6049	62	2770	3
6050	62	2778	3.5
6051	62	2788	3
6052	62	2800	2
6053	62	2805	4
6054	62	2806	1.5
6055	62	2819	2
6056	62	2823	3.5
6057	62	2827	2.5
6058	62	2837	5
6059	62	2844	2.5
6060	62	2855	1.5
6061	62	2863	3
6062	62	2869	1
6063	62	2870	0.5
6064	62	2883	0.5
6065	62	2898	2
6066	62	2908	1.5
6067	62	2920	2
6068	62	2921	3
6069	62	2925	3.5
6070	62	2926	3
6071	62	2938	0.5
6072	62	2965	1.5
6073	62	2966	3
6074	62	2968	1.5
6075	62	2969	1
6076	62	2992	2.5
6077	62	2993	1.5
6078	62	2998	2
6079	62	3000	3
6080	62	3006	0.5
6081	62	3011	3
6082	62	3025	1
6083	62	3031	0.5
6084	62	3039	2.5
6085	62	3048	0.5
6086	62	3052	4
6087	62	3054	3
6088	62	3055	2
6089	62	3056	2.5
6090	62	3073	3
6091	62	3083	3.5
6092	62	3087	2.5
6093	62	3088	3
6094	62	3108	2
6095	62	3109	5
6096	62	3114	1.5
6097	62	3126	1.5
6098	62	3127	1.5
6099	62	3130	0.5
6100	62	3132	0.5
6101	62	3143	3
6102	62	3149	3.5
6103	62	3155	1.5
6104	62	3158	1.5
6105	62	3162	2
6106	62	3163	4
6107	62	3166	0.5
6108	62	3169	2.5
6109	62	3170	2.5
6110	62	3173	4
6111	62	3174	2
6112	62	3176	3.5
6113	62	3177	3
6114	62	3180	0.5
6115	62	3186	4.5
6116	62	3233	2.5
6117	62	3244	0.5
6118	62	3248	2
6119	62	3253	0.5
6120	62	3265	3.5
6121	62	3308	3
6122	62	3320	3.5
6123	62	3323	3.5
6124	62	3325	1.5
6125	62	3333	3
6126	62	3337	2
6127	62	3338	2
6128	62	3345	2.5
6129	62	3351	0.5
6130	62	3375	1.5
6131	62	3380	3
6132	62	3383	0.5
6133	62	3389	2
6134	62	3392	3.5
6135	62	3403	0.5
6136	62	3405	2
6137	62	3406	2.5
6138	62	3411	1
6139	62	3422	1.5
6140	62	3423	0.5
6141	62	3424	0.5
6142	62	3425	4
6143	62	3436	0.5
6144	62	3473	3
6145	62	3481	1.5
6146	62	3482	0.5
6147	62	3483	3
6148	62	3484	2
6149	62	3489	1.5
6150	62	3490	0.5
6151	62	3491	1.5
6152	62	3502	0.5
6153	62	3510	3
6154	62	3536	1
6155	62	3573	0.5
6156	62	3578	0.5
6157	62	3581	1.5
6158	62	3621	2
6159	62	3633	0.5
6160	62	3636	3
6161	62	3638	2
6162	62	3670	1
6163	62	3683	1
6164	62	3693	3
6165	62	3696	0.5
6166	62	3698	3.5
6167	62	3704	2.5
6168	62	3707	0.5
6169	62	3709	2
6170	62	3716	1.5
6171	62	3738	4
6172	62	3748	0.5
6173	62	3767	2
6174	62	3769	1.5
6175	62	3779	3
6176	62	3784	2.5
6177	62	3788	5
6178	62	3796	4
6179	62	3803	3.5
6180	62	3804	3
6181	62	3807	3
6182	62	3812	2
6183	62	3813	0.5
6184	62	3816	3
6185	62	3818	0.5
6186	62	3820	0.5
6187	62	3831	1
6188	62	3856	3
6189	62	3860	2.5
6190	62	3870	4
6191	62	3874	4
6192	62	3875	0.5
6193	62	3886	1
6194	62	3888	4
6195	62	3899	2
6196	62	3900	3.5
6197	62	3904	4
6198	62	3915	2.5
6199	62	3925	1
6200	62	3929	0.5
6201	62	3959	0.5
6202	62	3966	1
6203	62	3986	0.5
6204	62	3998	2
6205	62	3999	3.5
6206	62	4009	0.5
6207	62	4033	1.5
6208	62	4034	3
6209	62	4056	0.5
6210	62	4061	3.5
6211	62	4062	3
6212	62	4075	2
6213	62	4080	2.5
6214	62	4109	3.5
6215	62	4118	1
6216	62	4127	3.5
6217	62	4135	3.5
6218	62	4173	2.5
6219	62	4177	1
6220	62	4184	1.5
6221	62	4188	5
6222	62	4200	0.5
6223	62	4213	3.5
6224	62	4216	2
6225	62	4217	0.5
6226	62	4224	0.5
6227	62	4228	3.5
6228	62	4240	2
6229	62	4256	1
6230	62	4258	2
6231	62	4278	3
6232	62	4279	4
6233	62	4286	3.5
6234	62	4313	2
6235	62	4316	4
6236	62	4319	2
6237	62	4320	2.5
6238	62	4367	1
6239	62	4368	2.5
6240	62	4382	0.5
6241	62	4383	2.5
6242	62	4386	1.5
6243	62	4408	3
6244	62	4424	2
6245	62	4434	2
6246	62	4435	5
6247	62	4436	1.5
6248	62	4450	1.5
6249	62	4453	4
6250	62	4458	1.5
6251	62	4459	3
6252	62	4461	3
6253	62	4466	1.5
6254	62	4471	0.5
6255	62	4485	3.5
6256	62	4487	0.5
6257	62	4496	4
6258	62	4504	4
6259	62	4521	0.5
6260	62	4523	2
6261	62	4562	2.5
6262	62	4567	0.5
6263	62	4583	3
6264	62	4597	4
6265	62	4600	2
6266	62	4642	1.5
6267	62	4643	3.5
6268	62	4646	0.5
6269	62	4661	0.5
6270	62	4681	3.5
6271	62	4697	1.5
6272	62	4702	0.5
6273	62	4706	2.5
6274	62	4779	5
6275	62	4780	0.5
6276	62	4785	2.5
6277	62	4801	3
6278	62	4803	0.5
6279	62	4804	1
6280	62	4807	0.5
6281	62	4832	0.5
6282	62	4850	1.5
6283	62	4878	2
6284	62	4906	4
6285	62	4907	3
6286	62	4909	3.5
6287	62	4930	3.5
6288	62	4935	2
6289	62	4936	3
6290	62	4957	0.5
6291	62	4958	0.5
6292	62	4960	2
6293	62	4998	0.5
6294	62	5003	4.5
6295	62	5005	4.5
6296	62	5037	3
6297	62	5039	1
6298	62	5042	2.5
6299	62	5043	3
6300	62	5048	3
6301	62	5052	4
6302	62	5054	3
6303	62	5068	1.5
6304	62	5090	0.5
6305	62	5106	3.5
6306	62	5124	3.5
6307	62	5175	0.5
6308	62	5188	4.5
6309	62	5202	3.5
6310	62	5203	2
6311	62	5207	1
6312	62	5213	3
6313	62	5215	4
6314	62	5221	1.5
6315	62	5269	0.5
6316	62	5274	0.5
6317	62	5289	0.5
6318	62	5303	2
6319	62	5306	3
6320	62	5323	2
6321	62	5328	4
6322	62	5329	5
6323	62	5337	3
6324	62	5349	1.5
6325	62	5365	4.5
6326	62	5370	3.5
6327	62	5374	2
6328	62	5376	1.5
6329	62	5377	3
6330	62	5562	2
6331	62	5618	2.5
6332	62	5619	2
6333	62	5627	2.5
6334	62	5652	3.5
6335	62	5677	3
6336	62	5678	4.5
6337	62	5720	2
6338	62	5726	3.5
6339	62	5729	1.5
6340	62	5730	3
6341	62	5733	2.5
6342	62	5744	0.5
6343	62	5793	3.5
6344	62	5794	3.5
6345	62	5802	3
6346	62	5809	0.5
6347	62	5812	1
6348	62	5816	2
6349	62	5830	3
6350	62	5839	3.5
6351	62	5853	5
6352	62	5854	0.5
6353	62	5867	0.5
6354	62	5873	2
6355	62	5874	3
6356	62	5875	3.5
6357	62	5876	4
6358	62	5880	2
6359	62	5881	3
6360	62	5882	1
6361	62	5883	3
6362	62	5891	3
6363	62	5892	3
6364	62	5894	3
6365	62	5896	3
6366	62	5899	2.5
6367	62	5900	0.5
6368	62	6173	0.5
6369	62	6226	4
6370	62	6238	2
6371	62	6239	0.5
6372	62	6248	3
6373	62	6261	3.5
6374	62	6284	0.5
6375	62	6296	4
6376	62	6301	4
6377	62	6322	0.5
6378	62	6346	3.5
6379	62	6347	1
6380	62	6349	3
6381	62	6355	1.5
6382	62	6370	5
6383	62	6390	4.5
6384	62	6394	4
6385	62	6395	0.5
6386	62	6408	4
6387	62	6411	3.5
6388	62	6414	4
6389	62	6415	3
6390	62	6417	4
6391	62	6423	1.5
6392	62	6424	3.5
6393	62	6488	1
6394	62	6491	3.5
6395	62	6518	0.5
6396	62	6540	0.5
6397	62	6563	5
6398	62	6595	3
6399	62	6606	0.5
6400	62	6616	3
6401	62	6620	3
6402	62	6622	0.5
6403	62	6628	0.5
6404	62	6631	2.5
6405	62	6632	3.5
6406	62	6635	1
6407	62	6642	4
6408	62	6650	0.5
6409	62	6663	3
6410	62	6671	0.5
6411	62	6673	2.5
6412	62	6687	3
6413	62	6690	2
6414	62	6692	1.5
6415	62	6714	3
6416	62	6724	1
6417	62	6727	3.5
6418	62	6744	3
6419	62	6757	4.5
6420	62	6765	3.5
6421	62	6768	3.5
6422	62	6787	3
6423	62	6802	1
6424	62	6811	3.5
6425	62	6822	2.5
6426	62	6827	0.5
6427	62	6828	3
6428	62	6887	3
6429	62	6889	0.5
6430	62	6890	2
6431	62	6909	1
6432	62	6933	3.5
6433	62	6937	3
6434	62	6938	0.5
6435	62	6942	0.5
6436	62	6946	4
6437	62	6948	3.5
6438	62	6950	4
6439	62	6967	3.5
6440	62	6973	3.5
6441	62	6979	0.5
6442	62	6989	1
6443	62	6991	4
6444	62	7015	2
6445	62	7018	3
6446	62	7019	2
6447	62	7020	1.5
6448	62	7040	1
6449	62	7056	3
6450	62	7058	3
6451	62	7061	4
6452	62	7080	1
6453	62	7082	2.5
6454	62	7085	4
6455	62	7086	2.5
6456	62	7095	4
6457	62	7117	1.5
6458	62	7136	1
6459	62	7139	3
6460	62	7142	2
6461	62	7151	3.5
6462	62	7155	3.5
6463	62	7157	4.5
6464	62	7161	4.5
6465	62	7179	4.5
6466	62	7187	0.5
6467	62	7203	3
6468	62	7228	5
6469	62	7241	0.5
6470	62	7248	3
6471	62	7288	3
6472	62	7292	3.5
6473	62	7301	4
6474	62	7307	4.5
6475	62	7333	0.5
6476	62	7334	4.5
6477	62	7349	0.5
6478	62	7363	0.5
6479	62	7376	3
6480	62	7378	3.5
6481	62	7383	2
6482	62	7386	3.5
6483	62	7398	2
6484	62	7403	1
6485	62	7405	3.5
6486	62	7418	2
6487	62	7421	3
6488	62	7423	2.5
6489	62	7429	0.5
6490	62	7435	2
6491	62	7442	3.5
6492	62	7446	3.5
6493	62	7453	0.5
6494	62	7466	3
6495	62	7480	2
6496	62	7485	4
6497	62	7501	3
6498	62	7507	3.5
6499	62	7538	3
6500	62	7542	3.5
6501	62	7543	0.5
6502	62	7549	3
6503	62	7573	2.5
6504	62	7576	2.5
6505	62	7588	3.5
6506	62	7589	3
6507	62	7607	4
6508	62	7620	3
6509	62	7636	2
6510	62	7666	0.5
6511	62	7670	4.5
6512	62	7689	3
6513	62	7715	3.5
6514	62	7719	3
6515	62	7758	3
6516	62	7762	0.5
6517	62	7798	5
6518	62	7820	3
6519	62	7827	3.5
6520	62	7832	5
6521	62	7844	3.5
6522	62	7857	3.5
6523	62	7860	3.5
6524	62	7889	3
6525	62	7901	4
6526	62	7902	0.5
6527	62	7911	4
6528	62	7914	2.5
6529	62	7917	2
6530	62	7934	0.5
6531	62	7951	3
6532	62	7952	3
6533	62	7957	4.5
6534	62	7997	1
6535	62	8011	4
6536	62	8032	2.5
6537	62	8035	0.5
6538	62	8048	2.5
6539	62	8065	3.5
6540	62	8068	1
6541	62	8076	2
6542	62	8086	4
6543	62	8093	2
6544	62	8110	4
6545	62	8120	1.5
6546	62	8128	0.5
6547	62	8130	3.5
6548	62	8132	3.5
6549	62	8150	1.5
6550	62	8151	0.5
6551	62	8165	3.5
6552	62	8170	0.5
6553	62	8184	4
6554	62	8235	3
6555	62	8243	0.5
6556	62	8248	0.5
6557	62	8249	3
6558	62	8263	3
6559	62	8264	3
6560	62	8309	1.5
6561	62	8315	2.5
6562	62	8327	3
6563	62	8405	3
6564	62	8408	3.5
6565	62	8460	3.5
6566	62	8467	1.5
6567	62	8511	4
6568	63	6	3
6569	63	10	2.5
6570	63	11	4
6571	63	15	3.5
6572	63	19	3
6573	63	21	2.5
6574	63	32	4
6575	63	45	4
6576	63	48	4.5
6577	63	88	2
6578	63	99	3
6579	63	123	3.5
6580	63	127	3.5
6581	63	130	3
6582	63	140	3.5
6583	63	142	3
6584	63	146	4
6585	63	149	1.5
6586	63	161	3
6587	63	167	3.5
6588	63	181	3.5
6589	63	203	2
6590	63	224	3.5
6591	63	231	4.5
6592	63	254	2
6593	63	258	2.5
6594	63	259	5
6595	63	261	3.5
6596	63	277	2.5
6597	63	278	4.5
6598	63	280	4
6599	63	290	2.5
6600	63	305	3.5
6601	63	310	3.5
6602	63	311	4.5
6603	63	317	4.5
6604	63	318	3.5
6605	63	324	3.5
6606	63	327	1.5
6607	63	328	3.5
6608	63	330	3
6609	63	334	2
6610	63	337	3.5
6611	63	340	3.5
6612	63	369	2.5
6613	63	380	3.5
6614	63	383	1.5
6615	63	390	2
6616	63	391	4
6617	63	403	4
6618	63	406	3
6619	63	414	2
6620	63	427	3
6621	63	431	3.5
6622	63	446	3
6623	63	454	3.5
6624	63	483	3.5
6625	63	485	4
6626	63	496	3
6627	63	520	2.5
6628	63	521	4
6629	63	522	3
6630	63	523	3.5
6631	63	524	4
6632	63	525	3.5
6633	63	526	3.5
6634	63	528	4
6635	63	530	4
6636	63	565	3.5
6637	63	620	3.5
6638	63	622	2.5
6639	63	626	2
6640	63	639	2.5
6641	63	645	4.5
6642	63	647	3.5
6643	63	650	4
6644	63	651	2
6645	63	653	3
6646	63	654	1.5
6647	63	662	4
6648	63	677	3
6649	63	681	3
6650	63	694	3.5
6651	63	696	3.5
6652	63	700	3.5
6653	63	724	4
6654	63	739	4.5
6655	63	742	4
6656	63	835	3.5
6657	63	836	4
6658	63	843	3.5
6659	63	844	4
6660	63	853	2.5
6661	63	864	3.5
6662	63	887	4
6663	63	888	4
6664	63	890	3.5
6665	63	891	3.5
6666	63	898	4
6667	63	917	3.5
6668	63	923	2
6669	63	947	3.5
6670	63	957	4
6671	63	959	5
6672	63	961	4
6673	63	963	4
6674	63	968	3.5
6675	63	970	3.5
6676	63	972	4
6677	63	975	4.5
6678	63	976	4
6679	63	982	3.5
6680	63	983	3
6681	63	984	4
6682	63	995	4
6683	63	1000	3.5
6684	63	1006	4.5
6685	63	1007	4
6686	63	1009	4
6687	63	1010	4
6688	63	1019	4.5
6689	63	1025	5
6690	63	1026	3.5
6691	63	1030	4
6692	63	1048	3
6693	63	1051	4
6694	63	1063	4.5
6695	63	1071	3
6696	63	1103	3.5
6697	63	1112	3.5
6698	63	1115	3
6699	63	1116	3.5
6700	63	1125	2
6701	63	1127	4.5
6702	63	1131	2
6703	63	1133	3
6704	63	1136	3.5
6705	63	1144	4
6706	63	1167	1
6707	63	1196	3.5
6708	63	1203	2.5
6709	63	1233	4
6710	63	1250	4
6711	63	1253	1
6712	63	1254	2.5
6713	63	1260	3.5
6714	63	1261	2
6715	63	1265	4
6716	63	1267	3.5
6717	63	1270	4
6718	63	1278	4
6719	63	1288	4
6720	63	1290	4
6721	63	1295	3.5
6722	63	1298	3.5
6723	63	1311	3.5
6724	63	1314	2
6725	63	1315	3
6726	63	1322	5
6727	63	1337	4.5
6728	63	1340	4.5
6729	63	1344	4
6730	63	1348	4
6731	63	1361	5
6732	63	1366	2.5
6733	63	1368	2.5
6734	63	1369	3
6735	63	1370	4.5
6736	63	1375	4
6737	63	1381	4
6738	63	1382	3.5
6739	63	1397	3.5
6740	63	1399	4
6741	63	1400	4
6742	63	1412	3.5
6743	63	1414	2
6744	63	1446	2
6745	63	1456	4
6746	63	1489	2
6747	63	1490	2
6748	63	1494	3
6749	63	1521	4.5
6750	63	1528	4.5
6751	63	1535	4.5
6752	63	1564	3.5
6753	63	1565	3.5
6754	63	1566	2
6755	63	1570	3
6756	63	1574	3.5
6757	63	1575	4
6758	63	1586	3
6759	63	1591	3.5
6760	63	1612	3.5
6761	63	1619	2
6762	63	1645	3
6763	63	1675	4
6764	63	1723	3
6765	63	1749	4.5
6766	63	1770	5
6767	63	1771	4
6768	63	1796	4.5
6769	63	1800	3
6770	63	1803	4
6771	63	1814	3.5
6772	63	1840	4
6773	63	1844	4
6774	63	1848	3.5
6775	63	1854	3
6776	63	1865	2
6777	63	1867	3
6778	63	1888	3
6779	63	1891	2.5
6780	63	1892	2.5
6781	63	1893	2
6782	63	1894	2
6783	63	1895	1
6784	63	1904	4
6785	63	1906	4
6786	63	1912	2
6787	63	1913	4.5
6788	63	1914	2.5
6789	63	1919	3.5
6790	63	1920	3
6791	63	1921	3.5
6792	63	1922	1.5
6793	63	1930	4.5
6794	63	1934	3
6795	63	1937	3
6796	63	1956	3.5
6797	63	1976	3
6798	63	1980	4
6799	63	1989	3
6800	63	2002	4
6801	63	2004	3.5
6802	63	2022	5
6803	63	2033	2.5
6804	63	2034	3
6805	63	2057	5
6806	63	2058	1.5
6807	63	2079	4
6808	63	2091	2
6809	63	2099	1
6810	63	2108	3
6811	63	2109	3
6812	63	2111	2.5
6813	63	2147	3
6814	63	2151	4
6815	63	2159	3.5
6816	63	2160	1
6817	63	2163	4
6818	63	2167	2
6819	63	2169	3.5
6820	63	2172	4
6821	63	2173	3.5
6822	63	2210	4.5
6823	63	2211	2.5
6824	63	2233	3.5
6825	63	2237	3.5
6826	63	2245	4
6827	63	2282	4
6828	63	2285	3.5
6829	63	2286	2.5
6830	63	2304	3
6831	63	2313	3
6832	63	2327	4.5
6833	63	2329	3.5
6834	63	2330	3
6835	63	2358	4
6836	63	2359	3
6837	63	2360	3.5
6838	63	2361	4
6839	63	2366	5
6840	63	2387	4.5
6841	63	2389	3.5
6842	63	2391	3.5
6843	63	2392	3.5
6844	63	2393	3.5
6845	63	2395	3
6846	63	2398	2
6847	63	2424	4
6848	63	2442	3.5
6849	63	2467	3
6850	63	2484	3.5
6851	63	2520	3.5
6852	63	2537	4.5
6853	63	2542	3
6854	63	2554	3
6855	63	2558	4
6856	63	2588	4
6857	63	2593	3.5
6858	63	2594	3
6859	63	2598	4
6860	63	2604	4
6861	63	2605	2.5
6862	63	2614	2
6863	63	2616	4.5
6864	63	2628	4
6865	63	2629	2
6866	63	2661	3.5
6867	63	2704	3.5
6868	63	2711	3.5
6869	63	2740	5
6870	63	2744	2.5
6871	63	2766	3.5
6872	63	2790	4
6873	63	2800	2.5
6874	63	2819	4
6875	63	2822	3.5
6876	63	2837	3.5
6877	63	2860	3.5
6878	63	2863	3.5
6879	63	2869	2.5
6880	63	2874	4
6881	63	2876	3
6882	63	2877	3.5
6883	63	2878	3
6884	63	2911	4
6885	63	2938	4
6886	63	2953	4.5
6887	63	2962	3.5
6888	63	2966	2
6889	63	2967	3.5
6890	63	2969	2
6891	63	2992	4
6892	63	3000	3.5
6893	63	3003	2.5
6894	63	3024	1.5
6895	63	3026	2.5
6896	63	3064	4
6897	63	3069	2.5
6898	63	3073	3
6899	63	3087	3.5
6900	63	3106	3.5
6901	63	3108	3
6902	63	3109	4.5
6903	63	3110	4.5
6904	63	3126	2.5
6905	63	3132	2
6906	63	3134	1.5
6907	63	3135	4
6908	63	3136	3.5
6909	63	3139	3.5
6910	63	3143	3
6911	63	3149	4
6912	63	3152	3
6913	63	3157	3
6914	63	3159	4
6915	63	3163	3
6916	63	3166	2
6917	63	3169	3
6918	63	3173	2.5
6919	63	3176	1.5
6920	63	3177	3
6921	63	3184	3
6922	63	3201	3.5
6923	63	3211	2.5
6924	63	3218	3.5
6925	63	3248	3
6926	63	3266	3
6927	63	3277	2.5
6928	63	3320	4
6929	63	3321	3.5
6930	63	3323	3.5
6931	63	3324	3.5
6932	63	3332	3.5
6933	63	3333	3.5
6934	63	3337	2
6935	63	3338	4
6936	63	3345	4
6937	63	3347	0.5
6938	63	3375	4
6939	63	3380	3
6940	63	3383	1
6941	63	3405	2
6942	63	3406	1.5
6943	63	3422	3
6944	63	3424	4
6945	63	3425	3
6946	63	3427	3.5
6947	63	3435	2.5
6948	63	3436	3
6949	63	3438	3
6950	63	3482	2.5
6951	63	3489	4
6952	63	3542	2.5
6953	63	3633	3
6954	63	3638	3.5
6955	63	3661	3
6956	63	3682	3
6957	63	3683	1.5
6958	63	3696	2.5
6959	63	3698	2.5
6960	63	3709	3.5
6961	63	3710	1
6962	63	3738	4
6963	63	3769	4
6964	63	3788	3
6965	63	3792	3.5
6966	63	3797	4
6967	63	3804	4
6968	63	3807	3
6969	63	3813	1
6970	63	3815	2
6971	63	3816	3
6972	63	3818	3.5
6973	63	3822	4.5
6974	63	3856	3.5
6975	63	3860	3.5
6976	63	3868	5
6977	63	3869	3.5
6978	63	3870	4
6979	63	3885	1
6980	63	3886	4
6981	63	3888	4
6982	63	3900	4
6983	63	3904	3
6984	63	3912	3.5
6985	63	3924	3
6986	63	3938	4
6987	63	3939	1.5
6988	63	3956	1
6989	63	3957	3.5
6990	63	3969	3.5
6991	63	3998	3
6992	63	3999	3.5
6993	63	4009	3.5
6994	63	4034	4
6995	63	4035	2
6996	63	4056	2.5
6997	63	4068	3
6998	63	4074	4
6999	63	4080	3.5
7000	63	4089	2.5
7001	63	4090	2.5
7002	63	4107	2.5
7003	63	4109	4
7004	63	4126	3
7005	63	4127	2.5
7006	63	4135	2.5
7007	63	4145	3.5
7008	63	4151	3.5
7009	63	4154	5
7010	63	4155	3.5
7011	63	4156	3.5
7012	63	4173	4
7013	63	4177	2
7014	63	4184	1
7015	63	4188	3.5
7016	63	4198	3.5
7017	63	4200	2.5
7018	63	4213	3.5
7019	63	4217	1.5
7020	63	4223	1.5
7021	63	4228	3.5
7022	63	4229	2
7023	63	4237	3
7024	63	4257	4.5
7025	63	4278	3.5
7026	63	4282	1.5
7027	63	4310	2.5
7028	63	4313	4
7029	63	4316	3.5
7030	63	4318	2.5
7031	63	4319	4
7032	63	4368	3
7033	63	4370	3
7034	63	4378	2.5
7035	63	4382	3
7036	63	4383	4.5
7037	63	4386	2.5
7038	63	4416	2.5
7039	63	4424	3
7040	63	4436	4
7041	63	4450	3
7042	63	4452	2
7043	63	4453	3
7044	63	4458	3.5
7045	63	4459	4
7046	63	4461	3
7047	63	4462	2
7048	63	4463	3.5
7049	63	4485	3.5
7050	63	4498	1.5
7051	63	4501	3.5
7052	63	4502	1.5
7053	63	4503	1.5
7054	63	4504	3
7055	63	4523	3
7056	63	4560	2
7057	63	4561	1.5
7058	63	4562	3
7059	63	4580	3
7060	63	4582	4
7061	63	4583	4.5
7062	63	4595	2.5
7063	63	4596	3
7064	63	4597	4.5
7065	63	4600	3
7066	63	4604	2
7067	63	4630	4
7068	63	4631	1.5
7069	63	4641	3
7070	63	4642	2
7071	63	4646	2.5
7072	63	4651	2.5
7073	63	4655	1.5
7074	63	4672	3.5
7075	63	4673	2.5
7076	63	4681	3.5
7077	63	4697	4
7078	63	4702	2
7079	63	4706	4
7080	63	4710	2.5
7081	63	4770	3
7082	63	4779	4
7083	63	4780	4
7084	63	4798	2
7085	63	4801	3
7086	63	4803	4.5
7087	63	4804	2.5
7088	63	4807	1
7089	63	4817	2.5
7090	63	4820	3.5
7091	63	4833	1.5
7092	63	4837	2.5
7093	63	4838	1.5
7094	63	4839	3.5
7095	63	4852	4
7096	63	4854	2
7097	63	4858	2.5
7098	63	4880	4
7099	63	4896	2.5
7100	63	4897	2.5
7101	63	4906	4
7102	63	4907	3
7103	63	4909	4.5
7104	63	4935	4
7105	63	4940	3.5
7106	63	4960	3.5
7107	63	5003	4
7108	63	5005	4
7109	63	5007	3.5
7110	63	5016	2
7111	63	5019	4
7112	63	5037	4
7113	63	5042	4
7114	63	5046	3
7115	63	5052	3.5
7116	63	5054	5
7117	63	5068	4.5
7118	63	5090	1
7119	63	5093	2.5
7120	63	5106	4.5
7121	63	5199	3.5
7122	63	5201	2.5
7123	63	5203	2.5
7124	63	5207	3.5
7125	63	5208	3.5
7126	63	5212	4
7127	63	5213	3.5
7128	63	5215	3
7129	63	5216	2
7130	63	5221	3
7131	63	5222	1
7132	63	5269	4
7133	63	5276	3.5
7134	63	5289	3
7135	63	5305	3
7136	63	5312	2.5
7137	63	5321	1
7138	63	5328	3.5
7139	63	5329	4.5
7140	63	5333	3
7141	63	5334	3
7142	63	5339	3.5
7143	63	5340	1.5
7144	63	5342	2.5
7145	63	5344	0.5
7146	63	5365	3.5
7147	63	5369	3.5
7148	63	5370	4.5
7149	63	5373	2
7150	63	5374	4.5
7151	63	5376	1.5
7152	63	5377	3
7153	63	5380	2
7154	63	5391	3.5
7155	63	5394	3.5
7156	63	5401	3
7157	63	5402	3.5
7158	63	5404	3
7159	63	5424	3
7160	63	5616	4.5
7161	63	5618	2.5
7162	63	5619	2.5
7163	63	5624	3
7164	63	5625	0.5
7165	63	5627	3.5
7166	63	5629	3
7167	63	5630	4.5
7168	63	5652	4
7169	63	5677	2.5
7170	63	5678	4
7171	63	5680	1
7172	63	5682	2
7173	63	5719	3.5
7174	63	5726	2.5
7175	63	5729	3
7176	63	5733	3
7177	63	5743	4
7178	63	5744	0.5
7179	63	5793	2.5
7180	63	5795	4.5
7181	63	5802	3.5
7182	63	5806	4
7183	63	5807	1.5
7184	63	5827	1
7185	63	5828	3
7186	63	5831	3.5
7187	63	5834	3.5
7188	63	5839	4
7189	63	5852	2.5
7190	63	5853	4
7191	63	5859	4.5
7192	63	5860	2.5
7193	63	5868	4.5
7194	63	5875	4.5
7195	63	5880	4
7196	63	5883	3
7197	63	5886	3
7198	63	5889	2.5
7199	63	5891	1
7200	63	5894	3.5
7201	63	5896	3.5
7202	63	5899	2.5
7203	63	5900	3
7204	63	6275	2.5
7205	63	6295	1.5
7206	63	6299	4.5
7207	63	6340	4.5
7208	63	6343	4
7209	63	6357	1
7210	63	6370	2.5
7211	63	6376	2.5
7212	63	6381	4
7213	63	6390	4
7214	63	6408	3
7215	63	6411	5
7216	63	6415	2.5
7217	63	6417	1.5
7218	63	6418	2.5
7219	63	6423	2
7220	63	6440	4
7221	63	6448	2
7222	63	6463	3
7223	63	6488	3
7224	63	6491	3
7225	63	6498	3.5
7226	63	6499	3.5
7227	63	6517	1
7228	63	6521	1
7229	63	6536	3.5
7230	63	6541	2
7231	63	6563	4.5
7232	63	6565	1.5
7233	63	6593	2.5
7234	63	6603	1
7235	63	6604	3.5
7236	63	6606	3.5
7237	63	6620	2.5
7238	63	6631	3
7239	63	6632	3
7240	63	6633	4
7241	63	6635	1
7242	63	6642	4
7243	63	6647	2
7244	63	6650	2
7245	63	6663	2.5
7246	63	6671	3
7247	63	6673	3
7248	63	6679	3
7249	63	6685	1
7250	63	6691	4.5
7251	63	6694	2
7252	63	6697	2
7253	63	6714	3.5
7254	63	6720	2
7255	63	6723	4
7256	63	6724	3
7257	63	6727	3.5
7258	63	6742	2.5
7259	63	6745	3
7260	63	6747	2
7261	63	6754	1
7262	63	6756	4
7263	63	6757	4.5
7264	63	6763	2.5
7265	63	6768	3.5
7266	63	6787	4.5
7267	63	6788	2.5
7268	63	6800	2.5
7269	63	6801	3
7270	63	6810	2
7271	63	6811	4.5
7272	63	6820	4
7273	63	6821	1
7274	63	6828	4.5
7275	63	6843	2.5
7276	63	6848	3.5
7277	63	6849	4.5
7278	63	6865	3.5
7279	63	6872	3.5
7280	63	6889	0.5
7281	63	6890	3
7282	63	6896	2
7283	63	6905	3
7284	63	6923	3.5
7285	63	6932	2
7286	63	6933	2.5
7287	63	6934	0.5
7288	63	6937	3.5
7289	63	6941	1.5
7290	63	6946	3.5
7291	63	6947	3.5
7292	63	6950	3.5
7293	63	6955	3.5
7294	63	6959	5
7295	63	6967	4
7296	63	6972	1
7297	63	6973	3
7298	63	6974	4
7299	63	6985	4
7300	63	6991	4
7301	63	6996	2.5
7302	63	7006	3.5
7303	63	7008	2
7304	63	7009	1.5
7305	63	7018	3.5
7306	63	7019	3.5
7307	63	7033	1.5
7308	63	7035	3.5
7309	63	7036	1.5
7310	63	7037	2.5
7311	63	7038	4
7312	63	7040	3.5
7313	63	7045	2.5
7314	63	7053	2.5
7315	63	7056	3
7316	63	7066	3.5
7317	63	7084	2
7318	63	7085	4
7319	63	7086	2
7320	63	7095	4.5
7321	63	7096	3.5
7322	63	7112	3.5
7323	63	7136	4.5
7324	63	7139	2.5
7325	63	7142	2
7326	63	7155	2.5
7327	63	7158	2.5
7328	63	7161	3.5
7329	63	7170	1.5
7330	63	7177	3
7331	63	7179	4.5
7332	63	7180	5
7333	63	7185	2
7334	63	7190	4.5
7335	63	7194	2.5
7336	63	7200	4
7337	63	7203	2.5
7338	63	7205	3.5
7339	63	7217	2.5
7340	63	7219	4
7341	63	7222	3.5
7342	63	7227	3.5
7343	63	7229	4
7344	63	7233	2
7345	63	7245	1
7346	63	7248	3.5
7347	63	7263	2.5
7348	63	7265	1.5
7349	63	7271	3
7350	63	7273	4.5
7351	63	7283	0.5
7352	63	7284	4.5
7353	63	7287	4
7354	63	7288	3.5
7355	63	7292	4
7356	63	7297	3
7357	63	7301	3
7358	63	7302	1
7359	63	7307	3.5
7360	63	7322	4
7361	63	7323	3.5
7362	63	7332	3.5
7363	63	7333	2
7364	63	7334	3.5
7365	63	7339	3
7366	63	7347	2
7367	63	7362	1.5
7368	63	7363	1.5
7369	63	7373	3.5
7370	63	7376	3
7371	63	7378	3.5
7372	63	7380	1.5
7373	63	7383	3
7374	63	7385	1
7375	63	7387	4
7376	63	7395	1.5
7377	63	7397	4.5
7378	63	7398	2
7379	63	7399	2
7380	63	7405	3
7381	63	7406	3
7382	63	7421	2
7383	63	7422	2
7384	63	7423	3.5
7385	63	7425	1
7386	63	7433	4
7387	63	7435	3.5
7388	63	7436	1
7389	63	7437	3
7390	63	7438	4
7391	63	7439	3.5
7392	63	7446	3.5
7393	63	7450	1
7394	63	7451	3
7395	63	7454	2
7396	63	7457	4
7397	63	7458	3
7398	63	7459	3.5
7399	63	7468	4
7400	63	7471	3.5
7401	63	7472	2.5
7402	63	7473	3.5
7403	63	7476	2.5
7404	63	7485	4
7405	63	7488	3.5
7406	63	7491	2
7407	63	7493	1.5
7408	63	7494	4.5
7409	63	7498	2
7410	63	7499	3.5
7411	63	7502	3.5
7412	63	7504	4
7413	63	7506	2
7414	63	7508	4
7415	63	7510	4
7416	63	7511	4
7417	63	7512	3
7418	63	7528	2
7419	63	7529	2.5
7420	63	7538	3.5
7421	63	7540	3.5
7422	63	7542	4.5
7423	63	7547	5
7424	63	7548	4.5
7425	63	7549	2.5
7426	63	7551	1.5
7427	63	7552	3.5
7428	63	7558	4.5
7429	63	7559	2.5
7430	63	7560	2.5
7431	63	7564	2.5
7432	63	7565	2.5
7433	63	7573	4
7434	63	7579	2.5
7435	63	7588	3
7436	63	7589	4
7437	63	7593	2.5
7438	63	7596	3
7439	63	7597	3
7440	63	7599	0.5
7441	63	7607	3.5
7442	63	7609	2.5
7443	63	7615	2.5
7444	63	7616	1
7445	63	7621	4
7446	63	7631	3
7447	63	7633	4
7448	63	7636	2
7449	63	7641	3.5
7450	63	7642	1
7451	63	7649	3
7452	63	7650	1.5
7453	63	7652	2
7454	63	7655	1.5
7455	63	7660	3.5
7456	63	7670	4
7457	63	7673	2.5
7458	63	7689	2
7459	63	7691	0.5
7460	63	7692	3.5
7461	63	7694	3.5
7462	63	7696	3
7463	63	7703	4
7464	63	7715	2.5
7465	63	7716	3
7466	63	7717	3.5
7467	63	7719	5
7468	63	7721	3.5
7469	63	7724	1
7470	63	7731	4
7471	63	7733	1
7472	63	7740	3.5
7473	63	7742	2.5
7474	63	7747	4
7475	63	7757	1.5
7476	63	7758	1.5
7477	63	7761	3.5
7478	63	7762	2.5
7479	63	7763	2
7480	63	7765	2.5
7481	63	7773	3.5
7482	63	7780	1
7483	63	7796	3.5
7484	63	7797	3.5
7485	63	7798	4
7486	63	7799	3.5
7487	63	7801	3.5
7488	63	7802	1
7489	63	7804	3
7490	63	7808	2.5
7491	63	7811	1
7492	63	7815	4
7493	63	7816	4
7494	63	7820	3.5
7495	63	7824	3.5
7496	63	7827	4.5
7497	63	7832	4.5
7498	63	7834	2.5
7499	63	7835	2
7500	63	7844	2
7501	63	7847	4
7502	63	7849	1.5
7503	63	7857	4
7504	63	7870	1
7505	63	7876	1.5
7506	63	7880	2
7507	63	7884	4
7508	63	7885	3.5
7509	63	7888	3.5
7510	63	7889	3.5
7511	63	7890	4
7512	63	7891	2.5
7513	63	7907	2.5
7514	63	7911	4
7515	63	7912	3.5
7516	63	7913	3
7517	63	7914	3.5
7518	63	7915	2.5
7519	63	7917	3
7520	63	7922	4.5
7521	63	7923	2
7522	63	7924	3
7523	63	7932	3.5
7524	63	7934	4
7525	63	7936	4
7526	63	7946	2.5
7527	63	7951	3.5
7528	63	7952	3.5
7529	63	7953	4
7530	63	7954	4
7531	63	7956	3
7532	63	7957	4
7533	63	7959	2
7534	63	7961	2.5
7535	63	7975	3.5
7536	63	7977	0.5
7537	63	7989	1
7538	63	7995	2
7539	63	7999	1.5
7540	63	8015	3.5
7541	63	8016	3.5
7542	63	8030	4.5
7543	63	8045	1
7544	63	8048	2.5
7545	63	8051	2.5
7546	63	8052	1
7547	63	8058	2
7548	63	8063	4
7549	63	8066	3.5
7550	63	8068	4
7551	63	8070	2.5
7552	63	8071	1.5
7553	63	8077	2
7554	63	8085	3.5
7555	63	8086	3.5
7556	63	8087	4
7557	63	8089	2.5
7558	63	8090	4
7559	63	8092	2
7560	63	8093	2
7561	63	8094	4
7562	63	8096	4.5
7563	63	8106	3.5
7564	63	8107	4.5
7565	63	8110	3.5
7566	63	8114	3
7567	63	8119	2
7568	63	8121	2.5
7569	63	8130	4
7570	63	8131	3.5
7571	63	8132	1.5
7572	63	8136	1
7573	63	8138	3.5
7574	63	8148	4
7575	63	8151	2.5
7576	63	8155	4
7577	63	8156	1
7578	63	8158	1.5
7579	63	8163	4.5
7580	63	8181	1.5
7581	63	8184	4.5
7582	63	8188	1
7583	63	8201	4
7584	63	8203	2
7585	63	8224	2.5
7586	63	8231	2.5
7587	63	8233	4
7588	63	8239	4.5
7589	63	8241	3.5
7590	63	8242	3.5
7591	63	8254	3
7592	63	8263	4
7593	63	8264	4.5
7594	63	8270	3.5
7595	63	8278	1.5
7596	63	8280	2
7597	63	8286	2.5
7598	63	8291	3.5
7599	63	8295	2
7600	63	8298	2.5
7601	63	8300	4
7602	63	8306	2
7603	63	8309	1
7604	63	8315	2.5
7605	63	8316	2.5
7606	63	8317	4
7607	63	8327	3.5
7608	63	8329	3
7609	63	8349	4
7610	63	8351	4
7611	63	8354	3.5
7612	63	8355	2
7613	63	8365	2.5
7614	63	8370	3.5
7615	63	8374	3.5
7616	63	8375	4
7617	63	8409	1.5
7618	63	8413	2.5
7619	63	8422	4
7620	63	8428	1
7621	63	8430	4
7622	63	8442	3
7623	63	8444	1
7624	63	8453	3.5
7625	63	8486	3
7626	63	8500	4.5
7627	63	8504	4
7628	63	8543	1.5
7629	63	8553	3.5
7630	63	8558	4
7631	63	8581	1
7632	63	8582	3.5
7633	63	8598	2
7634	63	8604	3
7635	63	8611	3
7636	63	8616	2
7637	63	8630	4.5
7638	63	8631	1.5
7639	63	8633	2
7640	63	8636	4
7641	63	8637	1
7642	63	8639	1
7643	63	8661	1
7644	63	8662	5
7645	63	8685	3.5
7646	63	8690	4
7647	63	8703	4.5
7648	63	8704	3
7649	63	8705	4.5
7650	63	8721	2
7651	63	8729	4.5
7652	63	8746	3.5
7653	63	8760	4
7654	63	8762	5
7655	63	8763	4.5
7656	63	8770	1.5
7657	63	8773	3.5
7658	63	8779	4.5
7659	63	8782	4.5
7660	63	8787	3
7661	63	8797	1
7662	63	8804	2.5
7663	63	8805	4.5
7664	63	8819	1
7665	63	8865	3.5
7666	63	8868	1.5
7667	63	8902	2
7668	63	8906	4
7669	63	8910	3.5
7670	63	8959	5
7671	63	8960	4.5
7672	63	8963	4.5
7673	63	9005	2.5
7674	63	9006	3.5
7675	64	278	0.5
7676	64	305	0.5
7677	64	327	0.5
7678	64	337	3.5
7679	64	446	3
7680	64	475	4.5
7681	64	521	4
7682	64	522	5
7683	64	523	0.5
7684	64	647	1.5
7685	64	761	1
7686	64	1123	3
7687	64	1162	0.5
7688	64	1224	3.5
7689	64	1239	3.5
7690	64	1261	3
7691	64	1269	1.5
7692	64	1314	2
7693	64	1341	0.5
7694	64	1368	3
7695	64	1494	3.5
7696	64	1694	2
7697	64	1907	5
7698	64	1989	4.5
7699	64	2136	2
7700	64	2175	4.5
7701	64	2210	4
7702	64	2528	2
7703	64	2869	2
7704	64	3173	1
7705	64	3634	3.5
7706	64	3818	5
7707	64	3860	4.5
7708	64	3888	1.5
7709	64	4109	3.5
7710	64	4154	3.5
7711	64	4705	5
7712	64	5207	3.5
7713	64	5372	1.5
7714	64	5618	1.5
7715	64	5620	3.5
7716	64	5624	3.5
7717	64	5726	2
7718	64	5743	3
7719	64	5883	4.5
7720	64	6464	0.5
7721	64	6946	3
7722	64	7019	2.5
7723	64	7036	4.5
7724	64	7155	3
7725	64	7157	4.5
7726	64	7180	2.5
7727	64	7435	0.5
7728	65	6	4
7729	65	22	4
7730	65	45	4
7731	65	99	5
7732	65	100	4
7733	65	121	3
7734	65	123	4
7735	65	130	3
7736	65	138	4
7737	65	161	3
7738	65	197	3
7739	65	202	4
7740	65	203	3
7741	65	224	4
7742	65	227	3
7743	65	236	5
7744	65	243	3
7745	65	247	4
7746	65	254	2
7747	65	258	4
7748	65	280	5
7749	65	300	3
7750	65	305	1
7751	65	311	4
7752	65	314	3
7753	65	316	2
7754	65	317	4
7755	65	337	4
7756	65	369	2
7757	65	383	3
7758	65	391	3
7759	65	403	4
7760	65	406	5
7761	65	427	4
7762	65	446	3
7763	65	454	4
7764	65	472	4
7765	65	483	3
7766	65	497	3
7767	65	520	3
7768	65	521	4
7769	65	523	3
7770	65	524	5
7771	65	525	3
7772	65	526	5
7773	66	17	4
7774	66	19	1
7775	66	29	2
7776	66	32	4
7777	66	34	3
7778	66	37	4
7779	66	43	4
7780	66	59	2
7781	66	64	2
7782	66	95	3
7783	66	110	4
7784	66	112	4
7785	66	121	2
7786	66	127	3
7787	66	143	1
7788	66	156	4
7789	66	176	3
7790	66	195	4
7791	66	203	1
7792	66	207	4
7793	66	209	2
7794	66	219	1
7795	66	224	2
7796	66	231	3
7797	66	235	4
7798	66	245	1
7799	66	261	4
7800	66	279	2
7801	66	294	3
7802	66	298	4
7803	66	300	2
7804	66	305	1
7805	66	312	2
7806	66	316	2
7807	66	317	3
7808	66	318	3
7809	66	321	2
7810	66	324	3
7811	66	327	2
7812	66	332	4
7813	66	337	2
7814	66	340	2
7815	66	362	3
7816	66	364	2
7817	66	378	3
7818	66	381	2
7819	66	384	1
7820	66	389	3
7821	66	403	2
7822	66	419	2
7823	66	420	2
7824	66	425	3
7825	66	431	1
7826	66	443	3
7827	66	446	2
7828	66	450	2
7829	66	453	3
7830	66	472	5
7831	66	474	2
7832	66	476	2
7833	66	482	4
7834	66	487	2
7835	66	495	4
7836	66	497	1
7837	66	503	2
7838	66	513	4
7839	66	519	3
7840	66	520	1
7841	66	522	3
7842	66	523	1
7843	66	528	3
7844	66	535	2
7845	66	538	4
7846	66	552	3
7847	66	572	3
7848	66	580	3
7849	66	590	2
7850	66	595	3
7851	66	602	3
7852	66	614	4
7853	66	642	3
7854	66	651	3
7855	66	652	2
7856	66	662	3
7857	66	674	3
7858	66	677	3
7859	66	693	3
7860	66	716	3
7861	66	735	4
7862	66	829	3
7863	66	849	3
7864	66	862	3
7865	66	863	3
7866	66	895	3
7867	66	909	3
7868	66	934	2
7869	66	943	4
7870	66	955	3
7871	66	959	3
7872	66	961	3
7873	66	972	3
7874	66	975	4
7875	66	977	3
7876	66	1002	3
7877	66	1019	4
7878	66	1025	4
7879	66	1030	4
7880	66	1045	4
7881	66	1048	5
7882	66	1051	4
7883	66	1131	4
7884	66	1132	3
7885	66	1133	3
7886	66	1134	3
7887	66	1144	3
7888	66	1146	3
7889	66	1170	2
7890	66	1171	3
7891	66	1175	5
7892	66	1181	2
7893	66	1189	3
7894	66	1193	1
7895	66	1196	3
7896	66	1203	2
7897	66	1206	2
7898	66	1222	3
7899	66	1226	4
7900	66	1233	3
7901	66	1238	2
7902	66	1242	3
7903	66	1257	2
7904	66	1260	2
7905	66	1261	3
7906	66	1265	2
7907	66	1281	3
7908	66	1283	2
7909	66	1293	2
7910	66	1302	4
7911	66	1310	4
7912	66	1318	4
7913	66	1337	5
7914	66	1344	3
7915	66	1353	3
7916	66	1361	4
7917	66	1368	3
7918	66	1372	3
7919	66	1375	2
7920	66	1381	3
7921	66	1391	3
7922	66	1399	3
7923	66	1402	3
7924	66	1407	2
7925	66	1418	3
7926	66	1443	2
7927	66	1456	2
7928	66	1463	4
7929	66	1464	4
7930	66	1478	3
7931	66	1488	4
7932	66	1492	4
7933	66	1494	4
7934	66	1561	4
7935	66	1575	2
7936	66	1584	2
7937	66	1591	3
7938	66	1604	3
7939	66	1614	2
7940	66	1620	2
7941	66	1624	5
7942	66	1636	4
7943	66	1642	2
7944	66	1653	1
7945	66	1684	2
7946	66	1699	2
7947	66	1770	3
7948	66	1777	3
7949	66	1784	3
7950	66	1798	4
7951	66	1806	4
7952	66	1814	3
7953	66	1816	3
7954	66	1822	3
7955	66	1836	4
7956	66	1839	5
7957	66	1847	4
7958	66	1860	3
7959	66	1867	4
7960	66	1868	2
7961	66	1899	2
7962	66	1907	5
7963	66	1941	3
7964	66	1943	3
7965	66	1945	3
7966	66	1952	3
7967	66	1993	2
7968	66	1994	4
7969	66	1996	1
7970	66	2002	5
7971	66	2003	4
7972	66	2006	3
7973	66	2033	3
7974	66	2034	3
7975	66	2042	1
7976	66	2046	2
7977	66	2057	2
7978	66	2063	5
7979	66	2064	4
7980	66	2065	2
7981	66	2069	3
7982	66	2071	3
7983	66	2078	5
7984	66	2092	3
7985	66	2095	2
7986	66	2144	4
7987	66	2151	4
7988	66	2152	5
7989	66	2158	4
7990	66	2159	4
7991	66	2163	4
7992	66	2164	4
7993	66	2167	3
7994	66	2169	3
7995	66	2172	4
7996	66	2174	1
7997	66	2179	2
7998	66	2210	4
7999	66	2239	3
8000	66	2240	1
8001	66	2241	1
8002	66	2246	4
8003	66	2251	1
8004	66	2261	2
8005	66	2282	5
8006	66	2312	4
8007	66	2332	3
8008	66	2366	3
8009	66	2371	4
8010	66	2380	2
8011	66	2389	4
8012	66	2398	5
8013	66	2404	3
8014	66	2414	2
8015	66	2442	4
8016	66	2491	3
8017	66	2498	3
8018	66	2531	4
8019	66	2541	4
8020	66	2542	5
8021	66	2584	1
8022	66	2589	1
8023	66	2594	2
8024	66	2595	2
8025	66	2596	2
8026	66	2598	1
8027	66	2602	4
8028	66	2614	3
8029	66	2629	3
8030	66	2641	3
8031	66	2664	5
8032	66	2698	2
8033	66	2729	1
8034	66	2742	3
8035	66	2762	4
8036	66	2766	5
8037	66	2781	3
8038	66	2823	3
8039	66	2837	4
8040	66	2860	1
8041	66	2862	3
8042	66	2869	2
8043	66	2965	5
8044	66	2992	1
8045	66	3000	5
8046	66	3046	3
8047	66	3049	3
8048	66	3054	3
8049	66	3069	5
8050	66	3073	4
8051	66	3082	3
8052	66	3084	5
8053	66	3103	3
8054	66	3108	4
8055	66	3109	2
8056	66	3131	1
8057	66	3132	3
8058	66	3150	4
8059	66	3165	4
8060	66	3166	1
8061	66	3169	1
8062	66	3170	4
8063	66	3171	4
8064	66	3184	4
8065	66	3210	1
8066	66	3323	5
8067	66	3328	1
8068	66	3333	4
8069	66	3337	4
8070	66	3378	4
8071	66	3380	5
8072	66	3382	4
8073	66	3383	3
8074	66	3425	2
8075	66	3482	3
8076	66	3636	4
8077	66	3638	3
8078	66	3641	4
8079	66	3683	2
8080	66	3696	4
8081	66	3713	4
8082	66	3736	4
8083	66	3788	4
8084	66	3810	3
8085	66	3812	5
8086	66	3816	1
8087	66	3818	4
8088	66	3868	5
8089	66	3874	5
8090	66	3886	4
8091	66	3902	4
8092	66	3911	1
8093	66	4037	4
8094	66	4040	4
8095	66	4061	3
8096	66	4080	3
8097	66	4095	1
8098	66	4109	5
8099	66	4126	4
8100	66	4127	3
8101	66	4135	5
8102	66	4145	1
8103	66	4152	4
8104	66	4173	4
8105	66	4179	2
8106	66	4184	3
8107	66	4185	3
8108	66	4196	4
8109	66	4200	3
8110	66	4213	4
8111	66	4215	4
8112	66	4225	4
8113	66	4228	4
8114	66	4231	3
8115	66	4279	5
8116	66	4281	3
8117	66	4313	5
8118	66	4316	5
8119	66	4386	4
8120	66	4395	4
8121	66	4435	5
8122	66	4458	3
8123	66	4461	4
8124	66	4473	5
8125	66	4485	5
8126	67	19	2.5
8127	67	207	4.5
8128	67	384	3.5
8129	67	527	3
8130	67	631	5
8131	67	877	3
8132	67	1134	3.5
8133	67	1144	0.5
8134	67	1233	5
8135	67	1265	3
8136	67	1535	3.5
8137	67	1806	5
8138	67	2057	5
8139	67	2078	4.5
8140	67	2144	3.5
8141	67	2167	0.5
8142	67	2233	3.5
8143	67	2239	3
8144	67	2282	4
8145	67	2398	4
8146	67	2531	4.5
8147	67	3049	5
8148	67	3636	4.5
8149	67	4137	5
8150	67	4157	4
8151	67	4697	5
8152	68	17	5
8153	68	242	3
8154	68	298	5
8155	68	423	4
8156	68	454	4
8157	68	460	4
8158	68	472	5
8159	68	526	3
8160	68	848	5
8161	68	947	5
8162	68	1031	4
8163	68	1105	4
8164	68	1308	4
8165	68	1309	3
8166	68	1310	3
8167	68	1313	2
8168	68	1341	3
8169	68	1342	4
8170	68	1345	5
8171	68	1361	5
8172	68	1402	5
8173	68	1426	3
8174	68	1429	3
8175	68	1850	3
8176	68	1871	3
8177	69	1	4
8178	69	6	4.5
8179	69	11	3
8180	69	21	3.5
8181	69	32	5
8182	69	34	2.5
8183	69	45	5
8184	69	48	4.5
8185	69	88	3
8186	69	99	2
8187	69	100	5
8188	69	101	2
8189	69	112	3.5
8190	69	127	3
8191	69	128	3
8192	69	131	3.5
8193	69	207	4
8194	69	208	3
8195	69	220	3.5
8196	69	231	5
8197	69	251	3.5
8198	69	259	5
8199	69	261	5
8200	69	264	4
8201	69	280	4
8202	69	320	2
8203	69	330	1
8204	69	377	3
8205	69	381	1
8206	69	383	2
8207	69	391	5
8208	69	406	4
8209	69	414	2
8210	69	422	3
8211	69	426	2
8212	69	439	3
8213	69	449	0.5
8214	69	472	4
8215	69	474	4
8216	69	485	5
8217	69	495	3.5
8218	69	499	4
8219	69	523	4
8220	69	526	4.5
8221	69	529	3.5
8222	69	538	5
8223	69	560	2
8224	69	564	3
8225	69	580	2
8226	69	645	4
8227	69	649	2
8228	69	657	4.5
8229	69	677	2
8230	69	681	1.5
8231	69	696	5
8232	69	725	5
8233	69	726	4.5
8234	69	730	4
8235	69	734	5
8236	69	745	5
8237	69	789	3.5
8238	69	807	1
8239	69	813	1
8240	69	830	2
8241	69	844	4.5
8242	69	863	4
8243	69	877	4
8244	69	878	4
8245	69	887	4
8246	69	888	4
8247	69	900	4
8248	69	923	3.5
8249	69	925	5
8250	69	944	5
8251	69	957	4
8252	69	959	5
8253	69	960	4
8254	69	961	5
8255	69	963	5
8256	69	964	5
8257	69	966	3.5
8258	69	967	5
8259	69	968	4
8260	69	969	4
8261	69	970	5
8262	69	972	2
8263	69	975	5
8264	69	976	5
8265	69	977	3.5
8266	69	980	4.5
8267	69	981	4
8268	69	983	5
8269	69	984	5
8270	69	987	4
8271	69	990	4.5
8272	69	994	5
8273	69	995	4
8274	69	1000	4.5
8275	69	1002	3.5
8276	69	1007	4
8277	69	1009	5
8278	69	1010	4.5
8279	69	1012	5
8280	69	1018	4
8281	69	1019	4
8282	69	1022	5
8283	69	1023	4.5
8284	69	1025	4
8285	69	1026	4
8286	69	1027	4.5
8287	69	1030	4
8288	69	1032	4
8289	69	1035	5
8290	69	1038	3
8291	69	1043	4
8292	69	1047	5
8293	69	1048	4
8294	69	1051	3.5
8295	69	1058	4.5
8296	69	1061	4
8297	69	1063	4
8298	69	1072	3
8299	69	1074	0.5
8300	69	1110	2
8301	69	1116	4.5
8302	69	1127	4.5
8303	69	1203	3.5
8304	69	1206	1
8305	69	1210	1
8306	69	1215	4
8307	69	1233	5
8308	69	1244	3.5
8309	69	1279	2
8310	69	1290	4
8311	69	1295	2
8312	69	1296	4.5
8313	69	1310	3.5
8314	69	1330	3.5
8315	69	1367	5
8316	69	1369	4
8317	69	1375	4
8318	69	1379	1
8319	69	1384	2.5
8320	69	1435	4
8321	69	1485	4
8322	69	1489	2
8323	69	1494	4
8324	69	1512	4
8325	69	1520	4.5
8326	69	1521	5
8327	69	1564	3.5
8328	69	1573	4
8329	69	1575	1
8330	69	1591	3.5
8331	69	1615	2
8332	69	1626	4
8333	69	1669	3
8334	69	1686	2
8335	69	1741	5
8336	69	1749	5
8337	69	1770	3.5
8338	69	1777	4.5
8339	69	1836	4
8340	69	1844	3
8341	69	1878	3.5
8342	69	1879	1
8343	69	1895	0.5
8344	69	1898	1
8345	69	1916	3.5
8346	69	1920	1
8347	69	1971	3
8348	69	1976	3
8349	69	1980	3.5
8350	69	2032	2
8351	69	2045	1
8352	69	2057	5
8353	69	2078	3
8354	69	2090	1.5
8355	69	2151	4
8356	69	2159	3.5
8357	69	2172	3.5
8358	69	2184	4
8359	69	2210	4
8360	69	2230	4.5
8361	69	2233	4
8362	69	2256	0.5
8363	69	2257	0.5
8364	69	2282	4.5
8365	69	2294	3
8366	69	2313	3.5
8367	69	2328	4
8368	69	2332	4
8369	69	2355	4
8370	69	2358	5
8371	69	2359	5
8372	69	2360	5
8373	69	2362	4.5
8374	69	2366	5
8375	69	2395	5
8376	69	2398	5
8377	69	2423	3.5
8378	69	2425	3
8379	69	2430	3.5
8380	69	2433	0.5
8381	69	2450	3
8382	69	2472	5
8383	69	2487	4
8384	69	2497	3
8385	69	2521	3.5
8386	69	2534	2
8387	69	2568	4
8388	69	2599	2.5
8389	69	2606	4
8390	69	2608	3.5
8391	69	2609	1
8392	69	2668	4
8393	69	2669	4
8394	69	2687	1
8395	69	2693	3.5
8396	69	2702	3.5
8397	69	2713	4
8398	69	2730	0.5
8399	69	2744	3.5
8400	69	2754	4
8401	69	2783	5
8402	69	2787	4.5
8403	69	2800	5
8404	69	2819	4
8405	69	2833	1
8406	69	2834	1
8407	69	2835	3
8408	69	2837	3.5
8409	69	2845	0.5
8410	69	2873	3
8411	69	2874	5
8412	69	2886	3.5
8413	69	2925	3
8414	69	2926	5
8415	69	2942	4
8416	69	2948	4
8417	69	2953	4
8418	69	2959	5
8419	69	2965	2
8420	69	3032	4
8421	69	3073	4
8422	69	3074	2
8423	69	3120	0.5
8424	69	3150	5
8425	69	3184	5
8426	69	3245	0.5
8427	69	3308	4
8428	69	3309	4
8429	69	3323	4.5
8430	69	3345	5
8431	69	3351	3
8432	69	3354	1
8433	69	3390	3.5
8434	69	3393	4
8435	69	3394	4
8436	69	3424	3
8437	69	3444	1
8438	69	3508	3
8439	69	3517	3.5
8440	69	3546	2.5
8441	69	3611	2.5
8442	69	3614	3
8443	69	3620	2
8444	69	3638	2.5
8445	69	3737	0.5
8446	69	3769	3
8447	69	3786	3
8448	69	3792	5
8449	69	3793	3.5
8450	69	3807	4
8451	69	3840	3.5
8452	69	3844	3
8453	69	3854	3
8454	69	3860	4.5
8455	69	3862	3
8456	69	3868	4
8457	69	3886	5
8458	69	3921	0.5
8459	69	4073	3.5
8460	69	4074	3
8461	69	4109	4
8462	69	4168	2.5
8463	69	4173	3.5
8464	69	4188	2
8465	69	4212	1
8466	69	4214	1
8467	69	4282	1
8468	69	4299	1
8469	69	4305	2
8470	69	4315	1
8471	69	4317	1
8472	69	4345	2
8473	69	4346	2
8474	69	4350	4
8475	69	4365	5
8476	69	4414	4.5
8477	69	4424	3.5
8478	69	4435	4.5
8479	69	4458	4.5
8480	69	4460	3
8481	69	4494	4
8482	69	4562	3
8483	69	4676	4
8484	69	4681	3.5
8485	69	4701	1
8486	69	4705	4
8487	69	4708	4
8488	69	4769	0.5
8489	69	4803	4
8490	69	4833	0.5
8491	69	4865	3.5
8492	69	4909	5
8493	69	4954	4
8494	69	4968	4
8495	69	4982	0.5
8496	69	4994	3.5
8497	69	4999	2
8498	69	5000	4
8499	69	5005	5
8500	69	5019	4
8501	69	5046	3.5
8502	69	5076	3
8503	69	5082	4
8504	69	5110	3.5
8505	69	5111	2.5
8506	69	5117	2
8507	69	5118	2
8508	69	5122	4
8509	69	5135	4
8510	69	5154	5
8511	69	5161	4
8512	69	5167	4
8513	69	5207	5
8514	69	5210	4
8515	69	5253	4
8516	69	5329	5
8517	69	5348	3.5
8518	69	5349	3.5
8519	69	5365	5
8520	69	5385	3
8521	69	5401	5
8522	69	5454	4
8523	69	5484	3.5
8524	69	5528	3.5
8525	69	5541	4
8526	69	5554	4
8527	69	5587	4.5
8528	69	5589	3
8529	69	5613	4.5
8530	69	5617	3
8531	69	5624	2
8532	69	5635	0.5
8533	69	5659	4
8534	69	5660	3.5
8535	69	5704	3.5
8536	69	5709	2
8537	69	5725	2
8538	69	5726	3.5
8539	69	5727	4.5
8540	69	5729	2
8541	69	5743	4.5
8542	69	5780	3.5
8543	69	5802	3.5
8544	69	5816	3
8545	69	5883	4.5
8546	69	5898	5
8547	69	5906	1
8548	69	5964	4
8549	69	6061	5
8550	69	6078	4
8551	69	6396	3.5
8552	69	6540	1
8553	69	6563	2
8554	69	6620	3
8555	69	6642	4.5
8556	69	6663	3
8557	70	1	4
8558	70	127	4
8559	70	151	2
8560	70	280	5
8561	70	317	4.5
8562	70	340	4
8563	70	425	4.5
8564	70	427	5
8565	70	523	4.5
8566	70	526	5
8567	70	647	5
8568	70	675	4
8569	70	788	4.5
8570	70	1170	4.5
8571	70	1272	3
8572	70	1298	5
8573	70	1361	3.5
8574	70	1844	4.5
8575	70	1905	4.5
8576	70	1915	3
8577	70	2090	3
8578	70	2146	4
8579	70	2173	3
8580	70	2178	3.5
8581	70	2282	5
8582	70	2327	5
8583	70	2496	2.5
8584	70	2520	5
8585	70	2661	4.5
8586	70	2958	5
8587	70	3769	4.5
8588	70	3886	3.5
8589	70	4458	3.5
8590	70	5207	3.5
8591	70	5329	5
8592	70	7061	5
8593	70	7670	4
8594	70	8184	5
8595	71	1	4.5
8596	71	32	4.5
8597	71	45	4.5
8598	71	48	4
8599	71	65	4
8600	71	142	4.5
8601	71	224	4.5
8602	71	259	5
8603	71	261	5
8604	71	280	5
8605	71	281	4.5
8606	71	317	4.5
8607	71	324	5
8608	71	337	5
8609	71	340	4
8610	71	406	4.5
8611	71	427	4.5
8612	71	485	4.5
8613	71	499	4.5
8614	71	521	4
8615	71	523	4
8616	71	526	4.5
8617	71	530	4.5
8618	71	538	4.5
8619	71	553	4
8620	71	620	4.5
8621	71	677	3.5
8622	71	721	4.5
8623	71	741	5
8624	71	774	4
8625	71	836	5
8626	71	843	4
8627	71	844	4.5
8628	71	873	4
8629	71	895	4
8630	71	898	3.5
8631	71	939	4.5
8632	71	952	4
8633	71	966	5
8634	71	981	4.5
8635	71	1000	4
8636	71	1012	4.5
8637	71	1018	4.5
8638	71	1019	4
8639	71	1030	5
8640	71	1072	4.5
8641	71	1083	4
8642	71	1090	4
8643	71	1091	4
8644	71	1112	4
8645	71	1122	4
8646	71	1127	4
8647	71	1133	4
8648	71	1144	4
8649	71	1233	4
8650	71	1260	4.5
8651	71	1261	4.5
8652	71	1288	3.5
8653	71	1296	4
8654	71	1322	4.5
8655	71	1361	4
8656	71	1368	4
8657	71	1399	4
8658	71	1402	4
8659	71	1489	3.5
8660	71	1494	4
8661	71	1518	5
8662	71	1520	3
8663	71	1522	4
8664	71	1528	4
8665	71	1549	4
8666	71	1561	4.5
8667	71	1564	4
8668	71	1569	4.5
8669	71	1570	3
8670	71	1574	4
8671	71	1576	4
8672	71	1591	4
8673	71	1619	4.5
8674	71	1678	4.5
8675	71	1741	4
8676	71	1796	4
8677	71	1811	4
8678	71	1822	4
8679	71	1844	5
8680	71	1865	4
8681	71	1867	4.5
8682	71	1916	4
8683	71	2001	3.5
8684	71	2022	4.5
8685	71	2057	5
8686	71	2058	4
8687	71	2091	4
8688	71	2108	4
8689	71	2135	5
8690	71	2151	4
8691	71	2164	4.5
8692	71	2210	4.5
8693	71	2211	4
8694	71	2217	3
8695	71	2239	4.5
8696	71	2332	4.5
8697	71	2414	4.5
8698	71	2466	4
8699	71	2497	4
8700	71	2520	5
8701	71	2600	3.5
8702	71	2704	4
8703	71	2778	4.5
8704	71	2788	4.5
8705	71	2806	4
8706	71	2818	3.5
8707	71	2929	4.5
8708	71	2958	3
8709	71	3117	4.5
8710	71	3125	4.5
8711	71	3149	4.5
8712	71	3171	4
8713	71	3173	4.5
8714	71	3191	4
8715	71	3219	3.5
8716	71	3320	4.5
8717	71	3323	4.5
8718	71	3337	4.5
8719	71	3380	5
8720	71	3382	4
8721	71	3483	4
8722	71	3698	4.5
8723	71	3724	4.5
8724	71	3738	4.5
8725	71	3772	4
8726	71	3784	3.5
8727	71	3804	4
8728	71	3807	4.5
8729	71	3812	4
8730	71	3814	3
8731	71	3818	4
8732	71	3860	4
8733	71	3868	4
8734	71	3870	3
8735	71	3885	4.5
8736	71	3887	4
8737	71	3911	4.5
8738	71	3927	3
8739	71	3938	4
8740	71	4037	2
8741	71	4062	4.5
8742	71	4075	3.5
8743	71	4076	5
8744	71	4080	3.5
8745	71	4109	4
8746	71	4126	4
8747	71	4135	4
8748	71	4154	4.5
8749	71	4173	4
8750	71	4188	4.5
8751	71	4213	3.5
8752	71	4228	3.5
8753	71	4286	4.5
8754	71	4316	4
8755	71	4386	4
8756	71	4431	4
8757	71	4459	4
8758	71	4461	2.5
8759	71	4485	5
8760	71	4487	4
8761	71	4595	4
8762	71	4597	4
8763	71	4642	4
8764	71	4658	4
8765	71	4673	4.5
8766	71	4697	4.5
8767	71	4779	4.5
8768	71	4803	4.5
8769	71	4853	3.5
8770	72	1	5
8771	72	3	3
8772	72	6	3
8773	72	9	1
8774	72	25	4
8775	72	32	4
8776	72	39	3
8777	72	75	4
8778	72	88	4
8779	72	92	4
8780	72	97	3
8781	72	101	4
8782	72	106	3
8783	72	117	3
8784	72	231	5
8785	72	336	3
8786	72	406	4
8787	72	503	4
8788	72	538	4
8789	72	560	3
8790	72	564	4
8791	72	565	4
8792	72	568	3
8793	72	580	4
8794	72	594	4
8795	72	601	3
8796	72	602	4
8797	72	611	3
8798	72	614	3
8799	72	620	4
8800	72	621	2
8801	72	622	3
8802	72	625	2
8803	72	630	3
8804	72	638	1
8805	72	639	2
8806	72	645	5
8807	72	647	5
8808	72	651	3
8809	72	652	4
8810	72	653	3
8811	72	654	3
8812	72	655	1
8813	72	656	4
8814	72	659	3
8815	72	662	3
8816	72	666	3
8817	72	674	2
8818	72	675	3
8819	72	677	4
8820	72	681	3
8821	72	684	2
8822	72	687	3
8823	72	691	3
8824	72	696	5
8825	72	704	3
8826	72	708	3
8827	72	710	3
8828	72	726	5
8829	72	734	4
8830	72	807	3
8831	72	810	2
8832	72	811	3
8833	72	812	3
8834	72	853	4
8835	72	854	3
8836	72	858	3
8837	72	873	5
8838	72	903	3
8839	72	909	4
8840	72	947	5
8841	72	972	5
8842	72	994	5
8843	72	1022	5
8844	72	1103	4
8845	72	1110	3
8846	72	1131	3
8847	72	1133	4
8848	72	1142	3
8849	72	1144	5
8850	72	1157	1
8851	72	1160	3
8852	72	1162	3
8853	72	1167	3
8854	72	1174	3
8855	72	1175	4
8856	72	1183	2
8857	72	1187	4
8858	72	1189	4
8859	72	1196	4
8860	72	1197	4
8861	72	1198	3
8862	72	1201	3
8863	72	1203	4
8864	72	1206	3
8865	72	1212	1
8866	72	1214	2
8867	72	1215	5
8868	72	1222	2
8869	72	1224	2
8870	72	1226	5
8871	72	1227	4
8872	72	1233	5
8873	72	1241	4
8874	72	1244	4
8875	72	1250	4
8876	72	1253	2
8877	72	1254	3
8878	72	1257	3
8879	72	1260	5
8880	72	1261	3
8881	72	1265	3
8882	72	1270	3
8883	72	1271	4
8884	72	1272	2
8885	72	1278	4
8886	72	1282	3
8887	72	1284	2
8888	72	1285	3
8889	72	1288	4
8890	72	1293	4
8891	72	1294	4
8892	72	1295	4
8893	72	1298	3
8894	72	1302	4
8895	72	1304	4
8896	72	1305	3
8897	72	1310	4
8898	72	1311	5
8899	72	1314	3
8900	72	1315	3
8901	72	1337	4
8902	72	1340	5
8903	72	1348	3
8904	72	1349	5
8905	72	1350	3
8906	72	1351	4
8907	72	1364	4
8908	72	1366	4
8909	72	1368	5
8910	72	1369	4
8911	72	1372	3
8912	72	1375	4
8913	72	1381	5
8914	72	1386	4
8915	72	1394	3
8916	72	1399	3
8917	72	1400	4
8918	73	37	1
8919	73	280	5
8920	73	361	4
8921	73	397	4
8922	73	406	5
8923	73	526	5
8924	73	583	5
8925	73	844	5
8926	73	892	4
8927	73	895	2
8928	73	1005	5
8929	73	1112	5
8930	73	1302	5
8931	73	1308	5
8932	73	1464	4
8933	73	1485	5
8934	73	1487	4
8935	73	1591	3
8936	73	2011	1
8937	73	2174	1
8938	73	2282	5
8939	73	2323	1
8940	74	1	2
8941	74	32	2
8942	74	34	2
8943	74	45	5
8944	74	46	1.5
8945	74	99	5
8946	74	127	3
8947	74	130	0.5
8948	74	135	2
8949	74	140	0.5
8950	74	142	1.5
8951	74	148	2
8952	74	203	0.5
8953	74	258	5
8954	74	261	5
8955	74	280	5
8956	74	305	0.5
8957	74	310	5
8958	74	317	5
8959	74	324	5
8960	74	327	0.5
8961	74	337	0.5
8962	74	383	1.5
8963	74	406	4
8964	74	427	1.5
8965	74	446	1.5
8966	74	465	1
8967	74	483	2
8968	74	496	1
8969	74	522	5
8970	74	526	5
8971	74	528	5
8972	74	530	2
8973	74	565	4
8974	74	620	4
8975	74	622	0.5
8976	74	647	5
8977	74	774	2.5
8978	74	873	4.5
8979	74	895	2
8980	74	1030	4
8981	74	1203	2
8982	74	1565	2.5
8983	74	1591	5
8984	74	1615	0.5
8985	74	1641	5
8986	74	1660	2
8987	74	2057	5
8988	74	2282	3.5
8989	74	2869	3
8990	74	3184	2.5
8991	74	4458	4
8992	74	5842	0.5
8993	75	152	5
8994	75	231	5
8995	75	278	4
8996	75	485	5
8997	75	522	4
8998	75	523	5
8999	75	622	2
9000	75	631	4
9001	75	721	3
9002	75	734	5
9003	75	746	4
9004	75	887	5
9005	75	895	3
9006	75	939	3
9007	75	960	5
9008	75	968	5
9009	75	972	3
9010	75	974	4
9011	75	976	3
9012	75	977	4
9013	75	1000	4
9014	75	1030	4
9015	75	1048	5
9016	75	1127	3
9017	75	1132	4
9018	75	1382	3
9019	75	1463	4
9020	75	1529	3
9021	75	1534	3
9022	75	1535	5
9023	75	1573	4
9024	75	1591	1
9025	75	1697	4
9026	75	1820	5
9027	75	2057	4
9028	75	2199	3
9029	75	2287	5
9030	75	2711	4
9031	75	2716	3
9032	75	2816	5
9033	75	3382	5
9034	75	3625	3
9035	75	3717	4
9036	75	3807	5
9037	75	3904	2
9038	75	4080	4
9039	75	4214	3
9040	75	4275	2
9041	75	4278	3
9042	75	4309	3
9043	75	4381	4
9044	75	4386	3
9045	75	4436	5
9046	75	4487	5
9047	75	4571	3
9048	75	4591	4
9049	75	4622	2
9050	75	4637	3
9051	75	4643	1
9052	75	4663	3
9053	76	45	3.5
9054	76	99	4
9055	76	317	4.5
9056	76	734	4
9057	76	959	3.5
9058	76	960	3.5
9059	76	984	4.5
9060	76	1361	4.5
9061	76	1591	4.5
9062	76	2366	3.5
9063	76	2837	4
9064	76	3886	5
9065	76	4458	5
9066	76	5207	5
9067	76	5329	4
9068	76	7307	4
9069	76	7670	4.5
9070	76	7715	4.5
9071	76	7974	4.5
9072	76	10001	3.5
9073	76	10006	4
9074	76	10092	4.5
9075	77	32	3.5
9076	77	49	2
9077	77	88	3
9078	77	99	4
9079	77	196	3
9080	77	277	3.5
9081	77	303	3.5
9082	77	317	3.5
9083	77	427	4
9084	77	472	4
9085	77	485	4.5
9086	77	523	3.5
9087	77	526	4.5
9088	77	746	4
9089	77	776	2.5
9090	77	822	4
9091	77	878	3
9092	77	892	4
9093	77	895	4.5
9094	77	919	3.5
9095	77	962	2
9096	77	992	3.5
9097	77	994	3
9098	77	995	4.5
9099	77	996	4.5
9100	77	1000	4.5
9101	77	1006	4
9102	77	1018	4.5
9103	77	1023	2
9104	77	1030	3.5
9105	77	1170	4
9106	77	1261	4.5
9107	77	1322	3
9108	77	1344	3.5
9109	77	1524	3
9110	77	1574	2
9111	77	1675	3
9112	77	1814	4
9113	77	1976	4
9114	77	2172	4
9115	77	2210	3.5
9116	77	2246	4
9117	77	2361	2
9118	77	2373	4.5
9119	77	2484	3
9120	77	2491	3.5
9121	77	2592	4
9122	77	2626	4
9123	77	2704	3
9124	77	2757	4.5
9125	77	2818	4.5
9126	77	2908	4.5
9127	77	2924	3.5
9128	77	2965	4.5
9129	77	2967	3
9130	77	3125	4.5
9131	77	3173	3
9132	77	3177	3.5
9133	77	3204	4
9134	77	3382	4.5
9135	77	3788	4
9136	77	3868	4.5
9137	77	4080	4.5
9138	77	4173	4
9139	77	4256	2
9140	77	4487	4.5
9141	77	4600	3.5
9142	77	4706	4
9143	77	4779	3.5
9144	77	4803	3.5
9145	77	4909	4
9146	77	5003	4
9147	77	5068	3
9148	77	5203	4.5
9149	78	280	5
9150	78	1025	5
9151	78	1030	5
9152	78	1344	5
9153	78	2057	5
9154	78	2172	5
9155	78	2837	5
9156	78	4033	5
9157	78	4803	5
9158	78	7565	5
9159	78	7715	5
9160	78	7719	5
9161	78	7742	5
9162	78	8351	5
9163	78	8374	5
9164	78	8489	5
9165	78	8543	5
9166	78	8630	5
9167	78	8761	5
9168	78	8805	5
9169	78	8925	5
9170	78	8958	5
9171	78	9013	5
9172	78	9053	5
9173	78	9122	5
9174	78	9230	5
9175	78	9354	5
9176	78	9401	5
9177	78	9643	5
9178	78	9687	5
9179	78	9703	5
9180	78	9706	5
9181	78	9759	5
9182	78	9821	5
9183	78	9985	5
9184	79	6	4
9185	79	48	4.5
9186	79	100	3
9187	79	127	3
9188	79	189	3
9189	79	195	3.5
9190	79	203	3.5
9191	79	259	4
9192	79	317	3.5
9193	79	328	3
9194	79	337	3.5
9195	79	390	3
9196	79	427	3.5
9197	79	525	3.5
9198	79	565	4
9199	79	631	4
9200	79	645	4
9201	79	651	3.5
9202	79	696	4
9203	79	734	4
9204	79	789	3.5
9205	79	887	3.5
9206	79	961	4
9207	79	970	4
9208	79	975	4
9209	79	983	4.5
9210	79	984	3.5
9211	79	998	3
9212	79	1006	4.5
9213	79	1014	2.5
9214	79	1030	3.5
9215	79	1038	3.5
9216	79	1051	4
9217	79	1053	3.5
9218	79	1061	3
9219	79	1087	3
9220	79	1133	4
9221	79	1198	3
9222	79	1203	3
9223	79	1344	4
9224	79	1381	3.5
9225	79	1456	2
9226	79	1520	3
9227	79	1591	4.5
9228	79	1675	4
9229	79	1730	3.5
9230	79	1814	4
9231	79	1816	1
9232	79	1865	3
9233	79	1906	4.5
9234	79	2001	3.5
9235	79	2002	3.5
9236	79	2034	3.5
9237	79	2057	4.5
9238	79	2091	4
9239	79	2210	3.5
9240	79	2282	4
9241	79	2332	3
9242	79	2355	2.5
9243	79	2366	3.5
9244	79	2442	3
9245	79	2766	4
9246	79	2837	4.5
9247	79	2869	3.5
9248	79	3163	4
9249	79	3173	4
9250	79	3333	3.5
9251	79	3345	3
9252	79	3860	4.5
9253	79	3874	4.5
9254	79	3886	4.5
9255	79	4458	4.5
9256	79	4504	3.5
9257	79	4803	4
9258	79	4969	3.5
9259	79	5207	4
9260	79	5838	4
9261	79	6061	3
9262	79	6200	3.5
9263	79	6417	4
9264	79	6563	3.5
9265	79	6946	3
9266	79	6950	4
9267	79	7161	4
9268	79	7179	5
9269	79	7180	4
9270	79	7219	4.5
9271	79	7439	4.5
9272	79	7472	4
9273	79	7501	4.5
9274	79	7538	4
9275	79	7621	4
9276	79	7653	4
9277	79	7658	3.5
9278	79	7670	4
9279	79	7773	4
9280	80	4	3.5
9281	80	18	4
9282	80	48	4.5
9283	80	82	3.5
9284	80	188	4.5
9285	80	269	3
9286	80	280	5
9287	80	472	4
9288	80	696	5
9289	80	734	4
9290	80	894	4.5
9291	80	983	5
9292	80	1153	3.5
9293	80	1430	3.5
9294	80	2366	4
9295	80	2596	3.5
9296	80	2863	1.5
9297	80	3083	4.5
9298	80	3143	4
9299	80	3323	4
9300	80	3868	4.5
9301	80	4944	3.5
9302	80	6959	5
9303	80	7439	4
9304	80	7588	4
9305	80	7670	4.5
9306	80	8087	4.5
9307	80	8148	4.5
9308	80	8165	2.5
9309	80	8168	3
9310	81	1	4
9311	81	231	5
9312	81	522	3
9313	81	527	5
9314	81	528	3
9315	81	529	3
9316	81	624	3
9317	81	788	5
9318	81	841	3
9319	81	844	5
9320	81	926	5
9321	81	1034	5
9322	81	1638	3
9323	81	1696	5
9324	81	2159	3
9325	81	2281	5
9326	81	2332	5
9327	81	2389	4
9328	81	2435	4
9329	81	2497	4
9330	81	2963	3
9331	81	2965	4
9332	81	3158	3
9333	82	135	4
9334	82	243	4
9335	82	280	5
9336	82	475	3.5
9337	82	499	4.5
9338	82	614	2.5
9339	82	732	5
9340	82	736	3.5
9341	82	737	3.5
9342	82	738	3
9343	82	884	4
9344	82	900	5
9345	82	995	3.5
9346	82	1090	4.5
9347	82	1222	3
9348	82	1514	4
9349	82	1640	5
9350	82	1917	2.5
9351	82	2195	4.5
9352	82	2895	4
9353	82	6828	2.5
9354	82	7433	3.5
9355	82	7573	4
9356	83	1	3.5
9357	83	5	1.5
9358	83	17	3.5
9359	83	95	3
9360	83	99	3.5
9361	83	203	1.5
9362	83	231	4
9363	83	300	3
9364	83	316	2
9365	83	317	4
9366	83	318	1.5
9367	83	404	2
9368	83	446	3.5
9369	83	465	3
9370	83	487	3
9371	83	565	4
9372	83	627	3.5
9373	83	647	3.5
9374	83	724	2
9375	83	835	3.5
9376	83	926	3.5
9377	83	959	4
9378	83	960	3.5
9379	83	961	3.5
9380	83	972	4
9381	83	1025	3.5
9382	83	1030	3
9383	83	1047	4
9384	83	1048	4
9385	83	1051	3.5
9386	83	1127	3.5
9387	83	1198	3
9388	83	1226	4.5
9389	83	1261	3.5
9390	83	1344	4
9391	83	1369	3.5
9392	83	1399	2
9393	83	1412	3.5
9394	83	1489	3
9395	83	1494	2.5
9396	83	1524	4
9397	83	1570	4.5
9398	83	1574	2
9399	83	1615	2
9400	83	1816	1.5
9401	83	1867	2.5
9402	83	1934	3
9403	83	1976	3
9404	83	2057	5
9405	83	2058	3
9406	83	2080	2.5
9407	83	2135	2.5
9408	83	2239	3.5
9409	83	2332	3.5
9410	83	2358	3.5
9411	83	2424	3
9412	83	2467	3.5
9413	83	2497	3.5
9414	83	2542	3.5
9415	83	2594	3.5
9416	83	2595	2
9417	83	2704	3.5
9418	83	2837	4.5
9419	83	2869	3
9420	83	3000	3
9421	83	3166	3
9422	83	3167	4
9423	83	3173	4
9424	83	3375	4.5
9425	83	3380	3.5
9426	83	3383	2.5
9427	83	3424	2
9428	83	3769	3.5
9429	83	3812	3.5
9430	83	3816	2
9431	83	4033	3
9432	83	4109	3.5
9433	83	4126	2
9434	83	4127	3
9435	83	4154	3.5
9436	83	4173	4
9437	83	4416	3.5
9438	83	4485	4
9439	83	4681	3
9440	83	4706	2.5
9441	83	4798	2.5
9442	83	4803	4
9443	83	4909	3
9444	83	4998	4
9445	83	5042	1
9446	83	5046	3.5
9447	83	5289	3
9448	83	5377	4
9449	83	5618	4
9450	83	5619	3.5
9451	83	5630	3
9452	83	5677	4
9453	83	5726	3.5
9454	83	5730	5
9455	83	5733	4
9456	83	5743	3.5
9457	83	5883	4
9458	83	5899	2
9459	83	6411	2.5
9460	83	6413	3.5
9461	83	6415	3
9462	83	6418	3.5
9463	83	6593	3.5
9464	83	6620	3.5
9465	83	6642	4.5
9466	83	6663	2
9467	83	6767	3
9468	83	6828	4.5
9469	83	7019	3.5
9470	83	7022	3.5
9471	83	7085	4
9472	83	7089	3
9473	83	7200	4
9474	83	7219	4
9475	83	7273	3.5
9476	83	7292	2.5
9477	83	7307	2
9478	83	7333	4.5
9479	83	7423	3
9480	83	7435	3.5
9481	83	7439	3.5
9482	83	7565	3.5
9483	83	7670	3.5
9484	83	7715	4
9485	83	7742	3.5
9486	83	7761	3.5
9487	83	8096	3.5
9488	83	8354	4
9489	83	8629	4.5
9490	83	8630	5
9491	83	8761	4
9492	83	8779	4
9493	83	8858	3.5
9494	83	9037	2.5
9495	83	9122	4
9496	83	9181	3.5
9497	83	9230	4
9498	83	9269	4
9499	83	9477	4
9500	83	9671	3.5
9501	83	9961	3.5
9502	83	10006	4.5
9503	84	1	3
9504	84	188	4
9505	84	280	5
9506	84	324	4.5
9507	84	530	3.5
9508	84	696	4.5
9509	84	843	4
9510	84	1066	3.5
9511	84	1368	4
9512	84	1586	3
9513	84	1839	5
9514	84	2210	4.5
9515	84	2704	4.5
9516	84	3176	4
9517	84	3211	3
9518	84	3812	4
9519	84	3818	4.5
9520	84	3868	5
9521	84	4033	4
9522	84	4319	3.5
9523	84	4386	4
9524	84	4560	3.5
9525	84	4705	4.5
9526	84	5624	3.5
9527	84	7599	3.5
9528	84	7670	4
9529	84	7747	2.5
9530	84	8105	4
9531	84	8121	3.5
9532	84	8143	4
9533	84	8181	3.5
9534	84	8185	4.5
9535	84	8291	4
9536	84	8329	4
9537	84	8351	4
9538	84	8354	4
9539	84	8397	4
9540	84	8489	4.5
9541	84	8580	4
9542	84	8630	4
9543	84	8639	4.5
9544	84	8762	4.5
9545	84	8868	3
9546	84	9049	5
9547	84	9061	3.5
9548	84	9143	5
9549	84	9227	5
9550	84	9491	1.5
9551	84	9700	4.5
9552	84	9780	4
9553	84	9915	4
9554	84	9966	4
9555	84	9971	4.5
9556	84	10072	3
9557	85	48	3.5
9558	85	100	5
9559	85	151	3.5
9560	85	180	3
9561	85	231	4.5
9562	85	261	4.5
9563	85	280	5
9564	85	342	2.5
9565	85	461	2.5
9566	85	472	4.5
9567	85	526	4.5
9568	85	631	4
9569	85	696	5
9570	85	734	4.5
9571	85	744	4
9572	85	835	3
9573	85	923	5
9574	85	939	5
9575	85	959	4.5
9576	85	961	4.5
9577	85	964	4.5
9578	85	966	4.5
9579	85	971	5
9580	85	983	4.5
9581	85	1072	4
9582	85	1427	2.5
9583	85	1514	3
9584	85	1839	5
9585	85	1844	4.5
9586	85	1941	3
9587	85	2057	5
9588	85	2282	4.5
9589	85	2360	3
9590	85	2366	5
9591	85	2608	3
9592	85	2716	4.5
9593	85	2727	4
9594	85	3166	2
9595	85	3170	3
9596	85	3323	4
9597	85	3886	5
9598	85	4365	4
9599	85	4458	5
9600	85	4487	3
9601	85	4504	4.5
9602	85	5207	5
9603	85	6959	4.5
9604	85	7670	3.5
9605	85	8630	4
9606	85	9269	4
9607	85	9343	4.5
9608	86	1	3
9609	86	100	5
9610	86	195	4.5
9611	86	259	5
9612	86	261	5
9613	86	317	4.5
9614	86	538	5
9615	86	645	2.5
9616	86	732	3
9617	86	745	3.5
9618	86	878	3.5
9619	86	926	3
9620	86	957	4
9621	86	960	3
9622	86	976	2.5
9623	86	996	5
9624	86	1012	4.5
9625	86	1036	3
9626	86	1368	3
9627	86	1375	3
9628	86	1814	4
9629	86	2057	4.5
9630	86	2144	1.5
9631	86	2172	4.5
9632	86	2366	5
9633	86	2398	4
9634	86	2520	4
9635	86	3000	4
9636	86	3380	2.5
9637	86	3812	3.5
9638	86	3868	5
9639	86	3886	3.5
9640	86	4491	4.5
9641	86	4697	3.5
9642	86	4705	3.5
9643	86	4803	3
9644	86	5005	5
9645	86	5207	3.5
9646	86	5329	4.5
9647	86	5365	5
9648	86	5624	2.5
9649	86	5856	5
9650	86	5883	2.5
9651	86	6946	4
9652	86	7273	3
9653	86	7542	5
9654	86	7670	4
9655	86	7761	3.5
9656	86	8121	4
9657	86	8130	2
9658	86	8173	4
9659	86	8184	4
9660	86	8351	4.5
9661	86	8629	3.5
9662	86	8630	4
9663	86	8762	4
9664	86	8779	3
9665	86	9578	5
9666	87	6	4.5
9667	87	22	2.5
9668	87	25	4
9669	87	32	4.5
9670	87	34	3.5
9671	87	36	3.5
9672	87	49	2.5
9673	87	58	3.5
9674	87	88	3.5
9675	87	99	4.5
9676	87	121	2
9677	87	127	4
9678	87	130	3
9679	87	138	3
9680	87	142	3.5
9681	87	161	3.5
9682	87	162	3.5
9683	87	181	3.5
9684	87	203	1.5
9685	87	252	3.5
9686	87	258	3
9687	87	261	2.5
9688	87	264	4.5
9689	87	278	3.5
9690	87	280	4.5
9691	87	305	1.5
9692	87	309	4
9693	87	317	4.5
9694	87	324	3.5
9695	87	327	2.5
9696	87	337	3.5
9697	87	340	3
9698	87	383	3.5
9699	87	403	2.5
9700	87	406	4
9701	87	422	4
9702	87	427	3.5
9703	87	431	3
9704	87	446	3.5
9705	87	472	4.5
9706	87	483	3
9707	87	485	2.5
9708	87	497	4
9709	87	520	1.5
9710	87	521	3
9711	87	522	3
9712	87	523	3.5
9713	87	525	4
9714	87	526	4
9715	87	538	4.5
9716	87	565	2.5
9717	87	620	3.5
9718	87	622	3.5
9719	87	647	2.5
9720	87	662	4
9721	87	696	4.5
9722	87	725	4
9723	87	730	4
9724	87	734	4.5
9725	87	735	4.5
9726	87	742	3.5
9727	87	744	4
9728	87	745	4
9729	87	844	4.5
9730	87	873	1
9731	87	876	3.5
9732	87	887	3.5
9733	87	912	4
9734	87	925	4
9735	87	957	4
9736	87	960	3.5
9737	87	961	4.5
9738	87	963	4.5
9739	87	969	4
9740	87	971	4
9741	87	974	4.5
9742	87	975	4.5
9743	87	976	4
9744	87	977	3.5
9745	87	981	4
9746	87	990	4
9747	87	1000	4
9748	87	1008	3.5
9749	87	1010	3.5
9750	87	1012	4.5
9751	87	1019	3.5
9752	87	1025	3.5
9753	87	1027	4
9754	87	1030	4.5
9755	87	1051	3.5
9756	87	1061	4
9757	87	1105	4.5
9758	87	1127	4
9759	87	1133	3.5
9760	87	1215	3
9761	87	1226	2.5
9762	87	1233	3.5
9763	87	1261	3
9764	87	1265	2.5
9765	87	1290	2.5
9766	87	1296	4.5
9767	87	1322	5
9768	87	1344	4.5
9769	87	1361	4
9770	87	1368	5
9771	87	1402	4
9772	87	1489	3
9773	87	1494	3
9774	87	1528	4
9775	87	1564	3.5
9776	87	1574	3
9777	87	1575	3.5
9778	87	1591	4.5
9779	87	1625	4.5
9780	87	1675	3.5
9781	87	1814	4
9782	87	1822	3
9783	87	1844	4.5
9784	87	1916	3.5
9785	87	2002	3.5
9786	87	2057	4.5
9787	87	2091	3
9788	87	2144	2.5
9789	87	2159	2.5
9790	87	2167	4
9791	87	2195	3.5
9792	87	2210	3.5
9793	87	2239	2.5
9794	87	2282	4.5
9795	87	2290	4
9796	87	2313	4
9797	87	2330	3.5
9798	87	2332	3.5
9799	87	2398	2
9800	87	2430	3
9801	87	2520	4.5
9802	87	2521	3.5
9803	87	2593	3.5
9804	87	2704	4
9805	87	2757	3
9806	87	2761	3
9807	87	2766	3.5
9808	87	2837	4
9809	87	2869	3.5
9810	87	2908	4
9811	87	2967	4
9812	87	3087	3.5
9813	87	3108	3.5
9814	87	3149	3
9815	87	3150	4.5
9816	87	3168	3.5
9817	87	3173	3.5
9818	87	3184	4.5
9819	87	3231	3.5
9820	87	3320	3.5
9821	87	3323	4
9822	87	3337	3
9823	87	3380	3.5
9824	87	3429	3
9825	87	3698	3.5
9826	87	3758	2.5
9827	87	3801	1.5
9828	87	3807	5
9829	87	3860	3.5
9830	87	3868	3
9831	87	3874	3
9832	87	3886	4.5
9833	87	3888	4
9834	87	3900	4
9835	87	3902	3.5
9836	87	4080	3.5
9837	87	4109	3.5
9838	87	4137	4.5
9839	87	4154	4
9840	87	4173	5
9841	87	4213	3.5
9842	87	4321	2.5
9843	87	4436	3
9844	87	4453	4
9845	87	4458	4.5
9846	87	4485	4.5
9847	87	4491	5
9848	87	4504	5
9849	87	4681	4
9850	87	4697	4
9851	87	4705	3.5
9852	87	4706	3.5
9853	87	4779	4
9854	87	4803	3
9855	87	4852	4.5
9856	87	4868	4.5
9857	87	4885	2
9858	87	4954	4.5
9859	87	4991	4
9860	87	5000	4
9861	87	5037	2
9862	87	5042	3.5
9863	87	5201	4
9864	87	5202	3.5
9865	87	5207	4.5
9866	87	5210	4
9867	87	5271	4
9868	87	5329	4
9869	87	5370	3.5
9870	87	5618	3
9871	87	5652	3.5
9872	87	5659	4
9873	87	5694	3.5
9874	87	5719	2.5
9875	87	5726	4
9876	87	5733	3
9877	87	5795	3.5
9878	87	5802	4
9879	87	5875	4
9880	87	5883	3.5
9881	87	5898	4
9882	87	6245	4
9883	87	6404	3.5
9884	87	6408	3.5
9885	87	6411	4
9886	87	6413	5
9887	87	6425	1.5
9888	87	6442	4
9889	87	6462	4.5
9890	87	6563	3.5
9891	87	6606	4
9892	87	6632	4
9893	87	6642	5
9894	87	6663	3
9895	87	6696	4.5
9896	87	6825	4
9897	87	6828	4
9898	87	6847	4
9899	87	6848	4.5
9900	87	6901	4.5
9901	87	6948	4
9902	87	7009	5
9903	87	7019	3.5
9904	87	7035	2
9905	87	7036	1.5
9906	87	7039	2
9907	87	7045	3.5
9908	87	7056	2.5
9909	87	7061	4.5
9910	87	7066	4.5
9911	87	7077	3
9912	87	7082	3
9913	87	7085	3.5
9914	87	7097	2
9915	87	7104	4
9916	87	7105	0.5
9917	87	7112	3
9918	87	7115	4
9919	87	7132	3.5
9920	87	7134	3.5
9921	87	7137	2.5
9922	87	7140	1
9923	87	7142	2
9924	87	7153	0.5
9925	87	7155	3.5
9926	87	7161	4.5
9927	87	7167	0.5
9928	87	7173	4
9929	87	7179	4
9930	87	7180	3.5
9931	87	7181	3.5
9932	87	7185	0.5
9933	87	7186	2
9934	87	7194	2.5
9935	87	7197	3.5
9936	87	7200	4
9937	87	7230	4
9938	88	1	4.5
9939	88	2	4.5
9940	88	6	4.5
9941	88	10	3.5
9942	88	11	4
9943	88	16	3.5
9944	88	19	2.5
9945	88	21	4.5
9946	88	25	5
9947	88	32	5
9948	88	36	4.5
9949	88	37	3
9950	88	42	3.5
9951	88	45	5
9952	88	48	5
9953	88	60	2.5
9954	88	64	4.5
9955	88	65	3.5
9956	88	88	3
9957	88	95	4
9958	88	99	4
9959	88	121	4
9960	88	123	4
9961	88	127	4.5
9962	88	128	3.5
9963	88	130	3
9964	88	137	2.5
9965	88	138	4
9966	88	140	4.5
9967	88	142	4
9968	88	146	3.5
9969	88	148	2.5
9970	88	149	2
9971	88	153	4
9972	88	156	4.5
9973	88	167	2.5
9974	88	170	3.5
9975	88	181	2.5
9976	88	195	5
9977	88	203	4.5
9978	88	208	3.5
9979	88	209	3.5
9980	88	224	4
9981	88	231	5
9982	88	236	4
9983	88	254	4
9984	88	256	4.5
9985	88	258	3.5
9986	88	259	5
9987	88	261	5
9988	88	267	3.5
9989	88	278	4
9990	88	280	5
9991	88	290	3
9992	88	294	4
9993	88	298	4.5
9994	88	300	3
9995	88	305	3.5
9996	88	310	4
9997	88	314	4.5
9998	88	315	3.5
9999	88	317	5
10000	88	318	3.5
10001	88	324	3.5
10002	88	327	4
10003	88	328	4
10004	88	330	3.5
10005	88	332	3.5
10006	88	337	3.5
10007	88	340	4
10008	88	346	5
10009	88	360	3
10010	88	380	3.5
10011	88	383	3
10012	88	384	2.5
10013	88	389	4.5
10014	88	390	4.5
10015	88	391	3.5
10016	88	403	3.5
10017	88	406	4.5
10018	88	414	3.5
10019	88	422	4
10020	88	426	3.5
10021	88	427	4.5
10022	88	431	2.5
10023	88	446	4
10024	88	453	5
10025	88	459	4
10026	88	465	3.5
10027	88	469	3
10028	88	472	5
10029	88	474	4
10030	88	483	4
10031	88	485	5
10032	88	487	4
10033	88	497	5
10034	88	499	5
10035	88	519	3.5
10036	88	520	3
10037	88	521	4
10038	88	522	4
10039	88	523	4.5
10040	88	524	4.5
10041	88	525	4.5
10042	88	526	5
10043	88	527	4
10044	88	528	4
10045	88	530	4
10046	88	538	5
10047	88	565	4
10048	88	620	4
10049	88	622	4
10050	88	631	5
10051	88	639	3
10052	88	645	4
10053	88	647	4.5
10054	88	652	4
10055	88	653	3.5
10056	88	654	3.5
10057	88	657	5
10058	88	659	4
10059	88	694	3
10060	88	696	5
10061	88	700	5
10062	88	730	4.5
10063	88	734	5
10064	88	735	5
10065	88	741	4
10066	88	742	4.5
10067	88	743	5
10068	88	744	5
10069	88	746	5
10070	88	774	4.5
10071	88	788	4.5
10072	88	798	2
10073	88	807	4
10074	88	836	4
10075	88	840	4
10076	88	843	4
10077	88	844	5
10078	88	845	3
10079	88	853	3
10080	88	863	4
10081	88	873	4.5
10082	88	877	5
10083	88	878	4
10084	88	879	4
10085	88	886	3.5
10086	88	887	5
10087	88	888	5
10088	88	891	4
10089	88	895	5
10090	88	898	3
10091	88	899	4
10092	88	909	4
10093	88	915	4
10094	88	923	5
10095	88	926	4.5
10096	88	945	4.5
10097	88	957	5
10098	88	959	5
10099	88	960	5
10100	88	961	5
10101	88	962	2
10102	88	963	4
10103	88	964	5
10104	88	968	5
10105	88	969	5
10106	88	970	5
10107	88	972	5
10108	88	975	5
10109	88	976	4.5
10110	88	977	4.5
10111	88	981	5
10112	88	982	4
10113	88	983	5
10114	88	984	5
10115	88	988	5
10116	88	991	4
10117	88	995	4.5
10118	88	1000	4.5
10119	88	1002	5
10120	88	1006	4.5
10121	88	1007	5
10122	88	1009	4
10123	88	1017	5
10124	88	1018	5
10125	88	1019	4
10126	88	1022	5
10127	88	1023	5
10128	88	1025	5
10129	88	1030	4
10130	88	1031	4
10131	88	1032	4.5
10132	88	1035	4.5
10133	88	1036	5
10134	88	1038	5
10135	88	1042	4
10136	88	1045	5
10137	88	1047	5
10138	88	1048	4
10139	88	1051	4
10140	88	1056	4.5
10141	88	1061	4.5
10142	88	1063	5
10143	88	1066	4
10144	88	1071	3
10145	88	1087	4
10146	88	1094	4
10147	88	1103	3
10148	88	1105	4.5
10149	88	1112	4
10150	88	1114	2.5
10151	88	1115	2.5
10152	88	1116	3
10153	88	1117	3
10154	88	1118	3
10155	88	1119	4
10156	88	1120	4
10157	88	1121	4
10158	88	1122	4
10159	88	1127	5
10160	88	1131	2
10161	88	1133	4.5
10162	88	1134	4.5
10163	88	1136	4
10164	88	1142	4
10165	88	1144	4
10166	88	1145	4.5
10167	88	1189	4.5
10168	88	1190	3
10169	88	1198	4
10170	88	1203	3.5
10171	88	1215	5
10172	88	1226	5
10173	88	1233	4.5
10174	88	1250	3
10175	88	1254	2.5
10176	88	1260	3
10177	88	1261	4
10178	88	1265	4
10179	88	1278	3
10180	88	1288	3.5
10181	88	1290	4.5
10182	88	1296	5
10183	88	1304	3
10184	88	1310	3.5
10185	88	1311	5
10186	88	1315	3.5
10187	88	1322	4.5
10188	88	1330	4.5
10189	88	1340	3.5
10190	88	1343	3
10191	88	1344	4.5
10192	88	1361	4.5
10193	88	1368	3.5
10194	88	1375	4.5
10195	88	1382	4
10196	88	1399	4
10197	88	1401	3
10198	88	1402	4.5
10199	88	1411	4.5
10200	88	1414	3.5
10201	88	1427	3
10202	88	1435	5
10203	88	1482	3
10204	88	1489	3
10205	88	1490	3
10206	88	1494	4
10207	88	1512	5
10208	88	1521	5
10209	88	1525	4.5
10210	88	1528	4.5
10211	88	1534	4
10212	88	1535	4
10213	88	1549	5
10214	88	1558	4
10215	88	1561	5
10216	88	1564	5
10217	88	1565	4
10218	88	1566	4
10219	88	1567	3.5
10220	88	1569	4.5
10221	88	1574	3.5
10222	88	1575	4
10223	88	1584	4.5
10224	88	1586	3
10225	88	1591	4.5
10226	88	1615	2.5
10227	88	1619	4
10228	88	1641	4
10229	88	1645	4
10230	88	1656	4
10231	88	1660	4
10232	88	1665	4
10233	88	1668	4.5
10234	88	1669	4.5
10235	88	1675	4
10236	88	1690	4
10237	88	1691	4
10238	88	1694	4
10239	88	1697	4.5
10240	88	1701	4
10241	88	1707	3.5
10242	88	1717	5
10243	88	1723	4
10244	88	1727	4
10245	88	1730	4.5
10246	88	1748	4
10247	88	1749	4.5
10248	88	1770	4.5
10249	88	1778	4.5
10250	88	1780	4.5
10251	88	1789	4.5
10252	88	1796	4.5
10253	88	1800	4
10254	88	1811	4.5
10255	88	1814	4
10256	88	1818	3.5
10257	88	1821	4.5
10258	88	1822	4
10259	88	1836	4.5
10260	88	1864	5
10261	88	1865	4
10262	88	1888	4
10263	88	1892	2.5
10264	88	1904	3.5
10265	88	1907	4
10266	88	1914	3
10267	88	1916	4.5
10268	88	1917	4.5
10269	88	1918	3
10270	88	1923	4
10271	88	1926	4.5
10272	88	1930	4
10273	88	1931	3
10274	88	1933	4
10275	88	1959	3
10276	88	1963	4
10277	88	1965	4
10278	88	1971	4.5
10279	88	1976	4
10280	88	1984	4
10281	88	1992	3
10282	88	1996	4
10283	88	2002	5
10284	88	2005	3.5
10285	88	2031	4
10286	88	2057	4.5
10287	88	2058	4
10288	88	2064	4
10289	88	2078	5
10290	88	2091	4
10291	88	2099	3.5
10292	88	2108	4.5
10293	88	2109	4
10294	88	2110	4
10295	88	2111	3
10296	88	2122	4
10297	88	2135	4
10298	88	2144	4
10299	88	2153	3.5
10300	88	2159	5
10301	88	2163	4.5
10302	88	2167	4
10303	88	2172	5
10304	88	2173	3.5
10305	88	2184	4.5
10306	88	2198	4.5
10307	88	2209	4
10308	88	2210	5
10309	88	2211	5
10310	88	2217	4
10311	88	2224	4.5
10312	88	2233	5
10313	88	2237	4.5
10314	88	2239	4.5
10315	88	2246	5
10316	88	2260	4
10317	88	2282	5
10318	88	2294	4.5
10319	88	2304	3
10320	88	2330	4
10321	88	2332	5
10322	88	2358	5
10323	88	2360	5
10324	88	2366	4
10325	88	2373	4
10326	88	2387	4
10327	88	2388	3
10328	88	2389	4.5
10329	88	2393	5
10330	88	2398	5
10331	88	2424	5
10332	88	2430	4.5
10333	88	2442	4
10334	88	2457	4
10335	88	2459	4.5
10336	88	2470	4.5
10337	88	2481	5
10338	88	2483	4.5
10339	88	2484	4
10340	88	2487	5
10341	88	2490	4.5
10342	88	2491	3.5
10343	88	2515	4
10344	88	2520	4.5
10345	88	2524	4.5
10346	88	2541	4
10347	88	2542	4
10348	88	2568	5
10349	88	2593	4
10350	88	2594	4
10351	88	2595	3
10352	88	2596	4
10353	88	2604	3.5
10354	88	2605	4
10355	88	2612	4.5
10356	88	2616	4.5
10357	88	2628	4
10358	88	2667	4.5
10359	88	2668	5
10360	88	2669	5
10361	88	2693	4
10362	88	2694	3.5
10363	88	2695	3.5
10364	88	2704	3.5
10365	88	2713	5
10366	88	2740	5
10367	88	2757	5
10368	88	2766	4
10369	88	2788	4
10370	88	2798	4
10371	88	2799	4.5
10372	88	2800	4
10373	88	2805	4.5
10374	88	2806	3
10375	88	2819	5
10376	88	2837	4
10377	88	2844	4
10378	88	2863	4.5
10379	88	2876	5
10380	88	2878	4.5
10381	88	2898	5
10382	88	2909	3
10383	88	2921	4
10384	88	2922	4
10385	88	2924	4
10386	88	2925	4.5
10387	88	2926	4.5
10388	88	2931	3.5
10389	88	2942	4.5
10390	88	2958	5
10391	88	2965	3.5
10392	88	2966	3.5
10393	88	2969	3.5
10394	88	2975	4
10395	88	2982	4
10396	88	2992	3.5
10397	88	2998	3.5
10398	88	3000	5
10399	88	3011	4.5
10400	88	3046	5
10401	88	3051	3
10402	88	3052	3.5
10403	88	3055	5
10404	88	3058	5
10405	88	3073	5
10406	88	3083	5
10407	88	3087	4
10408	88	3100	3.5
10409	88	3108	4.5
10410	88	3132	3
10411	88	3149	4
10412	88	3150	5
10413	88	3155	4.5
10414	88	3163	4.5
10415	88	3165	4.5
10416	88	3169	3.5
10417	88	3173	4
10418	88	3177	4.5
10419	88	3208	4.5
10420	88	3218	4
10421	88	3219	4
10422	88	3222	3.5
10423	88	3230	3.5
10424	88	3242	4
10425	88	3248	4.5
10426	88	3252	3
10427	88	3312	4
10428	88	3323	5
10429	88	3337	3.5
10430	88	3338	3.5
10431	88	3345	5
10432	88	3351	3.5
10433	88	3380	4.5
10434	88	3382	4
10435	88	3389	4
10436	88	3410	5
10437	88	3411	4.5
10438	88	3419	4
10439	88	3455	3.5
10440	88	3481	4.5
10441	88	3482	3
10442	88	3499	3
10443	88	3500	4
10444	88	3510	4.5
10445	88	3517	5
10446	88	3527	4
10447	88	3561	4.5
10448	88	3572	4.5
10449	88	3578	4
10450	88	3615	4.5
10451	88	3621	4.5
10452	88	3638	3.5
10453	88	3666	4
10454	88	3667	3.5
10455	88	3669	3
10456	88	3696	3.5
10457	88	3698	4
10458	88	3709	4.5
10459	88	3738	4.5
10460	88	3754	4.5
10461	88	3792	4.5
10462	88	3804	3.5
10463	88	3806	4
10464	88	3812	4.5
10465	88	3824	5
10466	88	3846	4
10467	88	3851	4.5
10468	88	3860	4.5
10469	88	3870	3
10470	88	3874	4.5
10471	88	3875	2
10472	88	3886	5
10473	88	3888	4.5
10474	88	3900	4.5
10475	88	3956	3
10476	88	3971	4.5
10477	88	4033	3.5
10478	88	4056	3
10479	88	4061	3.5
10480	88	4068	3.5
10481	88	4074	5
10482	88	4080	5
10483	88	4109	5
10484	88	4126	4.5
10485	88	4127	3.5
10486	88	4135	4
10487	88	4154	4.5
10488	88	4173	4.5
10489	88	4177	3
10490	88	4184	2
10491	88	4200	3
10492	88	4211	4.5
10493	88	4213	3
10494	88	4224	4
10495	88	4228	4
10496	88	4253	4.5
10497	88	4279	4
10498	88	4302	4.5
10499	88	4313	4.5
10500	88	4316	4.5
10501	88	4363	3
10502	88	4435	4.5
10503	88	4458	5
10504	88	4470	2.5
10505	88	4472	3.5
10506	88	4485	4
10507	88	4487	4
10508	88	4560	4
10509	88	4583	4.5
10510	88	4642	4.5
10511	88	4653	4
10512	88	4673	3.5
10513	88	4681	4
10514	88	4697	3.5
10515	88	4702	4
10516	88	4706	3.5
10517	88	4779	4
10518	88	4798	3
10519	88	4801	4
10520	88	4803	5
10521	88	4818	4
10522	88	4829	4.5
10523	88	4832	4.5
10524	88	4909	4.5
10525	88	4954	4.5
10526	88	4975	3.5
10527	88	4994	4.5
10528	88	4997	3
10529	88	5003	4.5
10530	88	5005	4.5
10531	88	5037	3
10532	88	5042	4
10533	88	5052	4
10534	88	5054	4.5
10535	88	5068	4.5
10536	88	5079	4.5
10537	88	5085	3.5
10538	88	5097	4.5
10539	88	5109	3
10540	88	5111	4
10541	88	5126	2.5
10542	88	5167	4.5
10543	88	5175	3.5
10544	88	5185	4
10545	88	5202	4.5
10546	88	5203	3.5
10547	88	5207	4.5
10548	88	5275	4
10549	88	5312	3.5
10550	88	5322	3.5
10551	88	5329	5
10552	88	5365	4.5
10553	88	5370	4
10554	88	5385	4.5
10555	88	5572	4.5
10556	88	5627	4
10557	88	5652	5
10558	88	5677	4
10559	88	5682	3.5
10560	88	5710	4.5
10561	88	5724	3.5
10562	88	5726	4
10563	88	5733	3.5
10564	88	5743	4
10565	88	5762	3.5
10566	88	5795	4
10567	88	5802	4.5
10568	88	5806	4
10569	88	5809	3
10570	88	5839	4
10571	88	5853	3.5
10572	88	5859	4
10573	88	5875	4
10574	88	5881	4.5
10575	88	5883	4.5
10576	88	5900	3
10577	88	6156	5
10578	88	6180	4
10579	88	6186	4.5
10580	88	6381	4
10581	88	6411	4.5
10582	88	6421	4.5
10583	88	6448	3
10584	88	6450	3.5
10585	88	6491	3.5
10586	88	6563	4.5
10587	88	6566	3.5
10588	88	6602	5
10589	88	6606	5
10590	88	6620	5
10591	88	6627	4
10592	88	6632	4
10593	88	6635	3.5
10594	88	6642	4
10595	88	6672	5
10596	88	6673	4
10597	88	6677	4
10598	88	6727	4
10599	88	6742	3
10600	88	6787	4.5
10601	88	6828	4
10602	88	6850	4
10603	88	6946	5
10604	88	6948	4
10605	88	7033	3.5
10606	88	7045	4.5
10607	88	7056	2.5
10608	88	7061	4.5
10609	88	7155	4
10610	88	7161	5
10611	88	7163	3
10612	88	7180	4
10613	88	7200	5
10614	88	7230	3.5
10615	88	7271	4.5
10616	88	7376	4
10617	88	7439	4
10618	88	7446	4
10619	88	7542	5
10620	88	7589	4
10621	88	7599	3.5
10622	88	7620	4
10623	88	7669	4
10624	88	7670	5
10625	88	7715	4.5
10626	88	7758	4.5
10627	88	7798	4.5
10628	88	7802	3.5
10629	88	7816	4.5
10630	88	7914	4.5
10631	88	8096	4
10632	88	8105	3.5
10633	88	8121	4.5
10634	88	8123	3.5
10635	88	8130	5
10636	88	8148	4.5
10637	88	8184	4
10638	88	8291	4.5
10639	88	8351	4
10640	88	8355	4.5
10641	88	8538	4.5
10642	88	8629	4
10643	88	8630	4.5
10644	88	8703	3.5
10645	88	8704	4
10646	88	8779	4
10647	88	8782	4.5
10648	88	9014	4.5
10649	88	9073	4.5
10650	88	9115	4.5
10651	88	9122	4
10652	88	9369	4
10653	88	9418	5
10654	88	9477	4.5
10655	88	9506	5
10656	88	9838	4.5
10657	88	9853	4
10658	89	1	4
10659	89	5	2
10660	89	10	4
10661	89	11	4
10662	89	17	3.5
10663	89	21	3.5
10664	89	23	3
10665	89	32	3
10666	89	34	4
10667	89	37	3.5
10668	89	45	2
10669	89	48	3.5
10670	89	58	2.5
10671	89	79	3.5
10672	89	99	4
10673	89	100	3.5
10674	89	121	4
10675	89	130	2
10676	89	140	3
10677	89	161	3
10678	89	162	2
10679	89	170	3
10680	89	195	3.5
10681	89	203	2
10682	89	224	3
10683	89	231	4
10684	89	254	3.5
10685	89	258	2.5
10686	89	259	4.5
10687	89	261	4
10688	89	278	3
10689	89	280	4.5
10690	89	290	4
10691	89	305	3
10692	89	306	3.5
10693	89	317	2
10694	89	318	3.5
10695	89	324	4
10696	89	327	3
10697	89	337	2
10698	89	340	3.5
10699	89	358	2.5
10700	89	360	4
10701	89	361	3.5
10702	89	381	2
10703	89	383	4
10704	89	403	3
10705	89	406	3
10706	89	427	4.5
10707	89	446	2
10708	89	472	2.5
10709	89	485	4
10710	89	487	4
10711	89	520	4
10712	89	522	4.5
10713	89	523	4
10714	89	524	3
10715	89	525	3.5
10716	89	526	4
10717	89	528	5
10718	89	530	3
10719	89	538	3
10720	89	546	4
10721	89	565	3
10722	89	595	3
10723	89	620	3.5
10724	89	622	3
10725	89	630	3.5
10726	89	647	4
10727	89	665	3.5
10728	89	696	3
10729	89	731	4
10730	89	734	5
10731	89	735	4
10732	89	741	4.5
10733	89	746	3
10734	89	753	3
10735	89	789	4
10736	89	810	3.5
10737	89	830	3
10738	89	840	4
10739	89	873	2.5
10740	89	887	4
10741	89	895	4
10742	89	923	3.5
10743	89	959	5
10744	89	960	5
10745	89	961	4
10746	89	963	4
10747	89	970	3
10748	89	972	4
10749	89	975	4
10750	89	976	4
10751	89	977	4
10752	89	991	3
10753	89	1000	3
10754	89	1030	3.5
10755	89	1042	4
10756	89	1051	4
10757	89	1061	3
10758	89	1071	4
10759	89	1072	3
10760	89	1078	3.5
10761	89	1111	3
10762	89	1133	2.5
10763	89	1134	4
10764	89	1214	3
10765	89	1226	3.5
10766	89	1233	4
10767	89	1241	4
10768	89	1261	3
10769	89	1288	3.5
10770	89	1296	3
10771	89	1349	3
10772	89	1351	4
10773	89	1368	3
10774	89	1399	4
10775	89	1402	2
10776	89	1482	4.5
10777	89	1489	3.5
10778	89	1494	3
10779	89	1578	3.5
10780	89	1631	2.5
10781	89	1632	3
10782	89	1645	4
10783	89	1660	3
10784	89	1684	4
10785	89	1690	3.5
10786	89	1698	4
10787	89	1699	3.5
10788	89	1719	3.5
10789	89	1743	2.5
10790	89	1796	3
10791	89	1816	2.5
10792	89	1822	3
10793	89	1828	3
10794	89	1835	3
10795	89	1844	3
10796	89	1865	3
10797	89	1906	3
10798	89	1907	4
10799	89	2004	1
10800	89	2057	3.5
10801	89	2058	4.5
10802	89	2079	2.5
10803	89	2099	3
10804	89	2144	4
10805	89	2158	3
10806	89	2163	3.5
10807	89	2164	2
10808	89	2172	4.5
10809	89	2200	2.5
10810	89	2210	3
10811	89	2233	4
10812	89	2235	3
10813	89	2275	3.5
10814	89	2282	3
10815	89	2366	3
10816	89	2488	2
10817	89	2526	3.5
10818	89	2542	4
10819	89	2591	3
10820	89	2713	4
10821	89	2804	2
10822	89	2837	3.5
10823	89	2924	3
10824	89	3000	4
10825	89	3073	3
10826	89	3122	4
10827	89	3189	4
10828	89	3192	3.5
10829	89	3323	3.5
10830	89	3330	2.5
10831	89	3380	4
10832	89	3421	4
10833	89	3425	2
10834	89	3491	3
10835	89	3572	4
10836	89	3634	2.5
10837	89	3693	2
10838	89	3696	3
10839	89	3886	4.5
10840	89	4126	2
10841	89	4200	1
10842	89	4435	2
10843	89	4458	4.5
10844	89	4660	3
10845	89	4687	2
10846	89	4779	4
10847	89	5052	2
10848	89	5207	4.5
10849	89	5289	2.5
10850	89	5342	3
10851	89	5559	4
10852	89	5572	3.5
10853	89	5574	4.5
10854	89	5710	3
10855	89	5809	3.5
10856	89	5894	2.5
10857	89	6595	3.5
10858	89	6636	3
10859	89	6714	2
10860	89	6745	4
10861	89	7092	2.5
10862	89	7109	3.5
10863	89	7151	2.5
10864	89	7248	2
10865	89	7307	4
10866	89	7349	3.5
10867	89	7378	4
10868	89	7415	3
10869	89	7472	3.5
10870	89	7476	2.5
10871	89	7507	3
10872	89	7566	2
10873	89	8036	2.5
10874	89	8065	3.5
10875	89	8068	2.5
10876	89	8224	3.5
10877	89	8351	3
10878	89	8452	4
10879	89	8598	3.5
10880	89	8953	2.5
10881	89	9010	4
10882	89	9263	2
10883	90	427	1
10884	90	964	5
10885	90	991	5
10886	90	1296	2
10887	90	1375	5
10888	90	1528	1
10889	90	2543	2
10890	90	2906	5
10891	90	3016	5
10892	90	3052	1
10893	90	3063	1
10894	90	3064	1
10895	90	3074	1
10896	90	3087	1
10897	90	3103	1
10898	90	3125	1
10899	90	3127	1
10900	90	3130	1
10901	90	3132	1
10902	90	3133	1
10903	90	3136	1
10904	91	17	3
10905	91	28	3
10906	91	58	4
10907	91	99	4
10908	91	261	1
10909	91	317	5
10910	91	422	3
10911	91	460	5
10912	91	472	5
10913	91	524	5
10914	91	538	5
10915	91	662	3
10916	91	972	3
10917	91	994	4
10918	91	1105	5
10919	91	1118	4
10920	91	1296	4
10921	91	1361	5
10922	91	1591	5
10923	91	1816	4
10924	91	1847	4
10925	91	1850	4
10926	91	1907	5
10927	91	2067	4
10928	91	2099	4
10929	91	2146	5
10930	91	2210	5
10931	91	2211	4
10932	91	2282	5
10933	91	2464	4
10934	91	2483	3
10935	91	2521	5
10936	91	2550	5
10937	91	2588	3
10938	91	2596	4
10939	91	2597	4
10940	92	17	3
10941	92	21	4
10942	92	32	5
10943	92	48	5
10944	92	88	2
10945	92	127	4
10946	92	130	4
10947	92	162	1
10948	92	203	3
10949	92	207	5
10950	92	208	3
10951	92	224	3
10952	92	258	4
10953	92	261	5
10954	92	264	4
10955	92	280	5
10956	92	298	4
10957	92	300	1
10958	92	317	4
10959	92	318	4
10960	92	327	5
10961	92	340	3
10962	92	389	3
10963	92	403	3
10964	92	406	4
10965	92	422	4
10966	92	427	4
10967	92	446	4
10968	92	454	5
10969	92	472	4
10970	92	483	3
10971	92	520	3
10972	92	521	3
10973	92	523	4
10974	92	524	3
10975	92	525	4
10976	92	526	5
10977	92	530	3
10978	93	1	4
10979	93	3	3
10980	93	5	3
10981	93	7	3
10982	93	14	3
10983	93	17	5
10984	93	25	3
10985	93	36	4
10986	93	49	4
10987	93	54	5
10988	93	58	3
10989	93	73	1
10990	93	120	3
10991	93	121	3
10992	93	231	3
10993	93	538	4
10994	93	553	4
10995	93	565	3
10996	93	602	5
10997	93	611	2
10998	93	620	3
10999	93	645	3
11000	93	647	4
11001	93	659	3
11002	93	662	4
11003	93	683	3
11004	93	694	4
11005	93	696	5
11006	93	806	5
11007	93	848	5
11008	93	849	5
11009	93	855	5
11010	93	972	3
11011	93	1133	1
11012	93	1222	4
11013	94	180	3.5
11014	94	191	2
11015	94	250	3
11016	94	261	2
11017	94	299	0.5
11018	94	376	3.5
11019	94	503	3.5
11020	94	526	4.5
11021	94	656	3.5
11022	94	981	3
11023	94	1018	5
11024	94	1072	3
11025	94	1298	5
11026	94	1608	4
11027	94	1654	2
11028	94	1657	3
11029	94	1730	3
11030	94	1771	3.5
11031	94	2147	3.5
11032	94	2272	4
11033	94	2661	4
11034	94	3248	4
11035	94	3534	4
11036	94	4526	3
11037	94	4673	4
11038	94	4779	5
11039	94	4920	2
11040	94	5042	5
11041	94	5106	3.5
11042	94	5328	5
11043	94	5530	4.5
11044	94	5542	3.5
11045	94	6301	2.5
11046	94	6698	3
11047	94	6707	1.5
11048	94	6825	4.5
11049	95	9	3
11050	95	12	2
11051	95	17	4
11052	95	62	2
11053	95	88	3
11054	95	95	3
11055	95	101	3
11056	95	107	4
11057	95	231	4
11058	95	440	3
11059	95	542	3
11060	95	558	1
11061	95	565	3
11062	95	568	3
11063	95	581	3
11064	95	620	3
11065	95	622	3
11066	95	638	5
11067	95	647	3
11068	95	652	3
11069	95	691	3
11070	95	696	4
11071	95	707	3
11072	95	873	3
11073	95	947	3
11074	95	972	2
11075	95	994	4
11076	95	1103	3
11077	95	1131	3
11078	95	1167	3
11079	95	1198	3
11080	95	1201	4
11081	95	1215	4
11082	96	1	5
11083	96	3	4
11084	96	5	3
11085	96	6	4
11086	96	7	3
11087	96	9	1
11088	96	14	3
11089	96	17	2
11090	96	25	3
11091	96	36	5
11092	96	49	1
11093	96	54	4
11094	96	58	5
11095	96	61	3
11096	96	73	3
11097	96	88	3
11098	96	95	4
11099	96	97	3
11100	96	101	3
11101	96	117	3
11102	96	120	4
11103	96	121	4
11104	96	231	5
11105	96	336	4
11106	96	440	2
11107	96	538	4
11108	96	553	1
11109	96	560	1
11110	96	565	3
11111	96	568	1
11112	96	572	1
11113	96	611	2
11114	96	620	4
11115	96	622	3
11116	96	623	1
11117	96	626	1
11118	96	639	1
11119	96	645	1
11120	96	647	4
11121	96	650	1
11122	96	651	1
11123	96	653	3
11124	96	654	3
11125	96	659	4
11126	96	662	4
11127	96	677	4
11128	96	873	4
11129	96	1103	3
11130	96	1151	5
11131	97	1	3.5
11132	97	2	4
11133	97	231	4
11134	97	324	5
11135	97	404	3
11136	97	427	4.5
11137	97	959	5
11138	97	963	4
11139	97	972	5
11140	97	976	5
11141	97	977	4
11142	97	1359	3
11143	97	1481	5
11144	97	1581	3.5
11145	97	1638	3.5
11146	97	1816	4
11147	97	1867	4
11148	97	2057	5
11149	97	2099	4
11150	97	2146	4.5
11151	97	2330	4.5
11152	97	2497	3.5
11153	97	3000	4
11154	97	3323	4.5
11155	97	3380	4
11156	97	3807	5
11157	97	3812	4.5
11158	97	3886	4
11159	97	4033	4
11160	97	4127	4
11161	97	4458	4.5
11162	97	4673	5
11163	97	4681	4
11164	97	4697	4
11165	97	4705	4
11166	97	4779	4
11167	97	5037	4
11168	97	5207	5
11169	97	5269	5
11170	97	5328	3.5
11171	97	5337	4
11172	97	5585	4.5
11173	97	5618	3.5
11174	97	5839	4
11175	97	6620	4
11176	97	6649	3.5
11177	97	6942	4
11178	97	7019	4
11179	97	7022	3.5
11180	97	7083	3
11181	97	7273	4
11182	97	7363	3
11183	97	7383	3.5
11184	97	7607	3.5
11185	97	7620	3.5
11186	97	7651	4
11187	97	7715	4
11188	97	7761	5
11189	97	7763	4
11190	97	7829	4
11191	97	8090	4
11192	97	8093	4
11193	97	8096	4
11194	97	8121	4.5
11195	97	8159	4
11196	97	8184	4
11197	97	8229	4.5
11198	97	8240	4
11199	97	8264	4
11200	97	8422	4.5
11201	97	8489	5
11202	97	8543	4
11203	97	8600	3.5
11204	97	8629	4.5
11205	97	8630	5
11206	97	8761	4
11207	97	8780	4.5
11208	97	8826	4.5
11209	97	8925	4
11210	97	8958	3.5
11211	97	9014	5
11212	97	9024	3
11213	97	9122	4.5
11214	97	9299	4
11215	97	9322	4
11216	97	9360	4
11217	97	9383	4.5
11218	97	9400	4.5
11219	97	9401	4
11220	97	9438	4.5
11221	97	9525	4.5
11222	97	9538	4.5
11223	97	9659	4
11224	97	9680	3.5
11225	97	9695	3
11226	97	9700	3.5
11227	97	9705	3.5
11228	97	9712	4
11229	97	9734	4
11230	97	9802	3.5
11231	97	9821	4
11232	97	9839	4.5
11233	97	9897	3
11234	97	9929	4.5
11235	97	9941	4
11236	97	9985	5
11237	97	10006	4.5
11238	97	10107	4
11239	97	10123	4
11240	97	10160	4
11241	97	10256	4.5
11242	97	10266	4
11243	98	24	3
11244	98	48	1
11245	98	95	4
11246	98	565	4
11247	98	788	3
11248	98	957	5
11249	98	959	3
11250	98	1029	5
11251	98	1094	4
11252	98	1302	5
11253	98	1535	4
11254	98	1601	3
11255	98	1636	4
11256	98	1828	4
11257	98	1852	2
11258	98	1981	4
11259	98	2144	4
11260	98	2147	3
11261	98	2167	1
11262	98	2248	2
11263	98	2320	3
11264	98	2410	5
11265	98	2563	4
11266	98	2761	4
11267	99	247	5
11268	99	280	3
11269	99	404	1.5
11270	99	469	3
11271	99	677	2.5
11272	99	957	2
11273	99	960	5
11274	99	992	2.5
11275	99	1047	3.5
11276	99	1113	5
11277	99	1570	4
11278	99	1581	2
11279	99	1654	2
11280	99	1660	2.5
11281	99	1976	3
11282	99	2173	3.5
11283	99	2355	3.5
11284	99	2430	4
11285	99	2490	2.5
11286	99	2597	4
11287	99	2822	3
11288	100	1	3
11289	100	46	5
11290	100	127	5
11291	100	135	2.5
11292	100	144	1.5
11293	100	232	5
11294	100	324	5
11295	100	472	5
11296	100	496	3.5
11297	100	529	3.5
11298	100	650	1.5
11299	100	651	3.5
11300	100	696	3
11301	100	739	1.5
11302	100	836	5
11303	100	843	5
11304	100	983	3
11305	100	1122	5
11306	100	1137	2.5
11307	100	1203	3.5
11308	100	1518	3.5
11309	100	1575	3
11310	100	1586	3
11311	100	1615	1
11312	100	1638	3
11313	100	1640	4
11314	100	1641	3
11315	100	1656	4
11316	100	1674	4.5
11317	100	1685	4.5
11318	100	1723	5
11319	100	1822	3
11320	100	1836	3.5
11321	100	1867	3
11322	100	2052	5
11323	100	2099	5
11324	100	2146	2.5
11325	100	2159	0.5
11326	100	2167	0.5
11327	100	2332	0.5
11328	100	2389	4.5
11329	100	2520	3
11330	100	2711	2.5
11331	100	2765	2.5
11332	100	2837	5
11333	100	3000	4.5
11334	100	3087	4
11335	100	3173	4
11336	100	3380	3
11337	100	3812	5
11338	100	3818	2.5
11339	100	3886	0.5
11340	100	3888	4
11341	100	4033	3.5
11342	100	4173	3
11343	100	4279	5
11344	100	4386	2.5
11345	100	4458	4.5
11346	100	4696	0.5
11347	100	4926	2.5
11348	100	4934	4
11349	100	5207	5
11350	101	42	1
11351	101	45	5
11352	101	48	5
11353	101	117	3
11354	101	127	4.5
11355	101	156	4
11356	101	259	5
11357	101	261	5
11358	101	280	5
11359	101	317	4
11360	101	362	3.5
11361	101	523	5
11362	101	538	4
11363	101	560	2
11364	101	645	5
11365	101	887	5
11366	101	923	5
11367	101	961	4.5
11368	101	963	4.5
11369	101	964	4.5
11370	101	970	4.5
11371	101	976	4.5
11372	101	984	4
11373	101	1051	3.5
11374	101	1057	4
11375	101	1233	4.5
11376	101	1267	3.5
11377	101	1272	2
11378	101	1330	4
11379	101	1361	4.5
11380	101	1569	4.5
11381	101	1591	4
11382	101	1844	4.5
11383	101	2002	4.5
11384	101	2034	4.5
11385	101	2057	4.5
11386	101	2075	4.5
11387	101	2153	4
11388	101	2282	2
11389	101	2362	4
11390	101	2366	5
11391	101	2616	5
11392	101	2713	5
11393	101	2819	5
11394	101	2822	4
11395	101	2870	3.5
11396	101	3109	4.5
11397	101	3163	4.5
11398	101	3333	5
11399	101	3807	4
11400	101	3971	5
11401	101	4436	4
11402	101	4583	4.5
11403	101	6616	3.5
11404	101	6734	4
11405	101	6756	5
11406	101	6967	4.5
11407	101	7038	4
11408	101	7161	4.5
11409	101	7282	4.5
11410	101	7475	4
11411	101	7552	4
11412	101	7670	4.5
11413	101	7719	3.5
11414	101	7761	3
11415	101	8086	4.5
11416	101	8130	5
11417	101	8264	3.5
11418	101	8422	4
11419	101	8429	4.5
11420	101	8500	3
11421	101	8543	3.5
11422	102	32	5
11423	102	48	5
11424	102	95	4
11425	102	127	4
11426	102	151	1
11427	102	195	4
11428	102	259	4
11429	102	261	5
11430	102	280	5
11431	102	469	5
11432	102	526	4
11433	102	538	5
11434	102	553	4
11435	102	627	4
11436	102	645	3
11437	102	652	4
11438	102	700	5
11439	102	863	4
11440	102	864	3
11441	102	959	4
11442	102	975	4
11443	102	1133	4
11444	102	1250	3
11445	102	1296	5
11446	102	1310	4
11447	102	1342	4
11448	102	1344	5
11449	102	1361	4
11450	102	1363	2
11451	102	1375	5
11452	102	1382	5
11453	102	1411	4
11454	102	1461	1
11455	102	1591	5
11456	102	1827	3
11457	102	1839	4
11458	102	1844	5
11459	102	1867	4
11460	102	1906	5
11461	102	1907	4
11462	102	1937	2
11463	102	1943	3
11464	102	1989	2
11465	102	1992	3
11466	102	2001	4
11467	102	2002	4
11468	102	2033	1
11469	102	2057	5
11470	102	2077	3
11471	102	2144	3
11472	102	2147	2
11473	102	2151	4
11474	102	2159	5
11475	102	2160	1
11476	102	2161	1
11477	102	2163	2
11478	102	2164	4
11479	102	2167	4
11480	102	2169	4
11481	102	2172	4
11482	102	2174	4
11483	102	2179	3
11484	102	2209	5
11485	102	2210	5
11486	102	2218	3
11487	102	2260	4
11488	102	2272	4
11489	102	2282	5
11490	102	2285	3
11491	102	2313	5
11492	102	2327	4
11493	102	2366	5
11494	102	2381	3
11495	102	2398	4
11496	102	2402	3
11497	102	2466	4
11498	102	2483	3
11499	102	2496	2
11500	102	2497	4
11501	102	2520	4
11502	102	2531	4
11503	102	2540	4
11504	102	2543	3
11505	102	2545	4
11506	102	2621	4
11507	102	2629	3
11508	102	2638	3
11509	102	2704	4
11510	102	2705	4
11511	102	2744	4
11512	102	2762	2
11513	102	2766	4
11514	102	2788	4
11515	102	2789	3
11516	102	2790	3
11517	102	2805	4
11518	102	2806	4
11519	102	2823	3
11520	102	2837	5
11521	102	2845	1
11522	102	2847	1
11523	102	2863	4
11524	102	2869	3
11525	102	2870	4
11526	102	2883	1
11527	102	2963	4
11528	102	2965	4
11529	102	2966	3
11530	102	2967	2
11531	102	2969	1
11532	102	3000	4
11533	102	3020	1
11534	102	3052	2
11535	102	3072	4
11536	102	3073	4
11537	102	3087	4
11538	102	3108	4
11539	102	3125	3
11540	102	3130	1
11541	102	3132	3
11542	102	3134	1
11543	102	3135	4
11544	102	3149	5
11545	102	3152	4
11546	102	3176	3
11547	102	3184	5
11548	103	1	3
11549	103	2	5
11550	103	17	5
11551	103	28	5
11552	103	41	5
11553	103	144	4
11554	103	252	1
11555	103	361	5
11556	103	414	5
11557	103	475	5
11558	103	496	4
11559	103	519	3
11560	103	521	2
11561	103	647	3
11562	103	669	3
11563	103	683	4
11564	103	835	4
11565	103	895	3
11566	103	923	5
11567	103	1006	4
11568	103	1037	5
11569	103	1257	2
11570	103	1261	3
11571	103	1368	2
11572	103	1378	4
11573	103	1412	4
11574	103	1561	5
11575	103	1583	5
11576	103	1643	4
11577	103	1796	4
11578	103	1908	5
11579	103	2237	4
11580	103	2300	2
11581	103	2330	2
11582	103	2465	5
11583	103	2587	1
11584	103	2770	5
11585	103	2934	2
11586	103	3056	5
11587	104	3	3
11588	104	6	4
11589	104	11	5
11590	104	16	3
11591	104	17	4
11592	104	21	4
11593	104	22	5
11594	104	25	3
11595	104	31	3
11596	104	32	4
11597	104	34	4
11598	104	37	4
11599	104	42	3
11600	104	45	5
11601	104	46	2
11602	104	48	5
11603	104	64	4
11604	104	99	4
11605	104	100	3
11606	104	121	4
11607	104	123	4
11608	104	127	5
11609	104	130	3
11610	104	135	4
11611	104	137	4
11612	104	138	4
11613	104	140	5
11614	104	142	3
11615	104	146	3
11616	104	149	3
11617	104	161	3
11618	104	162	3
11619	104	170	3
11620	104	171	3
11621	104	176	3
11622	104	181	3
11623	104	195	4
11624	104	196	3
11625	104	197	3
11626	104	199	3
11627	104	203	4
11628	104	217	3
11629	104	224	3
11630	104	227	3
11631	104	232	4
11632	104	246	3
11633	104	252	4
11634	104	254	3
11635	104	261	5
11636	104	277	4
11637	104	281	3
11638	104	290	5
11639	104	294	4
11640	104	298	3
11641	104	303	3
11642	104	305	3
11643	104	310	4
11644	104	311	3
11645	104	316	3
11646	104	317	4
11647	104	318	4
11648	104	324	5
11649	104	327	3
11650	104	330	3
11651	104	337	5
11652	104	340	4
11653	104	341	3
11654	104	360	3
11655	104	362	3
11656	104	381	3
11657	104	391	3
11658	104	403	4
11659	104	406	4
11660	104	422	4
11661	104	427	5
11662	104	431	3
11663	104	443	3
11664	104	446	4
11665	104	453	5
11666	104	483	5
11667	104	495	3
11668	104	496	3
11669	104	497	2
11670	104	519	5
11671	104	520	4
11672	104	521	4
11673	104	522	3
11674	104	523	5
11675	104	524	3
11676	104	525	3
11677	104	526	5
11678	104	528	4
11679	104	529	2
11680	104	530	4
11681	104	538	3
11682	104	551	2
11683	104	565	4
11684	104	620	4
11685	104	622	4
11686	104	647	5
11687	104	654	5
11688	105	1	4
11689	105	2	3
11690	105	5	3
11691	105	10	3
11692	105	11	4
11693	105	17	5
11694	105	25	3
11695	105	37	3
11696	105	41	3
11697	105	99	4
11698	105	121	3
11699	105	127	4
11700	105	128	3
11701	105	130	3
11702	105	138	4
11703	105	144	3
11704	105	161	3
11705	105	162	3
11706	105	194	4
11707	105	197	3
11708	105	227	3
11709	105	231	4
11710	105	236	3
11711	105	252	3
11712	105	261	3
11713	105	280	4
11714	105	290	5
11715	105	300	3
11716	105	310	4
11717	105	311	4
11718	105	317	4
11719	105	318	3
11720	105	328	4
11721	105	331	3
11722	105	337	4
11723	105	340	4
11724	105	383	3
11725	105	389	4
11726	105	403	4
11727	105	406	5
11728	105	422	3
11729	105	427	5
11730	105	436	4
11731	105	443	4
11732	105	446	3
11733	105	454	4
11734	105	472	4
11735	105	483	4
11736	105	520	3
11737	105	521	4
11738	105	523	4
11739	105	524	4
11740	105	525	3
11741	105	526	5
11742	105	530	4
11743	105	564	3
11744	105	565	4
11745	105	602	3
11746	105	622	4
11747	105	647	3
11748	105	653	3
11749	105	654	2
11750	105	659	4
11751	105	662	4
11752	105	677	4
11753	105	691	2
11754	105	734	4
11755	105	741	3
11756	105	742	5
11757	105	774	5
11758	105	843	4
11759	105	844	3
11760	105	849	3
11761	105	873	3
11762	105	886	3
11763	105	892	4
11764	105	895	5
11765	105	898	5
11766	105	926	4
11767	105	947	5
11768	105	959	3
11769	105	960	3
11770	105	961	4
11771	105	963	3
11772	105	972	3
11773	105	975	3
11774	105	976	3
11775	105	987	3
11776	105	995	4
11777	105	1000	3
11778	105	1002	3
11779	105	1006	3
11780	105	1019	3
11781	105	1025	3
11782	105	1047	5
11783	105	1051	4
11784	105	1055	3
11785	105	1058	5
11786	105	1061	3
11787	105	1063	3
11788	105	1066	4
11789	105	1103	3
11790	105	1111	3
11791	105	1116	4
11792	105	1117	3
11793	105	1118	3
11794	105	1122	4
11795	105	1133	3
11796	105	1136	4
11797	105	1145	3
11798	106	280	5
11799	106	1582	2.5
11800	106	3886	5
11801	106	4458	5
11802	106	4705	4.5
11803	106	4803	5
11804	106	5201	3.5
11805	106	5207	5
11806	106	5624	4
11807	106	5883	5
11808	106	6642	4.5
11809	106	6946	5
11810	106	7180	5
11811	106	7200	4
11812	106	7273	4
11813	106	7307	4
11814	106	7670	5
11815	106	7715	5
11816	106	7742	5
11817	106	7761	5
11818	106	7985	5
11819	106	8086	5
11820	106	8096	2
11821	106	8354	4
11822	106	8422	5
11823	106	8489	5
11824	106	8500	4
11825	106	8600	5
11826	106	8630	5
11827	106	8925	5
11828	106	9122	4.5
11829	106	9227	5
11830	106	9505	5
11831	106	9538	4
11832	106	9547	4.5
11833	106	9855	5
11834	106	9897	4
11835	106	9915	5
11836	106	9983	5
11837	106	9985	5
11838	106	10000	5
11839	106	10070	5
11840	106	10072	3.5
11841	106	10077	5
11842	106	10078	4.5
11843	106	10079	4.5
11844	106	10090	5
11845	106	10092	2
11846	106	10137	4
11847	106	10138	5
11848	106	10158	4
11849	106	10160	3
11850	106	10161	5
11851	106	10199	5
11852	106	10211	4
11853	106	10249	3.5
11854	106	10265	4
11855	107	1	3
11856	107	5	3
11857	107	6	4
11858	107	10	2
11859	107	11	4
11860	107	21	3
11861	107	25	3
11862	107	32	4
11863	107	45	4
11864	107	48	5
11865	107	54	5
11866	107	58	3
11867	107	64	4
11868	107	65	5
11869	107	83	4
11870	107	87	4
11871	107	99	5
11872	107	100	3
11873	107	109	4
11874	107	112	3
11875	107	121	4
11876	107	123	2
11877	107	130	2
11878	107	136	2
11879	107	142	4
11880	107	151	4
11881	107	167	2
11882	107	208	4
11883	107	217	3
11884	107	220	4
11885	107	224	4
11886	107	231	5
11887	107	243	2
11888	107	258	4
11889	107	259	4
11890	107	261	5
11891	107	264	4
11892	107	271	3
11893	107	277	3
11894	107	280	3
11895	107	281	5
11896	107	309	4
11897	107	310	3
11898	107	314	2
11899	107	317	5
11900	107	321	4
11901	107	325	3
11902	107	327	3
11903	107	328	3
11904	107	331	3
11905	107	332	4
11906	107	337	3
11907	107	340	3
11908	107	380	3
11909	107	383	4
11910	107	385	4
11911	107	387	2
11912	107	389	4
11913	107	390	4
11914	107	406	5
11915	107	408	2
11916	107	414	3
11917	107	419	2
11918	107	422	4
11919	107	423	5
11920	107	427	5
11921	107	455	2
11922	107	460	2
11923	107	462	4
11924	107	469	4
11925	107	473	3
11926	107	478	2
11927	107	479	4
11928	107	485	4
11929	107	487	4
11930	107	497	3
11931	107	499	5
11932	107	521	3
11933	107	522	2
11934	107	523	5
11935	107	524	2
11936	107	525	3
11937	107	526	3
11938	107	530	4
11939	107	538	5
11940	107	553	4
11941	107	564	3
11942	107	565	4
11943	107	594	2
11944	107	602	3
11945	107	614	3
11946	107	620	3
11947	107	622	3
11948	107	630	4
11949	107	645	5
11950	107	647	2
11951	107	653	3
11952	107	654	3
11953	107	655	3
11954	107	662	4
11955	107	677	3
11956	107	696	5
11957	107	700	4
11958	107	705	2
11959	107	725	5
11960	107	726	5
11961	107	730	4
11962	107	745	3
11963	107	746	4
11964	107	749	4
11965	107	752	4
11966	107	806	2
11967	107	807	2
11968	107	844	5
11969	107	845	3
11970	107	853	2
11971	107	860	4
11972	107	863	5
11973	107	877	4
11974	107	878	3
11975	107	884	5
11976	107	886	3
11977	107	887	5
11978	107	888	3
11979	107	891	4
11980	107	893	4
11981	107	895	4
11982	107	898	4
11983	107	909	3
11984	107	923	4
11985	107	945	3
11986	107	950	3
11987	107	957	5
11988	107	958	2
11989	107	959	5
11990	107	960	4
11991	107	961	5
11992	107	962	3
11993	107	963	4
11994	107	964	3
11995	107	968	3
11996	107	970	3
11997	107	972	4
11998	107	975	5
11999	107	976	4
12000	107	981	4
12001	107	982	3
12002	107	983	5
12003	107	987	4
12004	107	990	3
12005	107	991	4
12006	107	995	5
12007	107	1000	5
12008	107	1004	3
12009	107	1005	5
12010	107	1006	3
12011	107	1007	4
12012	107	1009	4
12013	107	1012	4
12014	107	1018	5
12015	107	1023	4
12016	107	1025	5
12017	107	1030	5
12018	107	1036	4
12019	107	1045	5
12020	107	1050	2
12021	107	1051	4
12022	107	1061	3
12023	107	1066	5
12024	107	1071	2
12025	107	1083	4
12026	107	1087	2
12027	107	1105	3
12028	107	1112	4
12029	107	1116	2
12030	107	1119	3
12031	107	1133	5
12032	107	1134	3
12033	107	1144	4
12034	107	1183	3
12035	107	1189	3
12036	107	1196	3
12037	107	1213	2
12038	107	1215	3
12039	107	1226	4
12040	107	1227	3
12041	107	1233	3
12042	107	1244	3
12043	107	1250	3
12044	107	1260	3
12045	107	1261	2
12046	107	1268	4
12047	107	1270	3
12048	107	1274	2
12049	107	1278	2
12050	107	1288	3
12051	107	1290	3
12052	107	1291	3
12053	107	1295	2
12054	107	1296	5
12055	107	1298	2
12056	107	1309	3
12057	107	1310	2
12058	107	1311	4
12059	107	1322	4
12060	107	1330	4
12061	107	1337	2
12062	107	1338	4
12063	107	1340	1
12064	107	1344	3
12065	107	1351	3
12066	107	1354	3
12067	107	1358	4
12068	107	1361	5
12069	107	1363	3
12070	107	1368	3
12071	107	1369	2
12072	107	1375	4
12073	107	1387	2
12074	107	1394	2
12075	107	1402	3
12076	107	1405	3
12077	107	1406	4
12078	107	1411	4
12079	107	1414	3
12080	107	1429	4
12081	107	1431	4
12082	107	1432	3
12083	107	1435	4
12084	107	1439	2
12085	107	1464	4
12086	107	1471	4
12087	107	1472	3
12088	107	1485	3
12089	107	1494	4
12090	107	1519	3
12091	107	1520	3
12092	107	1521	5
12093	107	1526	2
12094	107	1528	4
12095	107	1529	3
12096	107	1531	3
12097	107	1532	5
12098	107	1533	3
12099	107	1535	4
12100	107	1549	4
12101	107	1558	3
12102	107	1564	4
12103	107	1565	4
12104	107	1569	5
12105	107	1583	3
12106	107	1585	2
12107	107	1586	3
12108	107	1640	4
12109	107	1665	4
12110	107	1668	2
12111	107	1674	3
12112	107	1697	2
12113	107	1701	5
12114	107	1702	3
12115	107	1721	2
12116	107	1723	3
12117	107	1730	3
12118	107	1731	5
12119	107	1738	3
12120	107	1741	5
12121	107	1749	3
12122	107	1754	3
12123	107	1756	5
12124	107	1757	4
12125	107	1759	4
12126	107	1770	4
12127	107	1772	2
12128	107	1777	3
12129	107	1778	4
12130	107	1780	3
12131	107	1796	5
12132	107	1798	3
12133	107	1800	4
12134	107	1803	4
12135	107	1839	3
12136	107	1844	5
12137	107	1845	4
12138	107	1860	3
12139	107	1865	3
12140	107	1871	3
12141	107	1883	5
12142	107	1886	2
12143	107	1888	3
12144	107	1902	3
12145	107	1906	4
12146	107	1907	2
12147	107	1916	3
12148	107	1917	3
12149	107	1920	3
12150	107	1921	3
12151	107	1924	3
12152	107	1926	4
12153	107	1930	3
12154	107	1937	2
12155	107	1973	4
12156	107	1982	5
12157	107	1989	2
12158	107	1992	5
12159	107	2001	5
12160	107	2002	2
12161	107	2034	3
12162	107	2057	3
12163	107	2064	5
12164	107	2078	4
12165	107	2090	3
12166	107	2099	3
12167	107	2135	3
12168	107	2151	3
12169	107	2158	2
12170	107	2169	4
12171	107	2172	4
12172	107	2176	3
12173	107	2180	2
12174	107	2202	2
12175	107	2203	1
12176	107	2207	3
12177	107	2210	5
12178	107	2233	4
12179	107	2237	5
12180	107	2239	3
12181	107	2246	5
12182	107	2281	3
12183	107	2282	4
12184	107	2313	4
12185	107	2314	3
12186	107	2330	4
12187	107	2332	4
12188	107	2358	3
12189	107	2359	3
12190	107	2360	3
12191	107	2362	3
12192	107	2366	3
12193	107	2373	3
12194	107	2378	4
12195	107	2387	4
12196	107	2389	3
12197	107	2391	1
12198	107	2393	2
12199	107	2395	3
12200	107	2403	4
12201	107	2413	5
12202	107	2414	3
12203	107	2430	4
12204	107	2467	2
12205	107	2481	5
12206	107	2487	4
12207	107	2488	3
12208	107	2490	4
12209	107	2494	3
12210	107	2498	2
12211	107	2518	3
12212	107	2537	4
12213	107	2541	3
12214	107	2543	4
12215	107	2560	3
12216	107	2561	3
12217	107	2568	5
12218	107	2587	3
12219	107	2591	4
12220	107	2597	3
12221	107	2664	1
12222	107	2666	5
12223	107	2667	3
12224	107	2677	2
12225	107	2684	3
12226	107	2711	4
12227	107	2713	5
12228	107	2714	4
12229	107	2715	2
12230	107	2716	4
12231	107	2718	2
12232	107	2740	3
12233	107	2762	2
12234	107	2766	3
12235	107	2768	2
12236	107	2778	4
12237	107	2784	3
12238	107	2787	3
12239	107	2796	2
12240	107	2799	5
12241	107	2800	5
12242	107	2806	4
12243	107	2818	3
12244	107	2819	5
12245	107	2823	4
12246	107	2837	4
12247	107	2855	2
12248	107	2859	4
12249	108	1	5
12250	108	34	5
12251	108	45	5
12252	108	48	5
12253	108	65	5
12254	108	95	4
12255	108	195	5
12256	108	203	3
12257	108	254	5
12258	108	261	5
12259	108	278	5
12260	108	310	5
12261	108	314	5
12262	108	317	5
12263	108	322	4
12264	108	324	5
12265	108	327	5
12266	108	360	4
12267	108	406	4
12268	108	427	5
12269	108	446	5
12270	108	495	5
12271	108	519	5
12272	108	521	5
12273	108	524	4
12274	108	525	5
12275	108	620	5
12276	108	669	4
12277	108	684	4
12278	108	741	4
12279	108	810	5
12280	108	811	5
12281	108	821	4
12282	108	844	3
12283	108	877	5
12284	108	878	3
12285	108	887	5
12286	108	889	4
12287	108	895	5
12288	108	898	3
12289	108	915	4
12290	108	923	3
12291	108	926	4
12292	108	960	5
12293	108	961	4
12294	108	963	4
12295	108	976	4
12296	108	984	4
12297	108	1000	5
12298	108	1025	1
12299	108	1030	4
12300	108	1042	5
12301	108	1051	5
12302	108	1066	4
12303	108	1127	4
12304	108	1131	5
12305	108	1134	4
12306	108	1142	1
12307	108	1159	5
12308	108	1203	5
12309	108	1215	4
12310	108	1226	5
12311	108	1233	5
12312	108	1257	5
12313	108	1290	5
12314	108	1298	5
12315	108	1310	5
12316	108	1312	5
12317	108	1315	4
12318	108	1363	5
12319	108	1381	3
12320	108	1399	5
12321	108	1402	5
12322	108	1521	3
12323	108	1534	4
12324	108	1535	5
12325	108	1567	5
12326	108	1568	3
12327	108	1591	5
12328	108	1608	4
12329	108	1638	4
12330	108	1665	3
12331	108	1675	5
12332	108	1684	5
12333	108	1690	4
12334	108	1697	5
12335	108	1701	5
12336	108	1717	5
12337	108	1718	2
12338	108	1730	5
12339	108	1791	5
12340	108	1865	5
12341	108	1902	4
12342	108	1976	3
12343	108	2091	3
12344	108	2144	5
12345	108	2159	1
12346	108	2172	2
12347	108	2191	4
12348	108	2198	3
12349	108	2199	3
12350	108	2233	5
12351	108	2237	5
12352	108	2239	4
12353	108	2246	5
12354	108	2330	5
12355	108	2389	5
12356	108	2424	5
12357	109	1	5
12358	109	5	3
12359	109	6	5
12360	109	7	4
12361	109	10	4
12362	109	15	3
12363	109	16	5
12364	109	17	4
12365	109	19	1
12366	109	21	5
12367	109	23	4
12368	109	25	4
12369	109	32	5
12370	109	34	5
12371	109	36	5
12372	109	37	5
12373	109	39	4
12374	109	43	3
12375	109	45	5
12376	109	48	5
12377	109	62	2
12378	109	65	3
12379	109	75	3
12380	109	88	4
12381	109	90	5
12382	109	96	3
12383	109	97	4
12384	109	99	5
12385	109	100	4
12386	109	121	5
12387	109	123	5
12388	109	127	5
12389	109	130	3
12390	109	138	5
12391	109	140	5
12392	109	142	5
12393	109	144	3
12394	109	146	5
12395	109	148	2
12396	109	149	4
12397	109	158	2
12398	109	170	3
12399	109	177	2
12400	109	181	5
12401	109	195	5
12402	109	196	4
12403	109	197	4
12404	109	203	5
12405	109	207	5
12406	109	224	4
12407	109	227	2
12408	109	229	3
12409	109	231	5
12410	109	236	4
12411	109	243	4
12412	109	250	5
12413	109	254	3
12414	109	258	5
12415	109	259	5
12416	109	261	5
12417	109	267	4
12418	109	270	4
12419	109	271	4
12420	109	272	4
12421	109	277	3
12422	109	278	3
12423	109	279	3
12424	109	280	5
12425	109	281	5
12426	109	290	4
12427	109	298	3
12428	109	305	2
12429	109	307	3
12430	109	310	4
12431	109	316	3
12432	109	317	4
12433	109	318	5
12434	109	324	5
12435	109	327	5
12436	109	328	4
12437	109	330	4
12438	109	331	5
12439	109	337	4
12440	109	339	4
12441	109	340	5
12442	109	350	4
12443	109	356	3
12444	109	360	3
12445	109	361	4
12446	109	369	3
12447	109	374	3
12448	109	377	4
12449	109	380	4
12450	109	383	5
12451	109	389	4
12452	109	391	5
12453	109	392	5
12454	109	403	5
12455	109	404	2
12456	109	406	4
12457	109	412	4
12458	109	414	3
12459	109	419	4
12460	109	422	5
12461	109	423	5
12462	109	427	4
12463	109	428	4
12464	109	431	4
12465	109	437	3
12466	109	440	3
12467	109	443	5
12468	109	446	4
12469	109	449	4
12470	109	452	4
12471	109	453	5
12472	109	454	4
12473	109	460	4
12474	109	461	4
12475	109	462	3
12476	109	463	3
12477	109	464	2
12478	109	472	5
12479	109	476	4
12480	109	478	4
12481	109	483	4
12482	109	485	5
12483	109	487	5
12484	109	488	3
12485	109	492	3
12486	109	495	5
12487	109	496	4
12488	109	497	5
12489	109	499	4
12490	109	520	4
12491	109	521	4
12492	109	522	5
12493	109	523	5
12494	109	524	5
12495	109	525	5
12496	109	526	5
12497	109	527	5
12498	109	528	4
12499	109	529	5
12500	109	530	5
12501	109	531	5
12502	109	536	4
12503	109	538	5
12504	109	564	4
12505	109	565	4
12506	109	568	4
12507	109	572	4
12508	109	582	4
12509	109	602	4
12510	109	612	5
12511	109	620	5
12512	109	622	4
12513	109	623	2
12514	109	624	5
12515	109	627	5
12516	109	631	5
12517	109	645	4
12518	109	647	3
12519	109	648	4
12520	109	654	4
12521	109	655	4
12522	109	656	4
12523	109	661	4
12524	109	662	5
12525	109	677	4
12526	109	681	2
12527	109	683	4
12528	109	694	4
12529	109	696	4
12530	109	719	4
12531	109	720	5
12532	109	721	5
12533	109	723	5
12534	109	724	5
12535	109	725	5
12536	109	726	5
12537	109	729	4
12538	109	730	5
12539	109	732	5
12540	109	734	5
12541	109	735	5
12542	109	736	5
12543	109	737	5
12544	109	738	5
12545	109	740	3
12546	109	741	4
12547	109	742	5
12548	109	745	5
12549	109	746	5
12550	109	754	5
12551	109	755	4
12552	109	761	5
12553	109	763	5
12554	109	766	5
12555	109	774	5
12556	109	775	5
12557	109	776	5
12558	109	785	5
12559	109	789	4
12560	109	791	5
12561	109	804	5
12562	109	819	3
12563	109	820	3
12564	109	822	3
12565	109	828	5
12566	109	829	5
12567	109	831	5
12568	109	832	4
12569	109	834	5
12570	109	835	4
12571	109	836	5
12572	109	837	5
12573	109	838	4
12574	109	839	3
12575	109	843	3
12576	109	844	5
12577	109	845	3
12578	109	849	5
12579	109	853	4
12580	109	859	3
12581	109	862	5
12582	109	864	4
12583	109	873	5
12584	109	877	4
12585	109	878	5
12586	109	882	4
12587	109	884	5
12588	109	886	3
12589	109	887	5
12590	109	888	5
12591	109	889	4
12592	109	892	3
12593	109	895	5
12594	109	897	3
12595	109	898	5
12596	109	912	3
12597	109	913	4
12598	109	914	4
12599	109	915	5
12600	109	919	4
12601	109	920	5
12602	109	923	5
12603	109	926	5
12604	109	938	4
12605	109	941	5
12606	109	947	5
12607	109	949	4
12608	109	959	5
12609	109	960	4
12610	109	961	5
12611	109	963	5
12612	109	964	4
12613	109	967	5
12614	109	970	5
12615	109	971	5
12616	109	972	5
12617	109	974	5
12618	109	975	5
12619	109	976	5
12620	109	978	5
12621	109	981	5
12622	109	982	4
12623	109	983	5
12624	109	984	5
12625	109	985	5
12626	109	986	5
12627	109	990	4
12628	109	991	4
12629	109	994	5
12630	109	995	4
12631	109	1000	5
12632	109	1002	4
12633	109	1003	4
12634	109	1004	5
12635	109	1006	4
12636	109	1007	5
12637	109	1009	5
12638	109	1010	5
12639	109	1014	5
12640	109	1022	4
12641	109	1023	5
12642	109	1025	5
12643	109	1026	5
12644	109	1028	3
12645	109	1029	5
12646	109	1030	5
12647	109	1032	4
12648	109	1034	5
12649	109	1035	4
12650	109	1036	5
12651	109	1037	5
12652	109	1038	4
12653	109	1042	4
12654	109	1043	5
12655	109	1044	5
12656	109	1045	5
12657	109	1047	4
12658	109	1048	5
12659	109	1051	5
12660	109	1060	4
12661	109	1061	4
12662	109	1062	5
12663	109	1063	4
12664	109	1066	5
12665	109	1071	3
12666	109	1083	5
12667	109	1087	4
12668	109	1090	4
12669	109	1091	5
12670	109	1103	3
12671	109	1111	4
12672	109	1112	5
12673	109	1113	4
12674	109	1114	3
12675	109	1115	3
12676	109	1116	3
12677	109	1117	4
12678	109	1118	4
12679	109	1119	3
12680	109	1120	5
12681	109	1121	4
12682	109	1122	4
12683	109	1123	3
12684	109	1125	4
12685	109	1127	5
12686	109	1128	3
12687	109	1131	4
12688	109	1133	5
12689	109	1134	4
12690	109	1136	5
12691	109	1142	5
12692	109	1144	5
12693	109	1145	4
12694	109	1148	5
12695	109	1153	3
12696	109	1167	3
12697	109	1170	3
12698	109	1181	3
12699	109	1185	4
12700	109	1189	5
12701	109	1196	5
12702	109	1203	5
12703	109	1214	2
12704	109	1215	5
12705	109	1226	5
12706	109	1233	4
12707	109	1242	3
12708	109	1250	5
12709	109	1254	1
12710	109	1257	4
12711	109	1260	5
12712	109	1261	5
12713	109	1265	4
12714	109	1267	4
12715	109	1268	3
12716	109	1270	5
12717	109	1278	4
12718	109	1288	3
12719	109	1290	5
12720	109	1291	4
12721	109	1295	4
12722	109	1296	5
12723	109	1304	4
12724	109	1310	5
12725	109	1311	5
12726	109	1322	4
12727	109	1326	4
12728	109	1331	2
12729	109	1337	4
12730	109	1338	4
12731	109	1340	5
12732	109	1342	5
12733	109	1344	4
12734	109	1351	4
12735	109	1353	5
12736	109	1361	5
12737	109	1362	3
12738	109	1366	5
12739	109	1368	5
12740	109	1369	5
12741	109	1372	5
12742	109	1375	5
12743	109	1378	5
12744	109	1387	4
12745	109	1391	5
12746	109	1394	4
12747	109	1397	2
12748	109	1399	5
12749	109	1400	3
12750	109	1401	5
12751	109	1402	5
12752	109	1414	4
12753	109	1417	4
12754	109	1419	4
12755	109	1427	2
12756	109	1428	4
12757	109	1430	3
12758	109	1437	3
12759	109	1461	2
12760	109	1464	4
12761	109	1466	4
12762	109	1471	4
12763	109	1484	4
12764	109	1485	4
12765	109	1489	4
12766	109	1490	4
12767	109	1491	3
12768	109	1494	5
12769	109	1497	5
12770	109	1499	4
12771	109	1511	4
12772	109	1519	3
12773	109	1521	4
12774	109	1524	4
12775	109	1526	4
12776	109	1527	4
12777	109	1528	5
12778	109	1529	4
12779	109	1534	4
12780	109	1535	4
12781	109	1564	5
12782	109	1565	5
12783	109	1566	4
12784	109	1567	4
12785	109	1568	3
12786	109	1569	4
12787	109	1570	3
12788	109	1574	4
12789	109	1575	4
12790	109	1576	4
12791	109	1581	1
12792	109	1582	5
12793	109	1583	5
12794	109	1584	3
12795	109	1586	5
12796	109	1591	5
12797	109	1597	3
12798	109	1598	3
12799	109	1603	4
12800	109	1608	4
12801	109	1611	3
12802	109	1612	3
12803	109	1614	3
12804	109	1615	4
12805	109	1619	4
12806	109	1620	2
12807	109	1621	4
12808	109	1636	3
12809	109	1638	5
12810	109	1641	5
12811	109	1642	4
12812	109	1643	4
12813	109	1645	5
12814	109	1647	5
12815	109	1653	4
12816	109	1654	4
12817	109	1656	4
12818	109	1660	4
12819	109	1668	5
12820	109	1671	4
12821	109	1672	4
12822	109	1675	4
12823	109	1684	4
12824	109	1691	4
12825	109	1692	5
12826	109	1693	4
12827	109	1695	5
12828	109	1709	2
12829	109	1710	1
12830	109	1723	4
12831	109	1730	4
12832	109	1743	5
12833	109	1748	4
12834	109	1749	5
12835	109	1755	5
12836	109	1761	5
12837	109	1778	4
12838	109	1779	4
12839	109	1781	4
12840	109	1784	2
12841	109	1796	5
12842	109	1797	3
12843	109	1800	4
12844	109	1803	4
12845	109	1812	5
12846	109	1814	3
12847	109	1816	5
12848	109	1822	5
12849	109	1828	4
12850	109	1833	4
12851	109	1836	4
12852	109	1840	4
12853	109	1846	4
12854	109	1848	4
12855	109	1850	4
12856	109	1854	4
12857	109	1865	4
12858	109	1867	4
12859	109	1883	4
12860	109	1884	4
12861	109	1885	3
12862	109	1886	3
12863	109	1887	3
12864	109	1888	5
12865	109	1890	4
12866	109	1891	3
12867	109	1892	3
12868	109	1893	3
12869	109	1894	1
12870	109	1895	1
12871	109	1896	2
12872	109	1899	4
12873	109	1900	1
12874	109	1905	4
12875	109	1907	5
12876	109	1909	3
12877	109	1911	5
12878	109	1912	4
12879	109	1913	4
12880	109	1915	4
12881	109	1916	4
12882	109	1917	4
12883	109	1918	4
12884	109	1919	4
12885	109	1920	3
12886	109	1921	3
12887	109	1923	5
12888	109	1930	4
12889	109	1933	4
12890	109	1937	5
12891	109	1959	3
12892	109	1962	4
12893	109	1963	5
12894	109	1964	3
12895	109	1971	3
12896	109	1974	4
12897	109	1976	4
12898	109	1977	3
12899	109	1978	4
12900	109	1982	4
12901	109	1984	4
12902	109	1989	4
12903	109	1992	4
12904	109	2018	3
12905	109	2031	4
12906	109	2034	5
12907	109	2053	4
12908	109	2057	5
12909	109	2060	4
12910	109	2064	4
12911	109	2065	4
12912	109	2066	4
12913	109	2078	4
12914	109	2090	4
12915	109	2091	3
12916	109	2095	4
12917	109	2099	5
12918	109	2108	4
12919	109	2109	4
12920	109	2110	2
12921	109	2111	2
12922	109	2122	3
12923	109	2135	5
12924	109	2144	5
12925	109	2158	5
12926	109	2159	5
12927	109	2163	4
12928	109	2169	5
12929	109	2172	5
12930	109	2179	4
12931	109	2184	5
12932	109	2190	3
12933	109	2191	3
12934	109	2198	4
12935	109	2210	5
12936	109	2211	5
12937	109	2217	4
12938	109	2233	5
12939	109	2236	4
12940	109	2237	5
12941	109	2239	4
12942	109	2244	4
12943	109	2250	4
12944	109	2254	4
12945	109	2259	3
12946	109	2282	5
12947	109	2298	3
12948	109	2313	5
12949	109	2315	4
12950	109	2329	4
12951	109	2330	5
12952	109	2332	5
12953	109	2337	5
12954	109	2352	4
12955	109	2355	5
12956	109	2358	5
12957	109	2359	4
12958	109	2360	5
12959	109	2362	4
12960	109	2364	3
12961	109	2366	5
12962	109	2368	5
12963	109	2373	4
12964	109	2387	5
12965	109	2388	3
12966	109	2389	5
12967	109	2391	4
12968	109	2392	4
12969	109	2393	4
12970	109	2395	4
12971	109	2398	5
12972	109	2399	5
12973	109	2414	5
12974	109	2424	5
12975	109	2425	5
12976	109	2430	4
12977	109	2436	3
12978	109	2448	4
12979	109	2466	4
12980	109	2467	5
12981	109	2470	4
12982	109	2488	4
12983	109	2490	5
12984	109	2497	5
12985	109	2511	4
12986	109	2520	5
12987	109	2531	5
12988	109	2537	5
12989	109	2540	5
12990	109	2542	4
12991	109	2545	4
12992	109	2551	5
12993	109	2563	4
12994	109	2564	4
12995	109	2567	5
12996	109	2573	4
12997	109	2588	3
12998	109	2590	3
12999	109	2591	3
13000	109	2593	5
13001	109	2594	5
13002	109	2595	3
13003	109	2596	4
13004	109	2597	4
13005	109	2598	4
13006	109	2600	3
13007	109	2604	4
13008	109	2610	3
13009	109	2615	3
13010	109	2621	4
13011	109	2629	4
13012	109	2651	5
13013	109	2653	5
13014	109	2661	2
13015	109	2667	4
13016	109	2670	4
13017	109	2671	4
13018	109	2684	5
13019	109	2693	4
13020	109	2700	3
13021	109	2704	5
13022	109	2710	4
13023	109	2711	3
13024	109	2740	4
13025	109	2750	4
13026	109	2757	4
13027	109	2766	5
13028	109	2767	3
13029	109	2768	4
13030	109	2770	3
13031	109	2774	5
13032	109	2788	4
13033	109	2794	4
13034	109	2797	4
13035	109	2799	3
13036	109	2800	5
13037	109	2801	3
13038	109	2808	4
13039	109	2826	1
13040	109	2837	5
13041	109	2839	4
13042	109	2850	4
13043	109	2854	5
13044	109	2860	4
13045	109	2863	4
13046	109	2864	4
13047	109	2869	3
13048	109	2870	4
13049	109	2872	4
13050	109	2874	4
13051	109	2876	4
13052	109	2877	4
13053	109	2878	4
13054	109	2880	4
13055	109	2885	4
13056	109	2886	5
13057	109	2898	3
13058	109	2901	5
13059	109	2906	4
13060	109	2908	5
13061	109	2909	5
13062	109	2911	4
13063	109	2920	4
13064	109	2921	4
13065	109	2925	4
13066	109	2926	4
13067	109	2928	4
13068	109	2938	4
13069	109	2942	4
13070	109	2963	3
13071	109	2965	4
13072	109	2967	4
13073	109	2975	3
13074	109	2976	3
13075	109	2992	4
13076	109	3000	4
13077	109	3025	3
13078	109	3026	4
13079	109	3032	5
13080	109	3037	4
13081	109	3051	4
13082	109	3055	5
13083	109	3056	4
13084	109	3072	5
13085	109	3073	5
13086	109	3107	5
13087	109	3126	3
13088	109	3127	5
13089	109	3132	4
13090	109	3139	4
13091	109	3149	4
13092	109	3150	5
13093	109	3153	3
13094	109	3157	4
13095	109	3159	5
13096	109	3162	5
13097	109	3163	5
13098	109	3165	4
13099	109	3167	4
13100	109	3169	4
13101	109	3176	4
13102	109	3177	5
13103	109	3184	5
13104	109	3218	3
13105	109	3219	5
13106	109	3242	4
13107	109	3248	4
13108	109	3252	4
13109	109	3320	5
13110	109	3322	5
13111	109	3323	5
13112	109	3329	4
13113	109	3337	5
13114	109	3349	4
13115	109	3351	5
13116	109	3375	4
13117	109	3380	5
13118	109	3382	5
13119	109	3393	5
13120	109	3406	4
13121	109	3411	5
13122	109	3419	4
13123	109	3422	3
13124	109	3425	4
13125	109	3436	4
13126	109	3481	4
13127	109	3482	4
13128	109	3555	2
13129	109	3579	4
13130	109	3621	4
13131	109	3683	5
13132	109	3690	5
13133	109	3696	4
13134	109	3709	5
13135	109	3765	4
13136	109	3786	5
13137	109	3793	4
13138	109	3812	4
13139	109	3818	4
13140	109	3860	5
13141	109	3870	5
13142	109	3886	5
13143	109	3900	5
13144	109	3931	4
13145	109	3934	4
13146	109	3999	4
13147	109	4051	3
13148	109	4052	4
13149	109	4053	3
13150	109	4055	4
13151	109	4091	4
13152	109	4109	4
13153	109	4126	5
13154	109	4127	4
13155	109	4173	5
13156	109	4200	5
13157	109	4257	2
13158	109	4279	5
13159	109	4282	3
13160	109	4473	5
13161	110	2	4
13162	110	3	4.5
13163	110	11	4
13164	110	19	3
13165	110	36	5
13166	110	37	3
13167	110	45	1
13168	110	48	5
13169	110	64	4
13170	110	99	4
13171	110	100	3
13172	110	121	4.5
13173	110	127	5
13174	110	130	3.5
13175	110	151	1
13176	110	168	4.5
13177	110	195	3
13178	110	203	2
13179	110	218	4
13180	110	224	3
13181	110	231	5
13182	110	235	4
13183	110	236	1
13184	110	254	4.5
13185	110	258	3
13186	110	261	4
13187	110	264	5
13188	110	278	4
13189	110	280	5
13190	110	290	5
13191	110	305	5
13192	110	314	4
13193	110	317	5
13194	110	318	4
13195	110	324	5
13196	110	330	3.5
13197	110	337	3
13198	110	340	4
13199	110	358	5
13200	110	389	4.5
13201	110	406	3
13202	110	419	5
13203	110	425	4
13204	110	427	3
13205	110	446	3
13206	110	453	4
13207	110	460	5
13208	110	465	2.5
13209	110	472	5
13210	110	478	3
13211	110	483	4
13212	110	485	5
13213	110	495	5
13214	110	497	5
13215	110	519	3
13216	110	520	2
13217	110	522	4
13218	110	523	2
13219	110	524	5
13220	110	525	3.5
13221	110	526	2
13222	110	528	4.5
13223	110	530	3
13224	110	538	5
13225	110	552	5
13226	110	565	2
13227	110	620	2
13228	110	622	3
13229	110	652	3
13230	110	654	4
13231	110	735	4
13232	110	741	5
13233	110	742	4
13234	110	745	5
13235	110	844	3
13236	110	854	3
13237	110	877	5
13238	110	878	5
13239	110	887	4
13240	110	888	5
13241	110	892	4
13242	110	895	5
13243	110	915	5
13244	110	923	5
13245	110	959	5
13246	110	960	5
13247	110	961	5
13248	110	963	5
13249	110	966	5
13250	110	970	4.5
13251	110	972	5
13252	110	975	5
13253	110	976	5
13254	110	981	4
13255	110	984	5
13256	110	1000	2
13257	110	1006	5
13258	110	1012	5
13259	110	1018	4
13260	110	1019	4.5
13261	110	1025	4
13262	110	1026	5
13263	110	1038	5
13264	110	1045	4
13265	110	1049	5
13266	110	1051	5
13267	110	1066	5
13268	110	1071	3
13269	110	1087	3
13270	110	1090	3
13271	110	1103	5
13272	110	1105	4.5
13273	110	1112	3
13274	110	1114	5
13275	110	1116	5
13276	110	1117	5
13277	110	1118	5
13278	110	1122	4
13279	110	1131	5
13280	110	1144	3
13281	110	1175	4
13282	110	1196	3
13283	110	1226	5
13284	110	1261	3
13285	110	1265	4.5
13286	110	1290	4
13287	110	1296	4.5
13288	110	1302	5
13289	110	1340	4
13290	110	1344	4
13291	110	1351	4
13292	110	1368	5
13293	110	1381	4
13294	110	1402	5
13295	110	1462	5
13296	110	1494	4
13297	110	1528	3
13298	110	1529	5
13299	110	1535	5
13300	110	1564	2
13301	110	1569	4
13302	110	1570	5
13303	110	1591	5
13304	110	1624	5
13305	110	1641	3
13306	110	1676	3
13307	110	1684	4
13308	110	1761	5
13309	110	1814	5
13310	110	1820	3
13311	110	1867	5
13312	110	1902	5
13313	110	1904	5
13314	110	1906	5
13315	110	1916	4
13316	110	1917	4
13317	110	1933	3
13318	110	1973	5
13319	110	1999	4
13320	110	2057	4
13321	110	2067	5
13322	110	2099	3
13323	110	2108	4.5
13324	110	2109	3
13325	110	2144	3
13326	110	2163	2.5
13327	110	2167	3
13328	110	2172	3
13329	110	2233	5
13330	110	2234	5
13331	110	2237	4.5
13332	110	2246	5
13333	110	2282	5
13334	110	2330	4
13335	110	2355	4
13336	110	2389	5
13337	110	2399	4
13338	110	2431	5
13339	110	2442	3
13340	110	2459	4
13341	110	2466	5
13342	110	2515	5
13343	110	2520	4
13344	110	2542	5
13345	110	2595	3
13346	110	2599	2.5
13347	110	2601	5
13348	110	2667	5
13349	110	2693	4.5
13350	110	2694	4
13351	110	2711	5
13352	110	2713	5
13353	110	2740	4
13354	110	2742	5
13355	110	2778	5
13356	110	2819	4
13357	110	2822	4
13358	110	2837	3.5
13359	110	2895	5
13360	110	2898	4
13361	110	2934	5
13362	110	2965	5
13363	110	2969	5
13364	110	2973	4.5
13365	110	2992	3
13366	110	3011	5
13367	110	3039	5
13368	110	3055	5
13369	110	3073	5
13370	110	3083	5
13371	110	3108	4
13372	110	3110	5
13373	110	3125	5
13374	110	3149	5
13375	110	3177	5
13376	110	3179	5
13377	110	3183	4.5
13378	110	3184	5
13379	110	3189	4.5
13380	110	3191	3
13381	110	3230	5
13382	110	3248	4
13383	110	3275	1
13384	110	3323	3
13385	110	3345	1
13386	110	3380	3
13387	110	3389	5
13388	110	3666	3
13389	110	3698	5
13390	110	3792	4
13391	110	3874	4.5
13392	110	3886	5
13393	110	3900	4
13394	110	3902	5
13395	110	3934	5
13396	110	3971	2.5
13397	110	4040	5
13398	110	4061	3.5
13399	110	4080	5
13400	110	4127	3
13401	110	4154	4.5
13402	110	4172	4
13403	110	4173	3
13404	110	4188	2
13405	110	4200	2
13406	110	4256	4.5
13407	110	4313	4.5
13408	110	4452	3
13409	110	4453	4
13410	110	4458	5
13411	110	4473	5
13412	110	4485	4
13413	110	4495	1.5
13414	110	4653	4.5
13415	110	4681	3.5
13416	110	4699	3
13417	110	4799	0.5
13418	110	4968	4.5
13419	110	5005	3
13420	110	5039	3.5
13421	110	5042	5
13422	110	5167	5
13423	110	5207	5
13424	110	5329	4.5
13425	110	5539	5
13426	110	5622	5
13427	110	5719	3.5
13428	110	5830	5
13429	110	5837	2
13430	110	7155	4.5
13431	111	10	3
13432	111	19	3
13433	111	25	3
13434	111	99	5
13435	111	127	5
13436	111	130	5
13437	111	138	4
13438	111	142	3
13439	111	203	4
13440	111	224	4
13441	111	236	5
13442	111	254	3
13443	111	258	4
13444	111	261	5
13445	111	278	3
13446	111	280	3
13447	111	300	3
13448	111	305	2
13449	111	310	3
13450	111	317	5
13451	111	318	4
13452	111	324	5
13453	111	327	3
13454	111	337	5
13455	111	340	3
13456	111	403	4
13457	111	427	4
13458	111	446	3
13459	111	472	5
13460	111	483	5
13461	111	521	4
13462	111	522	4
13463	111	523	4
13464	111	524	4
13465	111	525	3
13466	111	528	3
13467	111	530	5
13468	112	17	4
13469	112	25	4
13470	112	39	2
13471	112	99	4
13472	112	217	4
13473	112	231	4
13474	112	235	5
13475	112	242	4
13476	112	280	4
13477	112	443	5
13478	112	454	5
13479	112	472	5
13480	112	538	5
13481	112	579	5
13482	112	631	5
13483	112	647	4
13484	112	725	4
13485	112	746	5
13486	112	875	3
13487	112	947	5
13488	112	952	5
13489	112	962	5
13490	112	968	1
13491	112	972	3
13492	112	976	2
13493	112	991	4
13494	112	995	5
13495	112	1012	5
13496	112	1013	4
13497	112	1029	5
13498	112	1030	4
13499	112	1116	4
13500	112	1136	3
13501	112	1261	2
13502	112	1265	5
13503	112	1341	3
13504	112	1517	5
13505	112	1535	3
13506	112	1574	3
13507	112	1584	4
13508	112	1586	5
13509	112	1615	4
13510	112	1814	3
13511	112	1828	5
13512	112	1869	5
13513	112	1907	5
13514	112	1917	4
13515	112	1934	5
13516	112	1946	5
13517	112	1963	2
13518	112	2022	2
13519	112	2198	4
13520	112	2230	4
13521	112	2282	3
13522	112	2327	4
13523	112	2354	4
13524	112	2373	4
13525	112	2403	5
13526	112	2471	4
13527	112	2576	5
13528	112	2713	3
13529	112	2757	5
13530	112	2775	4
13531	112	2783	4
13532	113	1	4
13533	113	3	3
13534	113	5	3.5
13535	113	11	3
13536	113	16	4
13537	113	18	3.5
13538	113	21	4
13539	113	32	4
13540	113	34	4
13541	113	37	3.5
13542	113	45	3.5
13543	113	48	5
13544	113	58	2.5
13545	113	92	2.5
13546	113	99	4
13547	113	121	3.5
13548	113	123	3
13549	113	127	4
13550	113	138	3.5
13551	113	181	2
13552	113	203	2.5
13553	113	208	3
13554	113	231	4.5
13555	113	258	3
13556	113	259	3.5
13557	113	261	4
13558	113	264	3.5
13559	113	280	4.5
13560	113	290	3.5
13561	113	294	3.5
13562	113	300	3.5
13563	113	305	2
13564	113	317	4
13565	113	318	4
13566	113	327	2
13567	113	332	3.5
13568	113	334	1.5
13569	113	337	2.5
13570	113	340	3
13571	113	376	2
13572	113	389	3.5
13573	113	403	3
13574	113	406	3.5
13575	113	414	2.5
13576	113	419	3
13577	113	427	3
13578	113	446	3.5
13579	113	459	2
13580	113	465	2.5
13581	113	472	3.5
13582	113	483	4
13583	113	485	3.5
13584	113	521	2
13585	113	522	3
13586	113	523	2.5
13587	113	524	3.5
13588	113	525	3.5
13589	113	526	3.5
13590	113	530	3
13591	113	538	3.5
13592	113	565	3
13593	113	622	3
13594	113	631	3
13595	113	647	3
13596	113	651	1.5
13597	113	652	3
13598	113	659	3
13599	113	696	4
13600	113	724	3.5
13601	113	745	3.5
13602	113	774	3.5
13603	113	844	3.5
13604	113	873	4
13605	113	886	3
13606	113	889	3.5
13607	113	890	3.5
13608	113	895	3.5
13609	113	898	3
13610	113	922	3.5
13611	113	923	4
13612	113	957	3.5
13613	113	959	4
13614	113	960	4.5
13615	113	961	4
13616	113	964	3.5
13617	113	969	3.5
13618	113	970	4
13619	113	972	4
13620	113	975	4
13621	113	976	4
13622	113	982	4
13623	113	983	4
13624	113	987	4
13625	113	992	4
13626	113	994	4
13627	113	1006	4
13628	113	1007	3
13629	113	1010	3.5
13630	113	1019	3.5
13631	113	1025	4.5
13632	113	1026	4
13633	113	1030	4
13634	113	1032	4
13635	113	1045	4
13636	113	1053	3.5
13637	113	1056	3.5
13638	113	1057	3
13639	113	1061	3
13640	113	1066	4
13641	113	1112	3
13642	113	1117	2.5
13643	113	1120	3
13644	113	1131	2
13645	113	1133	3
13646	113	1134	3.5
13647	113	1136	3.5
13648	113	1145	4
13649	113	1215	4
13650	113	1226	3
13651	113	1233	3
13652	113	1244	2
13653	113	1257	3
13654	113	1261	3.5
13655	113	1278	3.5
13656	113	1290	3.5
13657	113	1296	4
13658	113	1311	4
13659	113	1330	3.5
13660	113	1337	4
13661	113	1338	3.5
13662	113	1340	3
13663	113	1344	3
13664	113	1361	4.5
13665	113	1368	3
13666	113	1372	3.5
13667	113	1381	3.5
13668	113	1399	2
13669	113	1402	4
13670	113	1489	2.5
13671	113	1494	4
13672	113	1528	3.5
13673	113	1535	3.5
13674	113	1569	3
13675	113	1574	3.5
13676	113	1575	3.5
13677	113	1584	3
13678	113	1586	3
13679	113	1624	3.5
13680	113	1648	2
13681	113	1675	3.5
13682	113	1684	3
13683	113	1691	2.5
13684	113	1701	3
13685	113	1723	3
13686	113	1730	3
13687	113	1749	4
13688	113	1770	4
13689	113	1777	3
13690	113	1780	3.5
13691	113	1796	4
13692	113	1800	3.5
13693	113	1820	3
13694	113	1821	3.5
13695	113	1822	4
13696	113	1864	3.5
13697	113	1865	3.5
13698	113	1867	3.5
13699	113	1881	2.5
13700	113	1883	4
13701	113	1901	3.5
13702	113	1906	4
13703	113	1907	4
13704	113	1915	3
13705	113	1916	3.5
13706	113	1917	3
13707	113	1930	3
13708	113	1933	2.5
13709	113	1976	3
13710	113	1984	4
13711	113	2002	4
13712	113	2057	3.5
13713	113	2090	2
13714	113	2099	3.5
13715	113	2135	3
13716	113	2144	3
13717	113	2158	2.5
13718	113	2160	2.5
13719	113	2163	1
13720	113	2172	3
13721	113	2198	3.5
13722	113	2210	3.5
13723	113	2233	3
13724	113	2237	3.5
13725	113	2239	3.5
13726	113	2246	4
13727	113	2282	4
13728	113	2313	3.5
13729	113	2329	3
13730	113	2330	3
13731	113	2332	4
13732	113	2387	2.5
13733	113	2389	3
13734	113	2398	4
13735	113	2424	2.5
13736	113	2430	4
13737	113	2442	1.5
13738	113	2459	3.5
13739	113	2470	4
13740	113	2484	3.5
13741	113	2490	3.5
13742	113	2497	4
13743	113	2542	3
13744	113	2568	3
13745	113	2593	3.5
13746	113	2594	2.5
13747	113	2596	3
13748	113	2597	3.5
13749	113	2604	3
13750	113	2667	4
13751	113	2669	4
13752	113	2684	3
13753	113	2704	4
13754	113	2711	3.5
13755	113	2713	3
13756	113	2733	3
13757	113	2740	3
13758	113	2766	4
13759	113	2770	3
13760	113	2778	3.5
13761	113	2799	4
13762	113	2819	3.5
13763	113	2823	3.5
13764	113	2837	3
13765	113	2844	3.5
13766	113	2877	2.5
13767	113	2898	3.5
13768	113	2921	3.5
13769	113	2922	3
13770	113	2998	3
13771	113	3011	3.5
13772	113	3039	3.5
13773	113	3055	3
13774	113	3056	2.5
13775	113	3073	4
13776	113	3087	3
13777	113	3108	3.5
13778	113	3133	3
13779	113	3150	3
13780	113	3155	3.5
13781	113	3163	3.5
13782	113	3169	3
13783	113	3173	4
13784	113	3176	3
13785	113	3177	4
13786	113	3191	3
13787	113	3219	3.5
13788	113	3248	3.5
13789	113	3277	3.5
13790	113	3291	4
13791	113	3323	4
13792	113	3337	3.5
13793	113	3380	3
13794	113	3382	4
13795	113	3389	3
13796	113	3419	4
13797	113	3482	3.5
13798	113	3510	2.5
13799	113	3517	4.5
13800	113	3578	3
13801	113	3621	3
13802	113	3633	1.5
13803	113	3666	1.5
13804	113	3683	3
13805	113	3812	4
13806	113	3860	4
13807	113	3874	4
13808	113	3886	4.5
13809	113	3888	4
13810	113	3900	3.5
13811	113	3927	3.5
13812	113	3934	3.5
13813	113	3971	3.5
13814	113	4033	4
13815	113	4052	2.5
13816	113	4080	4
13817	113	4109	3.5
13818	113	4126	3.5
13819	113	4127	3.5
13820	113	4135	4
13821	113	4154	4
13822	113	4173	3
13823	113	4200	3
13824	113	4236	3
13825	113	4281	3
13826	113	4302	3.5
13827	113	4458	4
13828	113	4487	4
13829	113	4702	3
13830	113	4703	2.5
13831	113	4705	4
13832	113	4803	4
13833	113	4818	4
13834	113	4909	4
13835	113	4941	4.5
13836	113	4998	3.5
13837	113	5005	4
13838	113	5007	3.5
13839	113	5039	3.5
13840	113	5042	3.5
13841	113	5046	4
13842	113	5068	3
13843	113	5090	2.5
13844	113	5111	3.5
13845	113	5202	4
13846	113	5207	4.5
13847	113	5221	3.5
13848	113	5289	3.5
13849	113	5329	4.5
13850	113	5365	5
13851	113	5374	3
13852	113	5376	2
13853	113	5630	3.5
13854	113	5677	3
13855	113	5720	4
13856	113	5730	2.5
13857	113	5743	4
13858	113	5795	4
13859	113	5859	1.5
13860	113	5875	4.5
13861	113	5883	4
13862	113	5891	3
13863	113	5899	3.5
13864	113	6186	3.5
13865	113	6200	4
13866	113	6415	3.5
13867	113	6417	4
13868	113	6488	3
13869	113	6615	4
13870	113	6620	3.5
13871	113	6642	3.5
13872	113	6663	2
13873	113	6667	4
13874	113	6691	4
13875	113	6714	1.5
13876	113	6731	4
13877	113	6768	4
13878	113	6827	3.5
13879	113	6828	4
13880	113	6847	4
13881	113	6848	2.5
13882	113	6946	3.5
13883	113	6948	4
13884	113	7022	4
13885	113	7035	3.5
13886	113	7036	4
13887	113	7061	4.5
13888	113	7083	3.5
13889	113	7085	4.5
13890	113	7136	4
13891	113	7151	2.5
13892	113	7200	3.5
13893	113	7226	4
13894	113	7259	4
13895	113	7273	4
13896	113	7292	4
13897	113	7307	2.5
13898	113	7385	4
13899	113	7398	2.5
13900	113	7419	4
13901	113	7424	4
13902	113	7439	4
13903	113	7446	1.5
13904	113	7501	3
13905	113	7506	3.5
13906	113	7542	3.5
13907	113	7564	0.5
13908	113	7573	5
13909	113	7621	3
13910	113	7670	3
13911	113	7689	3
13912	113	7702	1
13913	113	7715	3.5
13914	113	7761	3.5
13915	113	7798	3.5
13916	113	7827	3
13917	113	7844	4
13918	113	7914	4
13919	113	7959	4
13920	113	7960	3
13921	113	7999	2.5
13922	113	8046	4.5
13923	113	8086	4
13924	113	8096	4
13925	113	8114	4
13926	113	8121	3
13927	113	8130	3.5
13928	113	8163	4
13929	113	8184	3.5
13930	113	8185	3
13931	113	8264	4
13932	113	8291	3
13933	113	8351	3
13934	113	8354	4
13935	113	8500	3.5
13936	113	8600	4
13937	113	8630	4
13938	113	8636	2.5
13939	113	8662	3.5
13940	113	8778	4
13941	113	8779	4
13942	113	8780	3.5
13943	113	8804	4
13944	113	8878	3
13945	113	8894	3.5
13946	113	8985	3.5
13947	113	9037	4.5
13948	113	9054	3.5
13949	113	9073	4
13950	113	9122	3.5
13951	113	9225	4
13952	113	9234	3
13953	113	9308	4
13954	113	9397	3
13955	113	9438	3.5
13956	113	10159	5
13957	114	1	4
13958	114	45	3.5
13959	114	100	4
13960	114	139	3.5
13961	114	231	5
13962	114	280	5
13963	114	317	5
13964	114	427	3.5
13965	114	485	3.5
13966	114	522	3
13967	114	523	3.5
13968	114	525	4.5
13969	114	645	3.5
13970	114	746	4
13971	114	887	3
13972	114	923	4.5
13973	114	959	5
13974	114	960	5
13975	114	961	5
13976	114	962	4.5
13977	114	963	5
13978	114	972	4.5
13979	114	976	5
13980	114	1000	3.5
13981	114	1019	5
13982	114	1025	5
13983	114	1030	5
13984	114	1034	5
13985	114	1038	3
13986	114	1042	3.5
13987	114	1051	3.5
13988	114	1119	3.5
13989	114	1215	3.5
13990	114	1261	4
13991	114	1302	4
13992	114	1322	4
13993	114	1340	2.5
13994	114	1344	4
13995	114	1351	2
13996	114	1534	5
13997	114	1535	4
13998	114	1675	4
13999	114	1995	4
14000	114	2057	5
14001	114	2282	3.5
14002	114	2387	5
14003	114	2399	5
14004	114	2705	1.5
14005	114	2963	4
14006	114	2992	3
14007	114	3000	3
14008	114	3134	0.5
14009	114	3163	5
14010	114	3166	1
14011	114	3169	2.5
14012	114	3275	3
14013	114	3338	1
14014	114	3342	3
14015	114	3343	2
14016	114	3380	3.5
14017	114	3403	0.5
14018	114	3405	2.5
14019	114	3481	2
14020	114	3636	3
14021	114	3638	3.5
14022	114	3697	2.5
14023	114	3716	3
14024	114	3769	2
14025	114	3788	2.5
14026	114	3807	3.5
14027	114	3812	3
14028	114	3816	1.5
14029	114	3818	4
14030	114	3886	5
14031	114	3943	4
14032	114	4034	2
14033	114	4109	5
14034	114	4197	2.5
14035	114	4368	1
14036	114	4425	4
14037	114	4458	5
14038	114	4461	5
14039	114	4493	3
14040	114	4562	1.5
14041	114	4631	1.5
14042	114	4643	3.5
14043	114	4681	3
14044	114	4798	2.5
14045	114	4803	3
14046	114	4804	1.5
14047	114	4855	4
14048	114	4944	3
14049	114	4979	3.5
14050	114	4998	2.5
14051	114	5039	2.5
14052	114	5054	3
14053	114	5207	5
14054	114	5260	3
14055	114	5726	5
14056	114	5883	3
14057	114	6207	5
14058	114	6242	3.5
14059	114	6290	3
14060	114	6340	5
14061	114	6346	4
14062	114	6417	3.5
14063	114	6485	4
14064	114	6503	5
14065	114	6559	5
14066	114	6563	3
14067	114	6620	2.5
14068	114	6642	4
14069	114	6691	5
14070	114	6827	4
14071	114	6946	3.5
14072	114	7157	5
14073	114	7161	5
14074	114	7179	4
14075	114	7424	4
14076	114	7446	3
14077	114	7472	3
14078	114	7487	3.5
14079	114	7542	4
14080	114	7567	2.5
14081	114	7573	4.5
14082	114	7621	4
14083	114	7670	4
14084	114	7715	4
14085	114	7761	3
14086	114	7882	4
14087	114	7883	3
14088	114	7922	4
14089	114	7979	5
14090	114	8011	3.5
14091	114	8090	3.5
14092	114	8630	4
14093	114	8662	3
14094	114	8778	5
14095	114	8804	4
14096	114	8825	4
14097	114	8826	3.5
14098	114	8907	3.5
14099	114	8924	3.5
14100	114	9014	3.5
14101	114	9049	4
14102	114	9122	4
14103	114	9181	3.5
14104	114	9227	3.5
14105	114	9322	4.5
14106	114	9448	5
14107	114	9491	3
14108	114	9525	3
14109	114	9538	2.5
14110	114	9547	3
14111	114	9847	4
14112	114	9855	3.5
14113	114	9897	3
14114	114	9903	3.5
14115	114	9915	4.5
14116	114	9961	3.5
14117	114	9976	3.5
14118	114	10006	3.5
14119	114	10069	3.5
14120	114	10077	3.5
14121	114	10079	5
14122	114	10103	4
14123	114	10158	5
14124	115	42	2
14125	115	48	2
14126	115	54	2.5
14127	115	144	0.5
14128	115	208	3
14129	115	232	2
14130	115	280	5
14131	115	303	4
14132	115	336	0.5
14133	115	419	4
14134	115	472	1.5
14135	115	524	1.5
14136	115	572	2.5
14137	115	650	2
14138	115	652	2
14139	115	696	1.5
14140	115	732	3
14141	115	734	1.5
14142	115	744	2
14143	115	892	2.5
14144	115	957	1.5
14145	115	974	1.5
14146	115	983	2
14147	115	1042	1.5
14148	115	1114	2.5
14149	115	1117	2.5
14150	115	1136	3.5
14151	115	1302	0.5
14152	115	1535	2.5
14153	115	1582	2
14154	115	1934	1.5
14155	115	1976	4
14156	115	2484	3.5
14157	115	2727	1
14158	115	2778	3
14159	115	3392	3
14160	115	3812	2
14161	115	4504	1.5
14162	115	4803	1.5
14163	115	5391	1.5
14164	115	6606	0.5
14165	115	6959	2.5
14166	115	7670	2.5
14167	115	8541	2.5
14168	115	8546	3.5
14169	115	9269	5
14170	115	9547	4
14171	115	9687	4
14172	115	9730	5
14173	115	9929	0.5
14174	116	1	5
14175	116	10	4
14176	116	21	4
14177	116	32	4
14178	116	34	5
14179	116	45	5
14180	116	48	5
14181	116	99	3
14182	116	138	5
14183	116	142	3
14184	116	161	4
14185	116	197	3
14186	116	203	1
14187	116	224	3
14188	116	236	3
14189	116	254	3
14190	116	261	4
14191	116	280	5
14192	116	290	4
14193	116	340	3
14194	116	360	4
14195	116	369	3
14196	116	406	4
14197	116	522	5
14198	116	524	4
14199	116	526	5
14200	116	528	5
14201	117	1	4
14202	117	6	5
14203	117	7	3
14204	117	14	4
14205	117	25	3
14206	117	39	3
14207	117	58	5
14208	117	88	3
14209	117	91	4
14210	117	120	4
14211	117	440	4
14212	117	565	5
14213	117	572	3
14214	117	581	4
14215	117	598	3
14216	117	601	3
14217	117	602	3
14218	117	604	3
14219	117	615	3
14220	117	620	4
14221	117	622	3
14222	117	626	3
14223	117	630	3
14224	117	638	3
14225	117	647	5
14226	117	650	5
14227	117	651	3
14228	117	653	3
14229	117	654	3
14230	117	662	4
14231	117	673	3
14232	117	677	5
14233	117	682	3
14234	117	873	3
14235	118	1	4
14236	118	5	4
14237	118	7	3
14238	118	10	4
14239	118	11	4
14240	118	17	2
14241	118	24	2
14242	118	37	2
14243	118	68	4
14244	118	95	4
14245	118	99	5
14246	118	121	0.5
14247	118	123	4
14248	118	127	5
14249	118	128	2
14250	118	130	4
14251	118	137	3
14252	118	138	3
14253	118	142	4
14254	118	144	5
14255	118	148	2
14256	118	177	2
14257	118	180	4
14258	118	181	2
14259	118	191	2
14260	118	203	4
14261	118	223	3
14262	118	228	4
14263	118	231	4
14264	118	254	2
14265	118	258	3
14266	118	261	0.5
14267	118	277	2
14268	118	278	4
14269	118	280	5
14270	118	300	4
14271	118	305	3
14272	118	310	2
14273	118	314	2
14274	118	317	5
14275	118	318	0.5
14276	118	321	3
14277	118	322	3
14278	118	327	4
14279	118	328	4
14280	118	337	3
14281	118	339	4
14282	118	340	5
14283	118	343	2
14284	118	353	2
14285	118	383	4
14286	118	391	5
14287	118	406	5
14288	118	414	4
14289	118	422	4
14290	118	427	4
14291	118	431	2
14292	118	437	4
14293	118	446	4
14294	118	453	3
14295	118	456	3
14296	118	465	4
14297	118	469	4
14298	118	483	4
14299	118	485	4
14300	118	487	3
14301	118	496	4
14302	118	497	5
14303	118	520	3
14304	118	521	4
14305	118	522	5
14306	118	523	4
14307	118	524	2
14308	118	525	4
14309	118	526	4
14310	118	530	4
14311	118	565	3
14312	118	568	3
14313	118	593	2
14314	118	602	3
14315	118	611	4
14316	118	620	4
14317	118	622	3
14318	118	646	3
14319	118	647	5
14320	118	659	4
14321	118	662	4
14322	118	683	3
14323	118	694	4
14324	118	716	2
14325	118	734	5
14326	118	741	4
14327	118	742	2
14328	118	755	5
14329	118	775	3
14330	118	835	4
14331	118	844	4
14332	118	854	2
14333	118	878	2
14334	118	888	2
14335	118	895	4
14336	118	897	3
14337	118	898	4
14338	118	923	4
14339	118	947	2
14340	118	959	4
14341	118	960	5
14342	118	961	4
14343	118	963	4
14344	118	969	4
14345	118	972	5
14346	118	976	3
14347	118	977	0.5
14348	118	1000	4
14349	118	1018	1
14350	118	1025	3
14351	118	1026	2
14352	118	1030	4
14353	118	1066	3
14354	118	1100	3
14355	118	1116	4
14356	118	1119	3
14357	118	1121	5
14358	118	1125	4
14359	118	1131	1
14360	118	1133	3
14361	118	1138	3
14362	118	1157	4
14363	118	1164	2
14364	118	1181	3
14365	118	1198	3
14366	118	1203	4
14367	118	1233	2
14368	118	1250	5
14369	118	1254	2
14370	118	1257	3
14371	118	1260	5
14372	118	1261	4
14373	118	1265	3
14374	118	1274	3
14375	118	1278	4
14376	118	1288	4
14377	118	1290	3
14378	118	1295	3
14379	118	1302	2
14380	118	1303	3
14381	118	1340	2
14382	118	1353	3
14383	118	1361	4
14384	118	1368	3
14385	118	1369	4
14386	118	1384	3
14387	118	1402	2
14388	118	1406	4
14389	118	1412	3
14390	118	1430	3
14391	118	1464	2
14392	118	1469	3
14393	118	1471	4
14394	118	1472	2
14395	118	1489	5
14396	118	1494	3
14397	118	1521	4
14398	118	1524	5
14399	118	1566	3
14400	118	1569	4.5
14401	118	1570	4
14402	118	1574	3
14403	118	1575	3
14404	118	1591	3
14405	118	1619	5
14406	118	1641	3
14407	118	1660	3
14408	118	1665	2
14409	118	1685	3
14410	118	1796	4
14411	118	1800	4
14412	118	1804	3
14413	118	1814	2
14414	118	1836	2
14415	118	1849	3
14416	118	1853	3
14417	118	1854	2
14418	118	1865	5
14419	118	1907	3
14420	118	1915	3
14421	118	1919	4
14422	118	1920	4
14423	118	1921	4
14424	118	1922	3
14425	118	1923	3
14426	118	1933	5
14427	118	1934	4
14428	118	1941	4
14429	118	1989	3
14430	118	1992	1.5
14431	118	1997	3
14432	118	2001	3
14433	118	2057	3
14434	118	2058	3
14435	118	2091	3
14436	118	2099	3
14437	118	2108	4
14438	118	2135	4
14439	118	2153	3
14440	118	2158	3
14441	118	2160	4
14442	118	2163	2
14443	118	2164	4
14444	118	2180	4
14445	118	2210	4
14446	118	2211	2
14447	118	2239	4
14448	118	2262	2
14449	118	2282	2
14450	118	2298	3
14451	118	2304	4
14452	118	2311	3
14453	118	2330	3
14454	118	2370	3
14455	118	2383	3
14456	118	2387	4
14457	118	2398	0.5
14458	118	2403	4
14459	118	2424	4
14460	118	2467	5
14461	118	2483	1
14462	118	2497	4
14463	118	2520	5
14464	118	2526	3
14465	118	2527	3
14466	118	2542	3
14467	118	2543	2
14468	118	2545	4
14469	118	2550	1
14470	118	2588	4
14471	118	2594	2
14472	118	2596	5
14473	118	2597	2
14474	118	2600	5
14475	118	2610	4
14476	118	2612	4
14477	118	2615	3
14478	118	2638	3
14479	118	2666	4
14480	118	2693	3
14481	118	2704	4
14482	118	2740	4
14483	118	2742	4
14484	118	2770	3
14485	118	2781	3
14486	118	2789	3
14487	118	2790	4
14488	118	2800	4
14489	118	2804	4
14490	118	2822	3
14491	118	2827	4
14492	118	2837	5
14493	118	2869	3
14494	118	2870	4
14495	118	2938	4
14496	118	2967	4
14497	118	2969	2
14498	118	3026	5
14499	118	3056	4
14500	118	3087	4
14501	118	3127	3
14502	118	3133	3
14503	118	3135	4
14504	118	3153	3
14505	118	3169	4
14506	118	3170	4
14507	118	3173	4
14508	118	3174	4
14509	118	3176	4
14510	118	3211	4
14511	118	3259	3
14512	118	3260	3
14513	118	3277	1
14514	118	3302	4
14515	118	3332	4
14516	118	3375	3
14517	118	3380	3.5
14518	118	3383	3
14519	118	3389	3
14520	118	3411	4
14521	118	3422	3
14522	118	3517	4
14523	118	3638	3
14524	118	3665	4.5
14525	118	3683	4
14526	118	3738	1
14527	118	3772	3
14528	118	3798	1
14529	118	3804	3
14530	118	3812	4
14531	118	3885	3
14532	118	3886	4
14533	118	3888	4
14534	118	3900	3
14535	118	3966	3
14536	118	3970	4
14537	118	3998	1
14538	118	4063	5
14539	118	4080	4
14540	118	4109	3
14541	118	4127	4
14542	118	4154	4
14543	118	4156	2
14544	118	4167	3
14545	118	4173	3
14546	118	4184	4
14547	118	4188	3
14548	118	4213	2
14549	118	4237	4
14550	118	4281	3
14551	118	4396	3
14552	118	4451	4
14553	118	4458	4.5
14554	118	4485	4
14555	118	4681	3.5
14556	118	4705	3.5
14557	118	5207	4
14558	119	6	5
14559	119	23	4.5
14560	119	32	5
14561	119	48	4.5
14562	119	99	5
14563	119	128	4.5
14564	119	142	4
14565	119	231	3
14566	119	236	5
14567	119	261	5
14568	119	280	5
14569	119	310	5
14570	119	317	5
14571	119	340	3.5
14572	119	406	5
14573	119	427	5
14574	119	472	5
14575	119	478	3.5
14576	119	497	5
14577	119	526	5
14578	119	538	5
14579	119	677	3.5
14580	119	696	5
14581	119	888	4
14582	119	961	4.5
14583	119	970	4.5
14584	119	975	3.5
14585	119	983	5
14586	119	984	5
14587	119	1000	5
14588	119	1133	3.5
14589	119	1201	5
14590	119	1290	4.5
14591	119	1302	5
14592	119	1348	4.5
14593	119	1354	3.5
14594	119	1361	4
14595	119	1406	5
14596	119	1429	5
14597	119	1494	5
14598	119	1591	5
14599	119	1627	4.5
14600	119	1844	4.5
14601	119	1915	3.5
14602	119	1941	3
14603	119	2057	5
14604	119	2210	5
14605	119	2282	5
14606	119	2366	5
14607	119	2496	4.5
14608	119	2543	4.5
14609	119	2638	4
14610	119	2733	5
14611	119	2761	4
14612	119	2837	5
14613	119	3039	4
14614	119	3323	4
14615	119	3888	4
14616	119	4173	5
14617	119	5005	5
14618	120	1	4
14619	120	34	4
14620	120	68	5
14621	120	214	4
14622	120	324	5
14623	120	495	3
14624	120	496	2
14625	120	522	4
14626	120	527	5
14627	120	528	5
14628	120	572	3
14629	120	732	5
14630	120	740	4
14631	120	741	5
14632	120	742	4
14633	120	766	5
14634	120	836	5
14635	120	840	4
14636	120	843	5
14637	120	867	5
14638	120	960	5
14639	120	962	5
14640	120	996	4
14641	120	1042	5
14642	120	1053	4
14643	120	1134	5
14644	120	1215	4
14645	120	1239	5
14646	120	1242	5
14647	120	1464	4
14648	120	1487	5
14649	120	1514	5
14650	120	1518	5
14651	120	1535	5
14652	120	1647	4
14653	120	1656	5
14654	120	1839	5
14655	120	1907	5
14656	120	2115	2
14657	120	2246	5
14658	120	2281	4
14659	120	2282	5
14660	120	2468	4
14661	120	2497	4
14662	120	2713	3
14663	120	2901	5
14664	121	559	3
14665	121	608	4
14666	121	631	5
14667	121	724	5
14668	121	730	5
14669	121	746	5
14670	121	848	4
14671	121	875	5
14672	121	947	5
14673	121	968	5
14674	121	991	3
14675	121	1012	4
14676	121	1031	5
14677	121	1066	4
14678	121	1261	3
14679	121	1311	5
14680	121	1473	4
14681	121	1522	5
14682	121	1591	5
14683	121	1625	3
14684	121	1669	1
14685	121	1685	4
14686	121	1839	4
14687	121	1871	5
14688	121	1901	4
14689	121	1907	5
14690	121	1946	3
14691	121	1989	3
14692	121	1992	4
14693	121	2002	2
14694	121	2031	4
14695	121	2034	3
14696	121	2053	4
14697	121	2058	3
14698	121	2067	5
14699	121	2078	2
14700	121	2083	5
14701	121	2095	3
14702	121	2135	5
14703	121	2145	5
14704	121	2149	4
14705	121	2155	4
14706	121	2165	4
14707	121	2169	3
14708	121	2180	3
14709	121	2215	4
14710	121	2247	3
14711	121	2281	3
14712	121	2282	5
14713	121	2371	4
14714	121	2428	5
14715	121	2521	5
14716	121	2542	3
14717	121	2639	4
14718	121	2740	5
14719	121	2742	4
14720	121	2753	5
14721	121	2754	5
14722	121	2757	3
14723	121	2766	5
14724	121	2770	3
14725	121	2780	4
14726	121	2783	4
14727	121	2786	5
14728	121	2789	5
14729	121	2797	4
14730	121	2799	3
14731	121	2801	2
14732	121	2806	5
14733	122	1	5
14734	122	2	3
14735	122	6	5
14736	122	10	3
14737	122	16	4
14738	122	22	3
14739	122	45	5
14740	122	48	5
14741	122	65	4
14742	122	71	3
14743	122	80	3
14744	122	88	2
14745	122	99	5
14746	122	140	4
14747	122	142	4
14748	122	146	4
14749	122	161	2
14750	122	195	5
14751	122	231	5
14752	122	256	4
14753	122	259	3
14754	122	261	5
14755	122	267	3
14756	122	278	3
14757	122	280	5
14758	122	310	4
14759	122	314	3
14760	122	324	4
14761	122	336	3
14762	122	337	4
14763	122	340	3
14764	122	372	2
14765	122	383	3
14766	122	403	3
14767	122	406	4
14768	122	412	1
14769	122	422	4
14770	122	427	5
14771	122	467	5
14772	122	472	5
14773	122	488	2
14774	122	522	4
14775	122	523	4
14776	122	524	4
14777	122	525	3
14778	122	526	5
14779	122	528	3
14780	122	553	3
14781	122	573	3
14782	122	581	2
14783	122	612	5
14784	122	614	3
14785	122	620	4
14786	122	622	3
14787	122	624	5
14788	122	627	5
14789	122	653	3
14790	122	655	2
14791	122	681	3
14792	122	691	1
14793	122	696	5
14794	122	708	2
14795	122	746	4
14796	122	773	3
14797	122	829	4
14798	122	844	5
14799	122	845	3
14800	122	853	3
14801	122	854	3
14802	122	864	4
14803	122	873	4
14804	122	887	5
14805	122	890	3
14806	122	895	4
14807	122	923	5
14808	122	926	5
14809	122	959	5
14810	122	960	5
14811	122	961	5
14812	122	963	5
14813	122	972	5
14814	122	975	5
14815	122	977	3
14816	122	983	5
14817	122	985	5
14818	122	1000	4
14819	122	1021	4
14820	122	1034	5
14821	122	1051	5
14822	122	1112	4
14823	122	1119	3
14824	122	1131	3
14825	122	1136	4
14826	122	1144	5
14827	122	1167	2
14828	122	1198	4
14829	122	1215	4
14830	122	1222	3
14831	122	1224	2
14832	122	1227	2
14833	122	1244	3
14834	122	1250	4
14835	122	1260	3
14836	122	1261	3
14837	122	1268	2
14838	122	1270	4
14839	122	1271	3
14840	122	1272	2
14841	122	1278	5
14842	122	1290	5
14843	122	1296	4
14844	122	1298	4
14845	122	1302	5
14846	122	1315	3
14847	122	1322	5
14848	122	1340	4
14849	122	1348	3
14850	122	1366	3
14851	122	1386	4
14852	122	1414	5
14853	122	1427	3
14854	122	1456	3
14855	122	1485	3
14856	122	1489	3
14857	122	1491	3
14858	122	1492	4
14859	122	1534	3
14860	122	1535	5
14861	122	1569	4
14862	122	1570	3
14863	122	1584	3
14864	122	1586	3
14865	122	1589	2
14866	122	1615	3
14867	122	1665	4
14868	122	1675	5
14869	122	1686	3
14870	122	1692	3
14871	122	1717	4
14872	122	1730	3
14873	122	1743	3
14874	122	1748	3
14875	122	1749	5
14876	122	1770	4
14877	122	1771	4
14878	122	1800	3
14879	122	1803	5
14880	122	1804	2
14881	122	1816	3
14882	122	1848	3
14883	122	1851	3
14884	122	1865	3
14885	122	1867	4
14886	122	1902	4
14887	122	1934	3
14888	122	1938	3
14889	122	1939	3
14890	122	1976	2
14891	122	1977	2
14892	122	1989	2
14893	122	1992	4
14894	122	2002	5
14895	122	2004	4
14896	122	2033	3
14897	122	2057	5
14898	122	2058	5
14899	122	2064	5
14900	122	2065	2
14901	122	2079	4
14902	122	2080	3
14903	122	2090	3
14904	122	2091	3
14905	122	2099	4
14906	122	2136	3
14907	122	2139	3
14908	122	2144	3
14909	122	2146	3
14910	122	2151	5
14911	122	2153	2
14912	122	2158	3
14913	122	2159	4
14914	122	2160	2
14915	122	2163	4
14916	122	2164	4
14917	122	2172	4
14918	122	2178	2
14919	122	2179	4
14920	122	2180	2
14921	122	2210	4
14922	122	2211	3
14923	122	2212	3
14924	122	2219	4
14925	122	2247	3
14926	122	2271	3
14927	122	2282	5
14928	122	2328	4
14929	122	2330	4
14930	122	2332	5
14931	122	2366	5
14932	122	2389	4
14933	122	2396	3
14934	122	2399	5
14935	122	2466	4
14936	122	2467	3
14937	122	2496	2
14938	122	2497	4
14939	122	2520	4
14940	122	2542	4
14941	122	2543	3
14942	122	2588	3
14943	122	2597	4
14944	122	2614	3
14945	122	2621	4
14946	122	2627	5
14947	122	2628	4
14948	122	2629	2
14949	122	2661	2
14950	122	2705	3
14951	122	2730	3
14952	122	2768	3
14953	122	2770	4
14954	122	2788	4
14955	122	2790	4
14956	122	2794	4
14957	122	2800	3
14958	122	2805	5
14959	122	2820	2
14960	122	2822	2
14961	122	2837	5
14962	122	2845	1
14963	122	2863	3
14964	122	2869	3
14965	122	2920	3
14966	122	2938	3
14967	122	2947	2
14968	122	2962	2
14969	122	2963	5
14970	122	2965	4
14971	122	2966	1
14972	122	2967	3
14973	122	2969	3
14974	122	2990	4
14975	122	3000	4
14976	122	3025	3
14977	122	3052	4
14978	122	3063	1
14979	122	3066	1
14980	122	3069	5
14981	122	3073	5
14982	122	3080	2
14983	122	3106	2
14984	122	3109	5
14985	122	3132	2
14986	122	3136	3
14987	122	3138	5
14988	122	3141	2
14989	122	3149	4
14990	122	3158	3
14991	122	3163	5
14992	122	3167	5
14993	122	3171	4
14994	122	3173	4
14995	122	3177	2
14996	122	3183	4
14997	122	3184	5
14998	122	3197	3
14999	122	3265	2
15000	122	3280	3
15001	122	3323	5
15002	122	3327	2
15003	122	3347	2
15004	122	3351	3
15005	122	3354	2
15006	122	3375	3
15007	122	3380	5
15008	122	3405	3
15009	122	3422	2
15010	122	3429	3
15011	122	3481	4
15012	122	3483	3
15013	122	3578	4
15014	122	3633	3
15015	122	3634	2
15016	122	3638	2
15017	122	3698	4
15018	122	3701	4
15019	122	3790	4
15020	122	3804	4
15021	122	3812	4
15022	122	3818	4
15023	122	3852	4
15024	122	3860	4
15025	122	3868	5
15026	122	3870	3
15027	122	3875	4
15028	122	3886	5
15029	122	3888	3
15030	122	3900	3
15031	122	3902	3
15032	122	3904	4
15033	122	3927	3
15034	122	3970	3
15035	122	4033	3
15036	122	4034	4
15037	122	4056	2
15038	122	4062	5
15039	122	4068	2
15040	122	4109	5
15041	122	4116	3
15042	122	4127	4
15043	122	4173	5
15044	122	4174	4
15045	123	5	3.5
15046	123	7	3.5
15047	123	21	4
15048	123	121	3.5
15049	123	261	4.5
15050	123	280	4
15051	123	300	4
15052	123	318	3.5
15053	123	324	3.5
15054	123	389	3.5
15055	123	446	4.5
15056	123	472	5
15057	123	483	4
15058	123	519	3.5
15059	123	520	4
15060	123	522	3.5
15061	123	526	4.5
15062	123	530	4.5
15063	123	538	4.5
15064	123	602	3.5
15065	123	669	2.5
15066	123	873	4.5
15067	123	877	4
15068	123	886	3
15069	123	898	4
15070	123	960	4
15071	123	1004	4.5
15072	123	1025	3.5
15073	123	1030	4.5
15074	123	1055	4
15075	123	1066	5
15076	123	1133	4.5
15077	123	1134	2
15078	123	1226	4
15079	123	1257	3.5
15080	123	1311	4
15081	123	1342	3.5
15082	123	1349	4
15083	123	1399	4
15084	123	1402	3.5
15085	123	1494	4
15086	123	1522	4.5
15087	123	1525	4
15088	123	1535	4.5
15089	123	1615	3
15090	123	1641	4
15091	123	1660	3
15092	123	1668	3.5
15093	123	1691	3.5
15094	123	1701	4
15095	123	1702	3.5
15096	123	1703	4
15097	123	1777	5
15098	123	1778	4.5
15099	123	1780	4
15100	123	1790	3.5
15101	123	1822	4
15102	123	1854	1
15103	123	1864	4.5
15104	123	1871	4.5
15105	123	1883	4
15106	123	1907	4.5
15107	123	1916	2.5
15108	123	1933	3.5
15109	123	1934	3.5
15110	123	1975	3.5
15111	123	2031	4
15112	123	2135	4
15113	123	2144	3.5
15114	123	2180	2.5
15115	123	2224	3.5
15116	123	2233	4.5
15117	123	2236	3.5
15118	123	2237	4
15119	123	2239	4.5
15120	123	2282	4
15121	123	2329	4.5
15122	123	2332	4.5
15123	123	2398	2
15124	123	2459	5
15125	123	2530	4
15126	123	2568	3.5
15127	123	2585	4
15128	123	2596	4
15129	123	2602	4
15130	123	2664	3.5
15131	123	2711	2.5
15132	123	2766	4
15133	123	2779	3
15134	123	2799	4
15135	123	2806	4.5
15136	123	2811	4
15137	123	2934	2.5
15138	123	2991	3.5
15139	123	3108	4
15140	123	3156	3.5
15141	123	3164	3.5
15142	123	3174	3.5
15143	123	3191	4
15144	123	3204	3.5
15145	123	3211	3.5
15146	123	3337	4
15147	123	3386	3
15148	123	3389	4
15149	123	3397	4
15150	123	3419	5
15151	123	3482	4
15152	123	3488	2.5
15153	123	3496	4
15154	123	3508	3.5
15155	123	3510	3.5
15156	123	3513	4
15157	123	3621	3.5
15158	123	3634	3
15159	123	3682	3.5
15160	123	3769	1
15161	123	3772	3.5
15162	123	3885	3.5
15163	123	4080	4
15164	123	4082	2
15165	123	4085	4
15166	123	4086	2.5
15167	123	4126	3.5
15168	123	4152	3.5
15169	123	4281	3
15170	123	4314	3.5
15171	123	4349	4
15172	123	4447	4
15173	123	4451	4
15174	123	4462	3
15175	123	4472	4
15176	123	4560	2.5
15177	123	4614	3.5
15178	123	4671	3
15179	123	4705	4.5
15180	123	4774	3.5
15181	123	4837	4.5
15182	123	4909	2
15183	123	4941	2
15184	123	5039	4
15185	123	5043	4
15186	123	5082	4
15187	123	5203	4
15188	123	5221	3.5
15189	123	5369	4
15190	123	5375	3
15191	123	5730	2
15192	123	5807	3
15193	123	5816	3
15194	123	5858	4
15195	123	5875	5
15196	123	5895	3.5
15197	123	6381	4
15198	123	6423	4
15199	123	6488	4
15200	123	6566	4
15201	123	6621	3.5
15202	123	6643	3.5
15203	123	6650	4
15204	123	6673	4.5
15205	123	6686	1.5
15206	123	6714	4
15207	123	6895	2
15208	123	6923	3
15209	123	6941	3
15210	124	36	5
15211	124	110	5
15212	124	231	5
15213	124	276	4
15214	124	281	4
15215	124	298	5
15216	124	414	5
15217	124	434	4
15218	124	451	5
15219	124	454	5
15220	124	460	4
15221	124	497	3
15222	124	523	5
15223	124	526	5
15224	124	538	5
15225	124	607	5
15226	124	624	5
15227	124	700	5
15228	124	724	5
15229	124	725	5
15230	124	726	5
15231	124	730	5
15232	124	746	5
15233	124	749	4
15234	124	789	4
15235	124	892	5
15236	124	909	4
15237	124	923	5
15238	124	940	5
15239	124	957	4
15240	124	959	5
15241	124	960	5
15242	124	963	2
15243	124	968	5
15244	124	970	2
15245	124	976	5
15246	124	984	4
15247	124	987	5
15248	124	997	4
15249	124	1000	4
15250	124	1007	5
15251	124	1012	5
15252	124	1018	5
15253	124	1040	5
15254	124	1045	5
15255	124	1055	5
15256	124	1087	4
15257	124	1094	4
15258	124	1101	1
15259	124	1201	5
15260	124	1230	4
15261	124	1309	5
15262	124	1318	5
15263	124	1322	1
15264	124	1340	3
15265	124	1345	4
15266	124	1368	1
15267	124	1534	5
15268	124	1535	5
15269	124	1536	4
15270	124	1537	4
15271	124	1538	4
15272	124	1539	4
15273	124	1561	4
15274	124	1582	5
15275	124	1583	5
15276	124	1584	5
15277	124	1588	3
15278	124	1636	5
15279	124	1660	5
15280	124	1690	5
15281	124	1701	5
15282	124	1716	5
15283	124	1717	4
15284	124	1730	4
15285	124	1748	5
15286	124	1814	4
15287	124	1836	1
15288	124	1851	5
15289	124	1864	4
15290	124	1881	4
15291	124	1896	4
15292	124	1901	4
15293	124	1906	5
15294	124	1963	5
15295	124	2041	5
15296	124	2057	4
15297	124	2079	5
15298	124	2101	2
15299	124	2122	5
15300	124	2151	5
15301	124	2185	5
15302	124	2195	4
15303	124	2210	4
15304	124	2332	5
15305	124	2351	5
15306	124	2366	5
15307	124	2373	4
15308	124	2378	5
15309	124	2398	5
15310	124	2399	5
15311	124	2491	4
15312	124	2576	5
15313	124	2605	4
15314	124	2667	5
15315	124	2718	4
15316	124	2796	5
15317	124	2799	5
15318	124	2812	5
15319	124	2817	4
15320	124	2855	5
15321	124	2927	5
15322	124	3039	5
15323	124	3059	5
15324	124	3082	3
15325	124	3103	4
15326	124	3128	4
15327	124	3190	5
15328	124	3204	5
15329	124	3231	5
15330	124	3389	3
15331	124	3425	3
15332	124	3440	4
15333	124	3560	5
15334	124	3590	5
15335	124	3602	5
15336	124	3637	5
15337	124	3716	3
15338	124	3788	5
15339	124	3795	5
15340	124	3818	3
15341	124	3865	5
15342	124	3868	3
15343	124	3915	4
15344	125	14	1
15345	125	97	4
15346	125	117	4.5
15347	125	270	0.5
15348	125	503	4
15349	125	560	4
15350	125	626	0.5
15351	125	1055	3
15352	125	1058	3.5
15353	125	1668	0.5
15354	125	1871	4
15355	125	1984	0.5
15356	125	2295	4.5
15357	125	2488	2
15358	125	2588	1
15359	125	2593	1
15360	125	2668	1.5
15361	125	2921	1
15362	125	3351	4
15363	125	8630	2.5
15364	126	32	4
15365	126	99	5
15366	126	203	5
15367	126	231	3.5
15368	126	261	2.5
15369	126	280	4.5
15370	126	317	4
15371	126	340	4.5
15372	126	406	4
15373	126	427	4
15374	126	472	4.5
15375	126	525	3
15376	126	526	4.5
15377	126	889	4
15378	126	1175	3
15379	126	1217	3
15380	126	1353	4
15381	126	1524	2
15382	126	1642	2
15383	126	1702	3
15384	126	1994	3.5
15385	126	2057	4.5
15386	126	2245	4
15387	126	2260	5
15388	126	2392	3.5
15389	126	2488	3.5
15390	126	2869	4.5
15391	126	3139	3
15392	126	3320	4
15393	126	3389	3
15394	126	3517	3
15395	126	3638	3
15396	126	3860	5
15397	126	3904	4
15398	126	4453	3.5
15399	126	4768	1
15400	126	4803	5
15401	126	5289	3.5
15402	126	7006	4
15403	126	7036	4.5
15404	126	7200	4.5
15405	126	7385	4.5
15406	126	8121	5
15407	126	8291	4
15408	126	8351	4.5
15409	127	211	1
15410	127	231	3
15411	127	427	2
15412	127	509	2
15413	127	522	3
15414	127	528	3
15415	127	580	4
15416	127	624	3
15417	127	730	3
15418	127	734	2
15419	127	741	3
15420	127	745	5
15421	127	959	3
15422	127	960	4
15423	127	961	3
15424	127	966	4
15425	127	972	3
15426	127	1019	3
15427	127	1029	3
15428	127	1030	3
15429	127	1034	3
15430	127	1035	2
15431	127	1042	1
15432	127	1051	3
15433	127	1256	2
15434	127	1349	2
15435	127	1491	1
15436	127	1492	4
15437	127	1641	3
15438	127	1652	1
15439	127	1816	3
15440	127	1867	2
15441	127	2146	2
15442	127	2151	5
15443	127	2209	4
15444	127	2389	4
15445	127	2399	4
15446	127	2425	2
15447	127	2963	2
15448	127	3000	3
15449	127	3052	2
15450	127	3150	4
15451	127	3167	2
15452	127	3177	3
15453	127	3221	3
15454	127	3265	1
15455	127	3380	2
15456	127	3481	2
15457	127	3536	3
15458	127	3886	3
15459	127	3943	3
15460	127	3996	2
15461	127	4109	2
15462	127	4116	3
15463	127	4189	4
15464	127	4272	4
15465	127	4279	4
15466	127	4458	3
15467	128	1	3
15468	128	2	3
15469	128	6	5
15470	128	10	3.5
15471	128	16	4
15472	128	18	4.5
15473	128	19	3.5
15474	128	21	4
15475	128	23	3.5
15476	128	29	2.5
15477	128	32	4.5
15478	128	34	3
15479	128	36	3.5
15480	128	45	5
15481	128	46	3
15482	128	48	5
15483	128	64	4
15484	128	65	4
15485	128	75	3
15486	128	88	3.5
15487	128	92	3
15488	128	95	2.5
15489	128	99	4.5
15490	128	100	4
15491	128	123	3.5
15492	128	128	3.5
15493	128	130	3.5
15494	128	137	3
15495	128	140	4
15496	128	142	4
15497	128	146	2
15498	128	149	2.5
15499	128	156	3.5
15500	128	161	2
15501	128	170	3.5
15502	128	171	2.5
15503	128	181	4
15504	128	195	3.5
15505	128	203	4
15506	128	207	3
15507	128	224	4
15508	128	231	3.5
15509	128	259	4.5
15510	128	261	5
15511	128	280	5
15512	128	281	3
15513	128	305	4
15514	128	310	3.5
15515	128	317	4.5
15516	128	318	3
15517	128	324	4
15518	128	327	3.5
15519	128	328	4.5
15520	128	330	3
15521	128	337	3.5
15522	128	340	2.5
15523	128	369	3
15524	128	380	4
15525	128	390	4
15526	128	406	4
15527	128	427	3.5
15528	128	428	3.5
15529	128	446	3
15530	128	472	3.5
15531	128	476	2.5
15532	128	485	5
15533	128	495	4.5
15534	128	499	3.5
15535	128	505	3
15536	128	520	3.5
15537	128	522	3.5
15538	128	523	3.5
15539	128	525	3.5
15540	128	526	4
15541	128	530	3.5
15542	128	538	4.5
15543	128	546	3.5
15544	128	553	4
15545	128	565	4
15546	128	603	3.5
15547	128	620	4.5
15548	128	622	3
15549	128	624	3.5
15550	128	626	4
15551	128	627	4
15552	128	631	4
15553	128	647	3
15554	128	651	3.5
15555	128	654	3
15556	128	677	3
15557	128	696	5
15558	128	741	2.5
15559	128	746	3.5
15560	128	807	3.5
15561	128	831	3.5
15562	128	840	5
15563	128	841	4
15564	128	844	4
15565	128	853	3.5
15566	128	862	4
15567	128	877	3.5
15568	128	878	4.5
15569	128	884	3.5
15570	128	887	5
15571	128	888	3.5
15572	128	889	3.5
15573	128	895	3.5
15574	128	915	4
15575	128	923	4.5
15576	128	926	4.5
15577	128	941	3
15578	128	959	4
15579	128	960	4
15580	128	961	4
15581	128	962	3
15582	128	963	4
15583	128	964	4
15584	128	966	4
15585	128	967	4
15586	128	968	4
15587	128	972	3.5
15588	128	975	4.5
15589	128	976	4
15590	128	977	3
15591	128	981	3
15592	128	982	5
15593	128	983	4.5
15594	128	984	4
15595	128	985	4
15596	128	989	4
15597	128	995	4
15598	128	998	3.5
15599	128	1000	4
15600	128	1003	4
15601	128	1005	4.5
15602	128	1006	4
15603	128	1009	4
15604	128	1018	4.5
15605	128	1019	4
15606	128	1021	2.5
15607	128	1023	4
15608	128	1030	4
15609	128	1048	4.5
15610	128	1049	1.5
15611	128	1051	4
15612	128	1057	4
15613	128	1062	4
15614	128	1071	3.5
15615	128	1090	4
15616	128	1111	3.5
15617	128	1112	4
15618	128	1119	3.5
15619	128	1125	3.5
15620	128	1131	3
15621	128	1136	3
15622	128	1142	4.5
15623	128	1144	3
15624	128	1167	2.5
15625	128	1189	4.5
15626	128	1203	4
15627	128	1226	4
15628	128	1233	4
15629	128	1250	3.5
15630	128	1254	3.5
15631	128	1256	3.5
15632	128	1260	3.5
15633	128	1261	3.5
15634	128	1265	2.5
15635	128	1270	3.5
15636	128	1271	2.5
15637	128	1278	3.5
15638	128	1284	2.5
15639	128	1295	3.5
15640	128	1296	4.5
15641	128	1298	4
15642	128	1302	5
15643	128	1306	3.5
15644	128	1314	2.5
15645	128	1315	4
15646	128	1322	4
15647	128	1339	2.5
15648	128	1340	2.5
15649	128	1344	3.5
15650	128	1348	4
15651	128	1351	3.5
15652	128	1361	5
15653	128	1366	2
15654	128	1369	4
15655	128	1372	4
15656	128	1375	4
15657	128	1382	3.5
15658	128	1385	3
15659	128	1386	4
15660	128	1400	3.5
15661	128	1406	3.5
15662	128	1411	3.5
15663	128	1435	2.5
15664	128	1446	3
15665	128	1463	4.5
15666	128	1469	2.5
15667	128	1482	3.5
15668	128	1485	4
15669	128	1489	3
15670	128	1490	4
15671	128	1494	3.5
15672	128	1521	4
15673	128	1522	4.5
15674	128	1528	4.5
15675	128	1534	3
15676	128	1535	4.5
15677	128	1561	3.5
15678	128	1564	4
15679	128	1565	4
15680	128	1567	2.5
15681	128	1574	3
15682	128	1575	3
15683	128	1586	4
15684	128	1591	4
15685	128	1619	4
15686	128	1621	3
15687	128	1632	2.5
15688	128	1638	4.5
15689	128	1640	3.5
15690	128	1641	3.5
15691	128	1647	3
15692	128	1665	3
15693	128	1667	1.5
15694	128	1675	3.5
15695	128	1723	3.5
15696	128	1730	4
15697	128	1749	4
15698	128	1771	4
15699	128	1796	3
15700	128	1800	4
15701	128	1803	4
15702	128	1805	3
15703	128	1811	3.5
15704	128	1814	4
15705	128	1816	2.5
15706	128	1818	3.5
15707	128	1840	3.5
15708	128	1844	4.5
15709	128	1848	3.5
15710	128	1852	1.5
15711	128	1865	4
15712	128	1867	2.5
15713	128	1890	3
15714	128	1891	3
15715	128	1892	3.5
15716	128	1893	3.5
15717	128	1894	3
15718	128	1895	2.5
15719	128	1902	3
15720	128	1905	4
15721	128	1906	3
15722	128	1913	4.5
15723	128	1934	3.5
15724	128	1992	3.5
15725	128	2002	3.5
15726	128	2031	4
15727	128	2033	3.5
15728	128	2034	5
15729	128	2057	4
15730	128	2064	4.5
15731	128	2079	2
15732	128	2080	3.5
15733	128	2091	3.5
15734	128	2099	3
15735	128	2122	1.5
15736	128	2136	3
15737	128	2144	3.5
15738	128	2146	3
15739	128	2151	3.5
15740	128	2160	3.5
15741	128	2163	3.5
15742	128	2167	3
15743	128	2172	4
15744	128	2175	3
15745	128	2197	3.5
15746	128	2210	4
15747	128	2230	3.5
15748	128	2245	3.5
15749	128	2271	4
15750	128	2282	4.5
15751	128	2284	4
15752	128	2313	4
15753	128	2330	2.5
15754	128	2332	4
15755	128	2362	3.5
15756	128	2366	5
15757	128	2389	4
15758	128	2392	2.5
15759	128	2398	3.5
15760	128	2424	4.5
15761	128	2442	4.5
15762	128	2466	4
15763	128	2467	4
15764	128	2497	3
15765	128	2520	4.5
15766	128	2543	3.5
15767	128	2568	3.5
15768	128	2594	3.5
15769	128	2595	3.5
15770	128	2603	3.5
15771	128	2608	4.5
15772	128	2614	1.5
15773	128	2616	4.5
15774	128	2621	4
15775	128	2628	3.5
15776	128	2629	3.5
15777	128	2635	3
15778	128	2646	3.5
15779	128	2662	4
15780	128	2713	3.5
15781	128	2766	3.5
15782	128	2798	3
15783	128	2800	2.5
15784	128	2837	4
15785	128	2863	2.5
15786	128	2869	2.5
15787	128	2870	3
15788	128	2911	3.5
15789	128	2925	2
15790	128	2926	2.5
15791	128	2927	2.5
15792	128	2938	3
15793	128	2962	3.5
15794	128	2965	3.5
15795	128	2966	3.5
15796	128	2967	3
15797	128	2992	3.5
15798	128	3000	3.5
15799	128	3052	3.5
15800	128	3055	4
15801	128	3056	4
15802	128	3063	3.5
15803	128	3073	4.5
15804	128	3079	3
15805	128	3108	4
15806	128	3132	3.5
15807	128	3139	3.5
15808	128	3143	3.5
15809	128	3149	3
15810	128	3150	3.5
15811	128	3151	2
15812	128	3163	4.5
15813	128	3165	4.5
15814	128	3166	2.5
15815	128	3167	4.5
15816	128	3173	3
15817	128	3177	4
15818	128	3184	4
15819	128	3197	2.5
15820	128	3219	4
15821	128	3232	4
15822	128	3233	3
15823	128	3248	3.5
15824	128	3260	2.5
15825	128	3265	3.5
15826	128	3275	4
15827	128	3280	3.5
15828	128	3323	5
15829	128	3345	4.5
15830	128	3349	3.5
15831	128	3351	3
15832	128	3375	4
15833	128	3380	4
15834	128	3405	2.5
15835	128	3406	3
15836	128	3424	3.5
15837	128	3425	4
15838	128	3436	3
15839	128	3478	2.5
15840	128	3491	1.5
15841	128	3561	2.5
15842	128	3636	3.5
15843	128	3683	3.5
15844	128	3696	2.5
15845	128	3698	3
15846	128	3702	4
15847	128	3704	3
15848	128	3709	1.5
15849	128	3716	2
15850	128	3738	4
15851	128	3769	3.5
15852	128	3788	4
15853	128	3791	3.5
15854	128	3796	4
15855	128	3804	2.5
15856	128	3806	2
15857	128	3807	4
15858	128	3810	4
15859	128	3812	4
15860	128	3816	3
15861	128	3822	4.5
15862	128	3852	2.5
15863	128	3853	2
15864	128	3860	4.5
15865	128	3868	4
15866	128	3870	3.5
15867	128	3874	4
15868	128	3886	4
15869	128	3888	4.5
15870	128	3900	4
15871	128	3904	2.5
15872	128	3925	2.5
15873	128	3971	3.5
15874	128	3979	3.5
15875	128	3988	3.5
15876	128	4033	4
15877	128	4034	4
15878	128	4035	3.5
15879	128	4056	3
15880	128	4089	2.5
15881	128	4107	4.5
15882	128	4109	3
15883	128	4135	4.5
15884	128	4146	3
15885	128	4151	2.5
15886	128	4154	4
15887	128	4172	2.5
15888	128	4173	4
15889	128	4184	3
15890	128	4188	4
15891	128	4200	3
15892	128	4211	4
15893	128	4213	2.5
15894	128	4216	2.5
15895	128	4217	2.5
15896	128	4257	4
15897	128	4279	3.5
15898	128	4282	2
15899	128	4286	4
15900	128	4290	4.5
15901	128	4309	2.5
15902	128	4313	4
15903	128	4319	4
15904	128	4367	3.5
15905	128	4368	3.5
15906	128	4373	2
15907	128	4397	3.5
15908	128	4416	3.5
15909	128	4434	3.5
15910	128	4435	3.5
15911	128	4436	3.5
15912	128	4456	4
15913	128	4458	4
15914	128	4461	3.5
15915	128	4463	3.5
15916	128	4485	4.5
15917	128	4496	4
15918	128	4503	2.5
15919	128	4504	4.5
15920	128	4523	4
15921	128	4561	3.5
15922	128	4562	2
15923	128	4583	4
15924	128	4601	3.5
15925	128	4617	4
15926	128	4622	2
15927	128	4630	2.5
15928	128	4641	3.5
15929	128	4642	4.5
15930	128	4651	2
15931	128	4673	3.5
15932	128	4681	3.5
15933	128	4697	3.5
15934	128	4702	4
15935	128	4705	3
15936	128	4706	3.5
15937	128	4710	2
15938	128	4768	1.5
15939	128	4779	3.5
15940	128	4781	3.5
15941	128	4798	2
15942	128	4801	3
15943	128	4803	4
15944	128	4804	3
15945	128	4807	3
15946	128	4809	3.5
15947	128	4823	3
15948	128	4832	2.5
15949	128	4838	3
15950	128	4905	3.5
15951	128	4906	4
15952	128	4907	4
15953	128	4935	3.5
15954	128	4936	4.5
15955	128	4940	2.5
15956	128	4968	4
15957	128	4998	4
15958	128	5005	3.5
15959	128	5016	3
15960	128	5024	4
15961	128	5037	3.5
15962	128	5039	3
15963	128	5050	1.5
15964	128	5051	3.5
15965	128	5054	4
15966	128	5060	2.5
15967	128	5068	3
15968	128	5088	3
15969	128	5106	4
15970	128	5124	3.5
15971	128	5154	4
15972	128	5201	2.5
15973	128	5202	5
15974	128	5207	4
15975	128	5216	3.5
15976	128	5230	3
15977	128	5257	2
15978	128	5269	4
15979	128	5291	3.5
15980	128	5305	3
15981	128	5306	4
15982	128	5307	3.5
15983	128	5310	3.5
15984	128	5312	3.5
15985	128	5324	3.5
15986	128	5328	4
15987	128	5329	4.5
15988	128	5334	4.5
15989	128	5349	4
15990	128	5365	3.5
15991	128	5370	4.5
15992	128	5371	3.5
15993	128	5376	2.5
15994	128	5377	4
15995	128	5402	3
15996	128	5450	1
15997	128	5466	4.5
15998	128	5477	2
15999	128	5545	4
16000	128	5550	3.5
16001	128	5616	3.5
16002	128	5618	3
16003	128	5619	3
16004	128	5620	3
16005	128	5625	3.5
16006	128	5627	4
16007	128	5628	2
16008	128	5635	3
16009	128	5652	4
16010	128	5667	3
16011	128	5677	3.5
16012	128	5678	3.5
16013	128	5680	2
16014	128	5691	4
16015	128	5692	1
16016	128	5706	2
16017	128	5719	3
16018	128	5730	4
16019	128	5733	4
16020	128	5743	3.5
16021	128	5744	1.5
16022	128	5795	3
16023	128	5802	4
16024	128	5806	3.5
16025	128	5827	3
16026	128	5828	3
16027	128	5838	4
16028	128	5839	4
16029	128	5851	3
16030	128	5854	1.5
16031	128	5856	4
16032	128	5859	3
16033	128	5873	4
16034	128	5876	4
16035	128	5880	4
16036	128	5888	3
16037	128	5899	4
16038	128	5900	3
16039	128	6151	3.5
16040	128	6164	4
16041	128	6200	2
16042	128	6223	4.5
16043	128	6276	2
16044	128	6282	3
16045	128	6313	3.5
16046	128	6314	3
16047	128	6316	3.5
16048	128	6325	3.5
16049	128	6326	1.5
16050	128	6327	3.5
16051	128	6337	2.5
16052	128	6340	4
16053	128	6346	3.5
16054	128	6353	4
16055	128	6354	2
16056	128	6356	4.5
16057	128	6361	3.5
16058	128	6369	3.5
16059	128	6370	4.5
16060	128	6372	3.5
16061	128	6390	4.5
16062	128	6402	4
16063	128	6408	4
16064	128	6415	4
16065	128	6417	4
16066	128	6459	4
16067	128	6463	3.5
16068	128	6465	2
16069	128	6466	3.5
16070	128	6488	3.5
16071	128	6491	4
16072	128	6503	3.5
16073	128	6533	3.5
16074	128	6563	4
16075	128	6593	3.5
16076	128	6604	3
16077	128	6606	4.5
16078	128	6616	2.5
16079	128	6627	4
16080	128	6635	4
16081	128	6642	4
16082	128	6649	3.5
16083	128	6663	4
16084	128	6671	2.5
16085	128	6679	4
16086	128	6691	4.5
16087	128	6694	3.5
16088	128	6714	4
16089	128	6719	2.5
16090	128	6720	4.5
16091	128	6724	3
16092	128	6727	3
16093	128	6743	3
16094	128	6744	4
16095	128	6745	2.5
16096	128	6755	4
16097	128	6763	2
16098	128	6767	3.5
16099	128	6768	4.5
16100	128	6802	3
16101	128	6811	3.5
16102	128	6815	3.5
16103	128	6820	2.5
16104	128	6822	3.5
16105	128	6825	2.5
16106	128	6828	3.5
16107	128	6835	4
16108	128	6847	4
16109	128	6856	4
16110	128	6872	4
16111	128	6878	4
16112	128	6888	2
16113	128	6890	2.5
16114	128	6896	3
16115	128	6923	3.5
16116	128	6925	3
16117	128	6928	3.5
16118	128	6934	2.5
16119	128	6936	3
16120	128	6942	3.5
16121	128	6946	2
16122	128	6948	4.5
16123	128	6950	4
16124	128	6967	4.5
16125	128	6978	3.5
16126	128	6982	3
16127	128	6984	3
16128	128	6990	2.5
16129	128	6993	3
16130	128	6999	3
16131	128	7006	2
16132	128	7015	3.5
16133	128	7018	4
16134	128	7019	3
16135	128	7031	4
16136	128	7033	3
16137	128	7036	4
16138	128	7037	3
16139	128	7038	2
16140	128	7044	3
16141	128	7063	2
16142	128	7066	3.5
16143	128	7080	4
16144	128	7083	3.5
16145	128	7095	3.5
16146	128	7103	4
16147	128	7112	3.5
16148	128	7117	2.5
16149	128	7133	2.5
16150	128	7136	3
16151	128	7142	3.5
16152	128	7147	3.5
16153	128	7153	3.5
16154	128	7155	3.5
16155	128	7157	4.5
16156	128	7160	3
16157	128	7161	4.5
16158	128	7163	3.5
16159	128	7177	4
16160	128	7179	4
16161	128	7180	4
16162	128	7184	4.5
16163	128	7185	3
16164	128	7200	4.5
16165	128	7203	3.5
16166	128	7212	4
16167	128	7219	4
16168	128	7236	2
16169	128	7248	3.5
16170	128	7263	4
16171	128	7265	2
16172	128	7268	2.5
16173	128	7273	3
16174	128	7284	4
16175	128	7292	4
16176	128	7297	2.5
16177	128	7301	4
16178	128	7302	2
16179	128	7307	2
16180	128	7312	4
16181	128	7321	3
16182	128	7334	4
16183	128	7339	3
16184	128	7347	4
16185	128	7355	3.5
16186	128	7356	4.5
16187	128	7357	3
16188	128	7376	3.5
16189	128	7378	3.5
16190	128	7383	3
16191	128	7385	3.5
16192	128	7387	4
16193	128	7394	4
16194	128	7397	4
16195	128	7398	3.5
16196	128	7399	2.5
16197	128	7404	3.5
16198	128	7405	3.5
16199	128	7413	4
16200	128	7414	4
16201	128	7418	3.5
16202	128	7421	4
16203	128	7422	3.5
16204	128	7423	4
16205	128	7425	3
16206	128	7427	4
16207	128	7433	3
16208	128	7435	3.5
16209	128	7439	3.5
16210	128	7446	3.5
16211	128	7450	3
16212	128	7453	3.5
16213	128	7454	4
16214	128	7457	3
16215	128	7461	3.5
16216	128	7468	4.5
16217	128	7471	4
16218	128	7473	4.5
16219	128	7484	2.5
16220	128	7491	3.5
16221	128	7494	4
16222	128	7498	2.5
16223	128	7500	3.5
16224	128	7504	3
16225	128	7506	4
16226	128	7507	3.5
16227	128	7511	4
16228	128	7512	4
16229	128	7516	2.5
16230	128	7520	2
16231	128	7521	4
16232	128	7526	3
16233	128	7528	3
16234	128	7535	3.5
16235	128	7538	4
16236	128	7539	2.5
16237	128	7540	4
16238	128	7542	4
16239	128	7543	3.5
16240	128	7547	3.5
16241	128	7551	2.5
16242	128	7558	3.5
16243	128	7560	2
16244	128	7565	4.5
16245	128	7567	4
16246	128	7572	3.5
16247	128	7573	4.5
16248	128	7578	4
16249	128	7586	4
16250	128	7587	3.5
16251	128	7588	3.5
16252	128	7589	4
16253	128	7591	4
16254	128	7604	3.5
16255	128	7607	3.5
16256	128	7614	3
16257	128	7617	2.5
16258	128	7621	5
16259	128	7631	2
16260	128	7636	3.5
16261	128	7643	4
16262	128	7647	1
16263	128	7648	1
16264	128	7649	3.5
16265	128	7650	2.5
16266	128	7651	5
16267	128	7656	2.5
16268	128	7664	4
16269	128	7670	4.5
16270	128	7688	2.5
16271	128	7689	4
16272	128	7691	2.5
16273	128	7692	4
16274	128	7697	1.5
16275	128	7699	3.5
16276	128	7700	2
16277	128	7704	3
16278	128	7715	4
16279	128	7719	2.5
16280	128	7720	3.5
16281	128	7731	2.5
16282	128	7733	3.5
16283	128	7734	3
16284	128	7742	4.5
16285	128	7747	3.5
16286	128	7748	4
16287	128	7754	3.5
16288	128	7755	4
16289	128	7758	3
16290	128	7761	3.5
16291	128	7762	3.5
16292	128	7763	3.5
16293	128	7765	3.5
16294	128	7773	4.5
16295	128	7788	2.5
16296	128	7797	2.5
16297	128	7798	3.5
16298	128	7801	4
16299	128	7802	4
16300	128	7804	3
16301	128	7811	3
16302	128	7813	2.5
16303	128	7820	3.5
16304	128	7827	3.5
16305	128	7832	4
16306	128	7834	2.5
16307	128	7837	3.5
16308	128	7839	3.5
16309	128	7844	4.5
16310	128	7845	1.5
16311	128	7846	2.5
16312	128	7847	4.5
16313	128	7852	3
16314	128	7860	2.5
16315	128	7861	4
16316	128	7862	3
16317	128	7863	4
16318	128	7867	2.5
16319	128	7870	4
16320	128	7871	3
16321	128	7879	4
16322	128	7885	3.5
16323	128	7886	4
16324	128	7887	3.5
16325	128	7889	3.5
16326	128	7900	3.5
16327	128	7903	3.5
16328	128	7907	3.5
16329	128	7911	4
16330	128	7912	3.5
16331	128	7913	3.5
16332	128	7914	3.5
16333	128	7915	3.5
16334	128	7917	3.5
16335	128	7918	2.5
16336	128	7920	4
16337	128	7929	2.5
16338	128	7934	3
16339	128	7935	2.5
16340	128	7939	3.5
16341	128	7945	3.5
16342	128	7952	3.5
16343	128	7959	4
16344	128	7960	3.5
16345	128	7961	3.5
16346	128	7968	3.5
16347	128	7972	3
16348	128	7993	4
16349	128	7995	2.5
16350	128	7996	3
16351	128	7997	4
16352	128	8007	2
16353	128	8011	4
16354	128	8014	3.5
16355	128	8015	2
16356	128	8016	3.5
16357	128	8018	4
16358	128	8021	3
16359	128	8024	4
16360	128	8030	4
16361	128	8031	3.5
16362	128	8042	5
16363	128	8043	3
16364	128	8047	3
16365	128	8048	3.5
16366	128	8050	3.5
16367	128	8051	3.5
16368	128	8055	4.5
16369	128	8057	4
16370	128	8058	2.5
16371	128	8066	3.5
16372	128	8068	4
16373	128	8072	3.5
16374	128	8078	3
16375	128	8079	5
16376	128	8083	3
16377	128	8086	4
16378	128	8087	4
16379	128	8089	2.5
16380	128	8090	4.5
16381	128	8093	2.5
16382	128	8096	4
16383	128	8100	2.5
16384	128	8105	2
16385	128	8107	3.5
16386	128	8110	3.5
16387	128	8111	3.5
16388	128	8113	3
16389	128	8114	4
16390	128	8120	3
16391	128	8121	4
16392	128	8128	2.5
16393	128	8130	3.5
16394	128	8135	3.5
16395	128	8136	3.5
16396	128	8137	3
16397	128	8138	4
16398	128	8139	4
16399	128	8144	2
16400	128	8148	4
16401	128	8151	3.5
16402	128	8158	4
16403	128	8159	2.5
16404	128	8167	4.5
16405	128	8173	3.5
16406	128	8183	3.5
16407	128	8184	4.5
16408	128	8188	1.5
16409	128	8194	3
16410	128	8212	4.5
16411	128	8224	4
16412	128	8225	4
16413	128	8229	4
16414	128	8233	3
16415	128	8234	3.5
16416	128	8237	3.5
16417	128	8239	2
16418	128	8241	4
16419	128	8256	3
16420	128	8260	4
16421	128	8263	3
16422	128	8264	4.5
16423	128	8268	3.5
16424	128	8276	4
16425	128	8286	3.5
16426	128	8298	2
16427	128	8300	3
16428	128	8303	4
16429	128	8306	1.5
16430	128	8309	3
16431	128	8310	4
16432	128	8318	2.5
16433	128	8322	3.5
16434	128	8333	3.5
16435	128	8335	4.5
16436	128	8346	3.5
16437	128	8350	3.5
16438	128	8351	4
16439	128	8354	4
16440	128	8369	3.5
16441	128	8370	3.5
16442	128	8371	2
16443	128	8374	4
16444	128	8375	4
16445	128	8382	2
16446	128	8386	3
16447	128	8392	4.5
16448	128	8408	2.5
16449	128	8410	4
16450	128	8411	4
16451	128	8421	2
16452	128	8422	4
16453	128	8426	4
16454	128	8440	3
16455	128	8441	3
16456	128	8443	3.5
16457	128	8451	1.5
16458	128	8452	3.5
16459	128	8453	3
16460	128	8456	2.5
16461	128	8457	1.5
16462	128	8460	2.5
16463	128	8461	2
16464	128	8462	3.5
16465	128	8471	2
16466	128	8474	2
16467	128	8485	2.5
16468	128	8488	3.5
16469	128	8495	4.5
16470	128	8498	4
16471	128	8500	4
16472	128	8501	2.5
16473	128	8502	3.5
16474	128	8506	3.5
16475	128	8532	3.5
16476	128	8543	4
16477	128	8556	3
16478	128	8557	2.5
16479	128	8558	4.5
16480	128	8574	4
16481	128	8575	2.5
16482	128	8578	4.5
16483	128	8579	4
16484	128	8581	3
16485	128	8587	2.5
16486	128	8592	3
16487	128	8598	3
16488	128	8603	3.5
16489	128	8611	3
16490	128	8629	3.5
16491	128	8630	5
16492	128	8633	3
16493	128	8639	3
16494	128	8640	4.5
16495	128	8645	3.5
16496	128	8649	3
16497	128	8650	4
16498	128	8654	4
16499	128	8657	3.5
16500	128	8659	3
16501	128	8661	3
16502	128	8662	3.5
16503	128	8681	3
16504	128	8685	4
16505	128	8686	2.5
16506	128	8694	4
16507	128	8700	3
16508	128	8703	4
16509	128	8704	3
16510	128	8707	3
16511	128	8709	3
16512	128	8713	4
16513	128	8721	3.5
16514	128	8723	3.5
16515	128	8730	3
16516	128	8738	3
16517	128	8739	3
16518	128	8742	1.5
16519	128	8746	4
16520	128	8753	2
16521	128	8758	4
16522	128	8789	4
16523	128	8797	2.5
16524	128	8804	4
16525	128	8805	4
16526	128	8815	4
16527	128	8835	3.5
16528	128	8837	3
16529	128	8846	4
16530	128	8852	4
16531	128	8858	3.5
16532	128	8876	3
16533	128	8885	4
16534	128	8894	3.5
16535	128	8896	3.5
16536	128	8902	3.5
16537	128	8905	2.5
16538	128	8906	3
16539	128	8910	4
16540	128	8923	3.5
16541	128	8924	3.5
16542	128	8925	3.5
16543	128	8927	2.5
16544	128	8950	2.5
16545	128	8957	3.5
16546	128	8958	3
16547	128	8970	4
16548	128	8974	4
16549	128	8985	3.5
16550	128	8986	2.5
16551	128	8990	3.5
16552	128	8996	3
16553	128	9010	3.5
16554	128	9011	3
16555	128	9013	2.5
16556	128	9021	3
16557	128	9037	4
16558	128	9051	4
16559	128	9056	3
16560	128	9064	4
16561	128	9072	3
16562	128	9074	3.5
16563	128	9083	2
16564	128	9087	3
16565	128	9091	3
16566	128	9093	3
16567	128	9095	2.5
16568	128	9097	2.5
16569	128	9111	3.5
16570	128	9119	4
16571	128	9122	4
16572	128	9124	3.5
16573	128	9131	3
16574	128	9135	4
16575	128	9142	3
16576	128	9147	2.5
16577	128	9156	2.5
16578	128	9162	3.5
16579	128	9164	3
16580	128	9172	3
16581	128	9181	3.5
16582	128	9198	3
16583	128	9210	3.5
16584	128	9213	3.5
16585	128	9216	2.5
16586	128	9221	3
16587	128	9225	3
16588	128	9227	3.5
16589	128	9228	2.5
16590	128	9230	4
16591	128	9236	4.5
16592	128	9251	3.5
16593	128	9254	3
16594	128	9255	3
16595	128	9274	4
16596	128	9275	3.5
16597	128	9278	3.5
16598	128	9300	3.5
16599	128	9301	2.5
16600	128	9308	4
16601	128	9310	3
16602	128	9312	3.5
16603	128	9318	2
16604	128	9322	3.5
16605	128	9323	3.5
16606	128	9328	2.5
16607	128	9330	2
16608	128	9344	3
16609	128	9352	3.5
16610	128	9354	2
16611	128	9360	3.5
16612	128	9369	4.5
16613	128	9380	4.5
16614	128	9388	2
16615	128	9415	3
16616	128	9418	4
16617	128	9419	3.5
16618	128	9438	4
16619	128	9470	3
16620	128	9473	3.5
16621	128	9475	3.5
16622	128	9477	3.5
16623	128	9478	4
16624	128	9491	4
16625	128	9494	2
16626	128	9498	4
16627	128	9505	4
16628	128	9538	3.5
16629	128	9540	3
16630	128	9542	3
16631	128	9546	3.5
16632	128	9547	4.5
16633	128	9556	3
16634	128	9586	2.5
16635	128	9598	4
16636	128	9643	3.5
16637	128	9664	3
16638	128	9671	3
16639	128	9677	3
16640	128	9686	2.5
16641	128	9687	3
16642	128	9692	4
16643	128	9705	3.5
16644	128	9706	2.5
16645	128	9714	3
16646	128	9735	4
16647	128	9736	2.5
16648	128	9756	3
16649	128	9760	2.5
16650	128	9766	4
16651	128	9780	4
16652	128	9783	3.5
16653	128	9839	4
16654	128	9845	3
16655	128	9860	3.5
16656	128	9862	3.5
16657	128	9863	1.5
16658	128	9876	3.5
16659	128	9877	2.5
16660	128	9890	3.5
16661	128	9900	2
16662	128	9909	5
16663	128	9915	4
16664	128	9937	3
16665	128	9949	3
16666	128	9951	3
16667	128	9955	3
16668	128	9974	2.5
16669	128	9976	2.5
16670	128	9983	3.5
16671	128	10006	3.5
16672	128	10007	3
16673	128	10022	1.5
16674	128	10033	4.5
16675	128	10035	2.5
16676	128	10043	2.5
16677	128	10055	4
16678	128	10067	4
16679	128	10069	2.5
16680	128	10077	3.5
16681	128	10079	4
16682	128	10082	2
16683	128	10090	4.5
16684	128	10095	1.5
16685	128	10105	3
16686	128	10128	4
16687	128	10138	3.5
16688	128	10145	3.5
16689	128	10149	2.5
16690	128	10176	3
16691	128	10182	4
16692	128	10188	3
16693	128	10207	2
16694	128	10213	4
16695	128	10219	2.5
16696	128	10249	3.5
16697	128	10275	1.5
16698	129	1	3
16699	129	10	3
16700	129	17	5
16701	129	21	3
16702	129	34	4
16703	129	45	2
16704	129	48	5
16705	129	100	3
16706	129	127	3
16707	129	138	2
16708	129	161	3
16709	129	162	3
16710	129	181	1
16711	129	197	3
16712	129	208	2
16713	129	227	3
16714	129	232	2
16715	129	252	2
16716	129	254	3
16717	129	261	2
16718	129	310	3
16719	129	340	1
16720	129	360	2
16721	129	406	4
16722	129	524	3
16723	129	525	1
16724	129	526	5
16725	130	1	3
16726	130	19	1
16727	130	24	1
16728	130	29	5
16729	130	32	4
16730	130	48	4
16731	130	68	5
16732	130	99	4
16733	130	100	3
16734	130	126	4
16735	130	127	4
16736	130	138	3
16737	130	142	1
16738	130	145	1
16739	130	148	2
16740	130	160	5
16741	130	170	2
16742	130	181	2
16743	130	195	4
16744	130	207	3
16745	130	224	3
16746	130	231	4
16747	130	235	4
16748	130	254	3
16749	130	259	5
16750	130	261	4
16751	130	270	4
16752	130	271	5
16753	130	272	4
16754	130	280	4
16755	130	288	2
16756	130	293	1
16757	130	314	4
16758	130	317	3
16759	130	318	2
16760	130	327	1
16761	130	330	1
16762	130	337	2
16763	130	356	1
16764	130	364	1
16765	130	367	5
16766	130	369	1
16767	130	378	1
16768	130	383	1
16769	130	384	1
16770	130	406	2
16771	130	427	3
16772	130	429	3
16773	130	443	3
16774	130	454	5
16775	130	464	1
16776	130	475	4
16777	130	485	5
16778	130	487	2
16779	130	490	1
16780	130	495	4
16781	130	497	3
16782	130	505	4
16783	130	519	1
16784	130	520	1
16785	130	521	1
16786	130	523	3
16787	130	525	4
16788	130	526	4
16789	130	530	1
16790	130	538	3
16791	130	540	1
16792	130	565	3
16793	130	566	5
16794	130	580	1
16795	130	582	1
16796	130	607	5
16797	130	620	2
16798	130	624	4
16799	130	631	4
16800	130	645	4
16801	130	647	2
16802	130	684	3
16803	130	715	1
16804	130	725	3
16805	130	726	4
16806	130	742	2
16807	130	745	3
16808	130	746	5
16809	130	789	3
16810	130	820	1
16811	130	828	4
16812	130	844	1
16813	130	845	3
16814	130	877	2
16815	130	878	4
16816	130	887	4
16817	130	888	4
16818	130	890	1
16819	130	892	3
16820	130	895	1
16821	130	897	1
16822	130	898	1
16823	130	901	1
16824	130	909	4
16825	130	923	3
16826	130	939	4
16827	130	940	4
16828	130	941	4
16829	130	955	1
16830	130	957	4
16831	130	959	2
16832	130	960	4
16833	130	961	3
16834	130	962	5
16835	130	963	4
16836	130	968	3
16837	130	970	5
16838	130	972	2
16839	130	973	5
16840	130	974	4
16841	130	976	4
16842	130	977	3
16843	130	978	5
16844	130	981	3
16845	130	982	2
16846	130	984	4
16847	130	986	5
16848	130	987	4
16849	130	992	4
16850	130	993	4
16851	130	994	3
16852	130	998	5
16853	130	1000	3
16854	130	1003	5
16855	130	1006	5
16856	130	1008	5
16857	130	1009	4
16858	130	1018	3
16859	130	1021	2
16860	130	1026	4
16861	130	1030	2
16862	130	1031	3
16863	130	1033	4
16864	130	1034	3
16865	130	1036	4
16866	130	1038	3
16867	130	1048	1
16868	130	1049	4
16869	130	1051	3
16870	130	1054	3
16871	130	1057	4
16872	130	1060	4
16873	130	1065	5
16874	130	1071	2
16875	130	1073	1
16876	130	1076	1
16877	130	1087	1
16878	130	1089	1
16879	130	1090	1
16880	130	1094	1
16881	130	1097	3
16882	130	1103	3
16883	130	1105	2
16884	130	1112	1
16885	130	1113	4
16886	130	1116	2
16887	130	1117	2
16888	130	1118	3
16889	130	1122	1
16890	130	1123	1
16891	130	1127	1
16892	130	1128	1
16893	130	1129	1
16894	130	1131	2
16895	130	1134	3
16896	130	1136	3
16897	130	1145	2
16898	130	1185	1
16899	130	1187	4
16900	130	1198	2
16901	130	1201	5
16902	130	1214	1
16903	130	1217	2
16904	130	1226	1
16905	130	1233	4
16906	130	1244	1
16907	130	1253	1
16908	130	1261	2
16909	130	1265	5
16910	130	1267	1
16911	130	1271	2
16912	130	1272	2
16913	130	1276	1
16914	130	1290	4
16915	130	1322	5
16916	130	1330	1
16917	130	1340	3
16918	130	1351	1
16919	130	1363	3
16920	130	1368	1
16921	130	1382	3
16922	130	1391	1
16923	130	1400	2
16924	130	1410	3
16925	130	1427	2
16926	130	1446	1
16927	130	1456	2
16928	130	1461	2
16929	130	1482	2
16930	130	1488	1
16931	130	1489	3
16932	130	1490	1
16933	130	1492	5
16934	130	1495	2
16935	130	1520	4
16936	130	1521	1
16937	130	1527	4
16938	130	1528	2
16939	130	1529	2
16940	130	1532	4
16941	130	1534	2
16942	130	1536	1
16943	130	1538	1
16944	130	1539	1
16945	130	1540	1
16946	130	1541	1
16947	130	1542	1
16948	130	1543	1
16949	130	1544	1
16950	130	1545	1
16951	130	1546	1
16952	130	1547	1
16953	130	1548	1
16954	130	1551	1
16955	130	1552	1
16956	130	1553	1
16957	130	1561	3
16958	130	1564	2
16959	130	1565	2
16960	130	1566	1
16961	130	1570	2
16962	130	1572	1
16963	130	1573	2
16964	130	1574	2
16965	130	1575	1
16966	130	1576	1
16967	130	1577	1
16968	130	1584	4
16969	130	1585	4
16970	130	1586	1
16971	130	1591	2
16972	130	1603	1
16973	130	1612	1
16974	130	1614	1
16975	130	1615	1
16976	130	1624	4
16977	130	1627	4
16978	130	1636	4
16979	130	1641	1
16980	130	1654	2
16981	130	1665	3
16982	130	1669	3
16983	130	1675	2
16984	130	1677	4
16985	130	1679	1
16986	130	1681	1
16987	130	1682	2
16988	130	1691	1
16989	130	1695	4
16990	130	1697	4
16991	130	1700	3
16992	130	1710	2
16993	130	1716	4
16994	130	1723	3
16995	130	1730	3
16996	130	1771	4
16997	130	1784	3
16998	130	1791	1
16999	130	1797	1
17000	130	1800	1
17001	130	1805	4
17002	130	1814	5
17003	130	1819	5
17004	130	1822	2
17005	130	1828	3
17006	130	1833	1
17007	130	1834	4
17008	130	1837	3
17009	130	1843	1
17010	130	1848	1
17011	130	1850	4
17012	130	1860	4
17013	130	1871	4
17014	130	1875	3
17015	130	1876	3
17016	130	1878	2
17017	130	1881	1
17018	130	1883	2
17019	130	1884	1
17020	130	1888	2
17021	130	1890	1
17022	130	1891	1
17023	130	1892	1
17024	130	1893	1
17025	130	1894	1
17026	130	1895	1
17027	130	1904	2
17028	130	1912	1
17029	130	1914	1
17030	130	1916	1
17031	130	1917	1
17032	130	1918	1
17033	130	1919	1
17034	130	1920	1
17035	130	1921	1
17036	130	1922	1
17037	130	1930	1
17038	130	1931	1
17039	130	1932	1
17040	130	1933	1
17041	130	1957	1
17042	130	1962	2
17043	130	1963	4
17044	130	1964	1
17045	130	1967	1
17046	130	1968	1
17047	130	1970	1
17048	130	1976	2
17049	130	1977	1
17050	130	1984	3
17051	130	1992	2
17052	130	2003	4
17053	130	2004	4
17054	130	2008	1
17055	130	2010	1
17056	130	2011	1
17057	130	2012	1
17058	130	2015	1
17059	130	2016	1
17060	130	2017	1
17061	130	2018	1
17062	130	2019	1
17063	130	2021	2
17064	130	2022	1
17065	130	2024	1
17066	130	2025	1
17067	130	2026	2
17068	130	2027	1
17069	130	2029	1
17070	130	2030	1
17071	130	2034	4
17072	130	2043	3
17073	130	2044	2
17074	130	2045	1
17075	130	2048	4
17076	130	2057	4
17077	130	2079	4
17078	130	2080	1
17079	130	2091	1
17080	130	2099	1
17081	130	2108	1
17082	130	2109	1
17083	130	2110	1
17084	130	2122	4
17085	130	2128	2
17086	130	2144	1
17087	130	2145	3
17088	130	2151	5
17089	130	2158	1
17090	130	2159	1
17091	130	2167	4
17092	130	2169	3
17093	130	2172	2
17094	130	2173	1
17095	130	2179	3
17096	130	2190	5
17097	130	2195	2
17098	130	2197	5
17099	130	2198	1
17100	130	2209	5
17101	130	2210	2
17102	130	2211	1
17103	130	2231	2
17104	130	2233	2
17105	130	2234	1
17106	130	2236	1
17107	130	2237	2
17108	130	2261	1
17109	130	2271	3
17110	130	2274	3
17111	130	2282	4
17112	130	2295	2
17113	130	2328	4
17114	130	2330	1
17115	130	2332	3
17116	130	2353	1
17117	130	2355	3
17118	130	2358	3
17119	130	2359	4
17120	130	2360	3
17121	130	2364	1
17122	130	2373	4
17123	130	2381	3
17124	130	2387	2
17125	130	2388	2
17126	130	2389	1
17127	130	2395	3
17128	130	2398	4
17129	130	2399	5
17130	130	2403	4
17131	130	2411	1
17132	130	2412	2
17133	130	2413	4
17134	130	2418	1
17135	130	2424	1
17136	130	2431	1
17137	130	2432	1
17138	130	2433	1
17139	130	2434	1
17140	130	2442	4
17141	130	2443	3
17142	130	2457	1
17143	130	2466	3
17144	130	2467	1
17145	130	2527	4
17146	130	2530	1
17147	130	2531	5
17148	130	2542	2
17149	130	2545	2
17150	130	2553	1
17151	130	2628	1
17152	130	2646	4
17153	130	2661	1
17154	130	2662	3
17155	130	2663	5
17156	130	2704	4
17157	130	2711	1
17158	130	2757	4
17159	130	2761	4
17160	130	2766	4
17161	130	2782	5
17162	130	2796	5
17163	130	2800	3
17164	130	2805	1
17165	130	2822	3
17166	130	2831	2
17167	130	2845	1
17168	130	2869	2
17169	130	2877	1
17170	130	2902	4
17171	130	2916	1
17172	130	2920	1
17173	130	2922	1
17174	130	2924	1
17175	130	2925	2
17176	130	2926	2
17177	130	2927	2
17178	130	2962	3
17179	130	2963	3
17180	130	2965	4
17181	130	2967	3
17182	130	2969	1
17183	130	2990	5
17184	130	3000	2
17185	130	3026	2
17186	130	3049	5
17187	130	3052	3
17188	130	3082	1
17189	130	3083	2
17190	130	3088	3
17191	130	3092	4
17192	130	3109	5
17193	130	3114	2
17194	130	3125	2.5
17195	130	3129	2
17196	130	3136	2
17197	130	3149	3
17198	130	3150	5
17199	130	3152	3
17200	130	3153	1
17201	130	3163	3
17202	130	3165	3
17203	130	3171	1
17204	130	3173	2
17205	130	3176	1
17206	130	3177	4
17207	130	3184	4
17208	130	3186	3
17209	130	3197	2
17210	130	3200	3
17211	130	3201	1
17212	130	3218	1
17213	130	3233	3
17214	130	3248	1
17215	130	3277	3
17216	130	3279	3
17217	130	3323	4
17218	130	3327	1
17219	130	3329	1
17220	130	3330	4
17221	130	3354	2
17222	130	3380	3
17223	130	3405	3
17224	130	3421	1
17225	130	3422	2
17226	130	3425	5
17227	130	3429	3
17228	130	3481	3
17229	130	3483	2
17230	130	3519	1
17231	130	3553	4
17232	130	3555	1
17233	130	3556	1
17234	130	3557	4
17235	130	3633	1
17236	130	3638	2
17237	130	3693	3
17238	130	3698	3
17239	130	3701	2
17240	130	3702	2
17241	130	3704	1
17242	130	3738	1
17243	130	3741	4
17244	130	3769	3
17245	130	3784	3
17246	130	3788	3
17247	130	3798	3
17248	130	3807	4
17249	130	3810	4
17250	130	3812	3.5
17251	130	3815	2
17252	130	3818	1
17253	130	3823	5
17254	130	3856	1
17255	130	3860	3
17256	130	3863	4
17257	130	3868	4.5
17258	130	3888	2.5
17259	130	3911	2
17260	130	3934	2
17261	130	4009	2
17262	130	4056	2
17263	130	4062	3
17264	130	4075	2
17265	130	4079	4
17266	130	4092	4
17267	130	4108	3
17268	130	4109	3
17269	130	4127	2
17270	130	4154	3
17271	130	4173	1
17272	130	4174	4
17273	130	4213	1
17274	130	4216	3
17275	130	4313	4
17276	130	4370	2
17277	130	4424	4
17278	130	4436	3
17279	130	4485	2.5
17280	130	4645	4
17281	130	4656	3.5
17282	130	4779	4
17283	130	4780	2
17284	130	4803	2.5
17285	130	5037	1.5
17286	130	5046	2.5
17287	130	5202	4
17288	130	5207	2
17289	130	5213	3.5
17290	131	317	2
17291	131	427	2
17292	131	472	5
17293	131	899	3
17294	131	1346	4
17295	131	1368	3
17296	131	2140	5
17297	131	2188	5
17298	131	2282	3
17299	131	2306	4
17300	131	2328	4
17301	131	2366	1
17302	131	2503	5
17303	131	2529	4
17304	131	2533	2
17305	131	2543	5
17306	131	2550	4
17307	131	2663	4
17308	131	2751	5
17309	131	2815	5
17310	131	2895	4
17311	132	11	3
17312	132	25	2
17313	132	32	3
17314	132	36	1
17315	132	99	5
17316	132	127	5
17317	132	138	2
17318	132	261	5
17319	132	280	5
17320	132	317	5
17321	132	328	4
17322	132	472	5
17323	132	521	4
17324	132	524	5
17325	132	526	5
17326	132	538	5
17327	132	677	3
17328	132	975	5
17329	132	1105	4
17330	132	1189	4
17331	132	1278	3
17332	132	1291	3
17333	132	1309	4
17334	132	1336	4
17335	132	1361	4
17336	132	1368	5
17337	132	1402	5
17338	132	1466	2
17339	132	1469	4
17340	132	1471	4
17341	132	1482	5
17342	132	1490	4
17343	132	1591	5
17344	132	1633	5
17345	132	1686	2
17346	133	1	3
17347	133	34	3
17348	133	37	3
17349	133	56	3
17350	133	99	4
17351	133	127	3
17352	133	135	3
17353	133	138	4
17354	133	145	3
17355	133	161	3
17356	133	217	3
17357	133	231	5
17358	133	237	3
17359	133	261	3
17360	133	280	4
17361	133	305	3
17362	133	316	2
17363	133	317	3
17364	133	324	3
17365	133	406	3
17366	133	427	3
17367	133	446	3
17368	133	483	3
17369	133	521	3
17370	133	524	3
17371	133	526	5
17372	133	581	3
17373	133	588	3
17374	133	662	3
17375	133	726	4
17376	133	741	3
17377	133	742	4
17378	133	743	4
17379	133	746	3
17380	133	774	4
17381	133	800	3
17382	133	878	3
17383	133	880	3
17384	133	882	3
17385	133	894	3
17386	133	895	1
17387	133	912	3
17388	133	957	3
17389	133	959	4
17390	133	960	3
17391	133	961	3
17392	133	970	4
17393	133	972	4
17394	133	975	3
17395	133	981	4
17396	133	982	3
17397	133	987	3
17398	133	991	5
17399	133	992	3
17400	133	994	2
17401	133	995	3
17402	133	1002	3
17403	133	1004	3
17404	133	1006	3
17405	133	1010	3
17406	133	1018	3
17407	133	1019	3
17408	133	1031	3
17409	133	1038	3
17410	133	1052	5
17411	133	1053	3
17412	133	1061	3
17413	133	1063	3
17414	133	1066	3
17415	133	1083	3
17416	133	1116	3
17417	133	1127	3
17418	133	1146	4
17419	133	3934	3
17420	134	1	4
17421	134	3	4
17422	134	5	5
17423	134	6	5
17424	134	12	4
17425	134	18	5
17426	134	25	4
17427	134	29	5
17428	134	32	5
17429	134	49	4
17430	134	54	5
17431	134	62	3
17432	134	75	5
17433	134	88	3
17434	134	106	5
17435	134	121	4
17436	134	231	5
17437	134	440	3
17438	134	538	4
17439	134	543	4
17440	134	564	4
17441	134	565	3
17442	134	591	3
17443	134	607	4
17444	134	614	4
17445	134	620	3
17446	134	622	3
17447	134	625	5
17448	134	626	5
17449	134	637	4
17450	134	638	5
17451	134	645	4
17452	134	647	4
17453	134	648	5
17454	134	649	3
17455	134	653	3
17456	134	654	3
17457	134	655	3
17458	134	666	4
17459	134	675	3
17460	134	677	4
17461	134	678	5
17462	134	684	5
17463	134	687	5
17464	134	691	3
17465	134	696	5
17466	134	707	4
17467	134	708	3
17468	134	804	4
17469	134	807	5
17470	134	854	3
17471	134	862	5
17472	134	864	5
17473	134	901	5
17474	134	909	5
17475	134	947	5
17476	134	972	5
17477	134	1103	5
17478	134	1104	5
17479	134	1110	5
17480	134	1133	4
17481	134	1142	5
17482	134	1144	5
17483	134	1153	3
17484	134	1159	4
17485	134	1160	3
17486	134	1167	3
17487	134	1198	4
17488	134	1203	4
17489	134	1206	3
17490	135	100	3
17491	135	270	5
17492	135	271	5
17493	135	272	5
17494	135	472	5
17495	135	485	4
17496	135	526	3
17497	135	529	4
17498	135	534	5
17499	135	631	3
17500	135	696	4
17501	135	720	3
17502	135	725	3
17503	135	726	4
17504	135	727	5
17505	135	730	3
17506	135	734	3
17507	135	741	3
17508	135	742	2
17509	135	745	5
17510	135	750	3
17511	135	751	3
17512	135	754	3
17513	135	756	4
17514	135	761	5
17515	135	763	4
17516	135	765	2
17517	135	772	4
17518	135	774	2
17519	135	786	4
17520	135	789	5
17521	135	856	5
17522	135	863	5
17523	135	870	4
17524	135	882	4
17525	135	887	4
17526	135	900	3
17527	135	919	5
17528	135	940	4
17529	135	944	5
17530	135	946	4
17531	135	957	5
17532	135	966	3
17533	135	967	4
17534	135	968	4
17535	135	971	4
17536	135	974	4
17537	135	975	4
17538	135	983	3
17539	135	986	5
17540	135	995	4
17541	135	996	5
17542	135	1000	3
17543	135	1008	5
17544	135	1009	4
17545	135	1010	2
17546	135	1012	4
17547	135	1013	2
17548	135	1018	4
17549	135	1036	4
17550	135	1043	3
17551	135	1044	4
17552	135	1064	4
17553	135	1083	3
17554	135	1134	3
17555	135	1173	5
17556	135	1223	4
17557	135	1296	5
17558	136	521	4
17559	136	845	4.5
17560	136	1094	4
17561	136	1256	3
17562	136	1271	1
17563	136	1400	3.5
17564	136	1406	1.5
17565	136	1430	5
17566	136	1707	4
17567	136	1879	3.5
17568	136	1894	4
17569	136	2026	4.5
17570	136	2146	4
17571	136	2173	2
17572	136	2250	4
17573	136	2403	3.5
17574	136	2527	4.5
17575	136	2782	5
17576	136	3127	4.5
17577	136	3542	3.5
17578	136	4173	5
17579	136	4424	4.5
17580	136	4837	4
17581	136	4935	4.5
17582	136	5023	5
17583	136	6538	4.5
17584	136	6896	5
17585	136	7283	4.5
17586	136	7825	4
17587	136	8011	4
17588	136	8052	4.5
17589	136	8143	4.5
17590	136	8159	3.5
17591	136	8168	2
17592	136	8181	3.5
17593	137	1	4
17594	137	11	3.5
17595	137	16	4.5
17596	137	25	4.5
17597	137	34	3
17598	137	45	4
17599	137	48	4
17600	137	95	3
17601	137	99	4.5
17602	137	123	3.5
17603	137	127	4.5
17604	137	167	1
17605	137	202	4
17606	137	203	3.5
17607	137	231	4
17608	137	252	4.5
17609	137	261	4.5
17610	137	280	5
17611	137	298	4.5
17612	137	305	3
17613	137	317	4.5
17614	137	318	3.5
17615	137	324	4
17616	137	414	3
17617	137	446	3.5
17618	137	453	4.5
17619	137	483	4
17620	137	521	3
17621	137	524	4.5
17622	137	526	4.5
17623	137	530	3.5
17624	137	538	5
17625	137	607	4.5
17626	137	620	4
17627	137	627	4
17628	137	631	3.5
17629	137	639	1.5
17630	137	645	3.5
17631	137	647	3.5
17632	137	652	4
17633	137	694	3.5
17634	137	696	4.5
17635	137	726	4.5
17636	137	741	4
17637	137	829	3
17638	137	844	3.5
17639	137	877	3.5
17640	137	886	3
17641	137	888	4
17642	137	897	2.5
17643	137	898	4
17644	137	912	4
17645	137	913	4
17646	137	923	4
17647	137	926	4
17648	137	957	4.5
17649	137	960	4
17650	137	961	4
17651	137	966	4
17652	137	971	4.5
17653	137	975	4.5
17654	137	992	3.5
17655	137	994	4.5
17656	137	1006	4
17657	137	1018	3.5
17658	137	1019	3
17659	137	1026	4.5
17660	137	1030	2.5
17661	137	1048	4.5
17662	137	1061	4
17663	137	1066	4
17664	137	1083	4
17665	137	1090	4
17666	137	1094	3
17667	137	1105	4.5
17668	137	1127	3.5
17669	137	1133	4
17670	137	1170	3.5
17671	137	1185	3
17672	137	1226	3.5
17673	137	1261	4
17674	137	1265	3.5
17675	137	1311	4
17676	137	1330	3.5
17677	137	1338	3
17678	137	1368	4
17679	137	1369	3
17680	137	1372	4
17681	137	1375	4
17682	137	1399	3.5
17683	137	1402	4
17684	137	1410	3.5
17685	137	1494	3.5
17686	137	1519	3.5
17687	137	1521	3.5
17688	137	1525	4
17689	137	1528	4.5
17690	137	1529	4.5
17691	137	1535	4
17692	137	1549	2.5
17693	137	1574	2
17694	137	1591	4
17695	137	1636	4
17696	137	1660	3.5
17697	137	1669	4
17698	137	1675	3.5
17699	137	1690	3
17700	137	1691	3
17701	137	1702	3
17702	137	1704	3
17703	137	1707	4
17704	137	1730	2.5
17705	137	1796	4.5
17706	137	1814	3.5
17707	137	1816	3.5
17708	137	1822	4.5
17709	137	1911	4.5
17710	137	1917	2
17711	137	1919	3.5
17712	137	1920	3
17713	137	1930	4
17714	137	1933	3.5
17715	137	1976	3.5
17716	137	1980	4
17717	137	2012	3
17718	137	2022	3.5
17719	137	2057	2.5
17720	137	2144	4
17721	137	2167	3.5
17722	137	2191	3
17723	137	2195	4.5
17724	137	2233	3.5
17725	137	2236	3
17726	137	2237	3.5
17727	137	2239	3.5
17728	137	2246	4
17729	137	2282	5
17730	137	2286	2
17731	137	2327	3.5
17732	137	2332	3.5
17733	137	2358	4
17734	137	2360	4
17735	137	2361	2.5
17736	137	2389	3.5
17737	137	2391	4
17738	137	2430	3
17739	137	2483	4
17740	137	2484	4
17741	137	2497	4.5
17742	137	2515	4
17743	137	2519	2.5
17744	137	2520	4
17745	137	2558	4
17746	137	2568	4
17747	137	2573	3.5
17748	137	2590	3.5
17749	137	2594	3
17750	137	2596	4.5
17751	137	2600	3.5
17752	137	2604	2.5
17753	137	2626	4
17754	137	2667	3.5
17755	137	2704	4
17756	137	2711	3.5
17757	137	2713	3.5
17758	137	2716	4
17759	137	2721	3.5
17760	137	2766	4.5
17761	137	2774	4
17762	137	2797	4
17763	137	2801	3.5
17764	137	2819	4
17765	137	2844	3
17766	137	2878	4
17767	137	2898	3.5
17768	137	2912	3
17769	137	2925	3.5
17770	137	2938	3.5
17771	137	2965	2.5
17772	137	2998	2.5
17773	137	3011	3.5
17774	137	3024	2.5
17775	137	3058	4
17776	137	3108	3.5
17777	137	3133	3.5
17778	137	3155	4.5
17779	137	3159	4
17780	137	3165	4.5
17781	137	3173	4.5
17782	137	3176	2.5
17783	137	3219	3
17784	137	3222	3.5
17785	137	3337	4
17786	137	3345	4
17787	137	3380	4
17788	137	3389	3.5
17789	137	3392	4.5
17790	137	3397	3
17791	137	3508	3
17792	137	3510	3.5
17793	137	3566	2
17794	137	3667	3.5
17795	137	3812	4
17796	137	3816	3
17797	137	3888	4.5
17798	137	3895	4
17799	137	3927	3.5
17800	137	3934	4
17801	137	3991	3.5
17802	137	4033	4
17803	137	4052	3
17804	137	4074	3.5
17805	137	4081	4
17806	137	4085	3
17807	137	4135	4
17808	137	4154	4.5
17809	137	4200	3
17810	137	4279	4
17811	137	4453	4
17812	137	4504	5
17813	137	4583	3
17814	137	4705	4
17815	137	4803	4
17816	137	4880	4.5
17817	137	4909	4
17818	137	4968	4
17819	137	4998	4
17820	137	5000	4.5
17821	137	5039	3.5
17822	137	5090	3.5
17823	137	5110	4
17824	137	5201	4.5
17825	137	5213	4
17826	137	5484	4.5
17827	137	5573	3.5
17828	137	5618	4
17829	137	5652	4
17830	137	5682	4
17831	137	5719	3.5
17832	137	5720	4
17833	137	5730	3.5
17834	137	5838	4
17835	137	5842	3.5
17836	137	5875	4
17837	137	5883	5
17838	137	6200	4.5
17839	137	6393	3.5
17840	137	6411	5
17841	137	6413	4.5
17842	137	6423	4
17843	137	6602	4
17844	137	6627	4
17845	137	6673	4
17846	137	6767	4
17847	137	6787	3.5
17848	137	6828	4
17849	137	6904	4.5
17850	137	6942	3.5
17851	137	6951	4.5
17852	137	6967	4
17853	137	7018	3.5
17854	137	7022	4
17855	137	7036	3.5
17856	137	7045	3.5
17857	137	7061	4
17858	137	7070	3
17859	137	7089	4.5
17860	137	7155	4
17861	137	7161	4.5
17862	137	7178	4
17863	137	7180	3.5
17864	137	7200	4
17865	137	7219	4
17866	137	7273	4
17867	137	7292	4
17868	137	7375	4.5
17869	137	7423	4
17870	137	7446	3.5
17871	137	7472	4
17872	137	7476	4
17873	137	7501	3.5
17874	137	7511	4
17875	137	7542	4
17876	137	7588	4.5
17877	137	7597	4.5
17878	137	7643	3.5
17879	137	7677	3
17880	137	7742	3.5
17881	137	7761	4
17882	137	7844	3.5
17883	137	7914	4.5
17884	137	7931	3.5
17885	137	7938	4
17886	137	7952	4.5
17887	137	7957	4.5
17888	137	7999	1
17889	137	8011	4
17890	137	8052	3.5
17891	137	8090	4
17892	137	8121	4
17893	137	8130	3.5
17894	137	8136	4
17895	137	8148	4
17896	137	8165	3
17897	137	8329	4
17898	137	8339	4
17899	137	8351	4.5
17900	137	8445	2
17901	137	8489	4
17902	137	8548	1.5
17903	137	8630	4.5
17904	138	34	5
17905	138	46	4
17906	138	130	5
17907	138	135	4
17908	138	137	4
17909	138	191	3
17910	138	197	5
17911	138	209	4
17912	138	223	3
17913	138	232	5
17914	138	233	3
17915	138	236	4
17916	138	246	3
17917	138	247	3
17918	138	264	4
17919	138	278	5
17920	138	279	3
17921	138	290	5
17922	138	300	3
17923	138	316	4
17924	138	317	5
17925	138	322	5
17926	138	324	5
17927	138	337	4
17928	138	340	3
17929	138	341	3
17930	138	360	4
17931	138	364	3
17932	138	368	3
17933	138	369	3
17934	138	381	3
17935	138	384	5
17936	138	403	5
17937	138	406	5
17938	138	419	4
17939	138	425	5
17940	138	427	5
17941	138	431	4
17942	138	446	5
17943	138	453	5
17944	138	465	5
17945	138	472	5
17946	138	474	4
17947	138	475	5
17948	138	483	4
17949	138	487	2
17950	138	495	3
17951	138	497	4
17952	138	519	3
17953	138	520	4
17954	138	521	5
17955	138	522	5
17956	138	523	5
17957	138	524	5
17958	138	525	3
17959	138	527	5
17960	138	528	5
17961	138	529	3
17962	138	530	5
17963	138	546	4
17964	139	36	4
17965	139	45	4
17966	139	96	2.5
17967	139	196	3.5
17968	139	272	4
17969	139	306	3.5
17970	139	528	3
17971	139	612	4
17972	139	886	4
17973	139	892	4
17974	139	926	4
17975	139	968	3.5
17976	139	1031	4
17977	139	1055	3.5
17978	139	1251	4
17979	139	1302	3.5
17980	139	1342	4
17981	139	1535	4
17982	139	1591	3.5
17983	139	1814	3.5
17984	139	1836	3.5
17985	139	1984	2.5
17986	139	2122	3
17987	139	2159	3
17988	139	2169	4
17989	139	2398	4
17990	139	2448	3.5
17991	139	2484	3
17992	139	2704	3
17993	139	2711	3.5
17994	139	2766	3.5
17995	139	2808	3.5
17996	139	2823	3.5
17997	139	2837	4
17998	139	2965	3.5
17999	139	3000	3
18000	139	3073	3.5
18001	139	3082	4
18002	139	3125	4
18003	139	3150	3.5
18004	139	3165	3.5
18005	139	3173	4
18006	139	3177	4
18007	139	3184	3.5
18008	139	3262	3.5
18009	139	3320	4
18010	139	3323	4
18011	139	3337	4
18012	139	3380	4
18013	139	3382	4
18014	139	3430	4
18015	139	3518	4
18016	139	3636	3.5
18017	139	3698	4
18018	139	3714	4
18019	139	3788	4
18020	139	3812	4
18021	139	3818	3
18022	139	3860	3.5
18023	139	3863	4.5
18024	139	3868	3.5
18025	139	3873	4
18026	139	3874	3.5
18027	139	3886	4
18028	139	3888	4
18029	139	3904	4
18030	139	3911	1.5
18031	139	3928	3.5
18032	139	3989	3.5
18033	139	4033	2.5
18034	139	4034	4
18035	139	4040	3.5
18036	139	4062	3.5
18037	139	4109	3.5
18038	139	4126	4
18039	139	4154	3.5
18040	139	4173	4
18041	139	4219	4
18042	139	4228	3.5
18043	139	4278	3
18044	139	4279	4
18045	139	4288	4
18046	139	4313	4
18047	139	4316	3.5
18048	139	4369	4
18049	139	4383	3.5
18050	139	4384	4
18051	139	4386	3
18052	139	4429	3.5
18053	139	4453	3
18054	139	4462	3.5
18055	139	4487	4
18056	139	4597	2.5
18057	139	4600	4
18058	139	4697	3
18059	139	4699	3.5
18060	139	4705	4
18061	139	4802	3.5
18062	139	4803	4
18063	139	4818	3
18064	139	4900	4
18065	139	4909	3.5
18066	139	4944	4
18067	139	5000	4
18068	139	5003	4
18069	139	5005	3.5
18070	139	5011	3
18071	139	5042	4
18072	139	5052	4.5
18073	139	5200	4
18074	139	5202	3.5
18075	139	5209	4
18076	139	5221	3
18077	139	5276	4
18078	139	5310	3.5
18079	139	5311	3
18080	139	5325	4
18081	139	5329	4
18082	139	5332	4
18083	139	5336	4.5
18084	139	5365	3
18085	139	5407	4
18086	139	5467	4
18087	139	5618	4.5
18088	139	5623	3.5
18089	139	5624	3
18090	139	5652	4
18091	139	5677	1
18092	139	5681	4
18093	139	5682	4
18094	139	5691	3
18095	139	5726	4
18096	139	5727	3.5
18097	139	5733	3.5
18098	140	1	3
18099	140	3	3
18100	140	6	3
18101	140	7	3
18102	140	9	3
18103	140	14	3
18104	140	17	4
18105	140	25	3
18106	140	30	3
18107	140	32	3
18108	140	36	3
18109	140	41	3
18110	140	48	3
18111	140	49	4
18112	140	52	3
18113	140	54	3
18114	140	57	3
18115	140	58	3
18116	140	68	5
18117	140	72	3
18118	140	73	2
18119	140	75	1
18120	140	76	3
18121	140	77	4
18122	140	80	3
18123	140	87	3
18124	140	88	3
18125	140	91	3
18126	140	94	3
18127	140	96	3
18128	140	102	3
18129	140	120	3
18130	140	121	2
18131	140	127	3
18132	140	130	3
18133	140	142	3
18134	140	168	4
18135	140	231	3
18136	140	235	4
18137	140	236	3
18138	140	258	3
18139	140	261	4
18140	140	278	3
18141	140	280	5
18142	140	290	3
18143	140	309	3
18144	140	310	4
18145	140	317	5
18146	140	336	3
18147	140	340	3
18148	140	383	2
18149	140	406	4
18150	140	415	3
18151	140	427	4
18152	140	440	3
18153	140	454	4
18154	140	460	3
18155	140	472	4
18156	140	483	3
18157	140	503	3
18158	140	522	3
18159	140	524	3
18160	140	525	3
18161	140	536	3
18162	140	538	4
18163	140	552	3
18164	140	553	3
18165	140	554	3
18166	140	559	3
18167	140	564	3
18168	140	565	3
18169	140	569	3
18170	140	581	3
18171	140	592	2
18172	140	601	2
18173	140	602	3
18174	140	611	3
18175	140	615	1
18176	140	617	3
18177	140	618	2
18178	140	620	3
18179	140	622	3
18180	140	630	3
18181	140	639	2
18182	140	641	3
18183	140	642	3
18184	140	645	2
18185	140	647	3
18186	140	649	3
18187	140	652	3
18188	140	653	3
18189	140	654	3
18190	140	657	4
18191	140	659	3
18192	140	661	3
18193	140	662	2
18194	140	663	2
18195	140	664	2
18196	140	668	1
18197	140	675	2
18198	140	677	3
18199	140	681	3
18200	140	683	3
18201	140	690	4
18202	140	691	3
18203	140	694	3
18204	140	696	5
18205	140	700	3
18206	140	710	2
18207	140	712	2
18208	140	717	3
18209	140	800	3
18210	140	804	3
18211	140	805	3
18212	140	806	4
18213	140	810	3
18214	140	812	2
18215	140	815	2
18216	140	848	5
18217	140	849	3
18218	140	853	3
18219	140	854	3
18220	140	858	4
18221	140	860	4
18222	140	863	3
18223	140	864	3
18224	140	904	3
18225	140	905	3
18226	140	909	3
18227	140	925	3
18228	140	927	5
18229	140	932	3
18230	140	947	3
18231	140	972	1
18232	140	994	4
18233	140	1068	2
18234	140	1100	3
18235	140	1101	3
18236	140	1102	3
18237	140	1103	4
18238	140	1104	4
18239	140	1107	5
18240	140	1108	3
18241	140	1109	3
18242	140	1110	2
18243	140	1131	2
18244	140	1133	3
18245	140	1139	3
18246	140	1140	3
18247	140	1144	3
18248	140	1146	3
18249	140	1147	3
18250	140	1153	2
18251	140	1154	3
18252	140	1157	3
18253	140	1165	2
18254	140	1167	2
18255	140	1181	3
18256	140	1183	2
18257	140	1188	3
18258	140	1189	3
18259	140	1195	3
18260	140	1196	3
18261	140	1198	3
18262	140	1199	3
18263	140	1203	3
18264	140	1205	3
18265	140	1206	3
18266	140	1215	3
18267	140	1226	1
18268	140	1233	2
18269	140	1238	3
18270	140	1242	4
18271	140	1244	2
18272	140	1250	3
18273	140	1253	3
18274	140	1257	1
18275	140	1308	3
18276	140	1310	4
18277	140	3464	4
18278	141	1	3.5
18279	141	99	4
18280	141	231	4
18281	141	317	4.5
18282	141	324	4
18283	141	427	4
18284	141	521	3.5
18285	141	524	4.5
18286	141	530	4
18287	141	645	3
18288	141	647	2
18289	141	659	3.5
18290	141	843	4
18291	141	959	4.5
18292	141	1030	3.5
18293	141	1261	3.5
18294	141	1276	3.5
18295	141	1368	3.5
18296	141	1412	3.5
18297	141	1894	1
18298	141	2057	5
18299	141	2339	3.5
18300	141	2366	2.5
18301	141	2788	4
18302	141	2969	2.5
18303	141	3000	4
18304	141	3380	5
18305	141	3868	4
18306	141	3886	4
18307	141	4803	5
18308	141	5306	3.5
18309	141	5560	2
18310	141	7040	3
18311	141	7385	4
18312	141	7424	3
18313	141	7620	0.5
18314	141	7631	3
18315	141	7660	5
18316	141	7829	4.5
18317	141	7976	5
18318	141	8351	5
18319	141	8354	2.5
18320	141	8374	0.5
18321	141	8427	2
18322	142	341	2.5
18323	142	1620	3
18324	142	1701	4.5
18325	142	1866	3
18326	142	2045	4
18327	142	2199	3
18328	142	3883	3
18329	142	4258	3.5
18330	142	4487	4.5
18331	142	4858	3.5
18332	142	5289	4.5
18333	142	5369	5
18334	142	6725	5
18335	142	6836	4
18336	142	6969	4
18337	142	7430	5
18338	142	7599	5
18339	142	7633	5
18340	142	7677	5
18341	142	8085	4
18342	142	8163	5
18343	143	2	5
18344	143	10	4
18345	143	19	4
18346	143	21	5
18347	143	32	4
18348	143	42	4
18349	143	45	5
18350	143	88	4
18351	143	99	5
18352	143	127	5
18353	143	128	5
18354	143	130	4
18355	143	135	5
18356	143	137	5
18357	143	142	4
18358	143	144	5
18359	143	149	5
18360	143	161	5
18361	143	177	4
18362	143	181	4
18363	143	203	4
18364	143	223	5
18365	143	224	5
18366	143	227	5
18367	143	236	5
18368	143	252	4
18369	143	254	3
18370	143	258	4
18371	143	259	4
18372	143	261	2
18373	143	277	3
18374	143	278	5
18375	143	279	5
18376	143	280	5
18377	143	290	3
18378	143	298	5
18379	143	300	4
18380	143	305	4
18381	143	311	4
18382	143	314	3
18383	143	317	5
18384	143	324	5
18385	143	327	3
18386	143	337	5
18387	143	340	4
18388	143	360	4
18389	143	369	4
18390	143	381	4
18391	143	389	3
18392	143	391	5
18393	143	403	5
18394	143	422	4
18395	143	427	3
18396	143	446	5
18397	143	472	5
18398	143	483	5
18399	143	495	2
18400	143	497	4
18401	143	520	3
18402	143	522	4
18403	143	523	4
18404	143	525	4
18405	143	526	3
18406	143	528	3
18407	143	530	5
18408	144	261	4
18409	144	495	5
18410	144	529	4.5
18411	144	572	5
18412	144	612	5
18413	144	627	5
18414	144	721	3.5
18415	144	724	5
18416	144	736	4.5
18417	144	738	5
18418	144	926	5
18419	144	957	5
18420	144	966	4
18421	144	968	5
18422	144	969	5
18423	144	985	5
18424	144	1042	5
18425	144	1052	5
18426	144	1060	5
18427	144	1087	4
18428	144	1492	4.5
18429	144	1534	5
18430	144	1656	3
18431	144	1696	5
18432	144	1697	5
18433	144	2052	3
18434	144	2151	5
18435	144	2281	5
18436	144	2282	4
18437	144	2287	3.5
18438	144	2399	5
18439	144	2425	3
18440	144	2647	5
18441	144	2721	5
18442	144	3109	5
18443	144	3807	5
18444	144	3868	5
18445	144	4279	5
18446	144	4315	0.5
18447	144	4803	5
18448	144	4944	5
18449	144	5076	5
18450	144	5202	5
18451	144	5329	5
18452	144	5707	5
18453	144	5795	5
18454	144	6321	5
18455	144	6358	5
18456	144	6485	5
18457	144	6755	4.5
18458	144	6946	5
18459	144	7061	5
18460	144	7139	5
18461	144	7157	5
18462	144	7177	5
18463	144	7255	4.5
18464	144	7275	5
18465	144	7433	5
18466	144	7573	5
18467	144	7597	5
18468	144	7678	4.5
18469	144	7761	5
18470	144	7845	1
18471	144	7914	5
18472	144	7954	5
18473	144	7959	5
18474	144	8011	5
18475	144	8163	5
18476	144	8278	4
18477	145	36	4
18478	145	48	5
18479	145	135	1
18480	145	231	5
18481	145	233	4
18482	145	235	3
18483	145	250	2
18484	145	261	5
18485	145	280	4
18486	145	343	3
18487	145	472	3
18488	145	493	5
18489	145	526	5
18490	145	538	3
18491	145	631	5
18492	145	696	5
18493	145	720	3
18494	145	721	5
18495	145	725	4
18496	145	727	5
18497	145	734	4
18498	145	741	5
18499	145	745	5
18500	145	791	5
18501	145	926	5
18502	145	944	5
18503	145	950	4
18504	145	970	5
18505	145	980	4
18506	145	981	5
18507	145	983	5
18508	145	986	4
18509	145	994	4
18510	145	1012	5
18511	145	1014	5
18512	145	1016	4
18513	145	1020	5
18514	145	1026	5
18515	145	1062	5
18516	145	1063	4
18517	145	1127	5
18518	145	1150	4
18519	145	1280	1
18520	145	1296	5
18521	145	1309	5
18522	145	1367	5
18523	145	1485	4
18524	145	1493	2
18525	145	1503	3
18526	145	1512	4
18527	145	1573	5
18528	145	1591	4
18529	145	1812	2
18530	145	1863	5
18531	145	1905	3
18532	145	2001	4
18533	145	2151	4
18534	145	2163	3
18535	145	2184	5
18536	145	2192	4
18537	145	2198	5
18538	145	2282	5
18539	145	2459	4
18540	145	2472	5
18541	145	2497	4
18542	145	2601	3
18543	145	2668	4
18544	145	2751	5
18545	146	25	4
18546	146	37	3
18547	146	233	4
18548	146	261	5
18549	146	280	5
18550	146	324	4
18551	146	361	1
18552	146	389	4
18553	146	406	5
18554	146	422	5
18555	146	472	5
18556	146	529	4
18557	146	538	5
18558	146	569	3
18559	146	639	1
18560	146	720	4
18561	146	721	5
18562	146	734	5
18563	146	741	5
18564	146	742	5
18565	146	761	3
18566	146	774	5
18567	146	776	4
18568	146	789	5
18569	146	809	3
18570	146	821	4
18571	146	843	5
18572	146	873	5
18573	146	888	2
18574	146	896	5
18575	146	923	5
18576	146	947	5
18577	146	961	5
18578	146	963	4
18579	146	969	5
18580	146	981	5
18581	146	986	3
18582	146	992	4
18583	146	1018	5
18584	146	1019	4
18585	146	1025	3
18586	146	1028	1
18587	146	1030	4
18588	146	1047	5
18589	146	1048	3
18590	146	1051	5
18591	146	1066	4
18592	146	1083	4
18593	146	1092	4
18594	146	1127	4
18595	146	1296	4
18596	146	1310	4
18597	146	1330	4
18598	146	1337	1
18599	146	1338	5
18600	146	1342	4
18601	146	1361	4
18602	146	1402	3
18603	146	1487	3
18604	146	1522	4
18605	146	1527	4
18606	146	1535	4
18607	146	1561	4
18608	146	1581	4
18609	146	1582	4
18610	146	1583	5
18611	146	1645	4
18612	146	1647	5
18613	146	1698	4
18614	146	1749	4
18615	146	1814	3
18616	146	1822	4
18617	146	1830	4
18618	146	1850	4
18619	146	1907	4
18620	146	2114	4
18621	146	2128	4
18622	146	2167	4
18623	146	2172	4
18624	146	2175	1
18625	146	2180	4
18626	146	2184	5
18627	146	2210	5
18628	146	2211	4
18629	146	2233	4
18630	146	2237	4
18631	146	2239	5
18632	146	2246	5
18633	146	2294	4
18634	146	2313	4
18635	146	2325	3
18636	146	2330	4
18637	146	2332	4
18638	146	2342	4
18639	146	2430	3
18640	146	2459	3
18641	146	2467	4
18642	146	2471	4
18643	146	2478	3
18644	146	2483	5
18645	146	4301	3
18646	147	1	5
18647	147	6	4
18648	147	29	5
18649	147	36	5
18650	147	45	5
18651	147	48	5
18652	147	54	5
18653	147	100	4
18654	147	112	4
18655	147	142	2
18656	147	170	3
18657	147	201	4
18658	147	205	5
18659	147	218	4
18660	147	220	4
18661	147	231	5
18662	147	233	5
18663	147	242	5
18664	147	259	4
18665	147	261	5
18666	147	281	4
18667	147	317	3
18668	147	337	1
18669	147	427	3
18670	147	472	4
18671	147	485	5
18672	147	503	5
18673	147	520	3
18674	147	523	4
18675	147	526	4
18676	147	528	5
18677	147	529	4
18678	147	538	4
18679	147	546	4
18680	147	573	4
18681	147	586	4
18682	147	622	3
18683	147	631	5
18684	147	653	2
18685	147	696	5
18686	147	700	5
18687	147	844	5
18688	147	848	4
18689	147	863	5
18690	147	867	5
18691	147	893	4
18692	147	898	3
18693	147	915	4
18694	147	919	5
18695	147	920	5
18696	147	923	4
18697	147	927	5
18698	147	941	5
18699	147	950	4
18700	147	957	4
18701	147	959	5
18702	147	961	5
18703	147	963	5
18704	147	968	5
18705	147	969	4
18706	147	970	5
18707	147	972	5
18708	147	975	5
18709	147	976	5
18710	147	983	5
18711	147	987	5
18712	147	989	5
18713	147	991	3
18714	147	994	4
18715	147	1000	4
18716	147	1005	5
18717	147	1009	4
18718	147	1018	5
18719	147	1021	4
18720	147	1024	5
18721	147	1030	5
18722	147	1033	4
18723	147	1037	5
18724	147	1038	5
18725	147	1042	4
18726	147	1051	5
18727	147	1058	4
18728	147	1071	2
18729	147	1090	4
18730	147	1097	4
18731	147	1105	4
18732	147	1109	5
18733	147	1112	5
18734	147	1144	3
18735	147	1187	5
18736	147	1203	3
18737	147	1226	4
18738	147	1233	5
18739	147	1244	1
18740	147	1261	4
18741	147	1296	5
18742	147	1302	4
18743	147	1311	4
18744	147	1338	4
18745	147	1357	5
18746	147	1367	4
18747	147	1382	5
18748	147	1386	2
18749	147	1399	5
18750	147	1414	4
18751	147	1482	4
18752	147	1494	4
18753	147	1521	3
18754	147	1558	5
18755	147	1561	5
18756	147	1569	4
18757	147	1574	5
18758	147	1591	5
18759	147	1635	3
18760	147	1636	5
18761	147	1641	5
18762	147	1645	5
18763	147	1678	5
18764	147	1685	4
18765	147	1697	4
18766	147	1701	4
18767	147	1723	5
18768	147	1730	4
18769	147	1811	4
18770	147	1812	4
18771	147	1820	5
18772	147	1822	5
18773	147	1839	5
18774	147	1861	5
18775	147	1867	4
18776	147	1902	4
18777	147	1911	5
18778	147	2034	5
18779	147	2041	4
18780	147	2057	5
18781	147	2078	5
18782	147	2091	5
18783	147	2114	5
18784	147	2122	5
18785	147	2158	3
18786	147	2164	3
18787	147	2210	4
18788	147	2211	3
18789	147	2246	4
18790	147	2282	5
18791	147	2329	4
18792	147	2331	4
18793	147	2366	5
18794	147	2373	4
18795	147	2389	4
18796	147	2412	5
18797	147	2448	4
18798	147	2454	5
18799	147	2483	4
18800	147	2520	5
18801	147	2533	4
18802	147	2542	4
18803	147	2543	4
18804	147	2563	4
18805	147	2603	4
18806	147	2608	4
18807	147	2704	2
18808	147	2777	4
18809	147	2784	4
18810	147	2835	5
18811	147	2898	4
18812	147	2908	5
18813	147	2925	5
18814	147	2926	5
18815	147	2946	4
18816	147	3003	4
18817	147	3025	3
18818	147	3052	4
18819	147	3064	5
18820	147	3073	5
18821	147	3148	5
18822	147	3149	4
18823	147	3150	5
18824	147	3163	5
18825	147	3165	5
18826	147	3173	5
18827	147	3177	4
18828	147	3184	5
18829	147	3186	2
18830	147	3193	3
18831	147	3219	4
18832	147	3233	5
18833	147	3240	5
18834	147	3262	5
18835	147	3276	4
18836	147	3277	2
18837	147	3281	3
18838	147	3308	5
18839	147	3323	5
18840	147	3324	3
18841	148	2	3
18842	148	10	3
18843	148	11	3
18844	148	17	4
18845	148	19	1
18846	148	21	4
18847	148	32	4
18848	148	34	5
18849	148	37	3
18850	148	45	3
18851	148	48	5
18852	148	88	3
18853	148	99	5
18854	148	121	4
18855	148	127	4
18856	148	128	3
18857	148	130	3
18858	148	137	1
18859	148	138	3
18860	148	142	3
18861	148	148	3
18862	148	149	2
18863	148	161	3
18864	148	162	3
18865	148	170	2
18866	148	177	3
18867	148	181	2
18868	148	197	3
18869	148	203	1
18870	148	207	4
18871	148	208	3
18872	148	223	3
18873	148	224	3
18874	148	232	3
18875	148	236	4
18876	148	252	3
18877	148	254	3
18878	148	258	3
18879	148	259	3
18880	148	261	4
18881	148	264	4
18882	148	277	3
18883	148	278	2
18884	148	279	3
18885	148	280	5
18886	148	290	4
18887	148	298	3
18888	148	300	3
18889	148	305	1
18890	148	310	3
18891	148	311	3
18892	148	317	5
18893	148	318	5
18894	148	324	3
18895	148	327	4
18896	148	337	4
18897	148	340	3
18898	148	360	3
18899	148	369	3
18900	148	381	3
18901	148	383	2
18902	148	384	3
18903	148	389	4
18904	148	391	3
18905	148	403	3
18906	148	406	3
18907	148	427	3
18908	148	446	3
18909	148	472	5
18910	148	483	4
18911	148	497	3
18912	148	520	1
18913	148	521	3
18914	148	523	3
18915	148	524	5
18916	148	525	3
18917	148	526	3
18918	148	528	2
18919	148	530	4
18920	149	6	4
18921	149	10	3
18922	149	16	5
18923	149	19	3
18924	149	21	4
18925	149	23	3
18926	149	24	3
18927	149	32	5
18928	149	36	5
18929	149	37	5
18930	149	45	5
18931	149	48	5
18932	149	65	4
18933	149	99	5
18934	149	100	5
18935	149	109	3
18936	149	130	3
18937	149	131	4
18938	149	135	3
18939	149	138	4
18940	149	142	3
18941	149	148	3
18942	149	149	2
18943	149	151	4
18944	149	162	3
18945	149	168	4
18946	149	171	4
18947	149	189	3
18948	149	195	5
18949	149	199	3
18950	149	203	3
18951	149	207	4
18952	149	217	5
18953	149	228	4
18954	149	231	5
18955	149	256	5
18956	149	261	5
18957	149	264	4
18958	149	278	3
18959	149	280	5
18960	149	281	4
18961	149	310	3
18962	149	311	3
18963	149	318	4
18964	149	327	3
18965	149	330	3
18966	149	332	4
18967	149	337	3
18968	149	369	1
18969	149	383	3
18970	149	384	3
18971	149	389	4
18972	149	403	4
18973	149	405	5
18974	149	406	4
18975	149	419	4
18976	149	422	4
18977	149	423	5
18978	149	427	4
18979	149	436	3
18980	149	453	4
18981	149	459	3
18982	149	479	4
18983	149	481	3
18984	149	482	5
18985	149	485	5
18986	149	487	4
18987	149	520	3
18988	149	521	3
18989	149	523	4
18990	149	524	3
18991	149	525	3
18992	149	526	5
18993	149	530	3
18994	149	538	5
18995	149	620	3
18996	149	627	4
18997	149	645	5
18998	149	651	3
18999	149	662	4
19000	149	677	3
19001	149	696	5
19002	149	702	4
19003	149	741	5
19004	149	745	4
19005	149	746	5
19006	149	774	4
19007	149	829	3
19008	149	834	4
19009	149	840	4
19010	149	843	3
19011	149	844	3
19012	149	877	5
19013	149	878	5
19014	149	887	5
19015	149	892	4
19016	149	895	4
19017	149	898	3
19018	149	909	5
19019	149	923	5
19020	149	932	4
19021	149	957	5
19022	149	959	4
19023	149	961	4
19024	149	962	5
19025	149	963	4
19026	149	969	5
19027	149	970	5
19028	149	972	5
19029	149	974	4
19030	149	975	5
19031	149	981	4
19032	149	982	5
19033	149	983	5
19034	149	995	5
19035	149	996	5
19036	149	1000	5
19037	149	1006	4
19038	149	1017	4
19039	149	1019	5
19040	149	1022	4
19041	149	1025	5
19042	149	1029	4
19043	149	1030	4
19044	149	1035	3
19045	149	1036	5
19046	149	1045	4
19047	149	1048	5
19048	149	1051	5
19049	149	1052	5
19050	149	1053	5
19051	149	1058	5
19052	149	1061	5
19053	149	1063	5
19054	149	1127	5
19055	149	1131	3
19056	149	1133	5
19057	149	1189	5
19058	149	1233	3
19059	149	1244	2
19060	149	1254	3
19061	149	1310	5
19062	150	311	3
19063	150	340	5
19064	150	472	5
19065	150	527	5
19066	150	565	4
19067	150	647	1
19068	150	696	4
19069	150	722	5
19070	150	724	4
19071	150	733	3
19072	150	734	4
19073	150	735	4
19074	150	736	5
19075	150	738	4
19076	150	739	5
19077	150	741	5
19078	150	742	5
19079	150	745	4
19080	150	754	4
19081	150	764	4
19082	150	789	4
19083	150	844	4
19084	150	892	4
19085	150	895	5
19086	150	920	5
19087	150	936	5
19088	150	939	5
19089	150	959	4
19090	150	960	5
19091	150	961	4
19092	150	972	4
19093	150	983	3
19094	150	991	4
19095	150	1004	4
19096	150	1007	4
19097	150	1024	5
19098	150	1030	4
19099	150	1042	4
19100	150	1055	5
19101	150	1066	5
19102	150	1278	3
19103	150	1296	4
19104	150	1298	3
19105	150	1322	3
19106	150	1338	3
19107	150	1514	5
19108	150	1526	4
19109	150	1583	4
19110	150	1591	5
19111	150	1625	5
19112	150	1640	4
19113	150	1641	4
19114	150	1777	3
19115	150	1778	4.5
19116	150	1908	4
19117	150	1916	4.5
19118	150	1997	3
19119	150	2145	2
19120	150	2239	5
19121	150	2331	4
19122	150	2454	4
19123	150	2457	4
19124	150	2472	4
19125	150	2509	2
19126	150	2521	4
19127	150	2575	5
19128	150	2629	4
19129	150	2704	5
19130	150	2737	3
19131	150	2744	3
19132	150	2808	5
19133	150	2821	4
19134	150	2822	3
19135	150	2827	3
19136	150	2829	4
19137	150	2869	3
19138	150	2883	4
19139	150	2965	3
19140	150	3003	4
19141	150	3024	4
19142	150	3028	3
19143	150	3045	4
19144	150	3046	4
19145	150	3064	4
19146	150	3069	5
19147	150	3073	3
19148	150	3081	4
19149	150	3083	4
19150	150	3108	4
19151	150	3112	3
19152	150	3125	5
19153	150	3126	3
19154	150	3132	4
19155	150	3150	5
19156	150	3165	4
19157	150	3169	4
19158	150	3170	4
19159	150	3175	4
19160	150	3176	4
19161	150	3177	4
19162	150	3184	5
19163	150	3211	4
19164	150	3220	3
19165	150	3262	2
19166	150	3266	2
19167	150	3272	1
19168	150	3322	2
19169	150	3323	5
19170	150	3324	3
19171	150	3327	3
19172	150	3337	5
19173	150	3359	2
19174	150	3380	4
19175	150	3382	5
19176	150	3406	3
19177	150	3419	5
19178	150	3431	5
19179	150	3434	4
19180	150	3472	4.5
19181	150	3482	5
19182	150	3634	3
19183	150	3683	3
19184	150	3701	4
19185	150	3708	3
19186	150	3713	4
19187	150	3767	3
19188	150	3812	4
19189	150	3818	4
19190	150	3830	1
19191	150	3860	2
19192	150	3868	4
19193	150	3871	3
19194	150	3873	3
19195	150	3874	2
19196	150	3886	5
19197	150	3888	5
19198	150	3902	4
19199	150	3962	5
19200	150	3989	4
19201	150	4006	4
19202	150	4037	4
19203	150	4040	4
19204	150	4064	1
19205	150	4080	3
19206	150	4090	3
19207	150	4093	4
19208	150	4109	4
19209	150	4118	4
19210	150	4126	4
19211	150	4127	3
19212	150	4129	4
19213	150	4135	5
19214	150	4146	4
19215	150	4154	4
19216	150	4173	3
19217	150	4184	3
19218	150	4229	4
19219	150	4272	3
19220	150	4277	4
19221	150	4308	3
19222	150	4312	4
19223	150	4324	3.5
19224	150	4330	5
19225	150	4370	4
19226	150	4384	4.5
19227	150	4386	4
19228	150	4416	4
19229	150	4435	4
19230	150	4446	4
19231	150	4451	2
19232	150	4453	3
19233	150	4458	5
19234	150	4461	3
19235	150	4485	5
19236	150	4487	5
19237	150	4496	4.5
19238	150	4542	5
19239	150	4560	3
19240	150	4592	4
19241	150	4596	2
19242	150	4600	5
19243	150	4646	1
19244	150	4651	4
19245	150	4697	3.5
19246	150	4699	3.5
19247	150	4711	4.5
19248	150	4779	1
19249	150	4803	4
19250	150	4818	4
19251	150	5003	4.5
19252	150	5042	3.5
19253	150	5167	3
19254	150	5207	5
19255	150	5215	4
19256	150	5618	4
19257	150	5624	4
19258	150	5719	4.5
19259	150	5743	3
19260	150	5820	4
19261	150	5871	4
19262	150	5881	5
19263	150	5890	4
19264	150	6356	3.5
19265	150	6418	4
19266	150	6490	4
19267	150	6563	4.5
19268	150	6564	3
19269	151	1	5
19270	151	3	3
19271	151	6	3
19272	151	7	3
19273	151	12	1
19274	151	17	4
19275	151	25	3
19276	151	32	4
19277	151	58	4
19278	151	61	2
19279	151	82	3
19280	151	88	3
19281	151	95	3
19282	151	97	3
19283	151	101	3
19284	151	121	3
19285	151	231	5
19286	151	336	3
19287	151	440	3
19288	151	538	4
19289	151	553	4
19290	151	563	4
19291	151	565	3
19292	151	602	4
19293	151	611	5
19294	151	614	4
19295	151	620	4
19296	151	622	5
19297	151	623	3
19298	151	638	3
19299	151	639	3
19300	151	641	4
19301	151	647	3
19302	151	650	4
19303	151	651	4
19304	151	652	4
19305	151	653	4
19306	151	654	4
19307	151	659	5
19308	151	662	5
19309	151	677	4
19310	151	696	4
19311	151	873	5
19312	151	972	5
19313	151	1111	5
19314	151	1133	4
19315	152	181	4.5
19316	152	448	3.5
19317	152	523	4
19318	152	622	4
19319	152	708	4
19320	152	844	4
19321	152	1233	4.5
19322	152	1256	3.5
19323	152	1267	4
19324	152	1366	4
19325	152	1852	4
19326	152	1932	3.5
19327	152	1977	3
19328	152	2099	2
19329	152	2110	3.5
19330	152	2260	3.5
19331	152	2608	4
19332	152	2614	3.5
19333	152	2744	3.5
19334	152	2837	5
19335	152	2962	4
19336	152	3000	4
19337	152	4109	4
19338	152	4458	5
19339	152	5207	5
19340	152	5618	4.5
19341	152	7307	5
19342	152	7670	4
19343	152	7934	4.5
19344	152	8351	4.5
19345	152	8630	5
19346	153	10	3
19347	153	34	3
19348	153	48	3
19349	153	127	4
19350	153	130	3
19351	153	138	3
19352	153	142	3
19353	153	161	3
19354	153	181	3
19355	153	197	3
19356	153	203	2
19357	153	224	3
19358	153	254	3
19359	153	258	3
19360	153	261	4
19361	153	264	3
19362	153	278	3
19363	153	280	4
19364	153	290	3
19365	153	300	3
19366	153	305	3
19367	153	310	3
19368	153	317	3
19369	153	324	3
19370	153	337	3
19371	153	340	3
19372	153	383	3
19373	153	403	3
19374	153	406	3
19375	153	427	3
19376	153	446	3
19377	153	483	3
19378	153	521	3
19379	153	522	3
19380	153	523	3
19381	153	524	4
19382	153	525	3
19383	153	528	3
19384	153	530	3
19385	154	860	5
19386	154	947	3
19387	154	1144	4
19388	154	1153	2
19389	154	1167	2
19390	154	1173	5
19391	154	1187	2
19392	154	1198	1
19393	154	1207	3
19394	154	1216	5
19395	154	1224	4
19396	154	1271	4
19397	154	1272	5
19398	154	1278	3
19399	154	1284	1
19400	154	1288	1
19401	154	1292	4
19402	154	1293	3
19403	154	1296	4
19404	154	1302	2
19405	154	1309	3
19406	154	1310	5
19407	154	1314	1
19408	154	1315	4
19409	154	1320	4
19410	154	1322	4
19411	154	1328	3
19412	154	1331	2
19413	154	1337	4
19414	154	1345	4
19415	154	1346	5
19416	154	1351	4
19417	154	1363	3
19418	154	1366	1
19419	154	1368	2
19420	154	1372	5
19421	154	1376	4
19422	154	1399	4
19423	155	11	3
19424	155	17	1
19425	155	36	3
19426	155	48	5
19427	155	206	4
19428	155	264	4
19429	155	318	5
19430	155	348	4
19431	155	483	2
19432	155	529	4
19433	155	747	4
19434	155	788	1
19435	155	795	2
19436	155	809	5
19437	155	878	2
19438	155	899	4
19439	155	913	1
19440	155	923	5
19441	155	957	3
19442	155	962	3
19443	155	977	1
19444	155	1007	5
19445	155	1054	5
19446	155	1088	2
19447	155	1145	5
19448	155	1311	4
19449	155	1345	2
19450	155	1410	5
19451	155	1549	2
19452	155	1626	2
19453	155	1638	5
19454	155	1640	4
19455	155	1647	3
19456	155	1777	4
19457	155	1907	5
19458	155	1937	4
19459	155	1996	3
19460	155	2001	5
19461	155	2057	4
19462	155	2064	5
19463	155	2078	4
19464	155	2114	3
19465	155	2166	3
19466	155	2281	1
19467	155	2332	5
19468	155	2358	3
19469	155	2409	1
19470	155	2410	1
19471	155	2413	2
19472	155	2448	5
19473	155	2524	4
19474	156	1	5
19475	156	2	3
19476	156	3	4
19477	156	4	3
19478	156	5	5
19479	156	8	4
19480	156	10	4
19481	156	13	3
19482	156	15	4
19483	156	19	5
19484	156	21	3
19485	156	24	4
19486	156	27	3
19487	156	31	4
19488	156	34	5
19489	156	37	5
19490	156	42	5
19491	156	44	1
19492	156	45	4
19493	156	46	5
19494	156	49	4
19495	156	51	2
19496	156	56	3
19497	156	57	3
19498	156	58	5
19499	156	61	4
19500	156	66	3
19501	156	82	2
19502	156	93	3
19503	156	97	5
19504	156	99	4
19505	156	101	4
19506	156	109	3
19507	156	117	5
19508	156	127	5
19509	156	130	5
19510	156	135	4
19511	156	137	5
19512	156	142	4
19513	156	144	5
19514	156	145	2
19515	156	148	3
19516	156	150	3
19517	156	161	4
19518	156	162	3
19519	156	167	1
19520	156	169	4
19521	156	170	4
19522	156	176	4
19523	156	180	5
19524	156	181	4
19525	156	188	3
19526	156	189	3
19527	156	191	4
19528	156	199	3
19529	156	202	3
19530	156	203	5
19531	156	206	4
19532	156	210	3
19533	156	211	4
19534	156	213	2
19535	156	219	3
19536	156	221	3
19537	156	223	4
19538	156	224	5
19539	156	227	4
19540	156	229	4
19541	156	231	5
19542	156	232	5
19543	156	233	3
19544	156	235	4
19545	156	236	5
19546	156	237	3
19547	156	244	3
19548	156	245	3
19549	156	246	4
19550	156	247	3
19551	156	252	3
19552	156	254	2
19553	156	258	4
19554	156	261	4
19555	156	264	3
19556	156	276	3
19557	156	279	3
19558	156	280	5
19559	156	293	4
19560	156	294	4
19561	156	298	4
19562	156	300	5
19563	156	301	3
19564	156	305	4
19565	156	311	4
19566	156	312	5
19567	156	314	3
19568	156	316	5
19569	156	317	5
19570	156	318	2
19571	156	321	4
19572	156	322	4
19573	156	324	5
19574	156	327	4
19575	156	328	4
19576	156	330	5
19577	156	334	4
19578	156	337	4
19579	156	338	4
19580	156	340	5
19581	156	342	2
19582	156	343	1
19583	156	347	2
19584	156	353	3
19585	156	360	5
19586	156	362	2
19587	156	363	3
19588	156	364	3
19589	156	368	4
19590	156	378	3
19591	156	379	1
19592	156	381	3
19593	156	384	4
19594	156	386	2
19595	156	389	4
19596	156	390	5
19597	156	394	4
19598	156	395	5
19599	156	404	3
19600	156	409	2
19601	156	414	5
19602	156	420	2
19603	156	421	4
19604	156	425	4
19605	156	427	5
19606	156	428	2
19607	156	431	4
19608	156	433	3
19609	156	435	3
19610	156	437	4
19611	156	443	5
19612	156	446	5
19613	156	448	4
19614	156	452	5
19615	156	461	5
19616	156	463	4
19617	156	465	5
19618	156	469	3
19619	156	472	2
19620	156	473	4
19621	156	475	4
19622	156	480	4
19623	156	483	5
19624	156	485	2
19625	156	486	5
19626	156	487	4
19627	156	490	2
19628	156	495	4
19629	156	496	3
19630	156	497	4
19631	156	501	2
19632	156	509	4
19633	156	514	4
19634	156	515	4
19635	156	516	4
19636	156	519	4
19637	156	520	2
19638	156	521	4
19639	156	522	5
19640	156	523	5
19641	156	524	4
19642	156	525	4
19643	156	527	2
19644	156	528	5
19645	156	529	3
19646	156	530	5
19647	156	536	4
19648	156	539	3
19649	156	546	5
19650	156	549	2
19651	156	560	5
19652	156	565	3
19653	156	568	5
19654	156	572	1
19655	156	573	2
19656	156	588	2
19657	156	603	5
19658	156	611	3
19659	156	614	5
19660	156	620	4
19661	156	622	3
19662	156	626	5
19663	156	633	2
19664	156	638	5
19665	156	639	3
19666	156	641	5
19667	156	647	5
19668	156	650	5
19669	156	651	2
19670	156	652	1
19671	156	653	4
19672	156	654	5
19673	156	655	1
19674	156	659	4
19675	156	667	2
19676	156	669	2
19677	156	674	5
19678	156	677	5
19679	156	678	2
19680	156	682	5
19681	156	685	3
19682	156	697	4
19683	156	708	4
19684	156	709	5
19685	156	711	3
19686	156	724	3
19687	156	736	5
19688	156	739	4
19689	156	741	3
19690	156	742	5
19691	156	746	3
19692	156	753	5
19693	156	755	3
19694	156	774	4
19695	156	775	3
19696	156	810	3
19697	156	814	4
19698	156	818	3
19699	156	819	1
19700	156	820	1
19701	156	821	5
19702	156	822	3
19703	156	824	3
19704	156	825	3
19705	156	826	4
19706	156	828	4
19707	156	830	4
19708	156	831	5
19709	156	832	2
19710	156	833	3
19711	156	834	3
19712	156	835	3
19713	156	836	4
19714	156	837	2
19715	156	838	4
19716	156	839	4
19717	156	840	4
19718	156	841	2
19719	156	843	5
19720	156	849	5
19721	156	853	4
19722	156	854	5
19723	156	864	3
19724	156	866	3
19725	156	873	3
19726	156	877	3
19727	156	883	1
19728	156	886	3
19729	156	887	1
19730	156	895	3
19731	156	914	4
19732	156	919	4
19733	156	920	5
19734	156	923	5
19735	156	957	2
19736	156	959	5
19737	156	960	5
19738	156	961	5
19739	156	969	3
19740	156	972	5
19741	156	982	5
19742	156	987	4
19743	156	1000	3
19744	156	1002	4
19745	156	1025	3
19746	156	1030	4
19747	156	1031	3
19748	156	1038	5
19749	156	1042	2
19750	156	1051	5
19751	156	1053	4
19752	156	1056	3
19753	156	1066	3
19754	156	1078	1
19755	156	1083	2
19756	156	1084	1
19757	156	1087	2
19758	156	1090	3
19759	156	1091	2
19760	156	1092	4
19761	156	1100	4
19762	156	1106	4
19763	156	1108	2
19764	156	1111	4
19765	156	1119	3
19766	156	1122	5
19767	156	1123	2
19768	156	1125	4
19769	156	1127	1
19770	156	1128	1
19771	156	1130	3
19772	156	1131	2
19773	156	1133	5
19774	156	1138	5
19775	156	1140	4
19776	156	1142	3
19777	156	1144	1
19778	156	1148	5
19779	156	1153	5
19780	156	1167	5
19781	156	1185	3
19782	156	1188	2
19783	156	1198	5
19784	156	1203	5
19785	156	1206	4
19786	156	1222	5
19787	156	1226	5
19788	156	1232	3
19789	156	1233	5
19790	156	1244	5
19791	156	1254	4
19792	156	1256	4
19793	156	1261	5
19794	156	1265	3
19795	156	1268	2
19796	156	1269	5
19797	156	1274	3
19798	156	1287	3
19799	156	1288	5
19800	156	1293	3
19801	156	1296	2
19802	156	1297	5
19803	156	1311	4
19804	156	1316	3
19805	156	1317	2
19806	156	1321	5
19807	156	1322	4
19808	156	1340	4
19809	156	1344	5
19810	156	1348	4
19811	156	1353	4
19812	156	1359	4
19813	156	1360	3
19814	156	1364	2
19815	156	1368	5
19816	156	1369	5
19817	156	1371	4
19818	156	1373	5
19819	156	1402	5
19820	156	1410	3
19821	156	1427	5
19822	157	6	4
19823	157	10	4
19824	157	21	3
19825	157	32	5
19826	157	65	3
19827	157	71	3
19828	157	83	3
19829	157	88	2
19830	157	99	4
19831	157	101	4
19832	157	137	2
19833	157	148	2
19834	157	161	3
19835	157	171	4
19836	157	227	4
19837	157	231	5
19838	157	278	3
19839	157	290	3
19840	157	293	2
19841	157	310	4
19842	157	314	4
19843	157	337	5
19844	157	339	3
19845	157	340	4
19846	157	384	1
19847	157	391	4
19848	157	406	4
19849	157	422	4
19850	157	427	4
19851	157	462	3
19852	157	485	5
19853	157	499	4
19854	157	523	5
19855	157	525	4
19856	157	540	4
19857	157	620	4
19858	157	631	4
19859	157	647	4
19860	157	654	4
19861	157	708	2
19862	157	746	3
19863	157	844	4
19864	157	845	1
19865	157	853	3
19866	157	895	5
19867	157	898	4
19868	157	915	4
19869	157	917	4
19870	157	959	5
19871	157	960	5
19872	157	961	5
19873	157	963	4
19874	157	964	5
19875	157	972	5
19876	157	976	3
19877	157	977	3
19878	157	982	4
19879	157	984	4
19880	157	1000	5
19881	157	1021	4
19882	157	1030	4
19883	157	1035	5
19884	157	1047	4
19885	157	1051	4
19886	157	1060	4
19887	157	1071	1
19888	157	1103	4
19889	157	1112	3
19890	157	1113	3
19891	157	1114	4
19892	157	1115	2
19893	157	1116	5
19894	157	1117	3
19895	157	1118	4
19896	157	1124	4
19897	157	1125	3
19898	157	1127	4
19899	157	1131	3
19900	157	1136	3
19901	157	1145	4
19902	157	1233	3
19903	157	1244	4
19904	157	1260	3
19905	157	1261	4
19906	157	1265	4
19907	157	1271	2
19908	157	1284	4
19909	157	1288	4
19910	157	1290	4
19911	157	1322	4
19912	157	1340	3
19913	157	1351	3
19914	157	1368	4
19915	157	1382	4
19916	157	1392	4
19917	157	1400	2
19918	157	1412	3
19919	157	1427	3
19920	157	1456	3
19921	157	1461	4
19922	157	1482	4
19923	157	1521	3
19924	157	1564	4
19925	157	1565	4
19926	157	1570	4
19927	157	1574	4
19928	157	1575	4
19929	157	1582	5
19930	157	1584	3
19931	157	1591	5
19932	157	1597	4
19933	157	1654	4
19934	157	1675	4
19935	157	1677	3
19936	157	1697	3
19937	157	1723	4
19938	157	1748	4
19939	157	1749	4
19940	157	1811	2
19941	157	1828	5
19942	157	1850	4
19943	157	1867	4
19944	157	1889	2
19945	157	1904	4
19946	157	1905	2
19947	157	1912	3
19948	157	1913	4
19949	157	1915	3
19950	157	1916	4
19951	157	1917	4
19952	157	1919	3
19953	157	1920	3
19954	157	1921	3
19955	157	1924	4
19956	157	1931	3
19957	157	1934	4
19958	157	1963	4
19959	157	1965	3
19960	157	1974	3
19961	158	1	4.5
19962	158	2	4
19963	158	6	4.5
19964	158	10	4
19965	158	32	4
19966	158	45	5
19967	158	48	5
19968	158	99	4.5
19969	158	123	4
19970	158	127	3.5
19971	158	130	3.5
19972	158	135	3.5
19973	158	142	4
19974	158	181	4.5
19975	158	203	4.5
19976	158	224	4
19977	158	231	3
19978	158	259	5
19979	158	261	5
19980	158	267	3.5
19981	158	278	3
19982	158	280	5
19983	158	305	3.5
19984	158	317	4.5
19985	158	324	4
19986	158	327	4
19987	158	337	4.5
19988	158	340	4.5
19989	158	406	4.5
19990	158	422	4
19991	158	427	4.5
19992	158	428	2
19993	158	472	5
19994	158	485	3.5
19995	158	520	3.5
19996	158	523	5
19997	158	524	3.5
19998	158	525	4
19999	158	526	4.5
20000	158	528	4
20001	158	530	3.5
20002	158	565	4.5
20003	158	620	3.5
20004	158	647	3.5
20005	158	696	5
20006	158	844	4.5
20007	158	887	3.5
20008	158	888	3.5
20009	158	895	4
20010	158	898	3.5
20011	158	926	3.5
20012	158	961	4
20013	158	963	4
20014	158	964	3.5
20015	158	970	4
20016	158	972	3
20017	158	975	4
20018	158	976	4
20019	158	983	5
20020	158	984	4
20021	158	1000	4
20022	158	1002	4.5
20023	158	1018	4
20024	158	1022	4.5
20025	158	1030	3.5
20026	158	1038	3
20027	158	1051	4
20028	158	1053	4
20029	158	1112	4
20030	158	1136	4.5
20031	158	1233	4
20032	158	1260	4.5
20033	158	1261	4.5
20034	158	1296	4
20035	158	1302	4.5
20036	158	1315	4
20037	158	1344	4
20038	158	1361	3.5
20039	158	1368	4
20040	158	1375	3.5
20041	158	1489	3.5
20042	158	1565	3
20043	158	1591	4.5
20044	158	1619	4.5
20045	158	1803	4.5
20046	158	1844	4.5
20047	158	1865	4
20048	158	1878	2
20049	158	1907	4
20050	158	1912	3
20051	158	1913	4
20052	158	1914	2.5
20053	158	1937	4
20054	158	2057	4
20055	158	2099	3.5
20056	158	2126	3.5
20057	158	2163	3
20058	158	2210	3.5
20059	158	2282	4.5
20060	158	2313	4
20061	158	2366	4
20062	158	2520	4.5
20063	158	2587	3.5
20064	158	2616	4
20065	158	2668	4.5
20066	158	2684	4.5
20067	158	2837	4
20068	158	2869	4
20069	158	2906	3.5
20070	158	3000	4.5
20071	158	3163	3.5
20072	158	3323	4
20073	158	3345	4
20074	158	3380	4.5
20075	158	3683	4
20076	158	3738	4
20077	158	3886	4.5
20078	158	3888	4
20079	158	3900	4
20080	158	4109	3.5
20081	158	4127	3.5
20082	158	4135	4
20083	158	4154	4
20084	158	4173	4
20085	158	4257	4
20086	158	4365	4.5
20087	158	4436	3.5
20088	158	4458	4.5
20089	158	4491	5
20090	158	4504	3.5
20091	158	4587	3.5
20092	158	4596	4
20093	158	4681	4.5
20094	158	4705	4
20095	158	4801	3.5
20096	158	4803	3.5
20097	158	4935	3.5
20098	158	4954	4.5
20099	158	5005	4
20100	158	5167	3.5
20101	158	5201	4.5
20102	158	5207	4.5
20103	158	5329	3.5
20104	158	5337	4
20105	158	5365	4
20106	158	5370	4
20107	158	5377	4.5
20108	158	5562	3.5
20109	158	5726	3.5
20110	158	5733	4
20111	158	5743	4.5
20112	158	5793	3.5
20113	158	5802	4
20114	158	5883	4
20115	158	5891	4
20116	158	5899	3.5
20117	158	6200	4.5
20118	158	6311	3
20119	158	6370	3.5
20120	158	6400	3.5
20121	158	6413	4
20122	158	6491	3.5
20123	158	6563	3
20124	158	6606	4
20125	158	6616	4
20126	158	6620	3.5
20127	158	6635	4
20128	158	6642	4
20129	158	6663	4
20130	158	6679	4.5
20131	158	6727	4.5
20132	158	6735	3.5
20133	158	6888	3.5
20134	158	6946	4
20135	158	6950	3.5
20136	158	7005	4
20137	158	7006	4.5
20138	158	7036	3.5
20139	158	7071	3.5
20140	158	7089	4.5
20141	158	7095	3.5
20142	158	7161	4.5
20143	158	7180	4.5
20144	158	7200	3.5
20145	158	7203	2.5
20146	158	7219	4.5
20147	158	7271	4.5
20148	158	7292	4
20149	158	7297	3.5
20150	158	7307	3
20151	158	7323	4.5
20152	158	7346	3.5
20153	158	7385	3.5
20154	158	7406	4
20155	158	7421	4
20156	158	7423	4.5
20157	158	7439	4.5
20158	158	7454	4
20159	158	7471	3.5
20160	158	7472	4
20161	158	7535	3
20162	158	7538	4.5
20163	158	7542	4
20164	158	7565	3.5
20165	158	7587	4
20166	158	7607	3
20167	158	7615	3.5
20168	158	7620	4
20169	158	7636	3.5
20170	158	7670	4.5
20171	158	7715	4.5
20172	158	7742	4
20173	158	7758	4
20174	158	7761	4
20175	158	7762	3.5
20176	158	7765	3
20177	158	7805	4
20178	158	7827	3
20179	158	7870	3.5
20180	158	7885	3.5
20181	158	7910	3.5
20182	158	7914	3.5
20183	158	7915	3.5
20184	158	7952	4
20185	158	7953	4
20186	158	7956	4
20187	158	7959	3.5
20188	158	7961	4
20189	158	7993	3.5
20190	158	8093	3.5
20191	158	8121	4
20192	158	8130	1.5
20193	158	8148	3.5
20194	158	8284	4.5
20195	158	8351	3.5
20196	158	8354	3.5
20197	158	8383	2.5
20198	159	1	3.5
20199	159	19	1
20200	159	45	3.5
20201	159	231	4
20202	159	328	4.5
20203	159	568	1.5
20204	159	734	4.5
20205	159	878	4.5
20206	159	887	4
20207	159	923	4.5
20208	159	959	4
20209	159	961	3.5
20210	159	963	3
20211	159	972	4.5
20212	159	987	3.5
20213	159	1051	4
20214	159	1226	2.5
20215	159	1233	3
20216	159	1361	4.5
20217	159	1494	2.5
20218	159	1528	4.5
20219	159	2057	4.5
20220	159	2144	1.5
20221	159	2167	1
20222	159	2210	4
20223	159	2366	4.5
20224	159	2389	2
20225	159	2520	3.5
20226	159	3000	3
20227	159	3150	4
20228	159	3380	3.5
20229	159	3886	4.5
20230	159	4279	4.5
20231	159	4315	1
20232	159	4458	4.5
20233	159	4701	1
20234	159	4968	4
20235	159	5005	4
20236	159	5167	4
20237	159	5207	4.5
20238	159	5365	4
20239	159	5618	3
20240	159	5726	3.5
20241	159	5883	3
20242	159	6413	4.5
20243	159	6415	3.5
20244	159	6485	4.5
20245	159	6503	3.5
20246	159	6632	2.5
20247	159	6642	3.5
20248	159	6667	4.5
20249	159	6697	0.5
20250	160	2	4
20251	160	4	4
20252	160	6	4
20253	160	10	4
20254	160	11	4
20255	160	15	4
20256	160	17	4
20257	160	18	3
20258	160	20	3
20259	160	21	3
20260	160	25	5
20261	160	27	4
20262	160	28	4
20263	160	30	3
20264	160	31	5
20265	160	32	4
20266	160	34	3
20267	160	35	3
20268	160	36	3
20269	160	38	4
20270	160	39	4
20271	160	41	3
20272	160	42	2
20273	160	43	4
20274	160	44	5
20275	160	45	4
20276	160	46	5
20277	160	47	4
20278	160	48	5
20279	160	52	4
20280	160	53	4
20281	160	54	5
20282	160	58	5
20283	160	65	4
20284	160	69	4
20285	160	72	4
20286	160	73	3
20287	160	74	4
20288	160	75	4
20289	160	76	4
20290	160	77	5
20291	160	78	3
20292	160	79	4
20293	160	80	4
20294	160	84	4
20295	160	85	3
20296	160	86	4
20297	160	88	2
20298	160	91	4
20299	160	96	4
20300	160	99	5
20301	160	100	5
20302	160	102	4
20303	160	103	5
20304	160	107	4
20305	160	110	3
20306	160	115	4
20307	160	116	3
20308	160	120	4
20309	160	123	3
20310	160	125	4
20311	160	126	4
20312	160	127	5
20313	160	128	4
20314	160	130	4
20315	160	131	5
20316	160	132	3
20317	160	136	5
20318	160	137	4
20319	160	138	5
20320	160	140	5
20321	160	141	4
20322	160	142	4
20323	160	143	4
20324	160	144	4
20325	160	145	2
20326	160	146	4
20327	160	148	4
20328	160	149	3
20329	160	153	4
20330	160	158	4
20331	160	161	3
20332	160	166	3
20333	160	167	1
20334	160	168	5
20335	160	170	3
20336	160	171	4
20337	160	173	3
20338	160	180	3
20339	160	181	4
20340	160	186	5
20341	160	187	5
20342	160	188	4
20343	160	190	3
20344	160	194	4
20345	160	196	5
20346	160	199	4
20347	160	201	3
20348	160	202	4
20349	160	204	5
20350	160	205	5
20351	160	207	4
20352	160	208	4
20353	160	209	4
20354	160	214	4
20355	160	218	4
20356	160	220	4
20357	160	223	4
20358	160	224	4
20359	160	225	3
20360	160	231	5
20361	160	232	4
20362	160	233	4
20363	160	235	5
20364	160	236	5
20365	160	238	3
20366	160	239	4
20367	160	241	4
20368	160	242	4
20369	160	243	4
20370	160	247	4
20371	160	249	4
20372	160	250	4
20373	160	251	4
20374	160	252	4
20375	160	254	3
20376	160	255	4
20377	160	256	5
20378	160	257	2
20379	160	258	4
20380	160	259	5
20381	160	260	4
20382	160	261	3
20383	160	263	3
20384	160	264	4
20385	160	265	5
20386	160	266	5
20387	160	267	4
20388	160	270	4
20389	160	271	4
20390	160	272	5
20391	160	273	3
20392	160	276	5
20393	160	277	4
20394	160	278	4
20395	160	280	5
20396	160	281	4
20397	160	287	4
20398	160	288	4
20399	160	289	3
20400	160	290	4
20401	160	291	4
20402	160	293	3
20403	160	298	5
20404	160	300	4
20405	160	302	5
20406	160	303	4
20407	160	307	4
20408	160	308	4
20409	160	310	5
20410	160	311	4
20411	160	312	4
20412	160	314	4
20413	160	315	4
20414	160	317	5
20415	160	318	4
20416	160	319	4
20417	160	321	4
20418	160	322	4
20419	160	324	4
20420	160	325	3
20421	160	326	3
20422	160	327	5
20423	160	328	4
20424	160	329	4
20425	160	331	3
20426	160	332	3
20427	160	333	5
20428	160	336	3
20429	160	337	4
20430	160	339	3
20431	160	340	4
20432	160	342	4
20433	160	343	4
20434	160	346	4
20435	160	347	3
20436	160	349	4
20437	160	356	2
20438	160	357	4
20439	160	361	4
20440	160	365	4
20441	160	366	5
20442	160	369	3
20443	160	374	4
20444	160	377	4
20445	160	383	4
20446	160	385	3
20447	160	388	3
20448	160	389	4
20449	160	391	4
20450	160	395	5
20451	160	397	5
20452	160	399	4
20453	160	403	3
20454	160	404	2
20455	160	406	4
20456	160	407	3
20457	160	412	4
20458	160	413	5
20459	160	416	4
20460	160	417	3
20461	160	422	4
20462	160	423	5
20463	160	427	5
20464	160	431	3
20465	160	436	3
20466	160	437	4
20467	160	440	4
20468	160	441	3
20469	160	442	4
20470	160	443	4
20471	160	448	3
20472	160	449	4
20473	160	451	4
20474	160	453	4
20475	160	454	5
20476	160	457	3
20477	160	460	4
20478	160	461	4
20479	160	462	4
20480	160	464	3
20481	160	467	4
20482	160	468	5
20483	160	469	4
20484	160	470	3
20485	160	472	5
20486	160	474	5
20487	160	477	3
20488	160	478	4
20489	160	479	3
20490	160	481	3
20491	160	483	5
20492	160	484	3
20493	160	485	5
20494	160	487	4
20495	160	488	3
20496	160	491	3
20497	160	492	4
20498	160	496	4
20499	160	497	4
20500	160	499	4
20501	160	502	3
20502	160	503	5
20503	160	504	4
20504	160	508	5
20505	160	513	5
20506	160	516	4
20507	160	521	4
20508	160	522	4
20509	160	523	5
20510	160	524	5
20511	160	525	3
20512	160	526	5
20513	160	527	5
20514	160	530	4
20515	160	531	5
20516	160	533	4
20517	160	536	3
20518	160	537	3
20519	160	538	5
20520	160	541	3
20521	160	543	4
20522	160	545	4
20523	160	553	4
20524	160	556	5
20525	160	559	5
20526	160	563	4
20527	160	564	5
20528	160	565	3
20529	160	567	2
20530	160	568	4
20531	160	571	3
20532	160	573	4
20533	160	582	3
20534	160	583	5
20535	160	584	3
20536	160	588	3
20537	160	590	4
20538	160	592	3
20539	160	594	4
20540	160	601	3
20541	160	602	4
20542	160	608	4
20543	160	614	4
20544	160	620	4
20545	160	622	3
20546	160	625	4
20547	160	631	5
20548	160	634	4
20549	160	637	4
20550	160	640	3
20551	160	642	4
20552	160	643	4
20553	160	646	4
20554	160	647	3
20555	160	648	2
20556	160	649	3
20557	160	650	2
20558	160	653	4
20559	160	654	4
20560	160	655	4
20561	160	657	5
20562	160	659	5
20563	160	661	4
20564	160	662	4
20565	160	666	3
20566	160	674	5
20567	160	677	4
20568	160	681	4
20569	160	683	4
20570	160	684	3
20571	160	687	3
20572	160	688	4
20573	160	690	5
20574	160	691	4
20575	160	692	2
20576	160	693	3
20577	160	694	5
20578	160	696	5
20579	160	707	4
20580	160	708	3
20581	160	710	2
20582	160	714	3
20583	160	717	4
20584	160	719	4
20585	160	721	4
20586	160	722	3
20587	160	724	3
20588	160	725	5
20589	160	726	5
20590	160	730	4
20591	160	731	5
20592	160	733	4
20593	160	734	5
20594	160	735	4
20595	160	736	5
20596	160	737	4
20597	160	740	4
20598	160	741	5
20599	160	742	5
20600	160	744	4
20601	160	745	4
20602	160	746	5
20603	160	749	4
20604	160	752	4
20605	160	753	4
20606	160	759	4
20607	160	761	5
20608	160	764	4
20609	160	765	5
20610	160	766	4
20611	160	769	5
20612	160	770	5
20613	160	773	4
20614	160	774	5
20615	160	775	4
20616	160	782	5
20617	160	788	5
20618	160	789	5
20619	160	791	4
20620	160	792	3
20621	160	793	4
20622	160	795	5
20623	160	796	3
20624	160	800	4
20625	160	802	3
20626	160	803	3
20627	160	804	4
20628	160	806	3
20629	160	807	4
20630	160	808	3
20631	160	809	4
20632	160	813	4
20633	160	815	3
20634	160	821	3
20635	160	822	4
20636	160	826	4
20637	160	828	4
20638	160	831	4
20639	160	835	4
20640	160	836	4
20641	160	837	4
20642	160	840	4
20643	160	843	5
20644	160	844	5
20645	160	845	4
20646	160	847	4
20647	160	848	5
20648	160	850	3
20649	160	851	3
20650	160	853	4
20651	160	854	4
20652	160	859	4
20653	160	860	4
20654	160	873	4
20655	160	879	4
20656	160	880	4
20657	160	882	4
20658	160	883	5
20659	160	886	5
20660	160	887	5
20661	160	888	5
20662	160	890	4
20663	160	891	2
20664	160	892	5
20665	160	893	5
20666	160	894	5
20667	160	895	4
20668	160	896	4
20669	160	898	4
20670	160	899	4
20671	160	900	4
20672	160	901	2
20673	160	909	2
20674	160	910	4
20675	160	912	4
20676	160	916	4
20677	160	917	4
20678	160	919	5
20679	160	920	5
20680	160	927	5
20681	160	932	5
20682	160	939	5
20683	160	941	4
20684	160	942	4
20685	160	944	5
20686	160	947	4
20687	160	948	5
20688	160	949	5
20689	160	950	4
20690	160	951	4
20691	160	952	4
20692	160	957	5
20693	160	959	5
20694	160	960	5
20695	160	961	5
20696	160	962	2
20697	160	963	5
20698	160	964	4
20699	160	966	4
20700	160	967	5
20701	160	968	5
20702	160	969	5
20703	160	970	3
20704	160	971	3
20705	160	972	5
20706	160	975	4
20707	160	976	5
20708	160	977	3
20709	160	979	5
20710	160	981	5
20711	160	982	4
20712	160	983	5
20713	160	984	4
20714	160	986	4
20715	160	987	5
20716	160	988	5
20717	160	989	4
20718	160	991	5
20719	160	992	5
20720	160	994	5
20721	160	998	5
20722	160	1000	5
20723	160	1002	5
20724	160	1004	5
20725	160	1005	4
20726	160	1006	5
20727	160	1007	5
20728	160	1009	5
20729	160	1010	5
20730	160	1012	4
20731	160	1013	4
20732	160	1014	5
20733	160	1018	5
20734	160	1019	4
20735	160	1020	4
20736	160	1022	5
20737	160	1023	4
20738	160	1024	4
20739	160	1025	4
20740	160	1026	5
20741	160	1028	5
20742	160	1029	5
20743	160	1030	4
20744	160	1031	5
20745	160	1032	5
20746	160	1035	3
20747	160	1036	5
20748	160	1037	4
20749	160	1040	5
20750	160	1042	5
20751	160	1043	5
20752	160	1046	5
20753	160	1047	5
20754	160	1048	4
20755	160	1049	2
20756	160	1050	4
20757	160	1051	5
20758	160	1053	4
20759	160	1054	5
20760	160	1055	5
20761	160	1057	3
20762	160	1058	5
20763	160	1059	4
20764	160	1060	5
20765	160	1061	5
20766	160	1062	5
20767	160	1063	3
20768	160	1066	5
20769	160	1071	4
20770	160	1083	5
20771	160	1084	3
20772	160	1087	5
20773	160	1089	4
20774	160	1090	4
20775	160	1092	5
20776	160	1093	4
20777	160	1097	3
20778	160	1099	4
20779	160	1101	4
20780	160	1103	4
20781	160	1104	5
20782	160	1105	5
20783	160	1108	3
20784	160	1109	4
20785	160	1110	4
20786	160	1112	4
20787	160	1113	3
20788	160	1114	4
20789	160	1115	3
20790	160	1118	4
20791	160	1119	4
20792	160	1120	4
20793	160	1125	3
20794	160	1127	5
20795	160	1131	3
20796	160	1132	3
20797	160	1133	5
20798	160	1135	3
20799	160	1139	5
20800	160	1140	5
20801	160	1141	4
20802	160	1144	4
20803	160	1145	5
20804	160	1146	4
20805	160	1147	3
20806	160	1148	4
20807	160	1150	3
20808	160	1153	1
20809	160	1154	4
20810	160	1157	4
20811	160	1162	4
20812	160	1164	2
20813	160	1165	3
20814	160	1166	4
20815	160	1167	4
20816	160	1171	4
20817	160	1176	4
20818	160	1177	4
20819	160	1181	4
20820	160	1183	4
20821	160	1188	4
20822	160	1189	5
20823	160	1195	2
20824	160	1198	3
20825	160	1199	4
20826	160	1205	4
20827	160	1206	4
20828	160	1211	4
20829	160	1213	5
20830	160	1214	3
20831	160	1220	4
20832	160	1223	4
20833	160	1224	3
20834	160	1233	4
20835	160	1241	4
20836	160	1242	5
20837	160	1244	4
20838	160	1248	4
20839	160	1250	4
20840	160	1251	4
20841	160	1253	4
20842	160	1254	3
20843	160	1257	4
20844	160	1260	4
20845	160	1261	3
20846	160	1263	4
20847	160	1265	3
20848	160	1267	3
20849	160	1268	5
20850	160	1270	5
20851	160	1271	4
20852	160	1272	3
20853	160	1274	5
20854	160	1276	2
20855	160	1278	3
20856	160	1281	3
20857	160	1284	4
20858	160	1288	5
20859	160	1290	5
20860	160	1294	4
20861	160	1295	4
20862	160	1296	4
20863	160	1297	4
20864	160	1298	4
20865	160	1299	4
20866	160	1301	4
20867	160	1302	3
20868	160	1303	4
20869	160	1304	3
20870	160	1308	4
20871	160	1309	4
20872	160	1310	5
20873	160	1313	4
20874	160	1314	4
20875	160	1315	4
20876	160	1318	4
20877	160	1322	5
20878	160	1326	4
20879	160	1328	5
20880	160	1334	2
20881	160	1336	4
20882	160	1337	4
20883	160	1338	4
20884	160	1340	4
20885	160	1341	5
20886	160	1343	1
20887	160	1344	4
20888	160	1345	4
20889	160	1346	4
20890	160	1347	3
20891	160	1348	4
20892	160	1351	3
20893	160	1353	4
20894	160	1355	4
20895	160	1361	4
20896	160	1363	3
20897	160	1366	4
20898	160	1367	5
20899	160	1368	5
20900	160	1369	4
20901	160	1370	5
20902	160	1381	4
20903	160	1382	3
20904	160	1386	4
20905	160	1392	2
20906	160	1394	4
20907	160	1399	5
20908	160	1400	3
20909	160	1402	5
20910	160	1406	4
20911	160	1412	3
20912	160	1414	5
20913	160	1426	3
20914	160	1430	4
20915	160	1431	5
20916	160	1433	2
20917	160	1446	2
20918	160	1456	4
20919	160	1462	4
20920	160	1468	3
20921	160	1471	4
20922	160	1481	4
20923	160	1482	3
20924	160	1485	5
20925	160	1486	3
20926	160	1489	3
20927	160	1494	4
20928	160	1496	5
20929	160	1497	5
20930	160	1499	4
20931	160	1500	3
20932	160	1502	5
20933	160	1503	4
20934	160	1506	4
20935	160	1507	5
20936	160	1509	4
20937	160	1510	2
20938	160	1511	5
20939	160	1512	5
20940	160	1513	4
20941	160	1514	5
20942	160	1516	4
20943	160	1517	4
20944	160	1518	5
20945	160	1519	5
20946	160	1520	4
20947	160	1521	4
20948	160	1522	4
20949	160	1523	4
20950	160	1524	5
20951	160	1525	4
20952	160	1526	5
20953	160	1527	5
20954	160	1529	4
20955	160	1531	3
20956	160	1532	4
20957	160	1535	4
20958	160	1558	4
20959	160	1561	5
20960	160	1564	5
20961	160	1565	5
20962	160	1566	5
20963	160	1567	3
20964	160	1570	5
20965	160	1572	5
20966	160	1573	5
20967	160	1574	4
20968	160	1575	4
20969	160	1576	3
20970	160	1578	4
20971	160	1582	5
20972	160	1583	4
20973	160	1584	5
20974	160	1586	2
20975	160	1587	3
20976	160	1591	5
20977	160	1605	5
20978	160	1607	4
20979	160	1615	3
20980	160	1627	5
20981	160	1628	4
20982	160	1630	5
20983	160	1634	4
20984	160	1635	4
20985	160	1636	4
20986	160	1640	4
20987	160	1641	4
20988	160	1648	3
20989	160	1654	4
20990	160	1657	4
20991	160	1659	4
20992	160	1660	4
20993	160	1661	3
20994	160	1665	5
20995	160	1666	5
20996	160	1668	4
20997	160	1672	4
20998	160	1674	4
20999	160	1675	4
21000	160	1676	2
21001	160	1677	4
21002	160	1680	4
21003	160	1682	3
21004	160	1687	4
21005	160	1689	5
21006	160	1690	4
21007	160	1697	4
21008	160	1700	4
21009	160	1702	5
21010	160	1703	4
21011	160	1716	4
21012	160	1748	4
21013	160	1749	4
21014	160	2051	2
21015	160	3464	4
21016	160	3865	4
21017	160	3934	4
21018	161	2	2
21019	161	6	3.5
21020	161	10	4
21021	161	32	4
21022	161	42	1.5
21023	161	45	5
21024	161	48	4.5
21025	161	88	4
21026	161	99	4.5
21027	161	140	4
21028	161	170	3.5
21029	161	181	3.5
21030	161	231	4
21031	161	258	2
21032	161	259	3
21033	161	261	3
21034	161	278	4
21035	161	280	5
21036	161	290	3.5
21037	161	305	1
21038	161	317	4
21039	161	318	4
21040	161	327	4
21041	161	330	4
21042	161	337	3.5
21043	161	383	2.5
21044	161	391	3
21045	161	403	4
21046	161	406	3.5
21047	161	422	3.5
21048	161	427	2
21049	161	453	1
21050	161	472	2
21051	161	483	3
21052	161	521	3
21053	161	523	3
21054	161	526	4
21055	161	565	4
21056	161	568	3
21057	161	620	3.5
21058	161	622	2
21059	161	647	3
21060	161	653	3
21061	161	654	1
21062	161	659	4
21063	161	774	2
21064	161	895	3
21065	161	898	3.5
21066	161	959	4
21067	161	961	5
21068	161	963	3
21069	161	972	3
21070	161	976	3
21071	161	983	4
21072	161	1000	4
21073	161	1025	4
21074	161	1027	4
21075	161	1030	4.5
21076	161	1051	5
21077	161	1103	3.5
21078	161	1116	4
21079	161	1131	1
21080	161	1144	0.5
21081	161	1226	3
21082	161	1233	4
21083	161	1244	1
21084	161	1260	4
21085	161	1261	2.5
21086	161	1278	2.5
21087	161	1290	3
21088	161	1296	1.5
21089	161	1302	4
21090	161	1322	4
21091	161	1340	2
21092	161	1361	5
21093	161	1368	2.5
21094	161	1402	5
21095	161	1485	3
21096	161	1489	3
21097	161	1528	4.5
21098	161	1574	4
21099	161	1575	4
21100	161	1591	4.5
21101	161	1615	1.5
21102	161	1675	4
21103	161	1796	5
21104	161	1844	4
21105	161	1852	1
21106	161	1865	4.5
21107	161	2057	5
21108	161	2091	3
21109	161	2099	3.5
21110	161	2108	3
21111	161	2144	3.5
21112	161	2167	0.5
21113	161	2172	1
21114	161	2210	4
21115	161	2245	4
21116	161	2282	4
21117	161	2330	3.5
21118	161	2366	4.5
21119	161	2387	1
21120	161	2520	4.5
21121	161	2837	5
21122	161	2869	3.5
21123	161	3000	3.5
21124	161	3108	4
21125	161	3132	2.5
21126	161	3149	4
21127	161	3150	4
21128	161	3323	3.5
21129	161	3380	4
21130	161	3818	3
21131	161	3822	5
21132	161	3860	4.5
21133	161	3886	5
21134	161	3900	3
21135	161	4127	4
21136	161	4154	5
21137	161	4173	4
21138	161	4257	3
21139	161	4286	4
21140	161	4386	3.5
21141	161	4458	5
21142	161	4485	4.5
21143	161	4673	2
21144	161	4681	3.5
21145	161	4697	4.5
21146	161	4702	3.5
21147	161	4705	4.5
21148	161	4706	5
21149	161	4803	3.5
21150	161	4909	3.5
21151	161	5003	4
21152	161	5005	3
21153	161	5207	5
21154	161	5216	4
21155	161	5323	4
21156	161	5365	3
21157	161	5370	4
21158	161	5618	4.5
21159	161	5726	3.5
21160	161	5743	5
21161	161	5793	4
21162	161	5883	5
21163	161	5891	4
21164	161	6200	5
21165	161	6606	4
21166	161	6642	5
21167	161	6679	4.5
21168	161	6691	4
21169	161	6827	4
21170	161	6946	4.5
21171	161	7018	4
21172	161	7036	3
21173	161	7112	3.5
21174	161	7157	2.5
21175	161	7161	5
21176	161	7180	5
21177	161	7200	4.5
21178	161	7219	4.5
21179	161	7273	3.5
21180	161	7301	3.5
21181	161	7323	4.5
21182	161	7347	3
21183	161	7424	3
21184	161	7439	5
21185	161	7504	4
21186	161	7670	5
21187	161	7715	4
21188	161	7719	3.5
21189	161	7761	5
21190	161	7798	3.5
21191	161	7959	4
21192	161	8055	3
21193	161	8086	3.5
21194	161	8105	2.5
21195	161	8351	4.5
21196	161	8354	5
21197	161	8422	4.5
21198	161	8600	4.5
21199	161	8630	5
21200	161	8746	4.5
21201	161	8770	3
21202	161	8779	3
21203	161	8858	4.5
21204	161	8876	3.5
21205	161	8925	4.5
21206	161	8977	4.5
21207	161	9021	1.5
21208	161	9122	4
21209	161	9156	4.5
21210	161	9181	4
21211	161	9227	5
21212	161	9228	5
21213	161	9230	4.5
21214	161	9234	4
21215	161	9236	4
21216	161	9278	3
21217	161	9418	4
21218	161	9438	4
21219	161	9506	4.5
21220	161	9509	3.5
21221	161	9643	4
21222	161	9687	4.5
21223	161	9704	4.5
21224	161	9736	4
21225	161	9838	4.5
21226	161	9915	4.5
21227	161	9976	4.5
21228	161	9984	4
21229	161	10001	4
21230	161	10043	4
21231	161	10092	5
21232	161	10298	3
21233	162	2	4
21234	162	127	5
21235	162	130	4
21236	162	138	4
21237	162	142	3
21238	162	161	3
21239	162	197	3
21240	162	232	1
21241	162	252	3
21242	162	258	3
21243	162	261	3
21244	162	264	4
21245	162	278	1
21246	162	280	3
21247	162	290	3
21248	162	294	4
21249	162	310	4
21250	162	311	3
21251	162	317	2
21252	162	337	5
21253	162	340	3
21254	162	381	3
21255	162	389	4
21256	162	403	3
21257	162	406	4
21258	162	427	5
21259	162	454	3
21260	162	472	4
21261	162	483	4
21262	162	525	4
21263	162	526	3
21264	163	65	3.5
21265	163	99	4
21266	163	100	3.5
21267	163	231	3.5
21268	163	261	4.5
21269	163	280	4.5
21270	163	317	4
21271	163	380	4.5
21272	163	427	3
21273	163	472	4.5
21274	163	523	3.5
21275	163	565	3.5
21276	163	631	4
21277	163	647	3
21278	163	696	4
21279	163	887	3.5
21280	163	957	4
21281	163	968	3.5
21282	163	970	4
21283	163	983	4
21284	163	984	4
21285	163	994	4
21286	163	1000	4
21287	163	1001	3.5
21288	163	1015	3
21289	163	1018	4
21290	163	1021	3.5
21291	163	1078	1.5
21292	163	1368	3
21293	163	1372	4
21294	163	1463	4
21295	163	1723	4.5
21296	163	1844	4.5
21297	163	2057	4
21298	163	2099	3.5
21299	163	2282	4
21300	163	2366	4.5
21301	163	2735	2
21302	163	3109	5
21303	163	3233	3.5
21304	163	3323	4
21305	163	3347	2.5
21306	163	3438	2
21307	163	3788	4.5
21308	163	3807	4
21309	163	3868	4.5
21310	163	3870	4
21311	163	3886	4.5
21312	163	4049	1
21313	163	4056	4
21314	163	4127	3.5
21315	163	4330	2.5
21316	163	4458	3.5
21317	163	4504	4
21318	163	4779	4.5
21319	163	4850	2.5
21320	163	4920	3
21321	163	5005	4
21322	163	5106	2.5
21323	163	5207	3
21324	163	5328	4.5
21325	163	5329	4
21326	163	5349	3
21327	163	5365	4.5
21328	163	5839	4
21329	163	5875	4
21330	163	5892	3.5
21331	163	5900	3.5
21332	163	6160	3
21333	163	6395	2.5
21334	163	6413	4.5
21335	163	6418	4
21336	163	6462	4
21337	163	6563	4
21338	163	6620	4
21339	163	6768	3.5
21340	163	6783	3
21341	163	6848	3.5
21342	163	6867	3.5
21343	163	6948	4
21344	163	6959	4.5
21345	163	7018	2.5
21346	163	7066	4
21347	163	7086	3
21348	163	7139	4
21349	163	7161	3.5
21350	163	7177	4.5
21351	163	7200	4
21352	163	7240	3.5
21353	163	7307	4
21354	163	7334	4
21355	163	7485	3.5
21356	163	7507	3
21357	163	7517	4.5
21358	163	7572	3
21359	163	7586	4.5
21360	163	7588	4
21361	164	1	4
21362	164	5	3
21363	164	6	5
21364	164	10	4
21365	164	16	4.5
21366	164	18	4
21367	164	22	3.5
21368	164	24	1.5
21369	164	31	3.5
21370	164	32	5
21371	164	34	3
21372	164	37	4
21373	164	45	4.5
21374	164	46	3
21375	164	48	5
21376	164	59	3
21377	164	61	3.5
21378	164	62	2.5
21379	164	65	5
21380	164	88	3.5
21381	164	95	4
21382	164	99	5
21383	164	100	4
21384	164	101	2.5
21385	164	117	4
21386	164	121	4
21387	164	123	4
21388	164	127	3.5
21389	164	130	1
21390	164	135	3
21391	164	140	4.5
21392	164	142	5
21393	164	148	3.5
21394	164	156	4
21395	164	167	1
21396	164	170	2
21397	164	171	4
21398	164	177	3.5
21399	164	181	3
21400	164	189	4
21401	164	195	4
21402	164	203	3
21403	164	224	5
21404	164	227	3
21405	164	231	5
21406	164	236	5
21407	164	254	3.5
21408	164	258	3
21409	164	259	5
21410	164	261	4
21411	164	267	4
21412	164	278	4
21413	164	279	3.5
21414	164	280	4
21415	164	288	3.5
21416	164	305	3.5
21417	164	310	4
21418	164	311	4
21419	164	314	4
21420	164	317	5
21421	164	324	3
21422	164	327	3
21423	164	328	4
21424	164	337	4
21425	164	340	3.5
21426	164	360	3
21427	164	372	4
21428	164	380	4
21429	164	381	2.5
21430	164	385	4
21431	164	391	3.5
21432	164	393	3
21433	164	406	4.5
21434	164	414	1
21435	164	422	4
21436	164	423	5
21437	164	427	4
21438	164	431	3
21439	164	446	4
21440	164	459	5
21441	164	474	5
21442	164	485	5
21443	164	488	4
21444	164	495	4
21445	164	496	4
21446	164	497	5
21447	164	499	5
21448	164	523	4.5
21449	164	526	4
21450	164	538	4
21451	164	560	3.5
21452	164	564	4
21453	164	565	3.5
21454	164	572	3.5
21455	164	573	3
21456	164	581	3
21457	164	592	3.5
21458	164	601	4
21459	164	611	3
21460	164	614	3.5
21461	164	620	4
21462	164	622	4
21463	164	623	1
21464	164	639	3
21465	164	645	5
21466	164	647	4
21467	164	649	3
21468	164	652	4
21469	164	653	3.5
21470	164	654	4
21471	164	655	3
21472	164	659	3.5
21473	164	662	3
21474	164	681	3.5
21475	164	687	3
21476	164	691	3.5
21477	164	696	5
21478	164	700	3
21479	164	708	2.5
21480	164	734	4.5
21481	164	807	3.5
21482	164	810	4
21483	164	814	3
21484	164	829	4
21485	164	843	4.5
21486	164	844	5
21487	164	853	4
21488	164	854	4
21489	164	862	4
21490	164	863	4
21491	164	864	4
21492	164	877	4.5
21493	164	887	5
21494	164	888	4.5
21495	164	898	4
21496	164	909	4.5
21497	164	915	4.5
21498	164	917	4
21499	164	923	4.5
21500	164	959	4.5
21501	164	960	4.5
21502	164	961	4.5
21503	164	963	4.5
21504	164	972	4.5
21505	164	975	4
21506	164	976	4.5
21507	164	982	4.5
21508	164	984	4.5
21509	164	987	4.5
21510	164	994	5
21511	164	1000	4.5
21512	164	1002	5
21513	164	1009	4.5
21514	164	1019	4.5
21515	164	1022	5
21516	164	1023	4.5
21517	164	1025	5
21518	164	1030	4.5
21519	164	1034	4.5
21520	164	1035	4.5
21521	164	1051	4.5
21522	164	1061	4.5
21523	164	1099	3.5
21524	164	1103	3
21525	164	1106	2.5
21526	164	1112	5
21527	164	1116	4
21528	164	1120	4.5
21529	164	1125	4
21530	164	1131	4
21531	164	1133	4
21532	164	1136	4.5
21533	164	1144	3
21534	164	1145	4.5
21535	164	1157	4
21536	164	1164	3
21537	164	1185	4
21538	164	1189	4.5
21539	164	1196	4
21540	164	1198	4.5
21541	164	1203	4
21542	164	1214	2
21543	164	1222	2
21544	164	1226	3
21545	164	1233	4
21546	164	1260	4
21547	164	1261	4
21548	164	1265	3
21549	164	1270	4
21550	164	1278	4.5
21551	164	1290	4.5
21552	164	1293	3.5
21553	164	1294	3.5
21554	164	1295	3.5
21555	164	1296	5
21556	164	1298	4
21557	164	1302	5
21558	164	1310	4
21559	164	1314	2
21560	164	1315	4
21561	164	1322	4
21562	164	1330	5
21563	164	1338	5
21564	164	1344	3
21565	164	1348	4
21566	164	1351	3.5
21567	164	1361	5
21568	164	1368	1
21569	164	1369	4.5
21570	164	1372	4.5
21571	164	1375	5
21572	164	1381	4
21573	164	1382	4
21574	164	1385	4
21575	164	1386	4
21576	164	1394	4
21577	164	1400	3
21578	164	1402	4.5
21579	164	1406	4
21580	164	1412	3
21581	164	1414	2
21582	164	1427	2.5
21583	164	1428	3.5
21584	164	1456	3
21585	164	1461	2
21586	164	1462	3
21587	164	1463	5
21588	164	1481	5
21589	164	1489	3.5
21590	164	1490	4.5
21591	164	1491	3
21592	164	1492	4
21593	164	1494	3.5
21594	164	1521	4.5
21595	164	1535	5
21596	164	1564	5
21597	164	1565	5
21598	164	1566	4.5
21599	164	1567	4
21600	164	1569	4
21601	164	1570	3
21602	164	1574	4
21603	164	1591	5
21604	164	1619	4
21605	164	1621	3
21606	164	1632	3.5
21607	164	1669	4.5
21608	164	1675	5
21609	164	1685	4.5
21610	164	1686	4
21611	164	1701	5
21612	164	1702	5
21613	164	1723	4.5
21614	164	1749	5
21615	164	1770	5
21616	164	1771	4
21617	164	1780	4.5
21618	164	1796	4.5
21619	164	1803	4.5
21620	164	1804	3
21621	164	1818	3
21622	164	1822	4
21623	164	1836	4
21624	164	1837	3.5
21625	164	1839	4.5
21626	164	1844	4.5
21627	164	1848	4
21628	164	1849	3.5
21629	164	1852	1
21630	164	1854	2
21631	164	1865	4
21632	164	1867	3.5
21633	164	1883	4
21634	164	1899	4
21635	164	1904	4
21636	164	1906	4
21637	164	1911	5
21638	164	1912	4
21639	164	1913	5
21640	164	1915	4.5
21641	164	1916	4.5
21642	164	1930	4.5
21643	164	1934	3
21644	164	1938	3.5
21645	164	1941	5
21646	164	1956	4
21647	164	1982	5
21648	164	1989	3.5
21649	164	1992	4.5
21650	164	1996	3.5
21651	164	2001	4
21652	164	2002	5
21653	164	2004	3
21654	164	2034	5
21655	164	2046	3.5
21656	164	2057	4
21657	164	2058	4
21658	164	2064	4
21659	164	2081	3.5
21660	164	2091	4
21661	164	2099	4
21662	164	2135	4.5
21663	164	2139	4
21664	164	2144	3
21665	164	2147	3.5
21666	164	2151	4
21667	164	2159	1
21668	164	2160	3
21669	164	2163	4
21670	164	2167	1
21671	164	2170	2
21672	164	2172	4.5
21673	164	2176	2
21674	164	2178	2
21675	164	2179	3
21676	164	2210	4.5
21677	164	2211	5
21678	164	2219	3.5
21679	164	2233	4
21680	164	2237	4.5
21681	164	2247	3
21682	164	2260	4
21683	164	2272	4
21684	164	2282	4
21685	164	2284	4
21686	164	2285	4.5
21687	164	2304	3.5
21688	164	2312	4.5
21689	164	2313	4
21690	164	2328	4
21691	164	2329	4.5
21692	164	2332	4.5
21693	164	2336	5
21694	164	2355	5
21695	164	2358	4.5
21696	164	2359	4.5
21697	164	2360	5
21698	164	2366	5
21699	164	2391	4.5
21700	164	2392	4.5
21701	164	2393	4.5
21702	164	2395	4.5
21703	164	2430	5
21704	164	2434	3
21705	164	2442	5
21706	164	2443	3
21707	164	2460	5
21708	164	2497	4
21709	164	2520	4.5
21710	164	2541	3
21711	164	2545	4
21712	164	2551	4
21713	164	2568	5
21714	164	2597	4.5
21715	164	2599	4
21716	164	2606	4.5
21717	164	2614	3
21718	164	2616	5
21719	164	2627	4
21720	164	2628	4
21721	164	2629	4
21722	164	2668	4.5
21723	164	2691	3.5
21724	164	2713	4.5
21725	164	2730	4
21726	164	2740	4.5
21727	164	2757	4.5
21728	164	2765	4
21729	164	2768	3
21730	164	2787	5
21731	164	2799	3
21732	164	2800	4.5
21733	164	2822	4.5
21734	164	2823	1
21735	164	2837	5
21736	164	2869	4
21737	164	2876	4.5
21738	164	2877	4.5
21739	164	2878	4.5
21740	164	2885	4
21741	164	2898	5
21742	164	2925	4.5
21743	164	2967	5
21744	164	2991	3.5
21745	164	2998	4.5
21746	164	3000	4
21747	164	3006	3.5
21748	164	3026	3
21749	164	3051	4
21750	164	3087	5
21751	164	3110	4
21752	164	3139	4.5
21753	164	3149	3.5
21754	164	3150	4
21755	164	3155	5
21756	164	3159	4.5
21757	164	3160	4
21758	164	3163	5
21759	164	3165	4
21760	164	3177	4
21761	164	3219	4.5
21762	164	3248	4
21763	164	3265	4
21764	164	3307	4
21765	164	3320	4.5
21766	164	3333	4.5
21767	164	3345	5
21768	164	3375	4
21769	164	3411	5
21770	164	3414	4
21771	164	3424	4
21772	164	3435	4.5
21773	164	3483	4
21774	164	3537	4
21775	164	3545	4
21776	164	3578	3.5
21777	164	3587	4
21778	164	3619	3
21779	164	3628	4.5
21780	164	3651	4
21781	164	3709	4
21782	164	3734	5
21783	164	3738	5
21784	164	3784	3
21785	164	3792	4.5
21786	164	3804	3
21787	164	3807	4
21788	164	3813	4
21789	164	3818	5
21790	164	3822	4.5
21791	164	3860	5
21792	164	3874	4
21793	164	3875	3
21794	164	3886	4
21795	164	3888	4.5
21796	164	3900	4
21797	164	3927	4
21798	164	3934	5
21799	164	3938	5
21800	164	3999	4.5
21801	164	4033	4.5
21802	164	4061	4
21803	164	4068	4.5
21804	164	4096	4
21805	164	4112	5
21806	164	4151	4
21807	164	4154	5
21808	164	4173	4
21809	164	4184	3.5
21810	164	4187	4
21811	164	4217	4
21812	164	4257	4.5
21813	164	4286	4
21814	164	4309	3.5
21815	164	4313	2
21816	164	4383	4.5
21817	164	4386	5
21818	164	4436	5
21819	164	4459	4
21820	164	4461	4.5
21821	164	4485	5
21822	164	4497	4.5
21823	164	4528	5
21824	164	4583	4.5
21825	164	4596	3.5
21826	164	4601	4
21827	164	4641	4
21828	164	4681	4.5
21829	164	4697	3.5
21830	164	4705	4
21831	164	4706	5
21832	164	4710	4
21833	164	4780	2.5
21834	164	4803	5
21835	164	4885	4.5
21836	164	4906	4.5
21837	164	4934	5
21838	164	4935	5
21839	164	4940	4.5
21840	164	4959	4
21841	164	4968	4
21842	164	5003	4.5
21843	164	5005	5
21844	164	5037	3.5
21845	164	5056	4
21846	164	5058	4
21847	164	5068	4.5
21848	164	5088	4
21849	164	5093	4
21850	164	5201	4.5
21851	164	5203	4
21852	164	5207	3
21853	164	5305	3
21854	164	5333	4
21855	164	5337	4.5
21856	164	5344	4
21857	164	5365	5
21858	164	5370	4.5
21859	164	5377	4
21860	164	5391	5
21861	164	5401	4.5
21862	164	5431	3
21863	164	5562	4.5
21864	164	5624	5
21865	164	5627	5
21866	164	5652	4
21867	164	5733	4
21868	164	5743	5
21869	164	5795	4.5
21870	164	5802	4.5
21871	164	5806	4.5
21872	164	5828	5
21873	164	5839	4.5
21874	164	5883	4
21875	164	5891	4.5
21876	164	5899	4
21877	164	6193	4.5
21878	164	6370	4
21879	164	6390	4.5
21880	164	6408	4
21881	164	6488	4
21882	164	6491	4
21883	164	6502	3.5
21884	164	6517	3
21885	164	6521	3.5
21886	164	6563	3.5
21887	164	6593	5
21888	164	6604	3
21889	164	6606	4
21890	164	6620	4
21891	164	6642	4.5
21892	164	6673	4
21893	164	6679	4
21894	164	6691	5
21895	164	6727	4.5
21896	164	6744	5
21897	164	6745	3
21898	164	6763	4
21899	164	6768	5
21900	164	6827	5
21901	164	6828	4.5
21902	164	6848	3
21903	164	6863	4
21904	164	6891	5
21905	164	6896	5
21906	164	6904	5
21907	164	6931	5
21908	164	6933	4
21909	164	6937	4
21910	164	6946	5
21911	164	6949	4
21912	164	6950	5
21913	164	6967	4.5
21914	164	6973	4.5
21915	164	6977	4
21916	164	7019	4
21917	164	7036	5
21918	164	7038	5
21919	164	7053	4
21920	164	7061	5
21921	164	7112	4
21922	164	7158	4.5
21923	164	7161	5
21924	164	7179	4.5
21925	164	7180	4.5
21926	164	7200	5
21927	164	7212	4.5
21928	164	7219	4
21929	164	7248	3
21930	164	7262	3.5
21931	164	7268	4.5
21932	164	7292	5
21933	164	7297	4.5
21934	164	7307	5
21935	164	7323	5
21936	164	7325	3.5
21937	164	7355	4
21938	164	7405	4.5
21939	164	7421	5
21940	164	7424	5
21941	164	7433	3.5
21942	164	7439	4
21943	164	7446	4.5
21944	164	7454	4.5
21945	164	7475	4
21946	164	7481	4
21947	164	7485	4
21948	164	7490	4
21949	164	7491	5
21950	164	7511	4.5
21951	164	7538	4
21952	164	7542	4
21953	164	7551	2
21954	164	7552	4
21955	164	7565	4
21956	164	7573	5
21957	164	7579	4
21958	164	7615	4.5
21959	164	7621	4
21960	164	7650	4
21961	164	7664	3.5
21962	164	7670	4
21963	164	7677	4
21964	164	7692	4
21965	164	7715	4
21966	164	7719	4.5
21967	164	7758	3.5
21968	164	7761	4
21969	164	7798	4.5
21970	164	7801	4
21971	164	7846	4.5
21972	164	7889	4
21973	164	7902	2.5
21974	164	7903	3
21975	164	7938	5
21976	164	7952	4.5
21977	164	7957	4
21978	164	7975	4
21979	164	7995	5
21980	164	8007	4
21981	164	8077	4
21982	164	8086	4.5
21983	164	8089	3
21984	164	8096	4
21985	164	8107	5
21986	164	8121	4.5
21987	164	8148	4.5
21988	164	8168	5
21989	164	8184	4
21990	164	8241	5
21991	164	8263	3.5
21992	164	8264	5
21993	164	8329	4.5
21994	164	8331	4
21995	164	8351	4
21996	164	8354	5
21997	164	8370	4
21998	164	8374	3.5
21999	164	8400	3.5
22000	164	8409	3.5
22001	164	8410	4
22002	164	8421	3
22003	164	8422	3.5
22004	164	8453	3
22005	164	8456	4
22006	164	8474	3
22007	164	8496	4
22008	164	8498	3
22009	164	8510	3
22010	164	8532	4
22011	164	8543	4.5
22012	164	8564	5
22013	164	8575	4
22014	164	8597	3
22015	164	8628	4
22016	164	8630	4
22017	164	8632	4
22018	164	8633	3
22019	164	8639	4
22020	164	8645	3
22021	164	8661	4
22022	164	8662	5
22023	164	8688	3.5
22024	164	8690	3
22025	164	8691	3.5
22026	164	8700	5
22027	164	8702	4
22028	164	8705	4
22029	164	8706	4
22030	164	8725	4
22031	164	8735	3
22032	164	8746	5
22033	164	8757	3
22034	164	8758	4
22035	164	8761	4
22036	164	8771	4
22037	164	8778	5
22038	164	8789	2
22039	164	8796	3
22040	164	8804	4.5
22041	164	8805	3
22042	164	8816	4
22043	164	8826	4
22044	164	8835	3
22045	164	8858	4.5
22046	164	8870	4
22047	164	8878	3.5
22048	164	8879	3
22049	164	8885	4
22050	164	8893	3
22051	164	8895	3
22052	164	8902	4
22053	164	8905	5
22054	164	8918	4
22055	164	8927	3.5
22056	164	8938	1
22057	164	8948	4
22058	164	8953	3
22059	164	8955	3.5
22060	164	8958	4
22061	164	8977	5
22062	164	8990	4
22063	164	9010	4
22064	164	9014	4
22065	164	9021	3
22066	164	9024	3
22067	164	9027	3
22068	164	9029	3
22069	164	9031	3
22070	164	9035	4
22071	164	9036	3.5
22072	164	9049	5
22073	164	9053	4
22074	164	9054	4
22075	164	9061	5
22076	164	9062	3.5
22077	164	9074	3
22078	164	9083	4
22079	164	9087	3
22080	164	9090	4
22081	164	9103	3
22082	164	9108	4
22083	164	9115	4
22084	164	9122	4
22085	164	9132	4
22086	164	9135	4
22087	164	9155	3
22088	164	9165	3
22089	164	9175	3
22090	164	9180	4
22091	164	9191	3
22092	164	9193	4
22093	164	9210	3.5
22094	164	9223	3.5
22095	164	9224	4
22096	164	9227	4.5
22097	164	9228	4
22098	164	9230	5
22099	164	9231	3
22100	164	9234	3.5
22101	164	9236	3.5
22102	164	9247	4
22103	164	9254	5
22104	164	9255	4
22105	164	9256	3.5
22106	164	9264	2.5
22107	164	9266	4
22108	164	9270	3.5
22109	164	9278	4
22110	164	9282	4
22111	164	9287	2
22112	164	9298	3
22113	164	9301	4
22114	164	9304	4
22115	164	9308	2.5
22116	164	9316	3.5
22117	164	9318	2.5
22118	164	9320	3
22119	164	9321	5
22120	164	9323	5
22121	164	9327	3
22122	164	9330	3
22123	164	9333	4
22124	164	9337	4
22125	164	9344	4
22126	164	9354	4
22127	164	9355	2
22128	164	9373	4
22129	164	9383	4
22130	164	9388	2.5
22131	164	9404	4
22132	164	9415	3
22133	164	9423	4
22134	164	9426	4
22135	164	9427	5
22136	164	9429	5
22137	164	9438	4
22138	164	9444	5
22139	164	9448	3.5
22140	164	9451	4
22141	164	9471	4.5
22142	164	9474	4
22143	164	9498	4
22144	164	9505	4
22145	164	9506	4.5
22146	164	9510	3
22147	164	9515	3.5
22148	164	9517	3
22149	164	9524	3
22150	164	9525	4
22151	164	9541	3.5
22152	164	9542	4
22153	164	9546	3
22154	164	9547	2.5
22155	164	9555	4
22156	164	9566	5
22157	164	9568	4
22158	164	9579	2
22159	164	9586	3
22160	164	9589	4
22161	164	9594	4
22162	164	9602	3.5
22163	164	9605	3.5
22164	164	9606	4
22165	164	9607	3.5
22166	164	9613	3
22167	164	9621	4
22168	164	9624	3.5
22169	164	9630	1
22170	164	9632	3.5
22171	164	9641	3
22172	164	9646	4
22173	164	9651	2.5
22174	164	9659	4.5
22175	164	9660	3.5
22176	164	9671	4
22177	164	9676	3
22178	164	9679	5
22179	164	9680	4
22180	164	9687	4
22181	164	9697	3
22182	164	9699	2
22183	164	9700	4
22184	164	9703	4
22185	164	9706	3
22186	164	9710	4
22187	164	9712	4.5
22188	164	9716	4
22189	164	9734	4
22190	164	9736	5
22191	164	9738	3.5
22192	164	9743	4
22193	164	9748	4
22194	164	9757	3.5
22195	164	9759	3.5
22196	164	9760	4
22197	164	9764	3
22198	164	9773	3
22199	164	9784	3.5
22200	164	9788	4
22201	164	9791	4
22202	164	9797	3.5
22203	164	9806	4
22204	164	9807	4
22205	164	9812	3
22206	164	9817	4
22207	164	9821	4
22208	164	9822	5
22209	164	9838	4.5
22210	164	9840	4
22211	164	9845	3
22212	164	9848	3
22213	164	9853	3
22214	164	9857	4
22215	164	9861	3
22216	164	9863	5
22217	164	9865	4
22218	164	9903	4.5
22219	164	9923	3
22220	164	9926	3.5
22221	164	9929	4.5
22222	164	9930	3.5
22223	164	9952	3.5
22224	164	9961	5
22225	164	9976	5
22226	164	9984	4
22227	164	9985	4.5
22228	164	10006	5
22229	164	10022	2
22230	164	10028	3
22231	164	10040	3
22232	164	10043	4
22233	164	10056	3.5
22234	164	10057	1
22235	164	10060	4
22236	164	10064	4
22237	164	10066	4
22238	164	10069	5
22239	164	10072	4
22240	164	10077	3.5
22241	164	10078	5
22242	164	10090	5
22243	164	10095	3
22244	164	10138	4.5
22245	164	10148	4
22246	164	10158	3.5
22247	164	10160	3
22248	164	10199	4
22249	164	10200	4.5
22250	164	10211	4
22251	164	10241	4
22252	164	10243	3.5
22253	164	10253	3.5
22254	164	10266	4.5
22255	164	10302	4
22256	165	1	5
22257	165	3	3
22258	165	5	2
22259	165	7	3
22260	165	26	4
22261	165	36	4
22262	165	58	4
22263	165	97	3
22264	165	121	3
22265	165	231	4
22266	165	336	4
22267	165	440	3
22268	165	565	4
22269	165	568	3
22270	165	581	4
22271	165	611	1
22272	165	620	3
22273	165	622	3
22274	165	647	4
22275	165	650	2
22276	165	652	1
22277	165	659	3
22278	165	662	5
22279	165	669	1
22280	165	681	3
22281	165	682	4
22282	165	696	5
22283	165	708	3
22284	165	873	5
22285	165	972	3
22286	165	1111	4
22287	166	1	3.5
22288	166	45	4
22289	166	48	5
22290	166	231	3
22291	166	259	3
22292	166	261	4
22293	166	280	4
22294	166	427	3.5
22295	166	526	4
22296	166	538	4
22297	166	923	4
22298	166	1348	3.5
22299	166	1361	4
22300	166	2057	5
22301	166	2366	4
22302	166	2938	3
22303	166	3132	3
22304	166	3163	4
22305	166	3380	3
22306	166	3422	3
22307	166	3769	3
22308	166	3812	4
22309	166	3822	4
22310	166	3860	5
22311	166	3868	4
22312	166	4154	5
22313	166	4173	3.5
22314	166	4279	4.5
22315	166	4435	4.5
22316	166	4436	2.5
22317	166	4473	5
22318	166	4485	4
22319	166	4697	3.5
22320	166	4706	4
22321	166	4803	3
22322	166	5037	3
22323	166	5329	4.5
22324	166	5337	3.5
22325	166	5743	4.5
22326	166	5802	3.5
22327	166	5839	4
22328	166	5875	4
22329	166	5883	4.5
22330	166	5899	3
22331	166	6390	5
22332	166	6417	4.5
22333	166	6635	3.5
22334	166	6642	4
22335	166	6727	3.5
22336	166	6768	5
22337	166	6946	3
22338	166	6948	3.5
22339	166	6950	5
22340	166	6959	4.5
22341	166	6967	5
22342	166	6973	5
22343	166	7161	4.5
22344	166	7180	4
22345	166	7200	4
22346	166	7273	3
22347	166	7292	4
22348	166	7439	4
22349	166	7446	2.5
22350	166	7565	3.5
22351	166	7573	3.5
22352	166	7621	4.5
22353	166	7670	4
22354	166	7715	4
22355	166	7719	3.5
22356	166	7798	4
22357	166	7892	5
22358	166	7914	3
22359	166	8046	4
22360	166	8086	4.5
22361	166	8090	4.5
22362	166	8184	4
22363	166	8264	3.5
22364	166	8303	4
22365	166	8351	2.5
22366	166	8630	4
22367	166	8703	4
22368	166	9051	4.5
22369	166	9122	3.5
22370	166	9124	5
22371	166	9227	4
22372	166	9228	3.5
22373	166	9236	4
22374	166	9343	4.5
22375	166	9418	4.5
22376	166	9438	4
22377	166	9447	3.5
22378	166	9477	4.5
22379	166	9547	4.5
22380	166	9780	5
22381	166	9822	4.5
22382	166	9847	3
22383	166	9855	5
22384	166	9886	5
22385	166	9909	4.5
22386	166	9915	4
22387	166	9976	4
22388	166	9977	4
22389	166	9986	5
22390	166	9989	4.5
22391	166	10000	4
22392	166	10001	5
22393	166	10069	5
22394	166	10077	5
22395	166	10079	4.5
22396	166	10138	3.5
22397	166	10158	4
22398	166	10160	3.5
22399	166	10161	3
22400	166	10224	4
22401	166	10248	4.5
22402	166	10251	2.5
22403	166	10256	4
22404	166	10277	4
22405	166	10288	5
22406	167	2	3.5
22407	167	13	4.5
22408	167	16	4
22409	167	24	3.5
22410	167	45	4.5
22411	167	149	3.5
22412	167	188	4.5
22413	167	237	3.5
22414	167	259	5
22415	167	280	4.5
22416	167	317	4.5
22417	167	324	4.5
22418	167	523	4
22419	167	528	4
22420	167	1260	4
22421	167	1302	5
22422	167	1315	4.5
22423	167	1340	4
22424	167	1349	4.5
22425	167	1369	4
22426	167	1400	4.5
22427	167	1414	3.5
22428	167	1489	4
22429	167	1591	4
22430	167	1771	4
22431	167	2034	4
22432	167	2057	5
22433	167	2150	4.5
22434	167	2282	3.5
22435	167	2366	4
22436	167	2520	4.5
22437	167	2593	4.5
22438	167	2621	4.5
22439	167	2837	5
22440	167	3772	4.5
22441	167	3899	5
22442	167	4458	4.5
22443	167	4485	4
22444	167	4504	4
22445	167	4673	4
22446	167	4705	4
22447	167	4803	4.5
22448	167	4909	5
22449	167	5207	4.5
22450	167	5269	4
22451	167	5323	4.5
22452	167	5682	4
22453	167	5727	5
22454	167	5896	3.5
22455	167	6488	3.5
22456	167	6563	5
22457	167	6606	5
22458	167	6642	4
22459	167	6727	4.5
22460	167	6843	4
22461	167	6967	4.5
22462	167	7035	3
22463	167	7089	4
22464	167	7161	5
22465	167	7200	5
22466	167	7205	5
22467	167	7219	4.5
22468	167	7248	4
22469	167	7255	4.5
22470	167	7307	4
22471	167	7323	4
22472	167	7347	4.5
22473	167	7384	4
22474	167	7385	4.5
22475	167	7424	4
22476	167	7494	4
22477	167	7545	4.5
22478	167	7547	5
22479	167	7670	5
22480	167	7715	4
22481	167	7719	4.5
22482	167	7816	4.5
22483	167	7885	4.5
22484	167	7914	5
22485	167	7934	3.5
22486	167	7952	4
22487	167	7956	4
22488	167	7959	4
22489	167	7960	4
22490	167	7963	4
22491	167	7985	4
22492	167	8068	4.5
22493	167	8086	4
22494	167	8092	4
22495	167	8152	5
22496	167	8163	4
22497	167	8264	4
22498	167	8329	4.5
22499	167	8351	4
22500	167	8372	3.5
22501	167	8397	5
22502	167	8422	4.5
22503	167	8484	4.5
22504	167	8630	4
22505	167	8642	4
22506	167	8703	4
22507	167	8713	3.5
22508	167	8760	4.5
22509	167	8868	3
22510	167	8872	4
22511	167	8910	4
22512	167	8958	3.5
22513	167	9049	4.5
22514	167	9061	3
22515	167	9143	3
22516	167	9160	4
22517	167	9227	4
22518	167	9235	4
22519	167	9269	5
22520	167	9369	4
22521	167	9386	4
22522	167	9394	3.5
22523	167	9435	3.5
22524	167	9509	4.5
22525	167	9532	5
22526	167	9542	3
22527	167	9547	5
22528	167	9611	4.5
22529	167	9669	3.5
22530	167	9687	4
22531	167	9705	3
22532	167	9770	4.5
22533	167	9801	4.5
22534	167	9813	3.5
22535	167	9822	4
22536	167	9847	3.5
22537	167	9848	3
22538	167	9915	5
22539	167	9954	3.5
22540	167	9960	4
22541	167	9970	4.5
22542	167	9986	4.5
22543	167	10000	4.5
22544	167	10001	4
22545	167	10030	3.5
22546	167	10077	4
22547	167	10078	4.5
22548	167	10090	3.5
22549	167	10094	4.5
22550	167	10114	4
22551	167	10145	4
22552	167	10228	4
22553	167	10248	3.5
22554	167	10289	4.5
22555	167	10295	4
22556	167	10316	4
22557	168	1	4
22558	168	10	3
22559	168	21	3
22560	168	32	1
22561	168	34	4
22562	168	42	3
22563	168	45	4
22564	168	48	4
22565	168	58	3
22566	168	99	4.5
22567	168	121	2.5
22568	168	127	4
22569	168	130	2
22570	168	140	3
22571	168	148	3
22572	168	149	2
22573	168	181	3
22574	168	258	3.5
22575	168	261	4.5
22576	168	278	3.5
22577	168	280	5
22578	168	305	4.5
22579	168	310	4
22580	168	317	5
22581	168	318	3.5
22582	168	324	5
22583	168	327	3.5
22584	168	337	3
22585	168	340	2.5
22586	168	383	3
22587	168	403	3
22588	168	404	3
22589	168	406	3
22590	168	414	4
22591	168	427	4
22592	168	440	2
22593	168	446	3.5
22594	168	483	3.5
22595	168	487	4.5
22596	168	523	3.5
22597	168	525	1.5
22598	168	528	3
22599	168	530	2
22600	168	602	1
22601	168	614	3
22602	168	620	3.5
22603	168	622	2
22604	168	647	4
22605	168	651	4
22606	168	696	4.5
22607	168	849	2
22608	168	939	4.5
22609	168	957	4.5
22610	168	959	5
22611	168	960	3
22612	168	961	3
22613	168	967	3.5
22614	168	1000	2.5
22615	168	1002	4
22616	168	1010	4.5
22617	168	1025	4
22618	168	1030	3.5
22619	168	1031	1
22620	168	1122	3.5
22621	168	1127	4
22622	168	1133	5
22623	168	1144	3
22624	168	1215	1.5
22625	168	1233	3.5
22626	168	1257	3
22627	168	1261	3
22628	168	1265	3.5
22629	168	1337	4.5
22630	168	1361	4
22631	168	1368	4
22632	168	1399	4
22633	168	1400	3.5
22634	168	1402	4
22635	168	1414	3
22636	168	1494	4.5
22637	168	1591	5
22638	168	1638	3.5
22639	168	1641	4
22640	168	1684	4
22641	168	1717	4
22642	168	1796	3
22643	168	1844	4.5
22644	168	1907	4
22645	168	1938	3.5
22646	168	1962	3
22647	168	2002	4
22648	168	2057	3
22649	168	2091	3
22650	168	2099	4
22651	168	2144	3
22652	168	2158	3.5
22653	168	2163	4.5
22654	168	2167	3.5
22655	168	2169	1.5
22656	168	2172	3.5
22657	168	2210	4
22658	168	2233	1.5
22659	168	2282	4
22660	168	2332	4
22661	168	2366	4.5
22662	168	2389	3.5
22663	168	2458	4
22664	168	2483	4.5
22665	168	2541	4.5
22666	168	2598	3
22667	168	2614	2
22668	168	2704	3
22669	168	2837	4.5
22670	168	3000	4
22671	168	3132	2.5
22672	168	3150	3.5
22673	168	3173	4.5
22674	168	3177	4
22675	168	3184	4.5
22676	168	3323	4.5
22677	168	3380	4
22678	168	3424	3
22679	168	3812	2
22680	168	3818	3.5
22681	168	3860	4
22682	168	3874	4.5
22683	168	3886	4.5
22684	168	3966	4
22685	168	4080	4
22686	168	4127	4.5
22687	168	4154	3.5
22688	168	4173	3
22689	168	4217	3.5
22690	168	4313	4
22691	168	4386	2.5
22692	168	4458	4.5
22693	168	4485	3
22694	168	4681	3
22695	168	4705	3.5
22696	168	4706	2
22697	168	4798	2
22698	168	4803	4
22699	168	5005	4
22700	168	5042	5
22701	168	5052	4
22702	168	5202	4
22703	168	5207	5
22704	168	5329	1
22705	168	5365	4
22706	168	5677	4
22707	168	5719	4
22708	168	5795	2.5
22709	168	5875	4.5
22710	168	5883	4
22711	168	5902	3.5
22712	168	6275	3.5
22713	168	6563	4
22714	168	6620	5
22715	168	6642	4
22716	168	6734	3
22717	168	6804	2.5
22718	168	6828	4
22719	168	6847	3
22720	168	6946	4
22721	168	7036	2.5
22722	168	7056	3.5
22723	169	1	3
22724	169	6	4
22725	169	10	3
22726	169	32	4
22727	169	36	3
22728	169	45	4
22729	169	48	4
22730	169	59	1
22731	169	65	2
22732	169	71	2
22733	169	75	3
22734	169	90	3
22735	169	99	4
22736	169	101	3
22737	169	127	3
22738	169	128	3
22739	169	140	5
22740	169	164	3
22741	169	168	4
22742	169	199	3
22743	169	224	4
22744	169	231	5
22745	169	243	2
22746	169	250	3
22747	169	254	5
22748	169	256	3
22749	169	259	4
22750	169	261	5
22751	169	267	2
22752	169	280	4
22753	169	294	2
22754	169	305	3
22755	169	309	1
22756	169	310	3
22757	169	314	4
22758	169	317	5
22759	169	319	3
22760	169	327	3
22761	169	342	3
22762	169	343	3
22763	169	380	3
22764	169	391	3
22765	169	406	3
22766	169	416	3
22767	169	423	3
22768	169	427	3
22769	169	431	1
22770	169	439	3
22771	169	443	3
22772	169	452	4
22773	169	454	4
22774	169	455	3
22775	169	460	3
22776	169	472	3
22777	169	484	1
22778	169	485	3
22779	169	491	1
22780	169	494	3
22781	169	497	3
22782	169	522	3
22783	169	523	3
22784	169	524	3
22785	169	526	4
22786	169	528	3
22787	169	530	3
22788	169	538	4
22789	169	562	3
22790	169	565	3
22791	169	612	3
22792	169	620	3
22793	169	622	2
22794	169	623	2
22795	169	627	3
22796	169	645	5
22797	169	647	3
22798	169	649	3
22799	169	654	2
22800	169	677	3
22801	169	696	3
22802	169	699	3
22803	169	700	5
22804	169	741	3
22805	169	807	3
22806	169	844	2
22807	169	853	4
22808	169	877	3
22809	169	878	5
22810	169	886	2
22811	169	888	4
22812	169	890	3
22813	169	898	3
22814	169	913	3
22815	169	915	4
22816	169	917	2
22817	169	923	5
22818	169	950	3
22819	169	957	4
22820	169	959	4
22821	169	961	3
22822	169	963	2
22823	169	964	2
22824	169	967	3
22825	169	970	3
22826	169	972	4
22827	169	976	3
22828	169	977	3
22829	169	982	3
22830	169	984	3
22831	169	987	4
22832	169	994	3
22833	169	1000	3
22834	169	1001	1
22835	169	1006	4
22836	169	1010	4
22837	169	1015	1
22838	169	1018	2
22839	169	1019	4
22840	169	1021	3
22841	169	1023	3
22842	169	1028	2
22843	169	1030	3
22844	169	1031	4
22845	169	1035	4
22846	169	1051	2
22847	169	1094	2
22848	169	1112	3
22849	169	1127	2
22850	169	3934	3
22851	170	29	4.5
22852	170	31	2.5
22853	170	32	4
22854	170	127	3.5
22855	170	261	5
22856	170	280	4
22857	170	288	4
22858	170	305	4
22859	170	317	4
22860	170	330	4
22861	170	336	3
22862	170	427	3.5
22863	170	472	4.5
22864	170	538	4.5
22865	170	626	2.5
22866	170	647	1.5
22867	170	863	3.5
22868	170	923	4
22869	170	952	4
22870	170	996	4.5
22871	170	1624	3.5
22872	170	1716	5
22873	170	2057	4
22874	170	2064	3
22875	170	2282	4
22876	170	2313	4
22877	170	2541	4.5
22878	170	4473	4
22879	170	5719	3
22880	170	5839	4
22881	170	6959	4.5
22882	170	7157	3
22883	170	7161	4.5
22884	170	7494	4.5
22885	170	7588	3.5
22886	170	7621	2.5
22887	170	7761	3.5
22888	170	8086	2.5
22889	170	8090	4.5
22890	170	8284	4.5
22891	170	8538	4
22892	170	8630	3.5
22893	170	8779	4
22894	170	9369	4
22895	170	9431	3.5
22896	170	9453	3
22897	170	9547	3.5
22898	170	9770	4
22899	170	9855	3.5
22900	170	9915	4
22901	170	9976	4
22902	170	10000	4
22903	170	10108	4.5
22904	170	10158	4
22905	170	10224	4
22906	170	10256	4.5
22907	171	1	5
22908	171	3	5
22909	171	5	5
22910	171	12	3
22911	171	36	3
22912	171	59	5
22913	171	61	4
22914	171	62	5
22915	171	69	3
22916	171	73	3
22917	171	97	4
22918	171	101	3
22919	171	440	3
22920	171	539	5
22921	171	551	5
22922	171	555	5
22923	171	558	3
22924	171	562	3
22925	171	563	5
22926	171	581	4
22927	171	592	4
22928	171	600	5
22929	171	604	3
22930	171	605	3
22931	171	611	1
22932	171	615	5
22933	171	619	4
22934	171	622	5
22935	171	623	4
22936	171	626	4
22937	171	639	3
22938	171	651	3
22939	171	653	4
22940	171	654	5
22941	171	666	4
22942	171	667	4
22943	171	678	4
22944	171	682	1
22945	171	687	1
22946	171	850	4
22947	171	854	5
22948	171	858	5
22949	171	873	5
22950	171	1103	2
22951	171	1108	5
22952	171	1137	3
22953	171	1148	3
22954	172	48	4
22955	172	61	1.5
22956	172	631	3
22957	172	1153	4
22958	172	1196	3
22959	172	1353	4
22960	172	1368	5
22961	172	1685	4
22962	172	2001	3
22963	172	2053	1
22964	172	2126	4
22965	172	2234	0.5
22966	172	2627	0.5
22967	172	2806	4
22968	172	2822	1
22969	172	3003	5
22970	172	3351	5
22971	172	3886	5
22972	172	3902	4
22973	172	3904	4
22974	172	6823	5
22975	173	195	4
22976	173	205	1
22977	173	380	4
22978	173	652	4
22979	173	788	5
22980	173	863	3
22981	173	891	3
22982	173	895	3
22983	173	1127	5
22984	173	1271	5
22985	173	1469	2
22986	173	1576	4
22987	173	1743	2
22988	173	1834	3
22989	173	1850	3
22990	173	1851	3
22991	173	1905	3
22992	173	1906	4
22993	173	1907	5
22994	173	1992	4
22995	173	2080	2
22996	173	2144	3
22997	173	2145	4
22998	173	2147	2
22999	173	2158	3
23000	173	2159	5
23001	173	2160	1
23002	173	2161	3
23003	173	2163	4
23004	173	2167	3
23005	173	2169	5
23006	173	2170	3
23007	173	2172	5
23008	173	2175	2
23009	173	2178	4
23010	173	2210	5
23011	173	2217	3
23012	173	2260	3
23013	173	2261	2
23014	173	2271	2
23015	173	2272	3
23016	173	2282	5
23017	173	2304	2
23018	173	2325	2
23019	173	2389	3
23020	173	2402	2
23021	173	2466	4
23022	173	2531	3
23023	173	2543	4
23024	173	2563	4
23025	174	29	4.5
23026	174	32	4
23027	174	126	4.5
23028	174	186	5
23029	174	270	5
23030	174	272	3.5
23031	174	309	4.5
23032	174	356	1
23033	174	419	4
23034	174	485	5
23035	174	538	4.5
23036	174	612	5
23037	174	631	4.5
23038	174	722	3.5
23039	174	728	4.5
23040	174	730	5
23041	174	734	5
23042	174	735	4
23043	174	746	4.5
23044	174	751	4.5
23045	174	756	4
23046	174	785	4
23047	174	873	4
23048	174	878	4
23049	174	923	4
23050	174	962	5
23051	174	963	5
23052	174	964	4
23053	174	967	3.5
23054	174	968	4.5
23055	174	973	5
23056	174	974	4
23057	174	976	3.5
23058	174	1002	3.5
23059	174	1005	4
23060	174	1009	4
23061	174	1018	5
23062	174	1020	4
23063	174	1030	5
23064	174	1033	5
23065	174	1038	4
23066	174	1039	4
23067	174	1045	4
23068	174	1052	4.5
23069	174	1058	4
23070	174	1064	4.5
23071	174	1071	2.5
23072	174	1134	5
23073	174	1187	4.5
23074	174	1372	3
23075	174	1375	5
23076	174	1435	5
23077	174	1478	4.5
23078	174	1567	2.5
23079	174	1574	2.5
23080	174	1575	2.5
23081	174	1582	4.5
23082	174	1634	4.5
23083	174	1636	4.5
23084	174	1670	5
23085	174	1723	4
23086	174	1759	4.5
23087	174	1780	4
23088	174	1811	4
23089	174	1821	4
23090	174	1906	3.5
23091	174	2034	4
23092	174	2057	4.5
23093	174	2155	4
23094	174	2169	4.5
23095	174	2185	4
23096	174	2188	4.5
23097	174	2246	4
23098	174	2336	3.5
23099	174	2362	4
23100	174	2366	3.5
23101	174	2373	5
23102	174	2398	4
23103	174	2421	4
23104	174	2472	5
23105	174	2491	3
23106	174	2711	4
23107	174	2721	5
23108	174	2727	4
23109	174	2756	4.5
23110	174	2877	1.5
23111	174	2898	4
23112	174	2908	5
23113	174	3000	3
23114	174	3018	5
23115	174	3066	1
23116	174	3163	4.5
23117	174	3177	4.5
23118	174	3184	4.5
23119	174	3219	4
23120	174	3638	1
23121	174	3788	4
23122	174	3810	3
23123	174	3895	4.5
23124	174	3937	4
23125	174	4056	2
23126	174	4073	5
23127	174	4109	3.5
23128	174	4277	4
23129	174	4279	3.5
23130	174	4373	4
23131	174	4397	4
23132	174	4681	4
23133	174	4695	3.5
23134	174	4697	2.5
23135	174	4740	4.5
23136	174	4803	3
23137	174	4856	4
23138	174	4880	4.5
23139	174	4881	4
23140	174	4968	5
23141	174	5037	2
23142	174	5085	1
23143	174	5098	4.5
23144	174	5124	4
23145	174	5378	3.5
23146	174	5726	4.5
23147	174	5749	4.5
23148	174	5839	3
23149	174	5853	4
23150	174	5859	4
23151	174	5900	1.5
23152	174	6006	5
23153	174	6061	4.5
23154	174	6195	4.5
23155	174	6390	3.5
23156	174	6415	3
23157	174	6417	3
23158	174	6650	2.5
23159	174	6923	0.5
23160	174	7019	2
23161	174	7036	2.5
23162	174	7200	3.5
23163	174	7363	1
23164	174	7385	1.5
23165	174	7464	4
23166	174	7542	4.5
23167	174	7686	5
23168	174	7761	4
23169	174	7844	3
23170	174	7913	4.5
23171	174	8055	3
23172	174	8090	4.5
23173	174	8093	3.5
23174	174	8113	1.5
23175	174	8135	2.5
23176	174	8149	4.5
23177	174	8184	4.5
23178	174	8303	3
23179	174	8351	2.5
23180	174	8354	2
23181	174	8421	2.5
23182	174	8485	2.5
23183	174	8522	4
23184	174	8538	4.5
23185	175	11	3
23186	175	29	4
23187	175	32	3
23188	175	231	5
23189	175	305	3
23190	175	360	3
23191	175	381	2
23192	175	485	5
23193	175	522	3
23194	175	523	5
23195	175	526	4
23196	175	746	5
23197	175	753	4
23198	175	789	5
23199	175	828	5
23200	175	840	5
23201	175	895	5
23202	175	915	5
23203	175	959	5
23204	175	960	2
23205	175	962	5
23206	175	963	4
23207	175	966	5
23208	175	968	1
23209	175	972	4
23210	175	976	5
23211	175	987	5
23212	175	1000	5
23213	175	1013	5
23214	175	1030	3
23215	175	1034	3
23216	175	1071	2
23217	175	1072	5
23218	175	1183	3
23219	175	1241	3
23220	175	1288	4
23221	175	1353	4
23222	175	1632	2
23223	175	1636	1
23224	175	1645	3
23225	175	1844	4
23226	175	1868	2
23227	175	1948	4
23228	175	1981	5
23229	175	2057	5
23230	175	2128	3
23231	175	2233	3
23232	175	2260	4
23233	175	2275	4
23234	175	2282	4
23235	175	2376	5
23236	175	2404	5
23237	175	2463	5
23238	175	2525	4
23239	175	2712	4
23240	175	2757	5
23241	175	2805	4
23242	175	2884	3
23243	175	3037	3
23244	175	3073	4
23245	175	3098	4
23246	176	1	4
23247	176	2	3
23248	176	42	5
23249	176	48	5
23250	176	99	5
23251	176	101	4
23252	176	144	3
23253	176	149	3
23254	176	181	3
23255	176	229	1
23256	176	231	3
23257	176	261	5
23258	176	267	3
23259	176	278	3
23260	176	280	5
23261	176	300	4
23262	176	317	4
23263	176	324	3
23264	176	340	4
23265	176	406	4
23266	176	427	4
23267	176	490	1
23268	176	496	4
23269	176	522	4
23270	176	523	4
23271	176	525	4
23272	176	528	3
23273	176	540	2
23274	176	565	3
23275	176	620	4
23276	176	624	3
23277	176	626	3
23278	176	741	3
23279	176	742	2
23280	176	838	2
23281	176	841	3
23282	176	873	2
23283	176	878	3
23284	176	915	4
23285	176	923	5
23286	176	959	4
23287	176	960	5
23288	176	961	5
23289	176	963	4
23290	176	972	4
23291	176	976	4
23292	176	977	5
23293	176	995	4
23294	176	1000	4
23295	176	1034	3
23296	176	1035	4
23297	176	1051	5
23298	176	1113	1
23299	176	1116	4
23300	176	1118	4
23301	176	1119	3
23302	176	1244	3
23303	176	1250	4
23304	176	1340	2
23305	176	1343	2
23306	176	1361	3
23307	176	1481	3
23308	176	1489	4
23309	176	1534	3
23310	176	1569	3
23311	176	1570	3
23312	176	1575	3
23313	176	1582	5
23314	176	1615	3
23315	176	1641	4
23316	176	1645	3
23317	176	1665	2
23318	176	1675	2
23319	176	1676	2
23320	176	1694	2
23321	176	1696	3
23322	176	1717	3
23323	176	1748	4
23324	176	1844	4
23325	176	1867	3
23326	176	1916	4
23327	176	1931	1
23328	176	1976	3
23329	176	2091	4
23330	176	2099	4
23331	176	2159	4
23332	176	2179	4
23333	176	2190	1
23334	176	2230	4
23335	176	2259	2
23336	176	2330	2
23337	176	2332	5
23338	176	2399	4
23339	176	2545	4
23340	176	2963	2
23341	177	1	3.5
23342	177	3	4
23343	177	6	4.5
23344	177	10	3.5
23345	177	11	5
23346	177	16	3.5
23347	177	19	2
23348	177	21	3
23349	177	23	2
23350	177	24	2.5
23351	177	25	3
23352	177	31	2.5
23353	177	32	3
23354	177	36	3.5
23355	177	37	4
23356	177	40	2
23357	177	42	2
23358	177	43	2.5
23359	177	45	4
23360	177	48	5
23361	177	65	2.5
23362	177	82	2.5
23363	177	83	3.5
23364	177	87	3
23365	177	88	2.5
23366	177	95	4
23367	177	99	4
23368	177	101	3.5
23369	177	109	3
23370	177	117	2.5
23371	177	123	3
23372	177	125	3
23373	177	127	3.5
23374	177	128	3.5
23375	177	130	3
23376	177	137	2
23377	177	138	4
23378	177	140	3
23379	177	142	3.5
23380	177	144	3
23381	177	148	2.5
23382	177	149	2.5
23383	177	150	2.5
23384	177	156	4
23385	177	189	4
23386	177	190	3.5
23387	177	195	4
23388	177	200	2.5
23389	177	203	4
23390	177	222	2.5
23391	177	224	4.5
23392	177	231	5
23393	177	236	2.5
23394	177	243	3
23395	177	250	2
23396	177	254	3.5
23397	177	258	3
23398	177	259	4
23399	177	261	4
23400	177	264	3.5
23401	177	267	3.5
23402	177	277	1.5
23403	177	280	5
23404	177	286	1
23405	177	305	4
23406	177	310	5
23407	177	314	3.5
23408	177	317	4.5
23409	177	319	3
23410	177	322	3
23411	177	324	5
23412	177	326	1
23413	177	327	3
23414	177	328	3.5
23415	177	330	2.5
23416	177	332	3.5
23417	177	334	2
23418	177	337	4
23419	177	340	3.5
23420	177	342	2.5
23421	177	347	3
23422	177	362	2.5
23423	177	369	2
23424	177	372	3
23425	177	378	1
23426	177	380	3.5
23427	177	383	2.5
23428	177	384	1.5
23429	177	385	3
23430	177	387	3
23431	177	390	2.5
23432	177	391	2
23433	177	399	2.5
23434	177	403	3.5
23435	177	404	3
23436	177	406	3.5
23437	177	408	2
23438	177	412	2
23439	177	414	2.5
23440	177	419	4
23441	177	422	4
23442	177	423	3.5
23443	177	426	1.5
23444	177	427	3
23445	177	431	3.5
23446	177	440	3
23447	177	446	2.5
23448	177	452	2
23449	177	453	4
23450	177	456	3
23451	177	459	2
23452	177	465	2.5
23453	177	472	5
23454	177	474	3
23455	177	482	2.5
23456	177	485	4
23457	177	497	5
23458	177	499	3.5
23459	177	520	2.5
23460	177	521	3
23461	177	522	3.5
23462	177	523	4
23463	177	525	4.5
23464	177	526	4.5
23465	177	528	4
23466	177	538	3.5
23467	177	540	3.5
23468	177	564	3
23469	177	565	4
23470	177	598	2.5
23471	177	614	2.5
23472	177	615	4
23473	177	620	4.5
23474	177	645	4
23475	177	647	4
23476	177	649	2.5
23477	177	651	3.5
23478	177	652	4
23479	177	653	3
23480	177	656	3
23481	177	659	4
23482	177	662	3
23483	177	677	3.5
23484	177	694	3.5
23485	177	696	5
23486	177	697	2.5
23487	177	700	2.5
23488	177	708	2
23489	177	712	2.5
23490	177	741	2.5
23491	177	745	4
23492	177	755	4
23493	177	804	3
23494	177	807	3.5
23495	177	810	3
23496	177	812	3
23497	177	829	3
23498	177	835	3
23499	177	844	4
23500	177	845	2.5
23501	177	853	4
23502	177	863	4.5
23503	177	864	4
23504	177	873	3.5
23505	177	886	4
23506	177	887	4
23507	177	888	4
23508	177	889	2.5
23509	177	890	4
23510	177	893	3.5
23511	177	895	3
23512	177	897	5
23513	177	898	5
23514	177	909	3.5
23515	177	915	3
23516	177	947	2
23517	177	955	3
23518	177	957	3
23519	177	959	5
23520	177	960	4
23521	177	961	4
23522	177	967	3
23523	177	969	4.5
23524	177	970	2.5
23525	177	972	5
23526	177	975	4
23527	177	983	5
23528	177	984	3.5
23529	177	987	3
23530	177	994	4
23531	177	995	4.5
23532	177	1000	3.5
23533	177	1007	4
23534	177	1019	4
23535	177	1022	4
23536	177	1025	4.5
23537	177	1026	5
23538	177	1028	3
23539	177	1030	4.5
23540	177	1034	2.5
23541	177	1035	3
23542	177	1036	5
23543	177	1048	4.5
23544	177	1051	4.5
23545	177	1056	3
23546	177	1061	4.5
23547	177	1063	4
23548	177	1087	4
23549	177	1089	2.5
23550	177	1094	2.5
23551	177	1112	2.5
23552	177	1119	3
23553	177	1120	2.5
23554	177	1122	3
23555	177	1125	2
23556	177	1133	4
23557	177	1136	3
23558	177	1142	3
23559	177	1144	2.5
23560	177	1148	2
23561	177	1157	2.5
23562	177	1164	2.5
23563	177	1170	3
23564	177	1183	3.5
23565	177	1189	4
23566	177	1196	4
23567	177	1203	3.5
23568	177	1212	2
23569	177	1215	3.5
23570	177	1217	2.5
23571	177	1222	3.5
23572	177	1226	3.5
23573	177	1233	3.5
23574	177	1250	2
23575	177	1254	2
23576	177	1260	3
23577	177	1261	2
23578	177	1265	3
23579	177	1268	4
23580	177	1270	4
23581	177	1278	3.5
23582	177	1290	4.5
23583	177	1296	4
23584	177	1298	3.5
23585	177	1310	2.5
23586	177	1311	4.5
23587	177	1314	2.5
23588	177	1315	3
23589	177	1322	4
23590	177	1330	2.5
23591	177	1337	4
23592	177	1338	4
23593	177	1340	3.5
23594	177	1344	3
23595	177	1348	3
23596	177	1353	4
23597	177	1361	4
23598	177	1363	3
23599	177	1366	2.5
23600	177	1368	1.5
23601	177	1372	2.5
23602	177	1375	3
23603	177	1378	4
23604	177	1381	4
23605	177	1385	2
23606	177	1394	3
23607	177	1399	3.5
23608	177	1401	3
23609	177	1402	4
23610	177	1406	3
23611	177	1435	4
23612	177	1449	1
23613	177	1482	4
23614	177	1489	3.5
23615	177	1490	2.5
23616	177	1494	4.5
23617	177	1520	3
23618	177	1528	4
23619	177	1535	3
23620	177	1561	3.5
23621	177	1563	3.5
23622	177	1564	3.5
23623	177	1565	2.5
23624	177	1566	3
23625	177	1567	3
23626	177	1569	3
23627	177	1570	3
23628	177	1574	4
23629	177	1575	4
23630	177	1583	4
23631	177	1586	4.5
23632	177	1589	2.5
23633	177	1591	4.5
23634	177	1615	2.5
23635	177	1619	3
23636	177	1638	3
23637	177	1642	1.5
23638	177	1654	4
23639	177	1668	3
23640	177	1675	3.5
23641	177	1679	3.5
23642	177	1680	4
23643	177	1681	2.5
23644	177	1682	2.5
23645	177	1684	3
23646	177	1690	2.5
23647	177	1698	2.5
23648	177	1703	2.5
23649	177	1723	1.5
23650	177	1728	4
23651	177	1730	3
23652	177	1749	4.5
23653	177	1750	3
23654	177	1770	4
23655	177	1796	4
23656	177	1803	5
23657	177	1814	3
23658	177	1822	4.5
23659	177	1835	2.5
23660	177	1836	4.5
23661	177	1839	4
23662	177	1844	4
23663	177	1848	4
23664	177	1849	3
23665	177	1865	4
23666	177	1867	3
23667	177	1883	3.5
23668	177	1884	3.5
23669	177	1886	2.5
23670	177	1888	3.5
23671	177	1890	4
23672	177	1891	2
23673	177	1892	2
23674	177	1893	2
23675	177	1894	2
23676	177	1895	1
23677	177	1906	2.5
23678	177	1912	3.5
23679	177	1913	3.5
23680	177	1914	2
23681	177	1915	2.5
23682	177	1916	2.5
23683	177	1921	2.5
23684	177	1923	3.5
23685	177	1930	4
23686	177	1931	3.5
23687	177	1933	4
23688	177	1937	2.5
23689	177	1956	4
23690	177	1959	2
23691	177	1976	2.5
23692	177	1989	3.5
23693	177	1992	4.5
23694	177	1994	4
23695	177	2000	3
23696	177	2002	4.5
23697	177	2004	4
23698	177	2008	3
23699	177	2022	2.5
23700	177	2032	4
23701	177	2033	4
23702	177	2034	3.5
23703	177	2053	3.5
23704	177	2057	4.5
23705	177	2058	4.5
23706	177	2064	3.5
23707	177	2077	2.5
23708	177	2078	2.5
23709	177	2080	3.5
23710	177	2091	3.5
23711	177	2097	2
23712	177	2108	2.5
23713	177	2109	2
23714	177	2136	2.5
23715	177	2144	2
23716	177	2145	4
23717	177	2147	3.5
23718	177	2151	4
23719	177	2153	3
23720	177	2158	2.5
23721	177	2163	4.5
23722	177	2167	2.5
23723	177	2169	4
23724	177	2172	3.5
23725	177	2173	2
23726	177	2191	2.5
23727	177	2210	4.5
23728	177	2211	4
23729	177	2219	2.5
23730	177	2233	3
23731	177	2234	2.5
23732	177	2239	3
23733	177	2240	2
23734	177	2254	3
23735	177	2255	2
23736	177	2256	1
23737	177	2261	2
23738	177	2271	4
23739	177	2282	3.5
23740	177	2294	3
23741	177	2312	2.5
23742	177	2313	3.5
23743	177	2329	3.5
23744	177	2330	4
23745	177	2332	4
23746	177	2355	4
23747	177	2358	4
23748	177	2359	3.5
23749	177	2360	4
23750	177	2366	4
23751	177	2387	3.5
23752	177	2388	2
23753	177	2389	4
23754	177	2391	3.5
23755	177	2392	3
23756	177	2393	3
23757	177	2395	4
23758	177	2398	2
23759	177	2403	2.5
23760	177	2413	2.5
23761	177	2414	2.5
23762	177	2424	3
23763	177	2442	3
23764	177	2443	2.5
23765	177	2466	4
23766	177	2470	3
23767	177	2481	5
23768	177	2490	3
23769	177	2496	3
23770	177	2500	3
23771	177	2508	2
23772	177	2515	4
23773	177	2518	2.5
23774	177	2520	4.5
23775	177	2521	4
23776	177	2530	3.5
23777	177	2540	3.5
23778	177	2541	3.5
23779	177	2545	4
23780	177	2558	3.5
23781	177	2567	2.5
23782	177	2584	2.5
23783	177	2588	2
23784	177	2590	2
23785	177	2593	5
23786	177	2594	3
23787	177	2595	2.5
23788	177	2596	4
23789	177	2597	4.5
23790	177	2600	3
23791	177	2604	2.5
23792	177	2605	3.5
23793	177	2611	2
23794	177	2616	3
23795	177	2627	3.5
23796	177	2638	2
23797	177	2639	3.5
23798	177	2661	2
23799	177	2662	3.5
23800	177	2666	3.5
23801	177	2667	4
23802	177	2684	4.5
23803	177	2705	2
23804	177	2713	3
23805	177	2733	4
23806	177	2736	4.5
23807	177	2742	4
23808	177	2762	3
23809	177	2777	3
23810	177	2790	3.5
23811	177	2798	3.5
23812	177	2799	3.5
23813	177	2800	3.5
23814	177	2805	5
23815	177	2819	2.5
23816	177	2837	4.5
23817	177	2860	3
23818	177	2863	3.5
23819	177	2869	3
23820	177	2874	3.5
23821	177	2876	3.5
23822	177	2877	3
23823	177	2878	3.5
23824	177	2911	3
23825	177	2912	4
23826	177	2921	3
23827	177	2925	2
23828	177	2926	2
23829	177	2927	2.5
23830	177	2928	2.5
23831	177	2938	1
23832	177	2958	3.5
23833	177	2961	2.5
23834	177	2967	3
23835	177	2969	1.5
23836	177	2975	3
23837	177	2976	2.5
23838	177	2990	3.5
23839	177	2998	3
23840	177	3000	4
23841	177	3006	2.5
23842	177	3011	2
23843	177	3012	3.5
23844	177	3025	3.5
23845	177	3026	2.5
23846	177	3031	3
23847	177	3046	2
23848	177	3051	3
23849	177	3052	3
23850	177	3055	3.5
23851	177	3056	3
23852	177	3073	3.5
23853	177	3075	3.5
23854	177	3083	4.5
23855	177	3087	3.5
23856	177	3100	2
23857	177	3106	3.5
23858	177	3108	3
23859	177	3111	4.5
23860	177	3129	1.5
23861	177	3133	3.5
23862	177	3135	2.5
23863	177	3139	3.5
23864	177	3148	3
23865	177	3149	5
23866	177	3150	5
23867	177	3152	2.5
23868	177	3155	2.5
23869	177	3157	3
23870	177	3158	2
23871	177	3159	3.5
23872	177	3166	3.5
23873	177	3170	4
23874	177	3174	2.5
23875	177	3176	3
23876	177	3177	4.5
23877	177	3183	3
23878	177	3184	3
23879	177	3186	4
23880	177	3191	4
23881	177	3196	1.5
23882	177	3197	2.5
23883	177	3218	2.5
23884	177	3219	3
23885	177	3229	2
23886	177	3230	3.5
23887	177	3242	3
23888	177	3248	3
23889	177	3253	2
23890	177	3254	2.5
23891	177	3266	1.5
23892	177	3275	2.5
23893	177	3301	2.5
23894	177	3304	3.5
23895	177	3307	3
23896	177	3308	3
23897	177	3311	2
23898	177	3319	3
23899	177	3320	3.5
23900	177	3323	5
23901	177	3329	3
23902	177	3332	3
23903	177	3333	2.5
23904	177	3337	4
23905	177	3343	1
23906	177	3345	2.5
23907	177	3349	3
23908	177	3351	3
23909	177	3380	3
23910	177	3383	3
23911	177	3385	3
23912	177	3392	4
23913	177	3393	3
23914	177	3406	4
23915	177	3411	3
23916	177	3413	2.5
23917	177	3422	2
23918	177	3424	2
23919	177	3425	3
23920	177	3444	4
23921	177	3445	2.5
23922	177	3446	2
23923	177	3481	3.5
23924	177	3482	3.5
23925	177	3483	4.5
23926	177	3490	2
23927	177	3504	2.5
23928	177	3508	3
23929	177	3510	3
23930	177	3517	2.5
23931	177	3526	2.5
23932	177	3537	2
23933	177	3556	2
23934	177	3573	3
23935	177	3574	2
23936	177	3575	2
23937	177	3576	3
23938	177	3578	3.5
23939	177	3579	2
23940	177	3585	1.5
23941	177	3600	3.5
23942	177	3603	3.5
23943	177	3612	2
23944	177	3614	4
23945	177	3618	2
23946	177	3619	2.5
23947	177	3621	3.5
23948	177	3626	2
23949	177	3631	2
23950	177	3638	2
23951	177	3666	4
23952	177	3696	3
23953	177	3699	3
23954	177	3703	2.5
23955	177	3704	4
23956	177	3709	2
23957	177	3710	2
23958	177	3726	3.5
23959	177	3738	4
23960	177	3769	4.5
23961	177	3772	2
23962	177	3778	3
23963	177	3784	1
23964	177	3788	4.5
23965	177	3797	3
23966	177	3804	2.5
23967	177	3812	3
23968	177	3815	4
23969	177	3822	3.5
23970	177	3842	2.5
23971	177	3860	5
23972	177	3874	4
23973	177	3875	2
23974	177	3886	3.5
23975	177	3888	3.5
23976	177	3900	2
23977	177	3902	4
23978	177	3911	3
23979	177	3927	3
23980	177	3931	4
23981	177	3938	4.5
23982	177	3965	2
23983	177	3966	4
23984	177	3972	2
23985	177	4052	4
23986	177	4062	2
23987	177	4068	2
23988	177	4074	3
23989	177	4089	4
23990	177	4090	2.5
23991	177	4107	2.5
23992	177	4109	4
23993	177	4154	5
23994	177	4166	2.5
23995	177	4167	2
23996	177	4173	3.5
23997	177	4177	2.5
23998	177	4188	4.5
23999	177	4198	2
24000	177	4200	2
24001	177	4213	5
24002	177	4237	3.5
24003	177	4257	3.5
24004	177	4260	2
24005	177	4286	4
24006	177	4302	2.5
24007	177	4314	2.5
24008	177	4330	2
24009	177	4332	3
24010	177	4368	3
24011	177	4386	3
24012	177	4389	3
24013	177	4395	2
24014	177	4404	3
24015	177	4416	1.5
24016	177	4422	3
24017	177	4458	3.5
24018	177	4461	4
24019	177	4463	4
24020	177	4466	2.5
24021	177	4491	2
24022	177	4493	2
24023	177	4501	3
24024	177	4509	3.5
24025	177	4523	4.5
24026	177	4531	3
24027	177	4583	4.5
24028	177	4601	3
24029	177	4642	3.5
24030	177	4660	3.5
24031	177	4672	5
24032	177	4681	4
24033	177	4697	2.5
24034	177	4705	4
24035	177	4706	4.5
24036	177	4779	5
24037	177	4798	2.5
24038	177	4801	4
24039	177	4803	4
24040	177	4807	1
24041	177	4825	2
24042	177	4829	4
24043	177	4832	2.5
24044	177	4838	3.5
24045	177	4878	2.5
24046	177	4882	2.5
24047	177	4906	2
24048	177	4922	3
24049	177	4935	3.5
24050	177	4940	3.5
24051	177	4960	3
24052	177	4963	2.5
24053	177	4975	3.5
24054	177	4979	3
24055	177	4985	3.5
24056	177	4990	2.5
24057	177	5005	5
24058	177	5037	2.5
24059	177	5042	4
24060	177	5043	3.5
24061	177	5046	4
24062	177	5049	3
24063	177	5054	4
24064	177	5060	3.5
24065	177	5064	2.5
24066	177	5067	4
24067	177	5083	2
24068	177	5088	3
24069	177	5090	2.5
24070	177	5091	2.5
24071	177	5093	3.5
24072	177	5100	2
24073	177	5101	2.5
24074	177	5113	2
24075	177	5115	3.5
24076	177	5175	3
24077	177	5176	3.5
24078	177	5201	3.5
24079	177	5207	3.5
24080	177	5216	3.5
24081	177	5230	3
24082	178	10	5
24083	178	45	3
24084	178	99	5
24085	178	127	3
24086	178	138	4
24087	178	142	4
24088	178	161	4
24089	178	181	4
24090	178	197	4
24091	178	203	5
24092	178	258	4
24093	178	261	5
24094	178	278	4
24095	178	290	4
24096	178	300	3
24097	178	310	4
24098	178	324	5
24099	178	327	3
24100	178	337	5
24101	178	340	4
24102	178	360	3
24103	178	383	4
24104	178	403	4
24105	178	406	5
24106	178	427	3
24107	178	446	3
24108	178	523	5
24109	178	524	4
24110	178	526	5
24111	178	528	5
24112	178	653	3
24113	179	1	4
24114	179	17	3.5
24115	179	22	3
24116	179	25	3.5
24117	179	29	3
24118	179	32	3
24119	179	34	3
24120	179	36	4
24121	179	39	4
24122	179	43	3.5
24123	179	45	3
24124	179	48	3
24125	179	58	3.5
24126	179	65	4
24127	179	89	3.5
24128	179	99	3
24129	179	106	3.5
24130	179	121	2
24131	179	128	2.5
24132	179	135	2.5
24133	179	142	2.5
24134	179	168	2.5
24135	179	180	2.5
24136	179	205	3.5
24137	179	207	2.5
24138	179	214	3
24139	179	218	3.5
24140	179	220	4
24141	179	224	3
24142	179	231	2.5
24143	179	232	1
24144	179	234	3
24145	179	242	3.5
24146	179	252	2.5
24147	179	254	3.5
24148	179	259	4.5
24149	179	261	4.5
24150	179	276	3.5
24151	179	280	3
24152	179	285	3.5
24153	179	298	3
24154	179	300	2
24155	179	303	3.5
24156	179	306	3
24157	179	317	2
24158	179	318	3.5
24159	179	320	1
24160	179	321	1.5
24161	179	322	3
24162	179	327	3
24163	179	340	2
24164	179	361	3.5
24165	179	389	3
24166	179	397	3
24167	179	406	2.5
24168	179	416	3.5
24169	179	422	2
24170	179	423	3.5
24171	179	427	2.5
24172	179	443	4
24173	179	446	2
24174	179	447	1
24175	179	453	2.5
24176	179	454	4.5
24177	179	460	4
24178	179	465	3
24179	179	467	3
24180	179	472	2.5
24181	179	474	3
24182	179	475	3
24183	179	482	2
24184	179	495	5
24185	179	521	2
24186	179	522	2.5
24187	179	523	2
24188	179	524	1.5
24189	179	526	2.5
24190	179	527	3
24191	179	528	2
24192	179	530	3.5
24193	179	538	4
24194	179	564	3
24195	179	572	3.5
24196	179	581	2.5
24197	179	599	3.5
24198	179	607	4.5
24199	179	612	2.5
24200	179	627	3
24201	179	631	0.5
24202	179	645	3.5
24203	179	651	2
24204	179	659	2
24205	179	675	2.5
24206	179	683	3
24207	179	720	3
24208	179	721	1.5
24209	179	724	3
24210	179	736	3.5
24211	179	738	2
24212	179	741	3
24213	179	742	4
24214	179	745	3.5
24215	179	746	1.5
24216	179	789	2
24217	179	804	3.5
24218	179	836	3
24219	179	840	3
24220	179	843	2.5
24221	179	844	2.5
24222	179	848	2.5
24223	179	854	2
24224	179	855	2
24225	179	862	4
24226	179	864	2.5
24227	179	873	4
24228	179	877	2.5
24229	179	878	2.5
24230	179	882	2.5
24231	179	886	2.5
24232	179	887	3
24233	179	888	2
24234	179	892	3.5
24235	179	895	2
24236	179	898	2.5
24237	179	909	2.5
24238	179	912	3
24239	179	917	2
24240	179	919	3.5
24241	179	920	3.5
24242	179	923	2.5
24243	179	926	3
24244	179	938	4
24245	179	940	1
24246	179	941	3.5
24247	179	947	1
24248	179	954	2
24249	179	957	4.5
24250	179	960	3
24251	179	961	2
24252	179	963	3
24253	179	968	4
24254	179	972	2.5
24255	179	973	3.5
24256	179	975	2
24257	179	976	3
24258	179	981	4
24259	179	982	3
24260	179	984	1.5
24261	179	985	2.5
24262	179	986	4.5
24263	179	987	2.5
24264	179	998	3
24265	179	1000	3
24266	179	1003	4
24267	179	1006	3
24268	179	1007	2
24269	179	1009	3
24270	179	1018	3
24271	179	1019	3
24272	179	1025	3
24273	179	1029	4
24274	179	1030	2
24275	179	1031	2.5
24276	179	1046	2
24277	179	1048	2.5
24278	179	1054	3
24279	179	1057	3
24280	179	1061	2
24281	179	1063	3
24282	179	1066	2.5
24283	179	1077	0.5
24284	179	1083	3
24285	179	1087	3
24286	179	1092	2
24287	179	1097	3
24288	179	1104	3
24289	179	1109	2.5
24290	179	1122	2
24291	179	1131	2
24292	179	1133	2
24293	179	1144	2.5
24294	179	1148	4
24295	179	1149	3
24296	179	1161	3.5
24297	179	1170	3.5
24298	179	1187	3
24299	179	1201	1.5
24300	179	1215	2
24301	179	1226	3
24302	179	1233	3
24303	179	1250	2.5
24304	179	1257	2.5
24305	179	1260	3
24306	179	1261	3
24307	179	1293	2
24308	179	1296	3
24309	179	1302	2
24310	179	1310	2.5
24311	179	1311	2.5
24312	179	1313	3.5
24313	179	1315	3
24314	179	1322	3
24315	179	1330	1.5
24316	179	1337	1
24317	179	1338	2.5
24318	179	1342	3.5
24319	179	1344	3
24320	179	1357	3.5
24321	179	1361	3
24322	179	1367	4.5
24323	179	1368	2
24324	179	1372	3
24325	179	1375	3.5
24326	179	1381	4
24327	179	1402	2.5
24328	179	1464	3
24329	179	1486	3.5
24330	179	1494	3
24331	179	1521	1.5
24332	179	1522	2
24333	179	1523	3
24334	179	1528	3
24335	179	1529	3
24336	179	1534	3.5
24337	179	1535	2
24338	179	1558	2.5
24339	179	1561	4
24340	179	1564	2.5
24341	179	1567	3
24342	179	1570	1.5
24343	179	1581	3.5
24344	179	1583	4
24345	179	1588	4.5
24346	179	1619	2.5
24347	179	1636	2
24348	179	1640	3
24349	179	1657	3
24350	179	1660	0.5
24351	179	1668	2
24352	179	1675	3
24353	179	1694	2.5
24354	179	1695	3
24355	179	1697	3
24356	179	1701	2
24357	179	1702	2
24358	179	1716	2.5
24359	179	1717	3
24360	179	1729	3.5
24361	179	1730	2.5
24362	179	1749	2.5
24363	179	1778	2
24364	179	1796	2.5
24365	179	1812	3
24366	179	1814	4.5
24367	179	1816	2.5
24368	179	1822	2
24369	179	1830	5
24370	179	1836	3
24371	179	1839	4.5
24372	179	1844	4
24373	179	1847	4
24374	179	1850	3.5
24375	179	1864	2.5
24376	179	1867	2.5
24377	179	1892	1
24378	179	1901	3.5
24379	179	1902	3
24380	179	1906	1
24381	179	1907	3.5
24382	179	1913	1.5
24383	179	1916	1.5
24384	179	1946	3
24385	179	1967	1
24386	179	1971	2
24387	179	1973	3
24388	179	1976	2
24389	179	1986	2
24390	179	2013	2
24391	179	2020	2
24392	179	2021	1.5
24393	179	2022	0.5
24394	179	2031	2.5
24395	179	2034	3.5
24396	179	2041	2.5
24397	179	2052	1.5
24398	179	2064	3.5
24399	179	2092	2.5
24400	179	2099	2
24401	179	2122	3.5
24402	179	2135	4
24403	179	2144	3
24404	179	2145	4.5
24405	179	2149	3.5
24406	179	2151	4
24407	179	2164	3
24408	179	2167	3
24409	179	2169	3
24410	179	2172	2
24411	179	2179	3.5
24412	179	2180	2.5
24413	179	2195	3.5
24414	179	2198	2
24415	179	2210	4
24416	179	2239	1.5
24417	179	2243	2
24418	179	2270	1.5
24419	179	2272	3.5
24420	179	2282	4
24421	179	2314	3
24422	179	2329	2
24423	179	2330	1.5
24424	179	2332	3
24425	179	2366	4
24426	179	2376	3
24427	179	2389	2
24428	179	2398	3.5
24429	179	2430	1.5
24430	179	2435	3.5
24431	179	2436	4.5
24432	179	2442	4.5
24433	179	2448	2
24434	179	2458	3.5
24435	179	2459	2
24436	179	2466	4
24437	179	2470	2.5
24438	179	2481	2
24439	179	2484	3
24440	179	2488	3.5
24441	179	2491	4.5
24442	179	2494	3
24443	179	2497	3
24444	179	2520	3
24445	179	2521	2.5
24446	179	2524	2.5
24447	179	2531	1
24448	179	2537	2
24449	179	2541	3.5
24450	179	2545	4
24451	179	2546	3.5
24452	179	2550	3.5
24453	179	2551	2
24454	179	2574	3
24455	179	2584	1
24456	179	2587	3.5
24457	179	2593	3.5
24458	179	2594	2
24459	179	2596	1.5
24460	179	2601	4
24461	179	2609	0.5
24462	179	2612	3
24463	179	2626	3
24464	179	2629	2.5
24465	179	2630	4
24466	179	2646	3
24467	179	2667	2.5
24468	179	2669	2.5
24469	179	2684	3
24470	179	2689	1
24471	179	2704	3
24472	179	2711	2
24473	179	2728	2.5
24474	179	2740	3
24475	179	2742	2.5
24476	179	2743	3.5
24477	179	2763	2
24478	179	2764	1.5
24479	179	2766	3.5
24480	179	2777	2
24481	179	2778	2.5
24482	179	2784	2.5
24483	179	2797	2.5
24484	179	2799	2
24485	179	2805	3
24486	179	2837	2
24487	179	2844	1.5
24488	179	2850	1.5
24489	179	2852	3.5
24490	179	2887	2.5
24491	179	2902	1.5
24492	179	2903	4.5
24493	179	2925	2.5
24494	179	2942	3
24495	179	2965	2
24496	179	3011	2.5
24497	179	3013	3.5
24498	179	3039	3
24499	179	3060	3
24500	179	3069	3
24501	179	3073	3.5
24502	179	3082	4.5
24503	179	3083	3
24504	179	3108	2.5
24505	179	3117	3.5
24506	179	3125	3.5
24507	179	3132	3.5
24508	179	3148	3.5
24509	179	3155	2
24510	179	3160	3
24511	179	3163	3.5
24512	179	3165	3.5
24513	179	3167	2
24514	179	3176	2.5
24515	179	3177	3.5
24516	179	3186	3
24517	179	3204	2.5
24518	179	3219	2
24519	179	3248	3
24520	179	3292	3.5
24521	179	3322	3.5
24522	179	3323	3.5
24523	179	3327	2.5
24524	179	3335	2
24525	179	3337	4
24526	179	3340	4
24527	179	3359	3.5
24528	179	3380	5
24529	179	3382	4.5
24530	179	3384	3
24531	179	3392	3.5
24532	179	3396	2.5
24533	179	3419	1.5
24534	179	3429	3
24535	179	3445	1
24536	179	3449	3.5
24537	179	3467	3.5
24538	179	3475	3
24539	179	3482	2
24540	179	3489	2.5
24541	179	3491	2.5
24542	179	3510	2
24543	179	3534	4
24544	179	3549	2
24545	179	3571	1.5
24546	179	3610	4
24547	179	3661	1
24548	179	3698	4
24549	179	3724	1.5
24550	179	3758	2
24551	179	3762	3
24552	179	3763	3
24553	179	3776	1
24554	179	3788	3
24555	179	3792	2.5
24556	179	3796	3
24557	179	3804	2
24558	179	3807	4.5
24559	179	3810	2
24560	179	3812	4.5
24561	179	3818	4
24562	179	3829	1.5
24563	179	3836	4
24564	179	3843	2.5
24565	179	3860	4
24566	179	3868	3.5
24567	179	3873	4
24568	179	3874	2
24569	179	3886	3
24570	179	3888	3.5
24571	179	3902	2.5
24572	179	3915	4
24573	179	3930	3.5
24574	179	4009	3
24575	179	4014	3.5
24576	179	4033	3
24577	179	4051	1
24578	179	4061	3
24579	179	4066	3
24580	179	4080	3
24581	179	4155	3
24582	179	4172	3
24583	179	4191	3.5
24584	179	4228	3
24585	179	4313	4.5
24586	179	4316	0.5
24587	179	4319	3
24588	179	4330	2
24589	179	4331	1
24590	179	4336	2.5
24591	179	4350	3.5
24592	179	4384	3.5
24593	179	4386	3.5
24594	179	4435	3.5
24595	179	4447	2.5
24596	179	4448	2.5
24597	179	4453	2
24598	179	4458	2
24599	179	4461	2
24600	179	4487	4
24601	179	4488	3.5
24602	179	4540	2.5
24603	179	4553	1.5
24604	179	4559	1
24605	179	4574	3.5
24606	179	4600	2
24607	179	4615	3.5
24608	179	4617	3.5
24609	179	4620	2.5
24610	179	4645	2.5
24611	179	4679	3.5
24612	179	4688	2.5
24613	179	4767	2.5
24614	179	4771	1
24615	179	4782	3.5
24616	179	4789	1.5
24617	179	4803	4
24618	179	4819	2.5
24619	179	4861	2.5
24620	179	4867	2
24621	179	4877	1
24622	179	4888	4
24623	179	4906	3
24624	179	4923	2
24625	179	4952	2
24626	179	4956	3.5
24627	179	4968	3
24628	179	4971	3
24629	179	4998	3
24630	179	5003	4
24631	179	5004	3.5
24632	179	5005	4.5
24633	179	5018	3
24634	179	5025	3
24635	179	5042	4
24636	179	5043	3
24637	179	5050	0.5
24638	179	5090	2.5
24639	179	5104	3.5
24640	179	5117	2.5
24641	179	5125	3
24642	179	5126	2
24643	179	5133	3.5
24644	179	5138	2.5
24645	179	5139	2
24646	179	5153	2
24647	179	5164	3
24648	179	5202	2.5
24649	179	5264	1
24650	179	5284	1
24651	179	5298	2
24652	179	5301	3.5
24653	179	5323	3.5
24654	179	5354	0.5
24655	179	5365	4
24656	179	5431	1
24657	179	5618	5
24658	179	5624	4
24659	179	5668	2
24660	179	5713	1
24661	179	5720	3
24662	179	5889	3.5
24663	180	1	3.5
24664	180	19	1.5
24665	180	34	3
24666	180	46	3.5
24667	180	58	4.5
24668	180	95	4
24669	180	97	4.5
24670	180	99	4
24671	180	127	4
24672	180	224	3.5
24673	180	231	4.5
24674	180	279	3
24675	180	294	3.5
24676	180	298	4
24677	180	305	2
24678	180	317	5
24679	180	324	3.5
24680	180	404	3.5
24681	180	427	3
24682	180	465	4
24683	180	496	4.5
24684	180	520	3.5
24685	180	522	3
24686	180	568	3.5
24687	180	726	3
24688	180	741	2.5
24689	180	746	4
24690	180	761	4
24691	180	828	3.5
24692	180	834	4
24693	180	835	4
24694	180	837	3
24695	180	873	3
24696	180	878	3.5
24697	180	898	2.5
24698	180	923	5
24699	180	959	4
24700	180	961	5
24701	180	969	4
24702	180	972	4.5
24703	180	1016	4
24704	180	1025	3.5
24705	180	1051	4
24706	180	1057	4
24707	180	1061	3.5
24708	180	1083	3.5
24709	180	1290	4
24710	180	1297	4.5
24711	180	1322	3.5
24712	180	1361	4
24713	180	1375	5
24714	180	1489	3
24715	180	1514	3.5
24716	180	1564	3.5
24717	180	1581	3.5
24718	180	1591	4
24719	180	1604	3
24720	180	1638	3
24721	180	1642	3.5
24722	180	1647	3
24723	180	1656	3
24724	180	1707	3.5
24725	180	1772	3.5
24726	180	1867	3
24727	180	1907	3
24728	180	1908	4
24729	180	1933	4
24730	180	1941	4
24731	180	2001	4.5
24732	180	2099	3.5
24733	180	2144	2.5
24734	180	2172	4.5
24735	180	2210	3
24736	180	2281	3.5
24737	180	2287	3
24738	180	2366	3.5
24739	180	2389	2
24740	180	2425	4
24741	180	2491	5
24742	180	2520	4
24743	180	2616	4
24744	180	2669	3
24745	180	2704	3.5
24746	180	2819	3.5
24747	180	2898	3.5
24748	180	3143	2.5
24749	180	3163	4.5
24750	180	3167	4
24751	180	3173	4
24752	180	3342	2
24753	180	3375	2.5
24754	180	3380	4
24755	180	3526	3.5
24756	180	3793	4
24757	180	3818	2.5
24758	180	3822	3
24759	180	3860	4
24760	180	3874	4
24761	180	3886	5
24762	180	4109	2
24763	180	4188	4
24764	180	4386	2.5
24765	180	4458	5
24766	180	4485	3.5
24767	180	4560	1
24768	180	4583	4
24769	180	4803	3.5
24770	180	5007	4
24771	180	5039	3
24772	180	5042	5
24773	180	5168	4
24774	180	5202	3.5
24775	180	5207	5
24776	180	5310	4.5
24777	180	5334	4
24778	180	5348	3.5
24779	180	5374	3.5
24780	180	5484	4.5
24781	180	5618	3.5
24782	180	5624	2.5
24783	180	5630	3
24784	180	5652	4
24785	180	5677	3.5
24786	180	5729	4
24787	180	5838	4.5
24788	180	5853	4
24789	180	5890	4
24790	180	6417	5
24791	180	6563	2
24792	180	6604	5
24793	180	6606	5
24794	180	6635	2.5
24795	180	6642	5
24796	180	6654	4.5
24797	180	6663	2.5
24798	180	6714	3
24799	180	6727	2
24800	180	6757	4
24801	180	6787	2
24802	180	6848	2.5
24803	180	6856	3.5
24804	180	6946	4.5
24805	180	6948	4.5
24806	180	6967	3.5
24807	180	7036	3.5
24808	180	7061	4.5
24809	180	7066	4
24810	180	7080	3
24811	180	7085	4
24812	180	7112	3.5
24813	180	7155	4
24814	180	7161	5
24815	180	7179	3.5
24816	180	7200	4
24817	180	7219	4
24818	181	5	2
24819	181	18	5
24820	181	32	3
24821	181	88	3
24822	181	97	3
24823	181	101	3
24824	181	121	4
24825	181	231	4
24826	181	254	3
24827	181	336	3
24828	181	538	4
24829	181	553	4
24830	181	555	2
24831	181	565	3
24832	181	568	4
24833	181	572	4
24834	181	574	3
24835	181	577	3
24836	181	620	3
24837	181	622	3
24838	181	639	3
24839	181	647	4
24840	181	650	4
24841	181	652	4
24842	181	654	3
24843	181	659	4
24844	181	675	3
24845	181	677	4
24846	181	696	4
24847	181	708	3
24848	181	972	4
24849	181	1103	5
24850	182	6	4
24851	182	96	1
24852	182	151	2
24853	182	165	2
24854	182	171	1.5
24855	182	254	2.5
24856	182	284	0.5
24857	182	389	2
24858	182	414	1
24859	182	419	4.5
24860	182	448	1
24861	182	483	1
24862	182	528	1.5
24863	182	573	0.5
24864	182	877	3
24865	182	882	5
24866	182	947	2
24867	182	1010	4.5
24868	182	1012	4.5
24869	182	1031	4
24870	182	1036	4.5
24871	182	1051	3
24872	182	1127	2.5
24873	182	1136	4
24874	182	1145	2.5
24875	182	1291	4
24876	182	1302	2.5
24877	182	1337	4
24878	182	1358	3
24879	182	1367	4.5
24880	182	1371	3
24881	182	1464	3.5
24882	182	1641	2
24883	182	1660	1
24884	182	1681	1.5
24885	182	1682	1
24886	182	1822	1.5
24887	182	1845	3.5
24888	182	1923	3
24889	182	2002	3.5
24890	182	2248	1
24891	182	2398	4
24892	182	2543	0.5
24893	182	2646	4.5
24894	182	2770	2
24895	182	2801	4
24896	182	2823	4
24897	182	3073	4
24898	182	3184	4
24899	182	3203	3
24900	182	3312	1
24901	182	3590	1
24902	182	3843	2
24903	182	4085	2
24904	183	2	4
24905	183	10	3.5
24906	183	17	2
24907	183	19	1.5
24908	183	34	2.5
24909	183	127	2.5
24910	183	181	2.5
24911	183	224	4
24912	183	231	3.5
24913	183	278	4
24914	183	300	4
24915	183	317	5
24916	183	318	4.5
24917	183	324	4.5
24918	183	341	3
24919	183	342	2.5
24920	183	403	3.5
24921	183	422	4
24922	183	427	4.5
24923	183	443	3.5
24924	183	446	4
24925	183	453	2.5
24926	183	472	5
24927	183	483	3
24928	183	520	2.5
24929	183	521	5
24930	183	525	4
24931	183	530	5
24932	183	581	2
24933	183	696	1.5
24934	183	734	2
24935	183	837	1
24936	183	873	4
24937	183	878	2
24938	183	886	4.5
24939	183	895	2.5
24940	183	898	3
24941	183	915	3
24942	183	960	4.5
24943	183	961	5
24944	183	972	3.5
24945	183	976	3.5
24946	183	983	1.5
24947	183	984	2
24948	183	987	3.5
24949	183	1000	4
24950	183	1006	3.5
24951	183	1030	4.5
24952	183	1051	5
24953	183	1066	2.5
24954	183	1116	2
24955	183	1122	3.5
24956	183	1133	4
24957	183	1198	2.5
24958	183	1226	0.5
24959	183	1257	3.5
24960	183	1261	2.5
24961	183	1265	4.5
24962	183	1302	3.5
24963	183	1311	4.5
24964	183	1344	4.5
24965	183	1359	2
24966	183	1361	4
24967	183	1368	4.5
24968	183	1402	4.5
24969	183	1489	3
24970	183	1494	4
24971	183	1528	3.5
24972	183	1535	2.5
24973	183	1558	2
24974	183	1564	2
24975	183	1569	3
24976	183	1574	4.5
24977	183	1575	4.5
24978	183	1615	3.5
24979	183	1638	1.5
24980	183	1660	4
24981	183	1675	5
24982	183	1730	2.5
24983	183	1748	4
24984	183	1839	5
24985	183	1844	3
24986	183	1850	1.5
24987	183	1905	3
24988	183	1907	4
24989	183	2057	4
24990	183	2099	3.5
24991	183	2109	4
24992	183	2135	3.5
24993	183	2144	0.5
24994	183	2163	4
24995	183	2167	1
24996	183	2172	4
24997	183	2173	3
24998	183	2180	3
24999	183	2210	4
25000	183	2239	4.5
25001	183	2359	2.5
25002	183	2360	2.5
25003	183	2389	2.5
25004	183	2430	2.5
25005	183	2497	2.5
25006	183	2520	4
25007	183	2597	1
25008	183	2837	3
25009	183	2926	2.5
25010	183	2927	2.5
25011	183	3000	4.5
25012	183	3108	2.5
25013	183	3125	5
25014	183	3143	1.5
25015	183	3165	5
25016	183	3173	3
25017	183	3323	2
25018	183	3375	2.5
25019	183	3380	4.5
25020	183	3818	4
25021	183	3860	3
25022	183	3868	4.5
25023	183	3886	4
25024	183	3888	4
25025	183	3938	3.5
25026	183	4109	4.5
25027	183	4386	4
25028	183	4436	3
25029	183	4458	4
25030	183	4681	4.5
25031	183	4705	2.5
25032	183	4801	1
25033	183	4803	4.5
25034	183	5005	3
25035	183	5042	4
25036	183	5202	3.5
25037	183	5207	4.5
25038	183	5310	3.5
25039	183	5618	4.5
25040	183	5624	3.5
25041	183	5726	4
25042	183	5883	3
25043	183	6485	0.5
25044	183	6620	2.5
25045	183	6691	2
25046	183	6847	3.5
25047	183	6968	3.5
25048	183	7018	2.5
25049	183	7019	4.5
25050	183	7061	4.5
25051	183	7085	4
25052	183	7173	1.5
25053	183	7219	2.5
25054	183	7273	4
25055	183	7307	1
25056	183	7363	3.5
25057	183	7383	4
25058	183	7423	1
25059	183	7424	3.5
25060	183	7494	1.5
25061	183	7506	2.5
25062	183	7670	4.5
25063	183	7715	3.5
25064	183	7742	2.5
25065	183	8093	4
25066	183	8096	2
25067	183	8130	1.5
25068	183	8168	3.5
25069	183	8779	3
25070	183	9269	4.5
25071	184	2	4.5
25072	184	16	4.5
25073	184	19	5
25074	184	454	4
25075	184	525	1
25076	184	527	3.5
25077	184	653	2
25078	184	734	4
25079	184	915	0.5
25080	184	981	5
25081	184	987	5
25082	184	1018	4.5
25083	184	1528	5
25084	184	2144	5
25085	184	2167	2
25086	184	2172	5
25087	184	2398	4.5
25088	184	2520	0.5
25089	184	3163	4.5
25090	184	3219	0.5
25091	184	3860	1
25092	184	4803	0.5
25093	184	7006	0.5
25094	185	123	3.5
25095	185	414	3
25096	185	844	3.5
25097	185	1214	2.5
25098	185	1226	3.5
25099	185	1254	2.5
25100	185	1461	2
25101	185	1490	3
25102	185	1921	4
25103	185	1976	2.5
25104	185	1992	4.5
25105	185	2057	4
25106	185	2153	4
25107	185	2160	3
25108	185	2178	3
25109	185	2313	4
25110	185	2467	3
25111	185	2800	4
25112	185	2938	5
25113	185	2966	3.5
25114	185	2992	3
25115	185	3219	4
25116	185	3422	4.5
25117	185	3683	5
25118	185	3900	3
25119	185	4184	2.5
25120	185	4458	4
25121	185	4697	3.5
25122	185	5207	4
25123	185	5733	5
25124	186	10	4
25125	186	99	5
25126	186	127	3
25127	186	130	3
25128	186	161	3
25129	186	181	3
25130	186	203	3
25131	186	224	4
25132	186	254	3
25133	186	258	3
25134	186	261	4
25135	186	278	3
25136	186	280	4
25137	186	290	2
25138	186	305	3
25139	186	310	4
25140	186	317	5
25141	186	327	3
25142	186	337	3
25143	186	340	4
25144	186	403	4
25145	186	406	5
25146	186	427	3
25147	186	446	3
25148	186	523	4
25149	186	524	4
25150	186	525	3
25151	187	1	5
25152	187	2	4
25153	187	3	3
25154	187	5	3
25155	187	10	3
25156	187	12	2
25157	187	17	3
25158	187	19	4
25159	187	21	2
25160	187	36	4
25161	187	37	5
25162	187	53	5
25163	187	58	4
25164	187	82	5
25165	187	87	3
25166	187	117	4
25167	187	121	4
25168	187	127	5
25169	187	130	3
25170	187	135	4
25171	187	138	4
25172	187	149	3
25173	187	150	3
25174	187	203	4
25175	187	211	5
25176	187	219	5
25177	187	231	4
25178	187	235	4
25179	187	245	3
25180	187	252	4
25181	187	264	3
25182	187	279	5
25183	187	290	3
25184	187	294	4
25185	187	300	5
25186	187	303	4
25187	187	305	4
25188	187	310	5
25189	187	316	3
25190	187	317	5
25191	187	324	4
25192	187	330	3
25193	187	332	4
25194	187	337	5
25195	187	340	5
25196	187	369	4
25197	187	389	5
25198	187	403	5
25199	187	404	3
25200	187	406	5
25201	187	416	4
25202	187	422	4
25203	187	427	3
25204	187	435	4
25205	187	437	4
25206	187	440	3
25207	187	446	5
25208	187	453	4
25209	187	461	2
25210	187	469	3
25211	187	474	5
25212	187	482	2
25213	187	483	5
25214	187	487	2
25215	187	519	3
25216	187	521	4
25217	187	522	5
25218	187	523	5
25219	187	528	4
25220	187	538	3
25221	187	560	3
25222	187	565	4
25223	187	569	4
25224	187	602	5
25225	187	611	3
25226	187	647	3
25227	187	650	4
25228	187	652	4
25229	187	653	4
25230	187	654	4
25231	187	659	5
25232	187	685	3
25233	187	838	4
25234	187	844	3
25235	187	849	4
25236	187	873	4
25237	187	889	3
25238	187	897	3
25239	187	915	5
25240	187	961	5
25241	187	972	4
25242	187	982	5
25243	187	1000	5
25244	187	1025	4
25245	187	1030	5
25246	187	1035	4
25247	187	1056	3
25248	187	1066	4
25249	187	1122	4
25250	188	1	4
25251	188	10	4
25252	188	16	5
25253	188	20	3
25254	188	21	4
25255	188	31	3
25256	188	37	4
25257	188	43	4
25258	188	48	4
25259	188	49	5
25260	188	54	5
25261	188	59	2
25262	188	88	2
25263	188	95	4
25264	188	99	4
25265	188	100	5
25266	188	101	3
25267	188	106	4
25268	188	112	5
25269	188	130	4
25270	188	139	4
25271	188	140	3
25272	188	143	5
25273	188	151	5
25274	188	152	5
25275	188	155	4
25276	188	156	4
25277	188	162	3
25278	188	163	4
25279	188	167	4
25280	188	176	3
25281	188	195	5
25282	188	204	4
25283	188	218	4
25284	188	221	2
25285	188	231	5
25286	188	244	2
25287	188	246	3
25288	188	254	4
25289	188	259	4
25290	188	261	5
25291	188	269	5
25292	188	278	4
25293	188	279	2
25294	188	280	5
25295	188	281	5
25296	188	284	5
25297	188	305	3
25298	188	306	4
25299	188	310	4
25300	188	314	3
25301	188	317	4
25302	188	318	4
25303	188	319	4
25304	188	321	3
25305	188	327	3
25306	188	332	4
25307	188	337	4
25308	188	340	4
25309	188	389	3
25310	188	390	4
25311	188	403	3
25312	188	405	4
25313	188	406	4
25314	188	410	3
25315	188	419	5
25316	188	425	4
25317	188	427	4
25318	188	446	2
25319	188	461	3
25320	188	463	4
25321	188	472	5
25322	188	474	4
25323	188	479	4
25324	188	483	3
25325	188	485	5
25326	188	499	5
25327	188	520	2
25328	188	521	4
25329	188	523	4
25330	188	524	4
25331	188	525	5
25332	188	526	4
25333	188	530	4
25334	188	538	5
25335	188	540	4
25336	188	542	1
25337	188	552	4
25338	188	564	4
25339	188	565	3
25340	188	581	2
25341	188	583	3
25342	188	592	2
25343	188	594	3
25344	188	611	3
25345	188	614	4
25346	188	617	5
25347	188	620	3
25348	188	622	3
25349	188	627	4
25350	188	631	5
25351	188	645	5
25352	188	647	3
25353	188	648	5
25354	188	649	2
25355	188	651	1
25356	188	652	3
25357	188	654	2
25358	188	656	4
25359	188	662	2
25360	188	677	3
25361	188	678	2
25362	188	693	4
25363	188	696	5
25364	188	700	3
25365	188	712	2
25366	188	720	4
25367	188	721	4
25368	188	724	5
25369	188	725	5
25370	188	726	5
25371	188	734	5
25372	188	735	4
25373	188	736	4
25374	188	741	4
25375	188	742	3
25376	188	743	4
25377	188	745	5
25378	188	746	5
25379	188	749	5
25380	188	756	4
25381	188	774	4
25382	188	806	5
25383	188	812	2
25384	188	844	3
25385	188	849	3
25386	188	853	4
25387	188	860	4
25388	188	862	5
25389	188	863	5
25390	188	864	4
25391	188	873	4
25392	188	875	4
25393	188	876	4
25394	188	877	4
25395	188	878	4
25396	188	882	5
25397	188	886	4
25398	188	887	5
25399	188	888	5
25400	188	889	3
25401	188	890	4
25402	188	892	4
25403	188	893	4
25404	188	895	5
25405	188	896	3
25406	188	898	5
25407	188	899	5
25408	188	905	4
25409	188	909	5
25410	188	913	3
25411	188	917	3
25412	188	922	4
25413	188	923	4
25414	188	926	4
25415	188	938	5
25416	188	940	5
25417	188	945	4
25418	188	947	2
25419	188	950	5
25420	188	952	5
25421	188	955	4
25422	188	957	5
25423	188	959	4
25424	188	961	5
25425	188	962	5
25426	188	963	4
25427	188	968	5
25428	188	970	5
25429	188	972	3
25430	188	975	5
25431	188	976	4
25432	188	978	5
25433	188	981	4
25434	188	982	4
25435	188	983	5
25436	188	990	5
25437	188	992	4
25438	188	995	5
25439	188	1000	4
25440	188	1006	4
25441	188	1007	5
25442	188	1009	5
25443	188	1017	5
25444	188	1018	5
25445	188	1019	4
25446	188	1023	5
25447	188	1025	3
25448	188	1026	4
25449	188	1028	5
25450	188	1030	5
25451	188	1039	5
25452	188	1042	4
25453	188	1045	5
25454	188	1048	5
25455	188	1050	4
25456	188	1053	4
25457	188	1055	3
25458	188	1057	3
25459	188	1061	4
25460	188	1066	5
25461	188	1089	4
25462	188	1090	3
25463	188	1094	4
25464	188	1101	4
25465	188	1105	3
25466	188	1106	2
25467	188	1109	5
25468	188	1111	3
25469	188	1112	3
25470	188	1116	3
25471	188	1119	4
25472	188	1122	4
25473	188	1125	2
25474	188	1127	4
25475	188	1131	2
25476	188	1132	4
25477	188	1133	4
25478	188	1134	5
25479	188	1136	3
25480	188	1142	3
25481	188	1145	4
25482	188	1151	5
25483	188	1153	3
25484	188	1159	3
25485	188	1164	2
25486	188	1167	2
25487	188	1171	5
25488	188	1175	5
25489	188	1178	4
25490	188	1182	5
25491	188	1183	2
25492	188	1187	3
25493	188	1189	3
25494	188	1196	4
25495	188	1198	3
25496	188	1201	4
25497	188	1203	2
25498	188	1206	2
25499	188	1209	4
25500	188	1213	4
25501	188	1215	5
25502	188	1217	2
25503	188	1222	3
25504	188	1224	2
25505	188	1226	3
25506	188	1233	5
25507	188	1238	3
25508	188	1241	2
25509	188	1244	2
25510	188	1250	4
25511	188	1261	4
25512	188	1267	4
25513	188	1278	3
25514	188	1286	2
25515	188	1288	3
25516	188	1290	3
25517	188	1293	4
25518	188	1295	3
25519	188	1296	5
25520	188	1302	4
25521	188	1311	5
25522	188	2363	4
25523	188	3158	1
25524	188	3934	4
25525	189	29	4
25526	189	32	4.5
25527	189	45	4.5
25528	189	48	4
25529	189	100	5
25530	189	110	5
25531	189	220	4
25532	189	231	4.5
25533	189	261	5
25534	189	272	5
25535	189	280	4
25536	189	308	4
25537	189	478	4
25538	189	485	5
25539	189	503	5
25540	189	526	5
25541	189	531	4.5
25542	189	538	5
25543	189	585	5
25544	189	607	5
25545	189	612	1
25546	189	624	5
25547	189	627	2
25548	189	656	2.5
25549	189	696	5
25550	189	725	5
25551	189	726	5
25552	189	730	4
25553	189	735	2.5
25554	189	744	5
25555	189	745	5
25556	189	746	5
25557	189	749	4.5
25558	189	751	4.5
25559	189	887	4
25560	189	913	4
25561	189	926	1.5
25562	189	942	5
25563	189	957	5
25564	189	962	4
25565	189	963	4.5
25566	189	964	5
25567	189	968	5
25568	189	970	5
25569	189	971	4
25570	189	974	5
25571	189	976	5
25572	189	981	5
25573	189	990	5
25574	189	993	5
25575	189	998	5
25576	189	1000	5
25577	189	1008	5
25578	189	1011	5
25579	189	1012	5
25580	189	1015	4
25581	189	1018	5
25582	189	1020	4.5
25583	189	1023	4.5
25584	189	1026	5
25585	189	1027	4
25586	189	1043	5
25587	189	1057	3.5
25588	189	1063	5
25589	189	1064	5
25590	189	1072	4
25591	189	1083	5
25592	189	1092	4.5
25593	189	1127	4
25594	189	1148	3.5
25595	189	1155	4.5
25596	189	1187	5
25597	189	1201	4.5
25598	189	1259	4.5
25599	189	1296	4
25600	189	1309	4.5
25601	189	1416	5
25602	189	1429	4.5
25603	189	1486	5
25604	189	1512	5
25605	189	1561	4
25606	189	1573	4.5
25607	189	1582	4.5
25608	189	1636	5
25609	189	1685	1
25610	189	1716	5
25611	189	1729	3.5
25612	189	1733	4.5
25613	189	1812	4
25614	189	1823	3
25615	189	1844	4.5
25616	189	1871	1
25617	189	1963	5
25618	189	1990	4
25619	189	2007	5
25620	189	2022	4.5
25621	189	2041	4.5
25622	189	2057	4.5
25623	189	2074	0.5
25624	189	2079	4.5
25625	189	2151	3.5
25626	189	2182	5
25627	189	2186	5
25628	189	2187	5
25629	189	2230	4
25630	189	2282	4.5
25631	189	2294	4.5
25632	189	2344	5
25633	189	2362	4.5
25634	189	2387	5
25635	189	2448	2.5
25636	189	2461	4.5
25637	189	2476	5
25638	189	2561	4.5
25639	189	2562	5
25640	189	2639	3.5
25641	189	2661	2
25642	189	2671	4.5
25643	189	2709	5
25644	189	2727	5
25645	189	2757	4
25646	189	2782	5
25647	189	2787	3.5
25648	189	2867	5
25649	189	2906	5
25650	189	2908	4
25651	189	2925	4
25652	189	2926	5
25653	189	2948	5
25654	189	2959	5
25655	189	2995	5
25656	189	3073	2
25657	189	3107	4.5
25658	189	3231	4
25659	189	3285	3.5
25660	189	3323	5
25661	189	3330	4.5
25662	189	3389	4
25663	189	3430	3.5
25664	189	3450	4.5
25665	189	3451	4.5
25666	189	3466	4.5
25667	189	3473	1
25668	189	3636	2.5
25669	189	3724	4.5
25670	189	3788	5
25671	189	3792	4.5
25672	189	3807	4.5
25673	189	3830	5
25674	189	3837	4.5
25675	189	3838	4
25676	189	3868	3.5
25677	189	3932	5
25678	189	3967	4.5
25679	189	3980	5
25680	189	3997	5
25681	189	4058	4
25682	189	4173	4
25683	189	4291	4.5
25684	189	4365	2
25685	189	4491	4
25686	189	4500	5
25687	189	4506	4.5
25688	189	4508	5
25689	189	4550	4.5
25690	189	4597	4.5
25691	189	4635	4
25692	189	4658	5
25693	189	4697	3.5
25694	189	4794	4.5
25695	189	4887	5
25696	189	4945	4.5
25697	189	4954	3.5
25698	189	4968	5
25699	189	5003	5
25700	189	5005	4
25701	189	5029	3.5
25702	189	5037	3
25703	189	5074	5
25704	189	5076	5
25705	189	5098	3.5
25706	189	5123	5
25707	189	5124	5
25708	189	5142	5
25709	189	5146	5
25710	189	5148	3.5
25711	189	5149	5
25712	189	5150	3
25713	189	5166	5
25714	189	5190	5
25715	189	5197	4
25716	189	5198	1.5
25717	189	5301	2.5
25718	189	5314	5
25719	189	5329	5
25720	189	5412	5
25721	189	5449	4.5
25722	189	5500	4
25723	189	5501	4
25724	189	5514	4
25725	189	5529	3.5
25726	189	5541	4
25727	189	5548	5
25728	189	5568	5
25729	189	5576	5
25730	189	5597	5
25731	189	5654	5
25732	189	5668	5
25733	189	5703	3.5
25734	189	5737	5
25735	189	5741	4.5
25736	189	5751	3.5
25737	189	5823	4
25738	189	5940	5
25739	189	6006	5
25740	189	6067	5
25741	189	6092	5
25742	189	6136	5
25743	189	6225	5
25744	189	6252	4.5
25745	189	6298	5
25746	189	6301	4
25747	189	6361	4.5
25748	189	6370	4.5
25749	189	6392	4.5
25750	189	6421	3.5
25751	189	6459	5
25752	189	6530	4
25753	189	6587	4
25754	189	6749	4
25755	189	6757	4.5
25756	189	6760	3.5
25757	189	6787	4.5
25758	189	6863	5
25759	189	6885	4
25760	189	6898	5
25761	189	6966	4
25762	189	7127	4.5
25763	190	10	3
25764	190	16	5
25765	190	21	4
25766	190	34	1
25767	190	37	4
25768	190	45	3
25769	190	88	3
25770	190	95	3
25771	190	116	3
25772	190	123	3
25773	190	127	4
25774	190	138	3
25775	190	142	4
25776	190	146	3
25777	190	148	3
25778	190	161	2
25779	190	167	1
25780	190	197	3
25781	190	203	3
25782	190	207	4
25783	190	247	3
25784	190	254	3
25785	190	261	3
25786	190	290	3
25787	190	310	3
25788	190	327	3
25789	190	337	3
25790	190	340	4
25791	190	342	3
25792	190	362	3
25793	190	368	1
25794	190	383	2
25795	190	384	2
25796	190	406	3
25797	190	414	3
25798	190	422	3
25799	190	427	3
25800	190	431	2
25801	190	465	3
25802	190	476	2
25803	190	484	3
25804	190	487	4
25805	190	492	3
25806	190	499	3
25807	190	521	1
25808	190	523	4
25809	190	524	4
25810	190	526	3
25811	190	530	3
25812	191	162	4
25813	191	247	4
25814	191	277	4
25815	191	303	4
25816	191	330	4
25817	191	564	4
25818	191	696	3.5
25819	191	890	3.5
25820	191	1122	4
25821	191	1203	3
25822	191	1278	4
25823	191	1302	2.5
25824	191	1399	3.5
25825	191	1565	3.5
25826	191	1615	2.5
25827	191	1916	3
25828	191	1917	3.5
25829	191	2210	3.5
25830	191	3132	4.5
25831	191	3934	4
25832	192	1	4
25833	192	2	3.5
25834	192	3	3
25835	192	5	3.5
25836	192	7	4
25837	192	11	5
25838	192	16	1
25839	192	19	2
25840	192	21	1
25841	192	24	4
25842	192	25	3
25843	192	32	1
25844	192	34	4
25845	192	36	4.5
25846	192	37	4
25847	192	58	4
25848	192	80	4
25849	192	99	4.5
25850	192	107	3
25851	192	121	3.5
25852	192	127	5
25853	192	130	3
25854	192	135	3.5
25855	192	138	4.5
25856	192	161	4
25857	192	210	4
25858	192	231	4
25859	192	236	4
25860	192	250	4.5
25861	192	252	4.5
25862	192	258	4
25863	192	261	1
25864	192	279	5
25865	192	280	5
25866	192	300	3.5
25867	192	305	2
25868	192	310	4
25869	192	311	4
25870	192	317	4
25871	192	318	2.5
25872	192	321	4
25873	192	324	4.5
25874	192	327	3
25875	192	328	4
25876	192	336	4
25877	192	337	3.5
25878	192	340	5
25879	192	343	4
25880	192	381	3.5
25881	192	389	3.5
25882	192	403	4
25883	192	406	4
25884	192	422	4
25885	192	425	4
25886	192	427	4
25887	192	437	5
25888	192	440	3.5
25889	192	446	4.5
25890	192	452	4
25891	192	453	5
25892	192	469	4.5
25893	192	472	5
25894	192	480	4
25895	192	483	4
25896	192	497	4
25897	192	520	4
25898	192	521	4
25899	192	522	4
25900	192	523	3
25901	192	524	5
25902	192	525	3
25903	192	526	3
25904	192	528	4
25905	192	530	4
25906	192	538	2
25907	192	564	4
25908	192	565	4
25909	192	568	4
25910	192	602	3.5
25911	192	620	4
25912	192	622	4
25913	192	647	3
25914	192	652	1
25915	192	659	5
25916	192	662	5
25917	192	665	4
25918	192	677	5
25919	192	690	4
25920	192	694	4
25921	192	696	4.5
25922	192	727	4
25923	192	728	4
25924	192	734	4
25925	192	741	5
25926	192	742	4
25927	192	755	4
25928	192	774	4.5
25929	192	831	4
25930	192	836	4
25931	192	844	4
25932	192	860	3
25933	192	882	4
25934	192	891	3
25935	192	895	5
25936	192	896	4
25937	192	898	4
25938	192	912	4
25939	192	915	3
25940	192	923	3
25941	192	934	3.5
25942	192	947	3.5
25943	192	957	4.5
25944	192	959	4
25945	192	960	3.5
25946	192	961	4.5
25947	192	970	4
25948	192	975	4
25949	192	976	4
25950	192	981	4
25951	192	982	5
25952	192	983	4.5
25953	192	995	4.5
25954	192	1000	4
25955	192	1002	4.5
25956	192	1006	3.5
25957	192	1007	4
25958	192	1012	4
25959	192	1018	2
25960	192	1025	4
25961	192	1026	4
25962	192	1029	4.5
25963	192	1030	4.5
25964	192	1031	5
25965	192	1032	3
25966	192	1036	4.5
25967	192	1038	4
25968	192	1051	4.5
25969	192	1053	3
25970	192	1058	4
25971	192	1061	4.5
25972	192	1063	5
25973	192	1066	4.5
25974	192	1083	4
25975	192	1105	4
25976	192	1108	4
25977	192	1111	4
25978	192	1112	4
25979	192	1122	4.5
25980	192	1133	4.5
25981	192	1140	4
25982	192	1170	4
25983	192	1203	4.5
25984	192	1222	3
25985	192	1227	4.5
25986	192	1233	2
25987	192	1244	4.5
25988	192	1250	4
25989	192	1257	4
25990	192	1260	2
25991	192	1261	3.5
25992	192	1265	4
25993	192	1279	4
25994	192	1288	4
25995	192	1290	4.5
25996	192	1298	4
25997	192	1302	3.5
25998	192	1310	0.5
25999	192	1311	4.5
26000	192	1337	1
26001	192	1338	4.5
26002	192	1342	3
26003	192	1344	2.5
26004	192	1353	5
26005	192	1361	4
26006	192	1368	4.5
26007	192	1399	4
26008	192	1402	4
26009	192	1440	3
26010	192	1452	4
26011	192	1484	4
26012	192	1489	4
26013	192	1494	0.5
26014	192	1506	4
26015	192	1514	4
26016	192	1526	2
26017	192	1528	5
26018	192	1535	3.5
26019	192	1564	4
26020	192	1565	4.5
26021	192	1570	4
26022	192	1574	4
26023	192	1575	3.5
26024	192	1576	3
26025	192	1591	4
26026	192	1615	3
26027	192	1619	4
26028	192	1627	3
26029	192	1630	4
26030	192	1638	4
26031	192	1640	4
26032	192	1641	4
26033	192	1645	3
26034	192	1647	3
26035	192	1660	3.5
26036	192	1675	4
26037	192	1685	3.5
26038	192	1704	4
26039	192	1711	3
26040	192	1722	4
26041	192	1730	4
26042	192	1749	4
26043	192	1772	4
26044	192	1776	4
26045	192	1796	4
26046	192	1814	2.5
26047	192	1816	4
26048	192	1822	4
26049	192	1827	4
26050	192	1830	4.5
26051	192	1836	3
26052	192	1847	4
26053	192	1865	4.5
26054	192	1867	4.5
26055	192	1881	4
26056	192	1901	3
26057	192	1916	4
26058	192	1917	4.5
26059	192	1934	4
26060	192	1943	4.5
26061	192	1961	4
26062	192	1989	4
26063	192	1992	4
26064	192	2001	5
26065	192	2002	3
26066	192	2037	4
26067	192	2057	0.5
26068	192	2058	3
26069	192	2060	4
26070	192	2065	4
26071	192	2077	4
26072	192	2080	4.5
26073	192	2091	4
26074	192	2114	4
26075	192	2135	3
26076	192	2147	4
26077	192	2153	4
26078	192	2158	4
26079	192	2163	1
26080	192	2164	4
26081	192	2167	1
26082	192	2170	4.5
26083	192	2172	3
26084	192	2180	4
26085	192	2190	3
26086	192	2194	3.5
26087	192	2195	4.5
26088	192	2210	5
26089	192	2233	4
26090	192	2234	3
26091	192	2239	5
26092	192	2247	1
26093	192	2272	4
26094	192	2280	4
26095	192	2282	1
26096	192	2285	3
26097	192	2304	4.5
26098	192	2312	4
26099	192	2313	3
26100	192	2325	4
26101	192	2326	1
26102	192	2327	2
26103	192	2330	3
26104	192	2332	4
26105	192	2367	4
26106	192	2372	4
26107	192	2381	3
26108	192	2382	3
26109	192	2389	3
26110	192	2397	4
26111	192	2401	4
26112	192	2402	4
26113	192	2441	4
26114	192	2458	4
26115	192	2459	3
26116	192	2460	4
26117	192	2471	4
26118	192	2481	4
26119	192	2483	3.5
26120	192	2484	5
26121	192	2488	5
26122	192	2490	4
26123	192	2493	4
26124	192	2494	4.5
26125	192	2496	4
26126	192	2497	3.5
26127	192	2498	4
26128	192	2520	4.5
26129	192	2521	4
26130	192	2526	4
26131	192	2528	1
26132	192	2541	1
26133	192	2542	4
26134	192	2545	4
26135	192	2546	4
26136	192	2551	3.5
26137	192	2553	5
26138	192	2555	4
26139	192	2572	4
26140	192	2573	4.5
26141	192	2577	3
26142	192	2593	4
26143	192	2596	4
26144	192	2597	4.5
26145	192	2627	4
26146	192	2629	3
26147	192	2639	2
26148	192	2643	4
26149	192	2661	4
26150	192	2666	4
26151	192	2667	4
26152	192	2669	4
26153	192	2704	4
26154	192	2705	3
26155	192	2711	4.5
26156	192	2740	4.5
26157	192	2743	4
26158	192	2745	3
26159	192	2752	3.5
26160	192	2757	5
26161	192	2765	4
26162	192	2766	3
26163	192	2768	4
26164	192	2778	5
26165	192	2788	4.5
26166	192	2789	4
26167	192	2790	4
26168	192	2802	3
26169	192	2804	4
26170	192	2806	3.5
26171	192	2811	4
26172	192	2822	4
26173	192	2827	4
26174	192	2837	4.5
26175	192	2862	3
26176	192	2863	1
26177	192	2869	4
26178	192	2895	4
26179	192	2898	4
26180	192	2935	5
26181	192	2938	4
26182	192	2943	4
26183	192	2953	4
26184	192	2966	1
26185	192	2967	5
26186	192	2969	5
26187	192	2991	4
26188	192	3003	4
26189	192	3023	2
26190	192	3025	3
26191	192	3026	5
26192	192	3048	2
26193	192	3051	4
26194	192	3073	3
26195	192	3075	4
26196	192	3083	2
26197	192	3087	5
26198	192	3108	3
26199	192	3126	1
26200	192	3127	5
26201	192	3133	3
26202	192	3135	4.5
26203	192	3136	3
26204	192	3137	4
26205	192	3138	3
26206	192	3142	4
26207	192	3143	4.5
26208	192	3149	3
26209	192	3150	2
26210	192	3152	4.5
26211	192	3153	2
26212	192	3156	3.5
26213	192	3169	5
26214	192	3170	4.5
26215	192	3173	5
26216	192	3174	4
26217	192	3176	4
26218	192	3177	4
26219	192	3183	3
26220	192	3184	3
26221	192	3191	3.5
26222	192	3195	4
26223	192	3196	4.5
26224	192	3199	4
26225	192	3203	3.5
26226	192	3211	4
26227	192	3219	4
26228	192	3259	3
26229	192	3260	3
26230	192	3270	4
26231	192	3272	3
26232	192	3277	3
26233	192	3281	2
26234	192	3322	4.5
26235	192	3324	3
26236	192	3326	4
26237	192	3332	4
26238	192	3337	3
26239	192	3345	1
26240	192	3365	4.5
26241	192	3370	4
26242	192	3373	2
26243	192	3375	3
26244	192	3380	5
26245	192	3382	1
26246	192	3383	4
26247	192	3392	4.5
26248	192	3404	3
26249	192	3419	4
26250	192	3423	2
26251	192	3424	3
26252	192	3425	1
26253	192	3427	3
26254	192	3482	4.5
26255	192	3483	4
26256	192	3565	4.5
26257	192	3599	4
26258	192	3634	4
26259	192	3682	4
26260	192	3683	4
26261	192	3696	2
26262	192	3698	3
26263	192	3699	4
26264	192	3701	2
26265	192	3703	3
26266	192	3704	4
26267	192	3709	1
26268	192	3715	4
26269	192	3717	3.5
26270	192	3726	3
26271	192	3727	1
26272	192	3733	4
26273	192	3738	2
26274	192	3750	4.5
26275	192	3758	4
26276	192	3762	4
26277	192	3767	4
26278	192	3770	4.5
26279	192	3772	4.5
26280	192	3779	4
26281	192	3784	4
26282	192	3797	4
26283	192	3798	4
26284	192	3804	4.5
26285	192	3809	4.5
26286	192	3811	4
26287	192	3812	5
26288	192	3815	3
26289	192	3816	2
26290	192	3818	4
26291	192	3822	4
26292	192	3824	3
26293	192	3829	3.5
26294	192	3856	3
26295	192	3859	4
26296	192	3860	4
26297	192	3874	1.5
26298	192	3885	4
26299	192	3887	4
26300	192	3888	4
26301	192	3899	3
26302	192	3900	2
26303	192	3903	3
26304	192	3904	1
26305	192	3905	3.5
26306	192	3910	3
26307	192	3927	4
26308	192	3939	2
26309	192	3940	4
26310	192	3956	4
26311	192	3959	4.5
26312	192	3966	4
26313	192	3969	4
26314	192	3970	5
26315	192	3987	1
26316	192	3999	4
26317	192	4002	3
26318	192	4032	4
26319	192	4033	5
26320	192	4052	3
26321	192	4062	4.5
26322	192	4063	5
26323	192	4067	4
26324	192	4075	3
26325	192	4080	4.5
26326	192	4089	3
26327	192	4095	3.5
26328	192	4109	3.5
26329	192	4126	3
26330	192	4135	3.5
26331	192	4145	3.5
26332	192	4152	5
26333	192	4154	4
26334	192	4173	2.5
26335	192	4188	4
26336	192	4213	3.5
26337	192	4216	3.5
26338	192	4232	3
26339	192	4241	3.5
26340	192	4281	4
26341	192	4282	2.5
26342	192	4312	4
26343	192	4316	2.5
26344	192	4319	1
26345	192	4324	3.5
26346	192	4384	2
26347	192	4416	2
26348	192	4417	4.5
26349	192	4449	4
26350	192	4454	5
26351	192	4460	5
26352	192	4462	4
26353	192	4485	5
26354	192	4487	2.5
26355	192	4488	2
26356	192	4498	3.5
26357	192	4523	4
26358	192	4582	3
26359	192	4595	3
26360	192	4600	3.5
26361	192	4630	4
26362	192	4633	3.5
26363	192	4642	4.5
26364	192	4646	3.5
26365	192	4660	4
26366	192	4665	4.5
26367	192	4672	3.5
26368	192	4673	3.5
26369	192	4702	4
26370	192	4705	4.5
26371	192	4706	5
26372	192	4716	4
26373	192	4720	4
26374	192	4727	4
26375	192	4732	4
26376	192	4737	4
26377	192	4758	3.5
26378	192	4774	3.5
26379	192	4785	4
26380	192	4799	4
26381	192	4803	5
26382	192	4804	3.5
26383	192	4812	4
26384	192	4813	3.5
26385	192	4816	4
26386	192	4818	5
26387	192	4837	3.5
26388	192	4838	4
26389	192	4845	4
26390	192	4852	4.5
26391	192	4868	4
26392	192	4907	3.5
26393	192	4934	4.5
26394	192	4941	3.5
26395	192	4971	4.5
26396	192	4985	4.5
26397	192	4997	3.5
26398	192	5007	3.5
26399	192	5015	5
26400	192	5043	3.5
26401	192	5065	3.5
26402	192	5090	3.5
26403	192	5098	4
26404	192	5102	4
26405	192	5112	4
26406	192	5149	4
26407	192	5187	4
26408	192	5202	3.5
26409	192	5208	3.5
26410	192	5209	5
26411	192	5214	4.5
26412	192	5266	3.5
26413	192	5275	5
26414	192	5284	4
26415	192	5288	2.5
26416	192	5295	4
26417	192	5297	3
26418	192	5306	5
26419	192	5311	4
26420	192	5333	4
26421	192	5431	3
26422	192	5566	4.5
26423	192	5618	3
26424	192	5710	4
26425	192	5724	4
26426	192	5743	4
26427	192	5802	5
26428	192	5827	5
26429	192	5835	2
26430	192	5842	4
26431	192	5868	4
26432	192	5881	4.5
26433	192	5883	4.5
26434	192	5885	5
26435	192	6141	4
26436	192	6206	5
26437	192	6237	4
26438	192	6272	5
26439	192	6413	4.5
26440	192	6449	4
26441	192	6452	4
26442	192	6565	4.5
26443	192	6606	3
26444	192	6622	3.5
26445	192	6632	5
26446	192	6633	4
26447	192	6650	3
26448	192	6667	5
26449	192	6709	0.5
26450	192	6716	4.5
26451	192	6723	3.5
26452	192	6725	4
26453	192	6746	2.5
26454	192	6754	3
26455	192	6780	3.5
26456	192	6789	5
26457	192	6811	1.5
26458	192	6819	1.5
26459	192	6828	5
26460	192	6829	3
26461	192	6842	4
26462	192	6847	4
26463	192	6849	3
26464	192	6869	3.5
26465	192	6893	5
26466	192	6894	4
26467	192	6941	4
26468	192	6942	4
26469	192	6946	0.5
26470	192	6961	4.5
26471	192	6969	4.5
26472	192	7018	1.5
26473	192	7020	3.5
26474	192	7022	4
26475	192	7032	2
26476	192	7033	4
26477	192	7036	3
26478	192	7074	3
26479	192	7083	4
26480	192	7089	3
26481	192	7176	3.5
26482	192	7192	0.5
26483	192	7206	4
26484	192	7216	4
26485	192	7219	2
26486	192	7220	3.5
26487	192	7227	4.5
26488	192	7230	4.5
26489	192	7232	4.5
26490	192	7244	3.5
26491	192	7262	3.5
26492	192	7267	4
26493	192	7273	4
26494	192	7276	5
26495	192	7285	3.5
26496	192	7286	4
26497	192	7299	5
26498	192	7302	5
26499	192	7306	4.5
26500	192	7320	3
26501	192	7358	3.5
26502	192	7363	2.5
26503	192	7377	5
26504	192	7383	3
26505	192	7417	3
26506	192	7422	4
26507	192	7437	4
26508	192	7439	4
26509	192	7492	3
26510	192	7494	3.5
26511	192	7495	3.5
26512	192	7500	5
26513	192	7504	4
26514	192	7508	4.5
26515	192	7510	4
26516	192	7511	3
26517	192	7523	2
26518	192	7536	3
26519	192	7537	5
26520	192	7538	3.5
26521	192	7545	3
26522	192	7559	4
26523	192	7565	4
26524	192	7568	1
26525	192	7573	0.5
26526	192	7579	5
26527	192	7580	4.5
26528	192	7587	5
26529	192	7589	4
26530	192	7593	4.5
26531	192	7595	4.5
26532	192	7597	3
26533	192	7598	3
26534	192	7599	4
26535	192	7608	3
26536	192	7618	2.5
26537	192	7626	3.5
26538	192	7633	4
26539	192	7638	2.5
26540	192	7641	4.5
26541	192	7645	4
26542	192	7730	5
26543	192	7782	4
26544	192	7812	4
26545	192	7895	4.5
26546	192	7912	3
26547	192	7937	3.5
26548	192	7938	4
26549	192	7977	5
26550	192	8161	4.5
26551	192	8169	5
26552	192	8329	5
26553	193	2	3
26554	193	46	3
26555	193	56	4
26556	193	137	1
26557	193	149	1
26558	193	161	3
26559	193	170	3
26560	193	231	5
26561	193	278	2
26562	193	288	5
26563	193	290	4
26564	193	327	2
26565	193	381	2
26566	193	427	5
26567	193	485	5
26568	193	523	5
26569	193	527	5
26570	193	528	5
26571	193	530	5
26572	193	568	3
26573	193	572	4
26574	193	647	3
26575	193	691	2
26576	193	721	4
26577	193	730	2
26578	193	736	5
26579	193	741	5
26580	193	746	1
26581	193	788	4
26582	193	831	5
26583	193	835	2
26584	193	836	5
26585	193	837	3
26586	193	839	2
26587	193	840	5
26588	193	843	5
26589	193	873	5
26590	193	875	1
26591	193	879	1
26592	193	886	4
26593	193	890	1
26594	193	895	4
26595	193	957	4
26596	193	959	4
26597	193	963	4
26598	193	972	4
26599	193	976	4
26600	193	982	5
26601	193	1030	5
26602	193	1042	5
26603	193	1103	4
26604	193	1113	3
26605	193	1114	3
26606	193	1115	4
26607	193	1116	4
26608	193	1117	4
26609	193	1122	3
26610	193	1131	3
26611	193	1136	4
26612	193	1260	2
26613	193	1261	4
26614	193	1323	4
26615	193	1351	4
26616	193	1368	1
26617	193	1400	2
26618	193	1495	2
26619	193	1514	3
26620	193	1532	1
26621	193	1569	1
26622	193	1574	3
26623	193	1575	3
26624	193	1578	3
26625	193	1580	3
26626	193	1584	2
26627	193	1615	2
26628	193	1636	1
26629	193	1638	5
26630	193	1640	3
26631	193	1647	4
26632	193	1651	4
26633	193	1656	5
26634	193	1660	5
26635	193	1665	3
26636	193	1692	3
26637	193	1695	4
26638	193	1730	5
26639	193	1784	2
26640	193	1814	3
26641	193	1858	3
26642	193	1904	4
26643	193	1905	2
26644	193	1917	3
26645	193	1959	1
26646	193	1963	1
26647	193	1964	1
26648	193	1995	4
26649	193	1998	1
26650	193	2020	5
26651	193	2022	4
26652	193	2023	4
26653	193	2025	3
26654	193	2026	4
26655	193	2052	5
26656	193	2057	4
26657	193	2078	2
26658	193	2091	4
26659	193	2099	4
26660	193	2108	3
26661	193	2109	4
26662	193	2122	5
26663	193	2198	5
26664	193	2211	5
26665	193	2239	5
26666	193	2295	4
26667	193	2330	3
26668	193	2352	4
26669	193	2373	1
26670	193	2387	1
26671	193	2417	1
26672	193	2423	5
26673	193	2457	2
26674	194	6	3
26675	194	45	2.5
26676	194	48	2.5
26677	194	72	3
26678	194	123	3.5
26679	194	127	2.5
26680	194	137	3
26681	194	261	2.5
26682	194	280	4
26683	194	300	5
26684	194	318	4
26685	194	337	4
26686	194	406	4
26687	194	427	4
26688	194	446	3.5
26689	194	521	3
26690	194	522	0.5
26691	194	528	0.5
26692	194	530	4.5
26693	194	607	3
26694	194	620	3.5
26695	194	648	3.5
26696	194	680	2
26697	194	859	3
26698	194	860	3
26699	194	947	4
26700	194	1030	1.5
26701	194	1033	3
26702	194	1039	2
26703	194	1066	3.5
26704	194	1111	0.5
26705	194	1144	1
26706	194	1241	4
26707	194	1257	4.5
26708	194	1274	3
26709	194	1278	4
26710	194	1297	4
26711	194	1298	3
26712	194	1372	2
26713	194	1378	3
26714	194	1393	3
26715	194	1412	3.5
26716	194	1428	3
26717	194	1434	1
26718	194	1471	5
26719	194	1485	3
26720	194	1528	3
26721	194	1614	1
26722	194	1844	4
26723	194	1865	4
26724	194	1879	1
26725	194	1934	4
26726	194	1989	3.5
26727	194	2002	3
26728	194	2046	4
26729	194	2074	2.5
26730	194	2077	2.5
26731	194	2080	4
26732	194	2099	0.5
26733	194	2135	3.5
26734	194	2169	3.5
26735	194	2180	4
26736	194	2260	2.5
26737	194	2282	4
26738	194	2360	3.5
26739	194	2361	5
26740	194	2366	2.5
26741	194	2392	3
26742	194	2403	3.5
26743	194	2468	0.5
26744	194	2521	3.5
26745	194	2531	2
26746	194	2551	3.5
26747	194	2616	1.5
26748	194	2621	3
26749	194	2629	1
26750	194	2646	2.5
26751	194	2705	1
26752	194	2804	3
26753	194	2837	3.5
26754	194	2877	3
26755	194	2878	3
26756	194	3109	3.5
26757	194	3152	4.5
26758	194	3173	4
26759	194	3218	1
26760	194	3265	3
26761	194	3280	4
26762	194	3320	3.5
26763	194	3323	1
26764	194	3324	3.5
26765	194	3329	2.5
26766	194	3330	3
26767	194	3332	3
26768	194	3337	3.5
26769	194	3406	2
26770	194	3482	2
26771	194	3681	5
26772	194	3788	1.5
26773	194	3822	3.5
26774	194	3856	2.5
26775	194	3860	4
26776	194	3870	2
26777	194	3888	3.5
26778	194	3927	3
26779	194	3938	4
26780	194	3998	3
26781	194	4036	4
26782	194	4077	3.5
26783	194	4095	4
26784	194	4126	4
26785	194	4154	4
26786	194	4156	4
26787	194	4215	3
26788	194	4257	3
26789	194	4286	3.5
26790	194	4386	1
26791	194	4402	4.5
26792	194	4451	4
26793	194	4459	2.5
26794	194	4485	4
26795	194	4488	2
26796	194	4673	1
26797	194	4702	1
26798	194	4706	4
26799	194	4779	2.5
26800	194	4803	4
26801	194	4807	3.5
26802	194	4909	3
26803	194	4932	3
26804	194	4940	3
26805	194	4941	3.5
26806	194	5003	3
26807	194	5014	4.5
26808	194	5042	4
26809	194	5052	4
26810	194	5221	3
26811	194	5276	3.5
26812	194	5305	2.5
26813	194	5330	4
26814	194	5344	1
26815	194	5370	3
26816	194	5374	2.5
26817	194	5377	4
26818	194	5378	3
26819	194	5391	3.5
26820	194	5427	5
26821	194	5618	2
26822	194	5619	4.5
26823	194	5625	3
26824	194	5678	4
26825	194	5682	5
26826	194	5689	3
26827	194	5729	3.5
26828	194	5743	4
26829	194	5802	2
26830	194	5818	2.5
26831	194	5822	3
26832	194	5888	3.5
26833	194	5891	4
26834	194	5892	0.5
26835	194	5896	2
26836	194	5899	4.5
26837	194	5900	0.5
26838	194	6200	4
26839	194	6275	1.5
26840	194	6328	4
26841	194	6373	1.5
26842	194	6384	2.5
26843	194	6406	2.5
26844	194	6463	2.5
26845	194	6469	4
26846	194	6488	3.5
26847	194	6512	1
26848	194	6539	3
26849	194	6540	3.5
26850	194	6565	4.5
26851	194	6601	3
26852	194	6606	2
26853	194	6622	3.5
26854	194	6635	5
26855	194	6638	3.5
26856	194	6643	3
26857	194	6644	3
26858	194	6673	4
26859	194	6700	3.5
26860	194	6723	3.5
26861	194	6724	3
26862	194	6746	3.5
26863	194	6754	3.5
26864	194	6757	2
26865	194	6763	3.5
26866	194	6794	3.5
26867	194	6819	2.5
26868	194	6823	5
26869	194	6827	1
26870	194	6843	3.5
26871	194	6857	2.5
26872	194	6868	3.5
26873	194	6881	4.5
26874	194	6905	4
26875	194	6941	3.5
26876	194	6950	4
26877	194	6967	2
26878	194	6968	1
26879	194	6983	3.5
26880	194	6996	3
26881	194	7006	3
26882	194	7017	3.5
26883	194	7035	4
26884	194	7036	4.5
26885	194	7066	3
26886	194	7078	2.5
26887	194	7083	2.5
26888	194	7086	2.5
26889	194	7095	0.5
26890	194	7108	2.5
26891	194	7151	4
26892	194	7155	1
26893	194	7161	2.5
26894	194	7170	3
26895	194	7173	2.5
26896	194	7179	3.5
26897	194	7182	0.5
26898	194	7194	5
26899	194	7200	3.5
26900	194	7203	2
26901	194	7206	3.5
26902	194	7208	2.5
26903	194	7218	4
26904	194	7219	4
26905	194	7238	2
26906	194	7240	3.5
26907	194	7268	3
26908	194	7278	2
26909	194	7280	3.5
26910	194	7286	2
26911	194	7301	2
26912	194	7307	3
26913	194	7311	4.5
26914	194	7314	4.5
26915	194	7323	3.5
26916	194	7346	3
26917	194	7347	3
26918	194	7358	3.5
26919	194	7376	3.5
26920	194	7378	2.5
26921	194	7385	3.5
26922	194	7391	3
26923	194	7395	3
26924	194	7398	4
26925	194	7406	4
26926	194	7408	3.5
26927	194	7417	4
26928	194	7423	0.5
26929	194	7437	3
26930	194	7439	4
26931	194	7454	3
26932	194	7459	4
26933	194	7465	1
26934	194	7469	2.5
26935	194	7470	2
26936	194	7476	3.5
26937	194	7478	3
26938	194	7480	2.5
26939	194	7481	3.5
26940	194	7482	1.5
26941	194	7497	3
26942	194	7499	3
26943	194	7505	1
26944	194	7587	4
26945	194	7597	3.5
26946	194	7599	3.5
26947	194	7601	3
26948	194	7621	0.5
26949	194	7636	2.5
26950	194	7677	2.5
26951	194	7687	3.5
26952	194	7690	3
26953	194	7710	3
26954	194	7716	3.5
26955	194	7719	3.5
26956	194	7733	3.5
26957	194	7762	2
26958	194	7765	2.5
26959	194	7801	2.5
26960	194	7816	4
26961	194	7825	3.5
26962	194	7857	2.5
26963	194	7858	3
26964	194	7884	3
26965	194	7885	3.5
26966	194	7891	3.5
26967	194	7915	4
26968	194	7954	4
26969	194	7977	4
26970	194	7987	1.5
26971	194	7989	3
26972	194	8018	3
26973	194	8036	2
26974	194	8058	3
26975	194	8086	2
26976	194	8087	3.5
26977	194	8089	0.5
26978	194	8134	4
26979	194	8143	5
26980	194	8155	3
26981	194	8156	4
26982	194	8163	4
26983	194	8181	5
26984	194	8183	3.5
26985	194	8192	3.5
26986	194	8199	3.5
26987	194	8246	3.5
26988	194	8270	2.5
26989	194	8273	1
26990	194	8280	4
26991	194	8286	2.5
26992	194	8309	4
26993	194	8311	3
26994	194	8348	3.5
26995	194	8349	3.5
26996	194	8409	3.5
26997	194	8410	3
26998	194	8420	3
26999	194	8456	1
27000	194	8474	5
27001	194	8492	3
27002	194	8504	3.5
27003	194	8533	3
27004	194	8573	3
27005	194	8574	0.5
27006	194	8586	3.5
27007	194	8633	3
27008	194	8639	4.5
27009	194	8653	3
27010	194	8661	2.5
27011	194	8671	3.5
27012	194	8685	2
27013	194	8688	3
27014	194	8692	3
27015	194	8718	2.5
27016	194	8720	3
27017	194	8725	5
27018	194	8751	4
27019	194	8765	3
27020	194	8771	4
27021	194	8773	5
27022	194	8795	3.5
27023	194	8797	4.5
27024	194	8803	3.5
27025	194	8819	3.5
27026	194	8823	4
27027	194	8836	4
27028	194	8868	3.5
27029	194	8870	3
27030	194	8876	3.5
27031	194	8877	3.5
27032	194	8896	2.5
27033	194	8902	3
27034	194	8903	2.5
27035	194	8915	3.5
27036	194	8918	4
27037	194	8925	2.5
27038	194	8948	2.5
27039	194	8955	0.5
27040	194	8984	3.5
27041	194	8990	3
27042	194	8991	3
27043	194	9035	2.5
27044	194	9037	2.5
27045	194	9051	2
27046	194	9054	4
27047	194	9055	3
27048	194	9067	2.5
27049	194	9110	3
27050	194	9130	3.5
27051	194	9132	3.5
27052	194	9154	2
27053	194	9161	2.5
27054	194	9165	3.5
27055	194	9210	3
27056	194	9222	1
27057	194	9228	3.5
27058	194	9247	2.5
27059	194	9255	2.5
27060	194	9264	3
27061	194	9269	3.5
27062	194	9270	3.5
27063	194	9279	3
27064	194	9284	2
27065	194	9288	1
27066	194	9302	3
27067	194	9325	3.5
27068	194	9329	1
27069	194	9335	2.5
27070	194	9353	3
27071	194	9368	2
27072	194	9373	4
27073	194	9379	2.5
27074	194	9386	3
27075	194	9394	3.5
27076	194	9418	2.5
27077	194	9451	4
27078	194	9461	3.5
27079	194	9477	4.5
27080	194	9506	2
27081	194	9507	3
27082	194	9515	3
27083	194	9550	5
27084	194	9559	3
27085	194	9756	4.5
27086	194	9805	3.5
27087	194	10032	2
27088	195	1	4
27089	195	10	4.5
27090	195	32	4.5
27091	195	45	3.5
27092	195	48	4
27093	195	99	4.5
27094	195	100	3
27095	195	125	4.5
27096	195	127	4
27097	195	231	4
27098	195	232	2
27099	195	261	5
27100	195	280	5
27101	195	290	5
27102	195	317	4
27103	195	427	4
27104	195	472	3.5
27105	195	483	3
27106	195	520	4
27107	195	523	4
27108	195	526	3.5
27109	195	565	4
27110	195	572	4.5
27111	195	631	5
27112	195	645	4.5
27113	195	647	4
27114	195	840	4.5
27115	195	887	4.5
27116	195	923	4
27117	195	959	4
27118	195	960	4
27119	195	961	3.5
27120	195	968	2
27121	195	972	4
27122	195	975	5
27123	195	984	4
27124	195	1018	2.5
27125	195	1048	5
27126	195	1078	3
27127	195	1113	3.5
27128	195	1117	3
27129	195	1131	2
27130	195	1233	5
27131	195	1261	4.5
27132	195	1344	4
27133	195	1375	4.5
27134	195	1411	4.5
27135	195	1463	5
27136	195	1494	3.5
27137	195	1819	3.5
27138	195	1844	4.5
27139	195	1903	2
27140	195	2002	5
27141	195	2034	4.5
27142	195	2057	4.5
27143	195	2075	4
27144	195	2210	4.5
27145	195	2245	4
27146	195	2282	4.5
27147	195	2366	4.5
27148	195	2596	2.5
27149	195	2616	5
27150	195	2750	3.5
27151	195	3052	3.5
27152	195	3083	4
27153	195	3109	4
27154	195	3150	2
27155	195	3163	5
27156	195	3177	5
27157	195	3323	4
27158	195	3333	5
27159	195	3578	3.5
27160	195	3803	5
27161	195	3807	4
27162	195	3860	4.5
27163	195	3886	4
27164	195	3904	3
27165	195	4173	4.5
27166	195	4279	2
27167	195	4365	4.5
27168	195	4458	4
27169	195	4705	4
27170	195	5005	4
27171	195	5202	4.5
27172	195	5207	4
27173	195	5329	4
27174	195	5365	4
27175	195	5562	5
27176	195	5795	4
27177	195	5839	3.5
27178	195	5883	3
27179	195	6200	4.5
27180	195	6390	2.5
27181	195	6417	4.5
27182	195	6563	4.5
27183	195	6606	3
27184	195	6727	4.5
27185	195	6946	4
27186	195	6948	4.5
27187	195	6967	4.5
27188	195	7061	4.5
27189	195	7062	2
27190	195	7137	4
27191	195	7157	3.5
27192	195	7161	3
27193	195	7179	4
27194	195	7200	4
27195	195	7283	2.5
27196	195	7307	3
27197	195	7347	3.5
27198	195	7538	3
27199	195	7549	4
27200	195	7653	4.5
27201	195	7670	4.5
27202	195	7719	4.5
27203	195	7772	5
27204	195	7798	4.5
27205	195	7926	4
27206	195	8130	3.5
27207	195	8168	4.5
27208	195	8187	2
27209	195	8197	2.5
27210	196	1	4
27211	196	10	2
27212	196	15	3
27213	196	19	2
27214	196	21	3
27215	196	34	4
27216	196	37	3
27217	196	42	3
27218	196	45	4
27219	196	46	3
27220	196	48	4
27221	196	56	3
27222	196	88	3
27223	196	99	5
27224	196	123	2
27225	196	127	3
27226	196	128	3
27227	196	130	3
27228	196	132	4
27229	196	135	3
27230	196	138	4
27231	196	141	2
27232	196	142	3
27233	196	144	3
27234	196	145	2
27235	196	146	3
27236	196	149	3
27237	196	157	1
27238	196	161	3
27239	196	162	3
27240	196	177	3
27241	196	181	2
27242	196	190	3
27243	196	194	3
27244	196	196	3
27245	196	199	3
27246	196	203	1
27247	196	204	4
27248	196	206	2
27249	196	209	4
27250	196	223	3
27251	196	224	2
27252	196	227	3
27253	196	232	4
27254	196	233	4
27255	196	236	3
27256	196	242	3
27257	196	252	3
27258	196	255	3
27259	196	258	3
27260	196	261	4
27261	196	264	3
27262	196	276	4
27263	196	278	4
27264	196	281	1
27265	196	287	3
27266	196	290	3
27267	196	299	2
27268	196	300	3
27269	196	305	2
27270	196	310	3
27271	196	311	3
27272	196	316	2
27273	196	317	5
27274	196	318	4
27275	196	321	3
27276	196	322	3
27277	196	324	4
27278	196	327	3
27279	196	328	3
27280	196	330	3
27281	196	334	2
27282	196	336	4
27283	196	337	4
27284	196	340	3
27285	196	341	3
27286	196	369	2
27287	196	370	3
27288	196	383	3
27289	196	389	4
27290	196	391	3
27291	196	403	3
27292	196	404	3
27293	196	406	4
27294	196	412	3
27295	196	422	4
27296	196	427	3
27297	196	431	2
27298	196	435	3
27299	196	443	3
27300	196	446	3
27301	196	453	4
27302	196	459	4
27303	196	464	2
27304	196	469	4
27305	196	472	5
27306	196	474	3
27307	196	475	3
27308	196	477	3
27309	196	483	3
27310	196	490	1
27311	196	495	4
27312	196	496	3
27313	196	497	3
27314	196	514	3
27315	196	519	1
27316	196	520	3
27317	196	521	4
27318	196	522	4
27319	196	523	4
27320	196	524	3
27321	196	525	3
27322	196	526	3
27323	196	527	4
27324	196	528	4
27325	196	529	4
27326	196	530	3
27327	196	565	4
27328	196	612	4
27329	196	620	4
27330	196	622	3
27331	196	647	5
27332	196	1103	4
27333	197	22	4
27334	197	42	3
27335	197	99	4
27336	197	321	1
27337	197	331	3
27338	197	337	2
27339	197	381	3
27340	197	384	2
27341	197	611	3
27342	197	622	3
27343	197	684	1
27344	197	834	5
27345	197	839	3
27346	197	957	4
27347	197	972	4
27348	197	1148	3
27349	197	1203	2
27350	197	1288	3
27351	197	1397	3
27352	197	1492	5
27353	197	1613	3
27354	197	1800	4
27355	197	1822	5
27356	197	1943	3
27357	197	2099	1
27358	197	2389	4
27359	197	2768	2
27360	197	2800	3
27361	197	3186	4
27362	197	3512	3
27363	197	3536	3
27364	197	3812	4
27365	197	4061	5
27366	197	4197	2
27367	197	4706	5
27368	198	1	5
27369	198	17	5
27370	198	34	2
27371	198	48	5
27372	198	54	5
27373	198	141	3
27374	198	189	4
27375	198	195	4
27376	198	204	5
27377	198	218	4
27378	198	231	5
27379	198	235	5
27380	198	261	4
27381	198	280	5
27382	198	296	4
27383	198	311	4
27384	198	327	3
27385	198	339	2
27386	198	400	3
27387	198	406	4
27388	198	427	5
27389	198	438	4
27390	198	472	5
27391	198	485	4
27392	198	503	4
27393	198	523	4
27394	198	526	4
27395	198	528	5
27396	198	530	4
27397	198	538	4
27398	198	657	4
27399	198	696	5
27400	198	725	5
27401	198	726	5
27402	198	730	5
27403	198	734	5
27404	198	736	5
27405	198	741	5
27406	198	742	5
27407	198	743	4
27408	198	754	4
27409	198	806	5
27410	198	836	4
27411	198	843	5
27412	198	844	3
27413	198	848	5
27414	198	875	4
27415	198	877	5
27416	198	879	4
27417	198	886	4
27418	198	888	5
27419	198	890	3
27420	198	892	5
27421	198	894	5
27422	198	895	5
27423	198	912	5
27424	198	919	5
27425	198	920	4
27426	198	923	3
27427	198	927	5
27428	198	939	5
27429	198	945	5
27430	198	949	5
27431	198	950	5
27432	198	952	5
27433	198	957	5
27434	198	959	3
27435	198	960	5
27436	198	961	5
27437	198	963	4
27438	198	968	4
27439	198	972	4
27440	198	975	5
27441	198	976	5
27442	198	981	5
27443	198	983	4
27444	198	987	4
27445	198	991	5
27446	198	992	5
27447	198	995	3
27448	198	999	3
27449	198	1000	5
27450	198	1002	2
27451	198	1004	4
27452	198	1007	5
27453	198	1012	4
27454	198	1018	4
27455	198	1019	5
27456	198	1024	5
27457	198	1025	4
27458	198	1027	5
27459	198	1029	4
27460	198	1030	4
27461	198	1038	4
27462	198	1040	5
27463	198	1045	4
27464	198	1048	3
27465	198	1051	5
27466	198	1055	4
27467	198	1059	5
27468	198	1061	4
27469	198	1063	3
27470	198	1066	5
27471	198	1103	3
27472	198	1105	5
27473	198	1116	4
27474	198	1134	5
27475	198	1183	1
27476	198	1202	3
27477	198	1257	3
27478	198	1265	4
27479	198	1278	3
27480	198	1296	5
27481	198	1302	4
27482	198	1310	4
27483	198	1315	2
27484	198	1338	5
27485	198	1341	5
27486	198	1399	5
27487	198	1482	4
27488	198	1485	5
27489	198	1486	4
27490	198	1512	4
27491	198	1514	5
27492	198	1518	4
27493	198	1519	3
27494	198	1520	4
27495	198	1521	5
27496	198	1523	4
27497	198	1524	4
27498	198	1525	5
27499	198	1526	5
27500	198	1527	5
27501	198	1528	4
27502	198	1529	5
27503	198	1531	4
27504	198	1574	3
27505	198	1591	5
27506	198	1619	3
27507	198	1624	5
27508	198	1625	5
27509	198	1636	4
27510	198	1641	3
27511	198	1660	5
27512	198	1739	4
27513	198	1741	5
27514	198	1749	4
27515	198	1761	4
27516	198	1776	3
27517	198	1777	5
27518	198	1778	4
27519	198	1779	4
27520	198	1780	5
27521	198	1812	5
27522	198	1820	4
27523	198	1829	5
27524	198	1830	3
27525	198	1839	5
27526	198	1847	4
27527	198	1850	5
27528	198	1860	3
27529	198	1861	4
27530	198	1864	5
27531	198	1883	3
27532	198	1901	5
27533	198	1902	5
27534	198	1906	5
27535	198	1907	5
27536	198	1916	4
27537	198	1917	4
27538	198	1943	3
27539	198	1973	1
27540	198	2002	4
27541	198	2037	4
27542	198	2052	5
27543	198	2057	5
27544	198	2067	4
27545	198	2078	4
27546	198	2080	3
27547	198	2099	4
27548	198	2108	3
27549	198	2122	3
27550	198	2128	4
27551	198	2144	4
27552	198	2151	3
27553	198	2153	3
27554	198	2160	1
27555	198	2172	4
27556	198	2201	3
27557	198	2207	3
27558	198	2210	5
27559	198	2211	3
27560	198	2217	3
27561	198	2218	2
27562	198	2233	5
27563	198	2239	5
27564	198	2279	4
27565	198	2282	5
27566	198	2283	3
27567	198	2306	3
27568	198	2312	1
27569	198	2325	1
27570	198	2329	5
27571	198	2330	4
27572	198	2331	5
27573	198	2332	5
27574	198	2333	5
27575	198	2339	4
27576	198	2367	1
27577	198	2373	1
27578	198	2376	3
27579	198	2378	5
27580	198	2387	3
27581	198	2389	4
27582	198	2397	3
27583	198	2398	3
27584	198	2401	1
27585	198	2402	2
27586	198	2403	5
27587	198	2430	4
27588	198	2435	5
27589	198	2441	2
27590	198	2454	5
27591	198	2455	4
27592	198	2458	3
27593	198	2459	5
27594	198	2467	3
27595	198	2484	4
27596	198	2487	5
27597	198	2496	1
27598	198	2521	4
27599	198	2531	5
27600	198	2542	4
27601	198	2543	4
27602	198	2573	4
27603	198	2592	3
27604	198	2601	5
27605	198	2627	4
27606	198	2629	1
27607	198	2634	4
27608	198	2664	3
27609	198	2666	4
27610	198	2667	4
27611	198	2668	3
27612	198	2704	4
27613	198	2713	4
27614	198	2714	5
27615	198	2716	5
27616	198	2761	4
27617	198	2766	4
27618	198	2778	5
27619	198	2783	4
27620	198	2784	4
27621	198	2788	4
27622	198	2804	2
27623	198	2806	2
27624	198	2808	4
27625	198	2811	5
27626	198	2812	5
27627	198	2816	5
27628	198	2855	4
27629	198	2870	3
27630	198	2908	5
27631	198	2910	5
27632	198	3013	5
27633	198	3018	5
27634	198	3073	5
27635	198	3934	4
27636	199	24	2
27637	199	29	3
27638	199	32	3
27639	199	71	3
27640	199	161	4
27641	199	171	1
27642	199	227	1
27643	199	231	5
27644	199	278	3
27645	199	290	5
27646	199	293	1
27647	199	375	5
27648	199	426	2
27649	199	427	4
27650	199	449	1
27651	199	457	2
27652	199	485	5
27653	199	523	5
27654	199	580	1
27655	199	582	5
27656	199	610	3
27657	199	630	3
27658	199	631	5
27659	199	647	4
27660	199	654	5
27661	199	696	4
27662	199	746	5
27663	199	788	5
27664	199	828	5
27665	199	875	4
27666	199	895	5
27667	199	915	1
27668	199	917	1
27669	199	959	5
27670	199	963	5
27671	199	968	5
27672	199	972	5
27673	199	976	5
27674	199	1013	5
27675	199	1030	5
27676	199	1034	1
27677	199	1060	5
27678	199	1065	5
27679	199	1071	5
27680	199	1084	4
27681	199	1103	5
27682	199	1113	2
27683	199	1114	5
27684	199	1116	5
27685	199	1117	5
27686	199	1118	5
27687	199	1136	3
27688	199	1233	2
27689	199	1244	3
27690	199	1260	3
27691	199	1261	5
27692	199	1265	4
27693	199	1322	1
27694	199	1340	1
27695	199	1351	4
27696	199	1352	1
27697	199	1369	4
27698	199	1382	3
27699	199	1400	3
27700	199	1456	1
27701	199	1482	1
27702	199	1495	1
27703	199	1574	5
27704	199	1575	5
27705	199	1584	5
27706	199	1597	5
27707	199	1608	5
27708	199	1615	5
27709	199	1651	5
27710	199	1653	2
27711	199	1654	3
27712	199	1665	1
27713	199	1676	2
27714	199	1677	5
27715	199	1771	1
27716	199	1801	1
27717	199	1810	5
27718	199	1811	2
27719	199	1858	1
27720	199	1875	1
27721	199	1877	3
27722	199	1889	1
27723	199	1904	5
27724	199	1917	5
27725	199	1962	3
27726	199	1963	4
27727	199	1995	5
27728	199	2020	1
27729	199	2021	5
27730	199	2022	5
27731	199	2023	4
27732	199	2025	3
27733	199	2026	3
27734	199	2043	3
27735	199	2044	1
27736	199	2057	5
27737	199	2087	1
27738	199	2089	5
27739	199	2099	1
27740	199	2108	3
27741	199	2110	1
27742	199	2122	5
27743	199	2124	5
27744	199	2125	4
27745	199	2128	5
27746	199	2129	5
27747	199	2131	3
27748	199	2136	5
27749	199	2158	5
27750	199	2178	1
27751	199	2305	3
27752	199	2321	2
27753	199	2330	4
27754	199	2387	5
27755	199	2388	4
27756	199	2423	5
27757	199	2424	2
27758	199	2447	1
27759	199	2457	5
27760	199	2527	3
27761	199	2542	5
27762	199	2610	2
27763	199	2628	3
27764	199	2654	5
27765	199	2678	1
27766	199	2757	5
27767	199	2782	3
27768	199	2800	5
27769	199	2877	5
27770	199	2889	1
27771	199	2919	1
27772	199	2921	3
27773	199	2922	5
27774	199	2924	4
27775	199	2925	5
27776	199	2926	5
27777	199	2927	2
27778	199	2963	5
27779	199	2971	1
27780	199	2982	2
27781	199	3000	1
27782	199	3026	4
27783	199	3062	1
27784	199	3091	3
27785	199	3093	5
27786	199	3094	5
27787	199	3098	3
27788	199	3100	1
27789	199	3117	5
27790	199	3141	1
27791	199	3149	1
27792	199	3151	5
27793	199	3158	1
27794	199	4579	5
27795	200	261	4.5
27796	200	280	5
27797	200	317	5
27798	200	406	4
27799	200	439	2.5
27800	200	526	4
27801	200	626	0.5
27802	200	647	3.5
27803	200	1272	1.5
27804	200	1432	3.5
27805	200	1848	2
27806	200	2284	2.5
27807	200	2540	3
27808	200	2614	0.5
27809	200	2744	3
27810	200	2790	4
27811	200	2939	3
27812	200	2962	3
27813	200	5273	0.5
27814	200	7395	3.5
27815	200	7692	3
27816	201	24	2
27817	201	130	3
27818	201	144	4
27819	201	156	3
27820	201	157	1
27821	201	235	2
27822	201	303	2
27823	201	314	2
27824	201	327	3
27825	201	521	3
27826	201	525	2
27827	201	538	3
27828	201	580	2
27829	201	652	3
27830	201	654	1
27831	201	696	5
27832	201	862	5
27833	201	873	2
27834	201	878	1
27835	201	886	5
27836	201	887	3
27837	201	913	1
27838	201	947	3
27839	201	959	1
27840	201	961	2
27841	201	972	1
27842	201	975	5
27843	201	983	5
27844	201	1030	3
27845	201	1066	1
27846	201	1122	4
27847	201	1198	3
27848	201	1222	4
27849	201	1226	2
27850	201	1257	4
27851	201	1278	3
27852	201	1315	4
27853	201	1375	4
27854	201	1399	4
27855	201	1402	3
27856	201	1411	5
27857	201	1472	4
27858	201	1586	4
27859	201	1627	1
27860	201	1660	3
27861	201	1685	2
27862	201	1692	2
27863	201	1814	2
27864	201	1833	4
27865	201	1850	4
27866	201	1897	3
27867	201	1905	4
27868	201	1907	3
27869	201	1933	4
27870	201	1934	2
27871	201	1938	3
27872	201	1984	3
27873	201	1989	5
27874	201	1994	4
27875	201	2002	5
27876	201	2015	3
27877	201	2033	4
27878	201	2054	2
27879	201	2058	5
27880	201	2065	3
27881	201	2081	4
27882	201	2095	3
27883	201	2144	3
27884	201	2153	3
27885	201	2160	3
27886	201	2163	5
27887	201	2167	2
27888	201	2170	2
27889	201	2178	4
27890	201	2180	4
27891	201	2219	5
27892	201	2237	3
27893	201	2247	3
27894	201	2248	3
27895	201	2260	3
27896	201	2261	2
27897	201	2262	3
27898	201	2271	4
27899	201	2272	2
27900	201	2282	4
27901	201	2295	1
27902	201	2304	3
27903	201	2308	3
27904	201	2311	3
27905	201	2326	2
27906	201	2332	5
27907	201	2366	4
27908	201	2381	2
27909	201	2398	4
27910	201	2442	4
27911	201	2542	1
27912	201	2543	2
27913	201	2568	3
27914	201	2610	2
27915	201	2614	3
27916	201	2704	4
27917	201	2705	5
27918	201	2713	2
27919	201	2744	3
27920	201	2804	5
27921	201	2823	3
27922	201	2827	3
27923	201	2837	4
27924	201	2862	4
27925	201	2863	4
27926	201	2938	5
27927	201	2966	2
27928	201	2967	3
27929	201	3025	2
27930	201	3080	4
27931	201	3150	2
27932	201	3173	1
27933	201	3177	4
27934	201	3181	3
27935	201	3197	3
27936	201	3219	3
27937	201	3326	4
27938	201	3424	4
27939	201	3427	4
27940	201	3578	4
27941	201	3634	4
27942	201	3636	5
27943	201	3683	5
27944	201	3696	4
27945	201	3698	2
27946	201	3733	4
27947	201	3770	3
27948	201	3772	5
27949	201	3785	4
27950	201	3821	5
27951	201	3822	2
27952	201	3852	3
27953	201	3856	5
27954	201	3860	3
27955	201	3869	3
27956	201	3870	1
27957	201	3874	4
27958	201	3885	5
27959	201	3888	2
27960	201	3904	2
27961	201	3910	5
27962	201	3939	2
27963	201	4127	1
27964	201	4134	4
27965	201	4135	4
27966	201	4154	5
27967	201	4162	2
27968	201	4167	4
27969	201	4177	3
27970	201	4184	4
27971	201	4195	3
27972	201	4204	2
27973	202	1	4
27974	202	16	4.5
27975	202	32	4.5
27976	202	34	3.5
27977	202	45	3.5
27978	202	48	5
27979	202	99	2
27980	202	127	2.5
27981	202	203	4
27982	202	261	4.5
27983	202	269	2
27984	202	272	3.5
27985	202	280	5
27986	202	305	2
27987	202	327	3.5
27988	202	337	4
27989	202	380	4
27990	202	406	3.5
27991	202	427	3
27992	202	446	4
27993	202	472	5
27994	202	481	3
27995	202	524	3.5
27996	202	526	4
27997	202	530	4
27998	202	538	5
27999	202	565	2.5
28000	202	620	2
28001	202	622	2.5
28002	202	696	5
28003	202	949	4
28004	202	1030	3
28005	202	1078	2
28006	202	1090	3.5
28007	202	1591	4.5
28008	202	2001	2.5
28009	202	2057	4.5
28010	202	2199	3.5
28011	202	2282	4.5
28012	202	2528	3
28013	202	2651	4
28014	202	2750	3.5
28015	202	2797	4
28016	202	3039	4
28017	202	3686	4.5
28018	202	5054	4.5
28019	202	5090	2
28020	202	5209	4
28021	202	6714	3.5
28022	203	1	1
28023	203	6	4
28024	203	7	3
28025	203	25	5
28026	203	32	4
28027	203	36	5
28028	203	40	5
28029	203	45	5
28030	203	48	5
28031	203	65	2
28032	203	99	3
28033	203	100	3
28034	203	109	4
28035	203	123	4
28036	203	127	4
28037	203	130	1
28038	203	142	5
28039	203	181	3
28040	203	196	4
28041	203	207	3
28042	203	208	5
28043	203	223	5
28044	203	227	1
28045	203	231	5
28046	203	254	4
28047	203	258	5
28048	203	259	2
28049	203	261	2
28050	203	264	4
28051	203	278	4
28052	203	280	5
28053	203	290	1
28054	203	298	5
28055	203	300	5
28056	203	317	5
28057	203	318	5
28058	203	327	4
28059	203	337	5
28060	203	340	3
28061	203	372	3
28062	203	380	5
28063	203	383	4
28064	203	389	5
28065	203	391	3
28066	203	397	4
28067	203	406	4
28068	203	416	3
28069	203	419	3
28070	203	422	5
28071	203	427	4
28072	203	431	2
28073	203	444	3
28074	203	445	5
28075	203	454	2
28076	203	460	3
28077	203	479	4
28078	203	483	4
28079	203	485	5
28080	203	490	2
28081	203	499	5
28082	203	521	4
28083	203	523	5
28084	203	526	4
28085	203	538	4
28086	203	565	2
28087	203	622	4
28088	203	639	3
28089	203	645	3
28090	203	647	5
28091	203	671	2
28092	203	694	4
28093	203	696	5
28094	203	721	4
28095	203	724	5
28096	203	730	5
28097	203	732	4
28098	203	734	5
28099	203	737	4
28100	203	742	5
28101	203	745	5
28102	203	746	5
28103	203	755	2
28104	203	757	4
28105	203	770	4
28106	203	791	5
28107	203	807	5
28108	203	844	5
28109	203	864	4
28110	203	877	4
28111	203	878	5
28112	203	892	4
28113	203	895	5
28114	203	898	4
28115	203	899	5
28116	203	913	4
28117	203	915	2
28118	203	923	5
28119	203	959	5
28120	203	961	4
28121	203	963	5
28122	203	970	4
28123	203	972	4
28124	203	975	2
28125	203	976	5
28126	203	983	5
28127	203	984	5
28128	203	987	5
28129	203	994	5
28130	203	1000	4
28131	203	1002	2
28132	203	1006	5
28133	203	1010	4
28134	203	1019	5
28135	203	1025	5
28136	203	1030	5
28137	203	1037	4
28138	203	1038	5
28139	203	1047	5
28140	203	1051	5
28141	203	1053	5
28142	203	1055	3
28143	203	1066	5
28144	203	1071	5
28145	203	1087	2
28146	203	1103	1
28147	203	1112	5
28148	203	1114	1
28149	203	1116	2
28150	203	1117	1
28151	203	1118	1
28152	203	1119	1
28153	203	1125	3
28154	203	1127	3
28155	203	1136	4
28156	203	1145	3
28157	203	1181	4
28158	203	1203	3
28159	203	1244	1
28160	203	1257	4
28161	203	1260	2
28162	203	1261	5
28163	203	1290	3
28164	203	1296	5
28165	203	1315	4
28166	203	1326	5
28167	203	1351	4
28168	203	1361	5
28169	203	1368	3
28170	203	1369	2
28171	203	1384	2
28172	203	1394	2
28173	203	1402	5
28174	203	1482	3
28175	203	1485	5
28176	203	1489	4
28177	203	1490	5
28178	203	1517	3
28179	203	1521	5
28180	203	1522	5
28181	203	1526	5
28182	203	1564	5
28183	203	1565	5
28184	203	1566	5
28185	203	1574	3
28186	203	1575	4
28187	203	1586	5
28188	203	1591	5
28189	203	1608	4
28190	203	1625	4
28191	203	1627	4
28192	203	1654	4
28193	203	1660	4
28194	203	1668	3
28195	203	1672	4
28196	203	1674	4
28197	203	1675	4
28198	203	1702	3
28199	203	1703	5
28200	203	1707	1
28201	203	1749	4
28202	203	1796	4
28203	203	1812	5
28204	203	1839	5
28205	203	1896	1
28206	203	1904	1
28207	203	1915	4
28208	203	1933	4
28209	203	1992	3
28210	203	2020	4
28211	203	2022	5
28212	203	2080	2
28213	203	2090	1
28214	203	2099	2
28215	203	2108	2
28216	203	2135	5
28217	203	2159	1
28218	203	2180	5
28219	203	2184	5
28220	203	2202	5
28221	203	2210	5
28222	203	2217	3
28223	203	2230	5
28224	203	2244	1
28225	203	2247	3
28226	203	2271	3
28227	203	2272	5
28228	203	2285	2
28229	203	2295	5
28230	203	2304	5
28231	203	2313	5
28232	203	2316	5
28233	203	2330	3
28234	203	2332	5
28235	203	2353	3
28236	203	2358	4
28237	203	2362	4
28238	203	2373	4
28239	203	2387	3
28240	203	2398	3
28241	203	2413	4
28242	203	2414	2
28243	203	2428	2
28244	203	2442	4
28245	203	2455	3
28246	203	2466	4
28247	203	2467	3
28248	203	2488	4
28249	203	2491	5
28250	203	2524	5
28251	203	2526	1
28252	203	2527	1
28253	203	2534	2
28254	203	2587	3
28255	203	2588	4
28256	203	2594	3
28257	203	2598	5
28258	203	2600	1
28259	203	2602	4
28260	203	2610	5
28261	203	2656	5
28262	203	2668	5
28263	203	2711	5
28264	203	2718	4
28265	203	2751	3
28266	203	2770	2
28267	203	2800	1
28268	204	58	4.5
28269	204	100	4.5
28270	204	261	4.5
28271	204	280	4.5
28272	204	472	5
28273	204	485	4
28274	204	526	4.5
28275	204	538	4.5
28276	204	583	4.5
28277	204	726	4
28278	204	734	3.5
28279	204	741	4.5
28280	204	878	5
28281	204	923	5
28282	204	957	5
28283	204	964	3.5
28284	204	969	4.5
28285	204	970	5
28286	204	975	4.5
28287	204	981	4
28288	204	987	4.5
28289	204	1265	4
28290	204	1296	4.5
28291	204	1528	4.5
28292	204	2144	4.5
28293	204	2167	3
28294	204	2172	2
28295	204	2282	4.5
28296	204	2366	4
28297	204	2398	4.5
28298	204	3323	4.5
28299	204	4458	4
28300	204	4491	4.5
28301	204	5329	4
28302	204	6413	4.5
28303	204	6462	4.5
28304	204	6760	4.5
28305	204	6816	4.5
28306	205	14	4
28307	205	16	4
28308	205	19	1
28309	205	21	3
28310	205	25	3
28311	205	32	3
28312	205	34	4
28313	205	37	2
28314	205	43	4
28315	205	45	3
28316	205	48	3
28317	205	127	4
28318	205	138	4
28319	205	139	4
28320	205	142	1
28321	205	161	3
28322	205	162	3
28323	205	170	1
28324	205	176	2
28325	205	181	1
28326	205	191	1
28327	205	197	3
28328	205	202	3
28329	205	203	1
28330	205	207	4
28331	205	208	3
28332	205	223	3
28333	205	224	1
28334	205	247	5
28335	205	250	3
28336	205	254	2
28337	205	261	5
28338	205	264	5
28339	205	269	1
28340	205	278	1
28341	205	279	3
28342	205	280	5
28343	205	300	3
28344	205	305	1
28345	205	309	3
28346	205	310	3
28347	205	317	4
28348	205	318	3
28349	205	321	4
28350	205	327	1
28351	205	328	4
28352	205	330	3
28353	205	337	4
28354	205	340	3
28355	205	380	2
28356	205	383	1
28357	205	389	1
28358	205	403	4
28359	205	406	5
28360	205	419	2
28361	205	425	4
28362	205	427	3
28363	205	436	4
28364	205	446	2
28365	205	472	5
28366	205	483	3
28367	205	497	2
28368	205	520	3
28369	205	525	3
28370	205	526	4
28371	205	530	2
28372	205	622	3
28373	206	17	2.5
28374	206	188	5
28375	206	231	1
28376	206	261	3.5
28377	206	280	2.5
28378	206	472	4
28379	206	645	3.5
28380	206	991	4
28381	206	1045	4
28382	206	1233	3
28383	206	1322	3.5
28384	206	1344	4
28385	206	1463	4
28386	206	1834	4
28387	206	2057	3
28388	206	2078	3
28389	206	2151	4
28390	206	2282	3.5
28391	206	2366	4
28392	206	2398	3
28393	206	2399	4
28394	206	2520	3
28395	206	2616	4
28396	206	2751	3
28397	206	2823	3
28398	206	3073	2
28399	206	3109	4.5
28400	206	3150	5
28401	206	3163	2.5
28402	206	3807	4
28403	206	3868	3.5
28404	206	3874	4
28405	206	4328	3.5
28406	206	4491	1
28407	206	4705	3
28408	206	5005	4.5
28409	206	5167	4
28410	206	5269	3
28411	206	5329	3.5
28412	206	5365	4.5
28413	206	5795	4.5
28414	206	6370	4
28415	206	6408	4
28416	206	6765	3.5
28417	206	6823	3.5
28418	206	6828	3.5
28419	206	6946	4
28420	206	7061	3
28421	206	7157	2.5
28422	206	7179	4
28423	206	7376	3.5
28424	206	7506	1.5
28425	206	7573	5
28426	206	7583	3.5
28427	206	7586	4
28428	206	7720	3.5
28429	206	7914	4.5
28430	206	7932	3.5
28431	206	7956	4
28432	206	8086	4.5
28433	206	8096	2
28434	206	8130	4
28435	206	8163	3
28436	206	8224	4
28437	206	8303	4
28438	206	8354	4
28439	206	8374	4
28440	206	8422	4
28441	206	8489	4
28442	206	8538	3
28443	206	8629	3
28444	206	8630	4
28445	206	9073	3.5
28446	206	9225	4.5
28447	206	9506	3.5
28448	206	9547	4
28449	206	9661	4
28450	206	9798	4
28451	206	9838	4.5
28452	206	10092	4.5
28453	207	11	4
28454	207	16	5
28455	207	25	4
28456	207	127	4
28457	207	140	3
28458	207	151	4
28459	207	261	5
28460	207	280	5
28461	207	298	3
28462	207	317	5
28463	207	337	3
28464	207	380	5
28465	207	422	4
28466	207	455	3
28467	207	472	4
28468	207	497	4
28469	207	524	4
28470	207	525	3
28471	207	530	4
28472	207	583	4
28473	207	696	5
28474	207	755	2
28475	207	762	3
28476	207	863	4
28477	207	961	3
28478	207	969	5
28479	207	972	3
28480	207	975	5
28481	207	983	4
28482	207	1006	1
28483	207	1018	3
28484	207	1025	4
28485	207	1026	4
28486	207	1045	3
28487	207	1061	3
28488	207	1090	3
28489	207	1133	5
28490	207	1144	4
28491	207	1189	5
28492	207	1215	3
28493	207	1226	1
28494	207	1296	3
28495	207	1302	4
28496	207	1337	4
28497	207	1340	2
28498	207	1361	4
28499	207	1375	2
28500	207	1411	4
28501	207	1485	4
28502	207	1494	5
28503	207	1521	4
28504	207	1586	5
28505	207	1591	2
28506	207	1722	4
28507	207	1730	2
28508	207	1749	4
28509	207	1796	5
28510	207	1822	4
28511	207	1883	4
28512	207	1902	1
28513	207	1956	5
28514	207	2002	3
28515	207	2014	2
28516	207	2064	2
28517	207	2163	5
28518	207	2210	5
28519	207	2211	4
28520	207	2239	3
28521	207	2272	5
28522	207	2313	3
28523	207	2329	4
28524	207	2332	4
28525	207	2366	4
28526	207	2389	1
28527	207	2430	2
28528	207	2442	1
28529	207	2531	1
28530	207	2545	4
28531	207	2568	4
28532	207	2594	3
28533	207	2611	3
28534	207	2666	4
28535	207	2684	4
28536	207	2701	4
28537	207	2711	4
28538	207	2750	4
28539	207	2788	3
28540	207	2800	3
28541	207	2837	5
28542	207	2849	3
28543	207	2967	4
28544	207	2975	3
28545	207	3026	3
28546	207	3073	4
28547	207	3087	5
28548	207	3108	5
28549	207	3131	2
28550	207	3132	3
28551	207	3134	1
28552	207	3135	4
28553	207	3160	4
28554	207	3184	5
28555	207	3285	4
28556	207	3319	4
28557	207	3389	3
28558	208	45	4
28559	208	99	5
28560	208	127	4
28561	208	130	4
28562	208	138	5
28563	208	142	3
28564	208	161	3
28565	208	181	3
28566	208	203	2
28567	208	224	2
28568	208	254	1
28569	208	258	3
28570	208	261	1
28571	208	264	2
28572	208	278	3
28573	208	280	5
28574	208	300	4
28575	208	305	1
28576	208	310	4
28577	208	317	4
28578	208	340	3
28579	208	360	3
28580	208	383	3
28581	208	406	4
28582	208	522	2
28583	208	524	5
28584	208	525	3
28585	208	526	4
28586	208	528	2
28587	208	667	5
28588	209	11	4
28589	209	231	5
28590	209	236	4
28591	209	324	4
28592	209	328	5
28593	209	343	4
28594	209	406	4
28595	209	472	5
28596	209	483	4
28597	209	522	4
28598	209	524	5
28599	209	526	3
28600	209	527	5
28601	209	677	3
28602	209	721	4
28603	209	734	4
28604	209	736	5
28605	209	741	5
28606	209	742	4
28607	209	749	4
28608	209	816	4
28609	209	831	5
28610	209	835	5
28611	209	836	5
28612	209	837	5
28613	209	840	4
28614	209	843	5
28615	209	895	5
28616	209	897	4
28617	209	898	5
28618	209	960	3
28619	209	964	4
28620	209	972	5
28621	209	1025	3
28622	209	1042	1
28623	209	1066	4
28624	209	1133	4
28625	209	1148	4
28626	209	1370	5
28627	209	1399	4
28628	209	1514	4
28629	209	1518	3
28630	209	1528	4
28631	209	1579	4
28632	209	1627	4
28633	209	1640	4
28634	209	1641	4
28635	209	1647	5
28636	209	1656	5
28637	209	1717	4
28638	209	1718	3
28639	209	1890	3
28640	209	1895	3
28641	209	1905	4
28642	209	1907	4
28643	209	1984	3
28644	209	2052	4
28645	209	2099	5
28646	209	2210	4
28647	209	2240	3
28648	209	2285	5
28649	209	2352	5
28650	209	2361	3
28651	209	2484	4
28652	209	2491	3
28653	209	2704	5
28654	209	2768	3
28655	209	2774	4
28656	209	2806	5
28657	209	2807	3
28658	209	2849	4
28659	209	2863	2
28660	209	3026	3
28661	209	3103	2
28662	209	3108	4
28663	209	3127	5
28664	209	3135	5
28665	209	3142	4
28666	209	3149	4
28667	209	3153	4
28668	209	3165	5
28669	209	3169	5
28670	209	3170	5
28671	209	3174	4
28672	209	3176	4
28673	209	3177	5
28674	209	3181	3
28675	209	3203	4
28676	209	3323	4
28677	209	3337	5
28678	209	3380	5
28679	209	3382	3
28680	209	3383	5
28681	209	3389	4
28682	209	3393	4
28683	209	3422	4
28684	209	3423	4
28685	209	3482	4
28686	209	3682	4
28687	209	3696	3
28688	209	3697	3
28689	209	3709	1
28690	209	3712	4
28691	209	3733	4
28692	209	3793	4
28693	209	3809	5
28694	209	3870	4
28695	209	3888	4
28696	209	3903	5
28697	209	3916	4
28698	209	3939	4
28699	209	3940	5
28700	209	3954	5
28701	209	3962	5
28702	209	3966	3
28703	209	3991	4
28704	209	4031	4
28705	209	4032	4
28706	210	21	4
28707	210	25	4
28708	210	29	5
28709	210	43	4
28710	210	48	5
28711	210	86	2
28712	210	92	4
28713	210	99	5
28714	210	100	3
28715	210	217	3
28716	210	231	2
28717	210	267	4
28718	210	327	4
28719	210	447	4
28720	210	466	4
28721	210	485	4
28722	210	521	2
28723	210	538	5
28724	210	612	4
28725	210	622	2
28726	210	631	5
28727	210	696	5
28728	210	734	5
28729	210	735	3
28730	210	754	5
28731	210	810	3
28732	210	818	3
28733	210	839	3
28734	210	873	5
28735	210	887	5
28736	210	895	5
28737	210	923	5
28738	210	939	4
28739	210	940	5
28740	210	941	4
28741	210	945	3
28742	210	957	4
28743	210	960	4
28744	210	964	4
28745	210	967	5
28746	210	968	5
28747	210	970	4
28748	210	975	5
28749	210	987	5
28750	210	990	4
28751	210	1005	5
28752	210	1007	4
28753	210	1012	4
28754	210	1019	4
28755	210	1036	5
28756	210	1044	4
28757	210	1054	2
28758	210	1057	5
28759	210	1066	3
28760	210	1071	4
28761	210	1134	5
28762	210	1189	4
28763	210	1296	5
28764	210	1382	5
28765	210	1397	4
28766	210	1478	5
28767	210	1492	5
28768	210	1534	4
28769	210	1591	4
28770	210	1660	4
28771	210	1695	5
28772	210	1699	3
28773	210	1730	4
28774	210	1792	4
28775	210	1793	1
28776	210	1814	3
28777	210	1816	4
28778	210	1830	4
28779	210	1889	4
28780	210	1992	4
28781	210	2001	5
28782	210	2031	4
28783	210	2057	5
28784	210	2099	2
28785	210	2151	5
28786	210	2161	4
28787	210	2239	4
28788	210	2260	5
28789	210	2281	4
28790	210	2294	4
28791	210	2295	5
28792	210	2315	4
28793	210	2335	5
28794	210	2366	5
28795	210	2373	5
28796	210	2389	4
28797	210	2398	5
28798	210	2430	4
28799	210	2471	4
28800	210	2525	4
28801	210	2556	4
28802	210	2563	3
28803	210	2662	2
28804	210	2665	5
28805	210	2669	4
28806	210	2712	3
28807	210	2764	3
28808	210	2843	4
28809	210	2929	4
28810	210	2947	3
28811	210	2973	3
28812	210	3009	4
28813	210	3013	4
28814	210	3056	4
28815	210	3073	4
28816	210	3095	4
28817	210	3109	5
28818	210	3162	3
28819	210	3187	4
28820	210	3312	4
28821	210	3323	5
28822	210	3372	3
28823	210	3380	4
28824	210	3482	2
28825	210	3485	5
28826	210	3491	4
28827	210	3533	3
28828	210	3578	4
28829	210	3591	3
28830	210	3594	4
28831	210	3620	5
28832	210	3683	3
28833	210	3693	4
28834	210	3738	4
28835	210	3818	3
28836	210	3886	5
28837	210	3893	4
28838	210	3920	4
28839	210	4143	5
28840	210	4236	4
28841	210	4253	4
28842	210	4292	3
28843	210	4309	3
28844	210	4313	1
28845	210	4432	4
28846	210	4433	4
28847	210	4439	4
28848	210	4458	5
28849	210	4515	2
28850	210	4551	4
28851	210	4572	3
28852	210	4575	5
28853	211	54	5
28854	211	208	2
28855	211	651	1.5
28856	211	721	4.5
28857	211	722	4
28858	211	723	4.5
28859	211	725	3
28860	211	726	3.5
28861	211	730	4
28862	211	746	5
28863	211	747	5
28864	211	753	4.5
28865	211	756	4.5
28866	211	759	4.5
28867	211	760	4
28868	211	769	5
28869	211	770	5
28870	211	789	3
28871	211	792	4.5
28872	211	831	4.5
28873	211	883	2
28874	211	899	5
28875	211	991	4
28876	211	998	4.5
28877	211	1010	4
28878	211	1012	3.5
28879	211	1013	4
28880	211	1047	4.5
28881	211	1122	4.5
28882	211	1203	2.5
28883	211	1215	2.5
28884	211	1510	4
28885	211	1511	5
28886	211	1615	1.5
28887	211	1640	4
28888	211	1737	3.5
28889	211	1749	3
28890	211	1863	4.5
28891	211	1874	1.5
28892	211	1916	2.5
28893	211	2041	5
28894	211	2052	5
28895	211	2078	3.5
28896	211	2108	4
28897	211	2187	5
28898	211	2281	2
28899	211	2339	5
28900	211	2350	4
28901	211	2352	4
28902	211	2398	2.5
28903	211	2443	3.5
28904	211	2504	3
28905	211	2539	5
28906	211	2559	4
28907	211	2680	4.5
28908	211	2701	3.5
28909	211	2702	4.5
28910	211	2760	5
28911	211	2815	3.5
28912	211	2816	3.5
28913	211	2853	3.5
28914	211	2879	3
28915	211	2901	4
28916	211	2954	4
28917	211	3040	4
28918	211	3058	4
28919	211	3073	3.5
28920	211	3184	3
28921	211	3195	5
28922	211	3296	3
28923	211	3415	3.5
28924	211	3418	4.5
28925	211	3460	4.5
28926	211	3462	4.5
28927	211	3469	2
28928	211	3470	4
28929	211	3471	5
28930	211	3752	4.5
28931	211	3760	4
28932	211	3889	3.5
28933	211	3896	4.5
28934	211	3907	3.5
28935	211	3918	5
28936	211	3934	2.5
28937	211	3948	4
28938	211	3997	5
28939	211	4138	4
28940	211	4139	3.5
28941	211	4148	3.5
28942	211	4173	2.5
28943	211	4206	4
28944	211	4242	4
28945	211	4245	2.5
28946	211	4475	4.5
28947	211	4491	5
28948	211	4511	5
28949	211	4578	5
28950	211	4609	4
28951	211	4628	4.5
28952	211	4693	4
28953	211	4695	4.5
28954	211	4714	4
28955	211	4721	3
28956	211	4734	4
28957	211	4748	4.5
28958	211	4750	4.5
28959	211	4765	4.5
28960	211	4788	3
28961	211	4887	4.5
28962	211	4952	4.5
28963	211	5165	4.5
28964	211	5194	4
28965	211	5231	4.5
28966	211	5237	4.5
28967	211	5295	4.5
28968	211	5348	3.5
28969	211	5390	4
28970	211	5411	4.5
28971	211	5475	3
28972	211	5536	4
28973	211	5565	3.5
28974	211	5567	4.5
28975	211	5576	5
28976	211	5604	5
28977	211	5613	4
28978	211	5617	3.5
28979	211	5647	4.5
28980	211	5649	5
28981	211	5650	4
28982	211	5664	5
28983	211	5665	2.5
28984	211	5674	3.5
28985	211	5748	4
28986	211	5768	3
28987	211	5825	4
28988	211	5862	4.5
28989	211	5905	3.5
28990	211	6017	3
28991	211	6023	4.5
28992	211	6025	3
28993	211	6431	4
28994	211	6705	4
28995	212	54	4
28996	212	131	5
28997	212	172	4
28998	212	204	5
28999	212	235	5
29000	212	306	3
29001	212	454	4
29002	212	507	5
29003	212	919	3
29004	212	920	4
29005	212	927	3
29006	212	932	3
29007	212	939	5
29008	212	954	5
29009	212	968	4
29010	212	973	4
29011	212	994	4
29012	212	1003	3
29013	212	1009	3
29014	212	1024	3
29015	212	1040	5
29016	212	1055	5
29017	212	1080	3
29018	212	1582	4
29019	213	1	4.5
29020	213	2	4
29021	213	5	3.5
29022	213	10	3.5
29023	213	16	4
29024	213	19	3.5
29025	213	25	5
29026	213	34	3
29027	213	37	3.5
29028	213	43	3.5
29029	213	45	4.5
29030	213	48	3.5
29031	213	88	2
29032	213	95	3.5
29033	213	99	4
29034	213	100	4
29035	213	123	4
29036	213	127	3.5
29037	213	128	4
29038	213	130	2.5
29039	213	131	3.5
29040	213	135	2.5
29041	213	136	4
29042	213	137	3
29043	213	142	3
29044	213	149	3.5
29045	213	161	4
29046	213	170	3.5
29047	213	181	2.5
29048	213	189	4.5
29049	213	195	4
29050	213	203	5
29051	213	207	3.5
29052	213	217	4
29053	213	231	4
29054	213	256	4
29055	213	258	4
29056	213	261	5
29057	213	264	4.5
29058	213	280	5
29059	213	294	4.5
29060	213	300	3
29061	213	305	3.5
29062	213	314	3.5
29063	213	317	4.5
29064	213	318	4
29065	213	324	4
29066	213	327	3
29067	213	330	2.5
29068	213	336	3.5
29069	213	337	2.5
29070	213	340	3
29071	213	373	3
29072	213	383	3.5
29073	213	403	3.5
29074	213	406	3.5
29075	213	422	4
29076	213	423	4
29077	213	427	4
29078	213	438	3.5
29079	213	446	2
29080	213	454	4.5
29081	213	467	4.5
29082	213	472	4.5
29083	213	474	4
29084	213	479	5
29085	213	485	3.5
29086	213	499	4
29087	213	514	2.5
29088	213	519	3.5
29089	213	520	3.5
29090	213	521	4
29091	213	522	3.5
29092	213	523	4
29093	213	524	4
29094	213	525	3.5
29095	213	526	4
29096	213	527	4
29097	213	528	3.5
29098	213	529	4
29099	213	530	2.5
29100	213	531	4
29101	213	538	5
29102	213	553	4
29103	213	565	2.5
29104	213	578	5
29105	213	579	5
29106	213	620	3.5
29107	213	622	3
29108	213	631	4
29109	213	639	4
29110	213	647	2.5
29111	213	651	4
29112	213	652	5
29113	213	654	4
29114	213	662	3.5
29115	213	674	3
29116	213	677	4
29117	213	682	2.5
29118	213	694	3.5
29119	213	696	5
29120	213	720	2
29121	213	721	5
29122	213	722	3
29123	213	725	4
29124	213	726	5
29125	213	727	4.5
29126	213	730	5
29127	213	731	4.5
29128	213	732	4
29129	213	734	5
29130	213	735	5
29131	213	741	3.5
29132	213	742	4.5
29133	213	744	4.5
29134	213	745	5
29135	213	746	3.5
29136	213	747	5
29137	213	749	4
29138	213	751	4.5
29139	213	752	4
29140	213	754	3.5
29141	213	761	4
29142	213	763	4.5
29143	213	766	3.5
29144	213	769	4.5
29145	213	772	3.5
29146	213	774	3.5
29147	213	775	3.5
29148	213	776	3
29149	213	785	3.5
29150	213	788	4.5
29151	213	789	3.5
29152	213	824	3
29153	213	831	4
29154	213	836	4
29155	213	837	4
29156	213	839	3.5
29157	213	840	4
29158	213	844	3.5
29159	213	853	3.5
29160	213	870	4.5
29161	213	873	3.5
29162	213	877	3.5
29163	213	878	3.5
29164	213	882	4
29165	213	884	4
29166	213	887	5
29167	213	888	4.5
29168	213	893	4.5
29169	213	895	5
29170	213	899	4
29171	213	900	4
29172	213	909	4.5
29173	213	915	4
29174	213	923	4.5
29175	213	939	5
29176	213	944	5
29177	213	953	4.5
29178	213	957	4
29179	213	959	4
29180	213	960	2
29181	213	961	4
29182	213	963	4.5
29183	213	964	5
29184	213	966	4.5
29185	213	967	4.5
29186	213	968	5
29187	213	969	4
29188	213	970	4.5
29189	213	971	5
29190	213	972	4
29191	213	974	4.5
29192	213	975	5
29193	213	976	4.5
29194	213	977	4
29195	213	979	5
29196	213	980	4.5
29197	213	981	5
29198	213	983	4.5
29199	213	984	4
29200	213	987	5
29201	213	990	4.5
29202	213	991	4
29203	213	995	5
29204	213	998	4
29205	213	1000	4.5
29206	213	1004	4
29207	213	1005	4
29208	213	1006	3.5
29209	213	1007	3.5
29210	213	1008	5
29211	213	1010	5
29212	213	1011	4
29213	213	1012	5
29214	213	1014	5
29215	213	1016	4
29216	213	1018	3.5
29217	213	1020	4.5
29218	213	1021	3.5
29219	213	1023	4
29220	213	1025	5
29221	213	1026	5
29222	213	1027	4.5
29223	213	1030	4.5
29224	213	1032	4.5
29225	213	1038	3.5
29226	213	1040	4.5
29227	213	1042	3
29228	213	1043	5
29229	213	1044	4
29230	213	1048	4
29231	213	1051	4
29232	213	1061	4.5
29233	213	1063	4
29234	213	1083	4.5
29235	213	1088	4
29236	213	1092	4
29237	213	1095	4.5
29238	213	1097	4
29239	213	1104	4.5
29240	213	1105	3.5
29241	213	1112	4
29242	213	1119	3.5
29243	213	1122	2.5
29244	213	1127	5
29245	213	1128	4
29246	213	1129	3
29247	213	1133	4
29248	213	1134	3
29249	213	1144	4.5
29250	213	1155	3.5
29251	213	1203	3
29252	213	1226	4.5
29253	213	1233	3.5
29254	213	1244	3
29255	213	1250	3.5
29256	213	1256	5
29257	213	1257	4
29258	213	1259	3.5
29259	213	1260	3.5
29260	213	1261	3.5
29261	213	1265	3.5
29262	213	1271	4.5
29263	213	1288	3.5
29264	213	1296	4.5
29265	213	1302	4
29266	213	1309	3.5
29267	213	1315	4
29268	213	1322	4.5
29269	213	1337	4
29270	213	1340	4
29271	213	1344	3.5
29272	213	1358	4.5
29273	213	1361	3.5
29274	213	1368	3.5
29275	213	1369	3.5
29276	213	1372	3.5
29277	213	1375	3.5
29278	213	1382	4.5
29279	213	1399	3.5
29280	213	1456	3.5
29281	213	1485	4
29282	213	1486	4
29283	213	1489	2.5
29284	213	1491	3.5
29285	213	1494	4
29286	213	1497	5
29287	213	1499	4
29288	213	1505	4
29289	213	1506	4.5
29290	213	1511	4
29291	213	1512	5
29292	213	1514	4.5
29293	213	1519	4.5
29294	213	1520	4
29295	213	1521	3.5
29296	213	1527	3.5
29297	213	1528	4.5
29298	213	1549	4
29299	213	1561	4.5
29300	213	1569	4
29301	213	1573	4.5
29302	213	1574	4.5
29303	213	1575	4
29304	213	1581	4
29305	213	1582	5
29306	213	1591	4.5
29307	213	1609	4
29308	213	1615	2.5
29309	213	1625	4.5
29310	213	1626	4.5
29311	213	1628	4
29312	213	1636	4
29313	213	1638	4
29314	213	1640	4
29315	213	1645	3.5
29316	213	1647	4
29317	213	1656	3.5
29318	213	1675	4
29319	213	1683	3
29320	213	1694	4
29321	213	1698	3.5
29322	213	1699	3.5
29323	213	1717	3.5
29324	213	1730	4
29325	213	1731	4
29326	213	1733	4
29327	213	1735	3.5
29328	213	1738	4
29329	213	1741	5
29330	213	1756	4.5
29331	213	1757	4
29332	213	1761	4
29333	213	1796	4
29334	213	1812	4.5
29335	213	1814	3.5
29336	213	1816	4
29337	213	1818	4.5
29338	213	1820	3.5
29339	213	1823	5
29340	213	1830	4.5
29341	213	1836	3.5
29342	213	1844	4.5
29343	213	1863	4.5
29344	213	1865	4
29345	213	1867	3.5
29346	213	1878	3.5
29347	213	1899	3
29348	213	1902	4
29349	213	1906	4.5
29350	213	1938	3
29351	213	1989	1.5
29352	213	1990	3.5
29353	213	2002	4
29354	213	2057	4.5
29355	213	2058	3.5
29356	213	2064	3.5
29357	213	2078	4.5
29358	213	2091	4
29359	213	2112	4
29360	213	2114	4
29361	213	2128	4
29362	213	2135	4
29363	213	2144	3.5
29364	213	2146	3.5
29365	213	2158	4.5
29366	213	2163	3.5
29367	213	2167	3.5
29368	213	2187	3.5
29369	213	2188	4
29370	213	2210	4
29371	213	2217	3
29372	213	2233	4.5
29373	213	2238	2.5
29374	213	2239	3.5
29375	213	2246	3.5
29376	213	2275	4
29377	213	2282	4
29378	213	2284	3
29379	213	2287	3.5
29380	213	2294	5
29381	213	2304	3
29382	213	2313	4
29383	213	2324	4
29384	213	2331	4
29385	213	2332	4
29386	213	2334	5
29387	213	2344	3.5
29388	213	2346	4
29389	213	2347	4
29390	213	2362	3.5
29391	213	2366	4
29392	213	2367	2.5
29393	213	2377	4.5
29394	213	2378	4.5
29395	213	2383	2.5
29396	213	2387	4
29397	213	2389	4
29398	213	2398	5
29399	213	2403	3.5
29400	213	2416	3.5
29401	213	2421	4.5
29402	213	2425	4
29403	213	2442	3.5
29404	213	2459	4
29405	213	2461	4
29406	213	2472	4.5
29407	213	2476	4
29408	213	2478	4
29409	213	2497	4.5
29410	213	2500	3
29411	213	2509	4
29412	213	2530	3
29413	213	2531	5
29414	213	2537	3.5
29415	213	2542	4
29416	213	2543	4
29417	213	2568	4
29418	213	2570	4
29419	213	2587	4.5
29420	213	2596	4
29421	213	2599	2.5
29422	213	2633	5
29423	213	2644	3.5
29424	213	2668	4
29425	213	2669	4
29426	213	2670	4.5
29427	213	2671	5
29428	213	2713	3.5
29429	213	2716	4
29430	213	2718	3.5
29431	213	2727	5
29432	213	2730	2.5
29433	213	2743	2.5
29434	213	2751	4
29435	213	2754	4
29436	213	2757	3.5
29437	213	2760	4
29438	213	2766	4
29439	213	2778	4.5
29440	213	2783	4
29441	213	2800	3.5
29442	213	2837	3.5
29443	213	2869	3
29444	213	2873	5
29445	213	2898	4
29446	213	2906	5
29447	213	2908	4
29448	213	2911	4.5
29449	213	2948	4
29450	213	2959	4.5
29451	213	2960	4
29452	213	2990	4
29453	213	2992	3.5
29454	213	3000	3.5
29455	213	3058	4
29456	213	3073	3
29457	213	3083	4.5
29458	213	3108	4.5
29459	213	3109	4
29460	213	3124	4
29461	213	3126	3
29462	213	3132	3
29463	213	3149	4
29464	213	3173	4
29465	213	3184	4
29466	213	3233	3
29467	213	3244	2.5
29468	213	3322	4.5
29469	213	3323	3.5
29470	213	3337	3.5
29471	213	3340	4.5
29472	213	3345	4
29473	213	3374	4.5
29474	213	3380	4
29475	213	3389	3.5
29476	213	3394	5
29477	213	3406	2.5
29478	213	3419	4
29479	213	3451	4
29480	213	3466	4.5
29481	213	3470	5
29482	213	3471	4
29483	213	3536	4
29484	213	3636	3.5
29485	213	3724	4.5
29486	213	3807	3.5
29487	213	3810	4.5
29488	213	3812	4
29489	213	3830	5
29490	213	3860	4.5
29491	213	3868	4
29492	213	3869	3.5
29493	213	3873	4.5
29494	213	3886	4.5
29495	213	3888	4.5
29496	213	3890	4.5
29497	213	3900	2.5
29498	213	3902	4
29499	213	3904	3.5
29500	213	3934	3
29501	213	3966	3
29502	213	3967	4
29503	213	3997	4.5
29504	213	4014	4
29505	213	4033	3.5
29506	213	4073	4.5
29507	213	4076	3.5
29508	213	4098	4.5
29509	213	4109	4
29510	213	4126	2.5
29511	213	4173	5
29512	213	4174	4
29513	213	4188	4.5
29514	213	4279	3
29515	213	4313	4.5
29516	213	4316	4
29517	213	4319	3.5
29518	213	4328	5
29519	213	4393	3
29520	213	4435	5
29521	213	4453	4.5
29522	213	4458	4
29523	213	4459	5
29524	213	4485	4
29525	213	4491	4.5
29526	213	4496	4
29527	213	4504	4.5
29528	213	4540	3.5
29529	213	4631	2
29530	213	4658	4
29531	213	4673	3.5
29532	213	4681	4
29533	213	4705	4
29534	213	4711	4.5
29535	213	4733	4
29536	213	4735	3
29537	213	4740	3.5
29538	213	4785	2.5
29539	213	4801	3.5
29540	213	4803	3.5
29541	213	4807	0.5
29542	213	4818	4.5
29543	213	4847	4.5
29544	213	4855	3.5
29545	213	4870	4
29546	213	4873	4
29547	213	4887	5
29548	213	4909	2
29549	213	4926	4
29550	213	4951	4
29551	213	4952	3
29552	213	4954	4.5
29553	213	4968	3
29554	213	4993	3.5
29555	213	5003	4
29556	213	5005	4
29557	213	5008	3
29558	213	5016	3
29559	213	5028	5
29560	213	5029	5
29561	213	5039	3.5
29562	213	5046	3.5
29563	213	5066	4
29564	213	5074	4
29565	213	5076	4
29566	213	5077	3
29567	213	5094	4
29568	213	5098	4.5
29569	213	5125	3.5
29570	213	5134	3.5
29571	213	5135	4
29572	213	5142	4
29573	213	5143	4
29574	213	5144	3.5
29575	213	5148	4.5
29576	213	5149	4.5
29577	213	5150	4
29578	213	5166	4
29579	213	5167	4
29580	213	5195	4
29581	213	5201	4.5
29582	213	5207	4
29583	213	5236	2
29584	213	5239	2.5
29585	213	5240	5
29586	213	5248	4.5
29587	213	5259	5
29588	213	5314	4
29589	213	5328	4.5
29590	213	5329	4.5
29591	213	5337	3.5
29592	213	5349	4.5
29593	213	5365	4
29594	213	5412	5
29595	213	5455	4.5
29596	213	5513	4
29597	213	5517	3.5
29598	213	5520	4.5
29599	213	5529	4
29600	213	5548	4
29601	213	5557	4.5
29602	213	5568	3
29603	213	5576	4
29604	213	5578	4.5
29605	213	5587	5
29606	213	5614	4
29607	213	5618	3.5
29608	213	5654	4
29609	213	5659	5
29610	213	5661	4
29611	213	5670	3
29612	213	5709	3.5
29613	213	5719	4.5
29614	213	5726	4.5
29615	213	5764	4
29616	213	5779	4
29617	213	5780	4.5
29618	213	5795	4
29619	213	5802	3.5
29620	213	5838	4.5
29621	213	5839	3.5
29622	213	5875	4.5
29623	213	5883	4.5
29624	213	5886	4.5
29625	213	5890	4
29626	213	5925	4
29627	213	5940	4
29628	213	6061	5
29629	213	6096	4
29630	213	6356	2.5
29631	213	6411	5
29632	213	6413	5
29633	213	6418	4
29634	213	6462	5
29635	213	6539	4
29636	213	6563	4
29637	213	6565	4
29638	213	6606	4.5
29639	213	6620	4
29640	213	6632	4.5
29641	213	6635	3
29642	213	6642	5
29643	213	6650	3.5
29644	213	6673	4.5
29645	213	6703	4
29646	213	6714	4.5
29647	213	6716	4
29648	213	6787	4.5
29649	213	6790	4.5
29650	213	6865	4.5
29651	214	22	3
29652	214	42	3.5
29653	214	46	3
29654	214	65	3
29655	214	135	1
29656	214	177	0.5
29657	214	487	4
29658	214	572	1
29659	214	650	3
29660	214	1002	5
29661	214	1061	4
29662	214	1114	3
29663	214	1337	2.5
29664	214	1399	4
29665	214	1660	3
29666	214	1933	4
29667	214	2091	4
29668	214	2217	3.5
29669	214	2246	5
29670	214	4302	4
29671	215	1	3.5
29672	215	48	4
29673	215	231	4.5
29674	215	280	4
29675	215	317	3
29676	215	427	3.5
29677	215	647	4
29678	215	959	4.5
29679	215	961	4.5
29680	215	972	4
29681	215	1030	4
29682	215	1051	3.5
29683	215	1591	2.5
29684	215	2057	4.5
29685	215	2366	4
29686	215	3886	4
29687	215	4279	4
29688	215	4692	4.5
29689	215	5207	4
29690	215	5733	4
29691	215	6485	4
29692	215	6691	4.5
29693	215	7670	4
29694	215	8121	4
29695	215	8778	3
29696	215	8958	4
29697	215	9053	4
29698	215	9122	4.5
29699	215	9400	4
29700	215	9659	4
29701	215	9671	4
29702	215	9838	4
29703	215	9903	4.5
29704	215	9929	3.5
29705	215	9961	3
29706	215	9976	3
29707	215	10006	5
29708	215	10160	4.5
29709	216	100	3
29710	216	352	3
29711	216	589	3
29712	216	715	5
29713	216	961	1
29714	216	966	3
29715	216	1244	5
29716	216	1266	3
29717	216	1549	5
29718	216	1550	5
29719	216	1551	5
29720	216	1552	5
29721	216	1553	5
29722	216	1667	5
29723	216	1794	5
29724	216	2002	3
29725	216	2267	3
29726	216	2382	5
29727	216	2533	4
29728	216	2930	3
29729	216	3100	3
29730	216	3234	3
29731	216	3662	3
29732	216	3791	3
29733	216	3958	4
29734	216	4018	3
29735	217	280	5
29736	217	472	4
29737	217	526	4
29738	217	538	5
29739	217	657	5
29740	217	693	2
29741	217	696	4
29742	217	734	4
29743	217	745	5
29744	217	959	4
29745	217	983	3
29746	217	1310	3
29747	217	1344	2
29748	217	1353	1
29749	217	1591	2
29750	217	1796	3
29751	217	1839	4
29752	217	1869	3
29753	217	2210	4
29754	217	2211	4
29755	217	2304	1
29756	218	1	3.5
29757	218	2	4
29758	218	18	4.5
29759	218	19	4
29760	218	34	3
29761	218	46	3
29762	218	65	4.5
29763	218	97	4.5
29764	218	99	3
29765	218	127	4.5
29766	218	155	4
29767	218	175	4.5
29768	218	196	4
29769	218	207	5
29770	218	224	4.5
29771	218	231	4.5
29772	218	254	5
29773	218	261	4.5
29774	218	277	4
29775	218	298	4
29776	218	305	4
29777	218	314	4
29778	218	317	5
29779	218	324	4
29780	218	327	4.5
29781	218	328	4.5
29782	218	356	3
29783	218	360	3
29784	218	383	4
29785	218	427	4.5
29786	218	436	4.5
29787	218	437	4
29788	218	453	5
29789	218	472	5
29790	218	477	4
29791	218	520	4
29792	218	521	4
29793	218	522	4.5
29794	218	524	4.5
29795	218	525	4
29796	218	527	4
29797	218	528	4
29798	218	529	4
29799	218	546	4
29800	218	603	4
29801	218	607	5
29802	218	624	5
29803	218	641	4
29804	218	645	5
29805	218	647	4
29806	218	651	4
29807	218	654	4
29808	218	670	4.5
29809	218	681	3.5
29810	218	837	4.5
29811	218	840	4
29812	218	873	5
29813	218	878	5
29814	218	890	3
29815	218	895	3.5
29816	218	898	4.5
29817	218	923	5
29818	218	957	4.5
29819	218	959	4.5
29820	218	961	4.5
29821	218	963	4.5
29822	218	966	4
29823	218	968	5
29824	218	971	5
29825	218	972	5
29826	218	976	4.5
29827	218	987	5
29828	218	991	5
29829	218	998	5
29830	218	1004	4.5
29831	218	1035	3
29832	218	1037	4
29833	218	1051	4.5
29834	218	1057	5
29835	218	1071	4.5
29836	218	1111	3
29837	218	1119	4
29838	218	1127	4.5
29839	218	1128	3
29840	218	1131	4
29841	218	1144	3.5
29842	218	1162	4
29843	218	1163	4.5
29844	218	1170	3.5
29845	218	1187	5
29846	218	1233	4.5
29847	218	1256	5
29848	218	1261	4
29849	218	1265	3
29850	218	1272	3
29851	218	1278	4.5
29852	218	1302	5
29853	218	1315	4.5
29854	218	1322	5
29855	218	1340	4.5
29856	218	1344	4.5
29857	218	1349	3
29858	218	1351	4
29859	218	1353	3
29860	218	1362	2
29861	218	1368	4
29862	218	1372	4.5
29863	218	1382	5
29864	218	1412	3
29865	218	1430	4.5
29866	218	1463	5
29867	218	1471	3
29868	218	1490	4.5
29869	218	1492	5
29870	218	1522	4
29871	218	1528	4
29872	218	1564	4.5
29873	218	1565	4.5
29874	218	1566	4.5
29875	218	1570	4
29876	218	1581	3.5
29877	218	1591	4
29878	218	1611	3
29879	218	1612	3
29880	218	1625	4
29881	218	1638	4
29882	218	1641	4
29883	218	1643	4
29884	218	1645	3.5
29885	218	1647	4
29886	218	1648	3.5
29887	218	1656	4
29888	218	1675	4.5
29889	218	1684	4
29890	218	1717	3.5
29891	218	1771	5
29892	218	1814	4.5
29893	218	1844	5
29894	218	1867	4
29895	218	1879	4
29896	218	1899	4.5
29897	218	1912	4
29898	218	1913	4.5
29899	218	1914	4.5
29900	218	1915	4.5
29901	218	1916	4.5
29902	218	1930	4
29903	218	1931	2
29904	218	1932	1
29905	218	1934	5
29906	218	2057	4.5
29907	218	2099	2
29908	218	2111	3.5
29909	218	2126	4
29910	218	2155	4
29911	218	2166	5
29912	218	2167	3
29913	218	2172	4
29914	218	2173	4.5
29915	218	2188	5
29916	218	2229	5
29917	218	2261	4.5
29918	218	2271	3.5
29919	218	2273	5
29920	218	2281	5
29921	218	2282	5
29922	218	2295	4
29923	218	2333	4
29924	218	2354	4.5
29925	218	2364	4
29926	218	2366	5
29927	218	2375	5
29928	218	2389	4.5
29929	218	2398	4.5
29930	218	2407	3
29931	218	2414	4.5
29932	218	2425	4
29933	218	2466	3.5
29934	218	2468	5
29935	218	2497	3.5
29936	218	2520	4
29937	218	2541	5
29938	218	2543	5
29939	218	2551	5
29940	218	2603	4
29941	218	2609	3
29942	218	2610	4
29943	218	2662	4
29944	218	2693	5
29945	218	2800	4
29946	218	2941	5
29947	218	2965	4.5
29948	218	2966	4
29949	218	3000	4.5
29950	218	3109	5
29951	218	3132	4
29952	218	3143	4.5
29953	218	3150	5
29954	218	3159	4.5
29955	218	3165	4
29956	218	3169	4.5
29957	218	3272	4
29958	218	3380	4.5
29959	218	3405	4
29960	218	3422	4
29961	218	3432	4.5
29962	218	3593	5
29963	218	3619	4
29964	218	3638	3.5
29965	218	3661	4
29966	218	3669	5
29967	218	3796	4.5
29968	218	3798	3
29969	218	3804	4
29970	218	3812	4
29971	218	3856	4
29972	218	3868	5
29973	218	3885	4.5
29974	218	3886	4
29975	218	3989	5
29976	218	3996	5
29977	218	4009	4.5
29978	218	4033	4.5
29979	218	4064	5
29980	218	4127	3.5
29981	218	4135	4
29982	218	4172	4.5
29983	218	4184	4
29984	218	4213	4
29985	218	4229	4
29986	218	4279	5
29987	218	4319	5
29988	218	4331	5
29989	218	4338	5
29990	218	4365	4.5
29991	218	4368	3.5
29992	218	4385	4
29993	218	4421	5
29994	218	4435	5
29995	218	4453	4.5
29996	218	4458	4
29997	218	4473	5
29998	218	4485	4.5
29999	218	4488	5
30000	218	4491	3
30001	218	4681	4.5
30002	218	4697	0.5
30003	218	4700	0.5
30004	218	4705	5
30005	218	4728	4.5
30006	218	4798	3
30007	218	4802	4.5
30008	218	4803	4.5
30009	218	4817	4
30010	218	4907	4.5
30011	218	4909	5
30012	218	4935	4.5
30013	218	4963	4
30014	218	4968	5
30015	218	5003	4.5
30016	218	5005	5
30017	218	5017	4.5
30018	218	5037	2
30019	218	5042	5
30020	218	5085	3
30021	218	5094	5
30022	218	5139	5
30023	218	5167	5
30024	218	5203	4.5
30025	218	5207	4
30026	218	5215	4.5
30027	218	5289	5
30028	218	5306	4
30029	218	5323	4.5
30030	218	5329	5
30031	218	5336	5
30032	218	5362	4.5
30033	218	5365	5
30034	218	5405	4
30035	218	5593	5
30036	218	5618	4.5
30037	218	5627	1
30038	218	5678	4.5
30039	218	5705	4.5
30040	218	5706	4.5
30041	218	5726	4
30042	218	5809	3
30043	218	5845	4
30044	218	5849	5
30045	218	5851	4
30046	218	5891	3
30047	218	5892	5
30048	218	6096	4
30049	218	6137	4
30050	218	6155	5
30051	218	6242	5
30052	218	6293	4.5
30053	218	6300	3.5
30054	218	6325	4.5
30055	218	6351	4.5
30056	218	6370	5
30057	218	6395	4
30058	218	6415	4.5
30059	218	6418	4.5
30060	218	6447	3.5
30061	218	6485	4.5
30062	218	6490	2
30063	218	6491	4.5
30064	218	6593	2
30065	218	6620	4
30066	218	6642	4
30067	218	6647	3
30068	218	6654	5
30069	218	6663	4.5
30070	218	6669	2
30071	218	6745	2
30072	218	6755	3.5
30073	218	6767	4.5
30074	218	6780	4.5
30075	218	6787	5
30076	218	6800	4
30077	218	6808	4.5
30078	218	6811	4.5
30079	218	6828	4.5
30080	218	6843	4
30081	218	6896	4.5
30082	218	6942	4
30083	218	6959	5
30084	218	7018	2.5
30085	218	7022	2.5
30086	218	7032	3.5
30087	218	7036	3.5
30088	218	7061	4
30089	218	7105	5
30090	218	7139	4.5
30091	218	7140	5
30092	218	7146	4.5
30093	218	7151	3.5
30094	218	7155	5
30095	218	7161	5
30096	218	7180	5
30097	218	7222	4
30098	218	7255	3.5
30099	218	7273	3.5
30100	218	7287	3.5
30101	218	7307	4.5
30102	218	7317	4.5
30103	218	7354	4
30104	218	7377	4
30105	218	7384	4
30106	218	7385	3
30107	218	7398	4
30108	218	7403	4
30109	218	7423	4.5
30110	218	7501	5
30111	218	7541	5
30112	218	7586	3
30113	218	7590	3
30114	218	7683	4.5
30115	218	7715	4
30116	218	7738	3
30117	218	7742	5
30118	218	7761	4
30119	218	7806	4.5
30120	218	7829	4
30121	218	7995	4.5
30122	218	8040	4.5
30123	218	8093	4.5
30124	218	8121	4.5
30125	218	8151	4.5
30126	218	8159	3
30127	218	8184	5
30128	218	8271	2.5
30129	219	185	1
30130	219	317	5
30131	219	343	4
30132	219	474	3
30133	219	519	2
30134	219	677	4
30135	219	724	4
30136	219	1446	3
30137	219	1639	3
30138	219	2157	3
30139	219	2614	3
30140	219	2616	3
30141	219	2628	2
30142	219	2744	4
30143	219	2805	2
30144	219	2822	4
30145	219	2837	4
30146	219	2869	5
30147	219	2870	3
30148	219	2938	4
30149	219	2962	3
30150	219	2967	4
30151	219	2969	4
30152	219	2992	3
30153	219	3000	4
30154	219	3024	4
30155	219	3053	2
30156	219	3063	2
30157	219	3065	3
30158	219	3066	3
30159	219	3113	2
30160	219	3134	2
30161	219	3136	2
30162	219	3143	3
30163	219	3151	1
30164	219	3202	2
30165	219	3261	1
30166	219	3265	3
30167	219	3277	3
30168	219	3283	1
30169	219	3320	4
30170	219	3321	1
30171	219	3327	4
30172	219	3332	3
30173	219	3334	1
30174	219	3343	1
30175	219	3347	3
30176	219	3348	1
30177	219	3350	1
30178	219	3351	3
30179	219	3375	4
30180	219	3377	3
30181	219	3380	5
30182	219	3382	5
30183	219	3383	4
30184	219	3404	1
30185	219	3405	4
30186	219	3406	4
30187	219	3421	2
30188	219	3422	4
30189	219	3424	5
30190	219	3426	2
30191	219	3427	3
30192	219	3428	1
30193	219	3435	4
30194	219	3436	3
30195	219	3438	1
30196	219	3481	3
30197	219	3482	4
30198	219	3483	3
30199	219	3595	3
30200	219	3631	2
30201	219	3633	2
30202	219	3634	1
30203	219	3638	3
30204	219	3640	2
30205	219	3682	3
30206	219	3683	4
30207	219	3696	3
30208	219	3697	1
30209	219	3698	5
30210	219	3699	1
30211	219	3702	3
30212	219	3707	1
30213	219	3710	2
30214	219	3711	1
30215	219	3725	3
30216	219	3726	3
30217	219	3727	1
30218	219	3733	2
30219	219	3737	1
30220	219	3786	3
30221	219	3791	1
30222	219	3796	3
30223	219	3797	4
30224	219	3799	1
30225	219	3804	4
30226	219	3805	1
30227	219	3806	1
30228	219	3812	4
30229	219	3813	2
30230	219	3816	3
30231	219	3818	4
30232	219	3820	1
30233	219	3821	3
30234	219	3822	4
30235	219	3823	3
30236	219	3856	3
30237	219	3859	2
30238	219	3860	5
30239	219	3861	3
30240	219	3869	1
30241	219	3870	4
30242	219	3874	4
30243	219	3882	3
30244	219	3886	5
30245	219	3888	4
30246	219	3899	3
30247	219	3900	4
30248	219	3903	4
30249	219	3910	2
30250	219	3911	4
30251	219	3924	2
30252	219	3925	3
30253	220	1	4
30254	220	2	3.5
30255	220	3	4
30256	220	5	2
30257	220	6	3.5
30258	220	10	3
30259	220	11	3.5
30260	220	17	3
30261	220	19	1
30262	220	21	4
30263	220	22	4
30264	220	24	4
30265	220	26	4
30266	220	29	4
30267	220	31	3.5
30268	220	32	3.5
30269	220	34	4
30270	220	36	4
30271	220	37	3.5
30272	220	42	4
30273	220	45	4
30274	220	46	3.5
30275	220	48	4
30276	220	56	3
30277	220	58	4
30278	220	62	2.5
30279	220	64	3
30280	220	65	4
30281	220	87	4
30282	220	88	3.5
30283	220	95	3.5
30284	220	99	4
30285	220	100	3.5
30286	220	101	3.5
30287	220	121	3
30288	220	123	3.5
30289	220	125	4
30290	220	127	2
30291	220	128	3.5
30292	220	130	3
30293	220	135	3
30294	220	138	3.5
30295	220	140	4
30296	220	142	3.5
30297	220	144	3
30298	220	145	2.5
30299	220	146	3.5
30300	220	149	3.5
30301	220	151	3
30302	220	156	3.5
30303	220	157	1.5
30304	220	161	3.5
30305	220	162	3.5
30306	220	167	3
30307	220	170	3
30308	220	181	3.5
30309	220	189	3.5
30310	220	194	3.5
30311	220	195	3.5
30312	220	196	4
30313	220	203	3.5
30314	220	207	3.5
30315	220	208	3.5
30316	220	218	4
30317	220	220	4
30318	220	224	4
30319	220	232	3.5
30320	220	235	4
30321	220	236	3.5
30322	220	247	3.5
30323	220	254	3.5
30324	220	256	4.5
30325	220	258	3
30326	220	259	3.5
30327	220	261	4
30328	220	263	3.5
30329	220	267	3.5
30330	220	277	3.5
30331	220	278	3.5
30332	220	279	4
30333	220	280	4
30334	220	281	4
30335	220	288	3.5
30336	220	290	3.5
30337	220	298	4
30338	220	300	3
30339	220	305	3
30340	220	306	3.5
30341	220	310	3.5
30342	220	314	4
30343	220	316	3
30344	220	317	3.5
30345	220	318	4
30346	220	322	3.5
30347	220	324	4
30348	220	327	3.5
30349	220	328	4
30350	220	330	3.5
30351	220	332	3.5
30352	220	334	2.5
30353	220	336	4
30354	220	337	2.5
30355	220	340	3.5
30356	220	360	3.5
30357	220	368	2
30358	220	369	3.5
30359	220	376	3.5
30360	220	380	4
30361	220	381	3
30362	220	383	3.5
30363	220	384	2.5
30364	220	389	4
30365	220	390	3
30366	220	391	2.5
30367	220	403	3
30368	220	404	3
30369	220	406	3
30370	220	414	3.5
30371	220	419	4
30372	220	422	4
30373	220	423	4
30374	220	427	3.5
30375	220	431	4
30376	220	436	3.5
30377	220	437	3.5
30378	220	443	3.5
30379	220	446	3.5
30380	220	448	2.5
30381	220	453	4
30382	220	454	3.5
30383	220	459	4
30384	220	463	2
30385	220	465	3.5
30386	220	467	4
30387	220	472	4
30388	220	475	3
30389	220	481	3
30390	220	482	4
30391	220	483	3.5
30392	220	484	3.5
30393	220	485	4
30394	220	487	3.5
30395	220	495	4.5
30396	220	496	3.5
30397	220	497	3
30398	220	499	4
30399	220	513	3
30400	220	514	3.5
30401	220	519	3.5
30402	220	520	3
30403	220	521	4
30404	220	522	4
30405	220	523	3.5
30406	220	524	3.5
30407	220	525	3.5
30408	220	526	3.5
30409	220	527	3
30410	220	528	3.5
30411	220	529	3.5
30412	220	530	2.5
30413	220	538	4
30414	220	552	3.5
30415	220	553	4
30416	220	560	3.5
30417	220	564	3.5
30418	220	565	3.5
30419	220	568	3.5
30420	220	572	4
30421	220	581	3
30422	220	588	2
30423	220	602	4
30424	220	611	3
30425	220	612	4.5
30426	220	614	3
30427	220	622	2.5
30428	220	624	4.5
30429	220	626	3.5
30430	220	627	4
30431	220	631	4
30432	220	645	4
30433	220	647	3.5
30434	220	650	3.5
30435	220	651	3
30436	220	652	3.5
30437	220	653	3
30438	220	654	4
30439	220	656	4
30440	220	659	4
30441	220	662	4
30442	220	667	2
30443	220	669	3
30444	220	677	3
30445	220	696	3
30446	220	708	3.5
30447	220	721	4
30448	220	724	3.5
30449	220	734	3
30450	220	735	3.5
30451	220	736	3.5
30452	220	741	3.5
30453	220	742	3
30454	220	746	4
30455	220	755	2
30456	220	773	3
30457	220	788	3.5
30458	220	819	3
30459	220	820	2
30460	220	829	3.5
30461	220	831	3.5
30462	220	834	3
30463	220	835	3
30464	220	836	3.5
30465	220	837	3.5
30466	220	838	3.5
30467	220	839	3.5
30468	220	840	4
30469	220	841	3.5
30470	220	843	1.5
30471	220	844	3.5
30472	220	845	3.5
30473	220	849	3.5
30474	220	853	3.5
30475	220	854	3.5
30476	220	862	4
30477	220	864	4
30478	220	873	4
30479	220	877	4
30480	220	878	4
30481	220	882	3
30482	220	886	3.5
30483	220	887	3.5
30484	220	888	3.5
30485	220	889	3
30486	220	890	3.5
30487	220	891	3
30488	220	895	3.5
30489	220	898	3
30490	220	900	3.5
30491	220	909	4
30492	220	915	3.5
30493	220	923	4
30494	220	926	4
30495	220	945	4
30496	220	950	3
30497	220	952	4
30498	220	953	3.5
30499	220	957	3.5
30500	220	959	2.5
30501	220	960	4
30502	220	961	3.5
30503	220	962	4
30504	220	963	3.5
30505	220	967	3.5
30506	220	968	4
30507	220	969	3.5
30508	220	970	4.5
30509	220	972	2.5
30510	220	976	4
30511	220	977	4
30512	220	981	3.5
30513	220	982	3
30514	220	984	4
30515	220	987	4
30516	220	1000	3.5
30517	220	1001	3.5
30518	220	1006	5
30519	220	1007	3.5
30520	220	1010	4
30521	220	1017	3.5
30522	220	1018	3.5
30523	220	1019	3.5
30524	220	1021	3.5
30525	220	1022	3.5
30526	220	1025	4
30527	220	1026	3.5
30528	220	1028	3.5
30529	220	1030	3
30530	220	1031	4
30531	220	1035	3.5
30532	220	1036	4
30533	220	1037	3.5
30534	220	1042	3.5
30535	220	1045	4
30536	220	1047	3.5
30537	220	1048	4
30538	220	1051	3.5
30539	220	1053	4
30540	220	1057	4
30541	220	1063	3.5
30542	220	1066	3
30543	220	1071	3
30544	220	1072	3.5
30545	220	1078	3.5
30546	220	1079	2.5
30547	220	1083	3.5
30548	220	1091	3.5
30549	220	1092	3.5
30550	220	1094	3.5
30551	220	1103	3.5
30552	220	1104	4
30553	220	1111	3
30554	220	1112	3.5
30555	220	1119	3
30556	220	1120	4
30557	220	1121	4
30558	220	1122	3.5
30559	220	1125	3
30560	220	1127	3
30561	220	1128	3
30562	220	1131	3.5
30563	220	1133	3.5
30564	220	1134	3
30565	220	1136	3.5
30566	220	1142	2.5
30567	220	1144	3.5
30568	220	1145	4
30569	220	1155	4
30570	220	1163	3.5
30571	220	1167	3
30572	220	1170	4
30573	220	1196	3
30574	220	1198	3.5
30575	220	1203	3.5
30576	220	1233	4
30577	220	1244	2.5
30578	220	1250	3.5
30579	220	1257	3
30580	220	1260	3
30581	220	1261	3.5
30582	220	1265	2
30583	220	1267	3
30584	220	1268	3.5
30585	220	1269	2.5
30586	220	1270	3.5
30587	220	1278	3.5
30588	220	1288	3.5
30589	220	1290	3
30590	220	1291	2.5
30591	220	1296	4
30592	220	1297	3.5
30593	220	1302	3.5
30594	220	1310	3.5
30595	220	1311	3.5
30596	220	1314	3.5
30597	220	1322	4
30598	220	1330	3.5
30599	220	1337	4
30600	220	1338	4
30601	220	1340	3.5
30602	220	1342	3.5
30603	220	1343	3.5
30604	220	1344	4
30605	220	1349	4
30606	220	1351	3
30607	220	1353	3.5
30608	220	1361	4
30609	220	1362	1
30610	220	1366	3
30611	220	1368	3
30612	220	1369	3
30613	220	1372	4
30614	220	1374	1
30615	220	1375	3.5
30616	220	1382	4
30617	220	1397	1
30618	220	1399	3.5
30619	220	1402	2
30620	220	1414	3.5
30621	220	1433	3
30622	220	1463	3.5
30623	220	1481	4
30624	220	1484	3.5
30625	220	1489	3.5
30626	220	1490	3
30627	220	1494	3.5
30628	220	1520	4
30629	220	1521	3.5
30630	220	1522	3.5
30631	220	1524	3.5
30632	220	1527	3.5
30633	220	1528	3.5
30634	220	1529	3.5
30635	220	1534	4
30636	220	1535	3.5
30637	220	1538	3.5
30638	220	1556	2.5
30639	220	1558	3.5
30640	220	1561	3.5
30641	220	1564	3.5
30642	220	1565	3.5
30643	220	1566	3.5
30644	220	1567	3
30645	220	1569	3.5
30646	220	1570	4
30647	220	1574	3
30648	220	1575	3
30649	220	1582	4
30650	220	1584	3.5
30651	220	1585	4
30652	220	1588	3.5
30653	220	1591	2
30654	220	1604	2.5
30655	220	1608	3
30656	220	1611	2.5
30657	220	1614	2
30658	220	1615	3
30659	220	1619	3.5
30660	220	1638	4
30661	220	1640	4
30662	220	1641	3.5
30663	220	1645	3.5
30664	220	1647	3
30665	220	1652	3
30666	220	1660	3
30667	220	1665	3.5
30668	220	1669	3
30669	220	1675	3.5
30670	220	1676	3.5
30671	220	1677	4
30672	220	1682	2.5
30673	220	1684	3
30674	220	1691	3.5
30675	220	1693	3.5
30676	220	1695	4.5
30677	220	1697	3.5
30678	220	1700	3.5
30679	220	1707	3
30680	220	1717	3
30681	220	1723	3.5
30682	220	1730	4
30683	220	1748	4
30684	220	1749	4
30685	220	1771	4
30686	220	1779	3.5
30687	220	1796	3.5
30688	220	1800	3.5
30689	220	1803	4
30690	220	1814	4
30691	220	1816	4
30692	220	1819	3.5
30693	220	1821	4
30694	220	1822	3
30695	220	1836	4
30696	220	1840	4
30697	220	1844	4.5
30698	220	1849	3.5
30699	220	1860	3.5
30700	220	1864	3.5
30701	220	1867	3.5
30702	220	1871	4.5
30703	220	1881	3
30704	220	1883	4
30705	220	1891	2.5
30706	220	1894	1
30707	220	1895	1
30708	220	1900	3
30709	220	1905	3.5
30710	220	1907	3.5
30711	220	1911	3.5
30712	220	1914	3
30713	220	1915	3.5
30714	220	1916	3.5
30715	220	1917	3.5
30716	220	1920	3
30717	220	1930	3
30718	220	1931	3
30719	220	1932	2.5
30720	220	1934	2.5
30721	220	1937	3.5
30722	220	1963	3
30723	220	1966	3
30724	220	1972	3
30725	220	1974	3
30726	220	1976	3.5
30727	220	1977	2.5
30728	220	1980	3.5
30729	220	1984	3.5
30730	220	1992	3
30731	220	1996	3.5
30732	220	2022	3
30733	220	2033	3.5
30734	220	2034	4
30735	220	2057	4.5
30736	220	2058	3.5
30737	220	2064	3.5
30738	220	2065	3.5
30739	220	2080	3
30740	220	2090	3
30741	220	2091	3.5
30742	220	2099	3
30743	220	2108	3
30744	220	2109	3
30745	220	2111	2
30746	220	2122	3.5
30747	220	2126	4
30748	220	2140	4
30749	220	2144	3.5
30750	220	2146	3.5
30751	220	2151	3.5
30752	220	2153	3.5
30753	220	2158	4
30754	220	2159	5
30755	220	2161	3
30756	220	2163	4
30757	220	2164	3.5
30758	220	2167	3.5
30759	220	2169	3
30760	220	2172	3.5
30761	220	2173	3
30762	220	2174	3
30763	220	2179	3
30764	220	2180	1.5
30765	220	2185	3.5
30766	220	2195	4
30767	220	2198	4
30768	220	2199	3
30769	220	2210	3.5
30770	220	2217	3.5
30771	220	2221	2.5
30772	220	2230	4
30773	220	2235	3
30774	220	2239	3.5
30775	220	2272	4
30776	220	2275	3.5
30777	220	2282	4
30778	220	2290	3.5
30779	220	2294	3.5
30780	220	2304	3.5
30781	220	2313	4
30782	220	2330	3.5
30783	220	2332	3
30784	220	2339	3
30785	220	2355	3
30786	220	2361	3
30787	220	2364	2.5
30788	220	2366	4.5
30789	220	2387	3.5
30790	220	2389	2
30791	220	2398	4
30792	220	2402	3.5
30793	220	2410	3
30794	220	2419	3.5
30795	220	2424	4
30796	220	2430	4
30797	220	2435	4
30798	220	2442	4
30799	220	2448	3.5
30800	220	2466	3.5
30801	220	2470	4
30802	220	2483	4
30803	220	2484	3.5
30804	220	2488	4
30805	220	2490	3.5
30806	220	2491	4.5
30807	220	2497	3.5
30808	220	2520	4
30809	220	2528	3
30810	220	2530	3
30811	220	2541	4.5
30812	220	2543	3.5
30813	220	2550	4
30814	220	2551	4
30815	220	2563	3.5
30816	220	2567	3
30817	220	2582	2.5
30818	220	2587	4
30819	220	2591	3.5
30820	220	2593	3.5
30821	220	2594	3
30822	220	2596	3
30823	220	2597	3.5
30824	220	2602	3.5
30825	220	2604	3
30826	220	2605	3.5
30827	220	2608	4
30828	220	2609	1.5
30829	220	2610	3.5
30830	220	2615	3
30831	220	2616	4.5
30832	220	2646	4
30833	220	2693	3.5
30834	220	2694	4
30835	220	2704	3.5
30836	220	2711	3
30837	220	2715	3
30838	220	2732	2
30839	220	2740	3.5
30840	220	2742	3.5
30841	220	2750	4.5
30842	220	2757	3.5
30843	220	2764	4
30844	220	2770	3
30845	220	2778	3.5
30846	220	2797	3.5
30847	220	2800	3.5
30848	220	2801	3
30849	220	2816	3.5
30850	220	2819	3.5
30851	220	2823	4.5
30852	220	2837	2
30853	220	2845	1.5
30854	220	2869	3.5
30855	220	2870	3.5
30856	220	2898	3.5
30857	220	2903	4
30858	220	2925	3.5
30859	220	2926	3.5
30860	220	2938	2.5
30861	220	2942	3
30862	220	2958	4
30863	220	2965	3.5
30864	220	2966	3
30865	220	2975	3.5
30866	220	2992	3.5
30867	220	2998	3.5
30868	220	3000	3.5
30869	220	3013	4.5
30870	220	3020	3.5
30871	220	3049	4
30872	220	3052	3.5
30873	220	3073	3.5
30874	220	3082	3.5
30875	220	3108	3
30876	220	3109	3.5
30877	220	3125	4
30878	220	3126	3.5
30879	220	3132	3.5
30880	220	3148	4
30881	220	3149	3.5
30882	220	3150	4
30883	220	3155	2.5
30884	220	3162	3.5
30885	220	3163	3.5
30886	220	3169	3.5
30887	220	3170	3
30888	220	3171	4
30889	220	3173	1
30890	220	3176	3
30891	220	3177	4.5
30892	220	3184	4
30893	220	3186	3.5
30894	220	3203	4
30895	220	3211	3.5
30896	220	3218	3
30897	220	3219	3.5
30898	220	3233	3.5
30899	220	3244	1.5
30900	220	3312	3
30901	220	3322	4
30902	220	3323	4
30903	220	3333	4
30904	220	3351	3.5
30905	220	3380	4
30906	220	3382	4
30907	220	3392	4
30908	220	3405	4
30909	220	3406	3.5
30910	220	3419	3.5
30911	220	3422	2.5
30912	220	3444	2.5
30913	220	3476	3.5
30914	220	3491	4
30915	220	3517	4.5
30916	220	3526	4
30917	220	3531	3.5
30918	220	3562	4
30919	220	3578	2.5
30920	220	3593	3.5
30921	220	3598	2.5
30922	220	3614	3.5
30923	220	3619	2.5
30924	220	3621	3.5
30925	220	3622	3
30926	220	3632	2
30927	220	3636	4
30928	220	3638	3
30929	220	3645	3
30930	220	3678	4
30931	220	3698	4
30932	220	3709	4
30933	220	3720	0.5
30934	220	3769	2
30935	220	3786	4
30936	220	3803	4
30937	220	3807	4.5
30938	220	3810	4
30939	220	3812	4.5
30940	220	3818	4
30941	220	3820	2.5
30942	220	3860	3
30943	220	3868	5
30944	220	3869	4
30945	220	3873	4
30946	220	3874	4.5
30947	220	3886	3.5
30948	220	3904	4
30949	220	3911	4
30950	220	3921	3
30951	220	3931	3.5
30952	220	3934	4
30953	220	3939	3.5
30954	220	3971	4
30955	220	4033	4
30956	220	4056	3.5
30957	220	4057	3.5
30958	220	4082	3
30959	220	4085	3
30960	220	4086	3
30961	220	4087	3.5
30962	220	4090	4
30963	220	4097	3.5
30964	220	4109	3.5
30965	220	4126	4
30966	220	4154	3.5
30967	220	4172	4
30968	220	4173	3.5
30969	220	4174	4.5
30970	220	4180	0.5
30971	220	4200	3
30972	220	4211	3.5
30973	220	4213	3.5
30974	220	4228	4
30975	220	4253	4
30976	220	4272	4
30977	220	4279	5
30978	220	4286	4.5
30979	220	4313	4
30980	220	4316	4
30981	220	4330	3
30982	220	4333	2.5
30983	220	4365	4
30984	220	4368	4
30985	220	4383	4
30986	220	4386	4
30987	220	4390	4
30988	220	4435	4
30989	220	4458	4
30990	220	4479	3.5
30991	220	4494	3.5
30992	220	4496	4
30993	220	4525	4
30994	220	4540	4
30995	220	4549	3.5
30996	220	4557	3
30997	220	4600	4
30998	220	4617	4
30999	220	4681	4
31000	220	4688	3
31001	220	4694	3
31002	220	4697	3.5
31003	220	4705	3.5
31004	220	4711	4
31005	220	4768	1
31006	220	4779	4
31007	220	4780	3
31008	220	4801	4
31009	220	4803	2.5
31010	220	4804	3
31011	220	4810	4
31012	220	4853	4.5
31013	220	4860	2
31014	220	4881	3.5
31015	220	4909	4.5
31016	220	4913	4.5
31017	220	4914	4.5
31018	220	4935	3.5
31019	220	4944	4.5
31020	220	4960	4
31021	220	4968	4
31022	220	4998	4.5
31023	220	5003	4
31024	220	5004	3.5
31025	220	5005	3.5
31026	220	5018	4
31027	220	5037	3
31028	220	5043	2.5
31029	220	5050	1.5
31030	220	5052	4
31031	220	5054	4.5
31032	220	5055	3
31033	220	5093	3.5
31034	220	5106	4.5
31035	220	5111	3
31036	220	5118	3.5
31037	220	5141	3.5
31038	220	5167	4.5
31039	220	5189	3.5
31040	220	5201	3.5
31041	220	5202	4
31042	220	5207	4
31043	220	5212	4
31044	220	5213	4.5
31045	220	5264	3
31046	220	5269	4
31047	220	5306	4
31048	220	5329	5
31049	220	5348	3
31050	220	5365	3.5
31051	220	5376	3
31052	220	5385	3.5
31053	220	5418	3.5
31054	220	5419	4
31055	220	5431	1
31056	220	5437	2
31057	220	5477	4.5
31058	220	5537	4
31059	220	5587	4
31060	220	5617	3.5
31061	220	5618	4.5
31062	220	5619	3.5
31063	220	5624	4
31064	220	5626	4
31065	220	5627	4
31066	220	5652	3
31067	220	5661	3.5
31068	220	5677	4
31069	220	5695	4
31070	220	5719	3.5
31071	220	5809	3
31072	220	5812	4.5
31073	220	5841	4
31074	220	5853	4
31075	220	5859	3.5
31076	220	5880	2.5
31077	220	5883	4
31078	220	5898	4.5
31079	220	5907	4
31080	220	6186	3.5
31081	220	6356	4
31082	220	6396	4
31083	220	6402	4
31084	220	6503	4.5
31085	220	6524	3.5
31086	220	6542	3.5
31087	221	10	5
31088	221	21	4
31089	221	32	5
31090	221	45	5
31091	221	48	5
31092	221	99	5
31093	221	100	5
31094	221	130	4
31095	221	142	5
31096	221	170	3
31097	221	171	5
31098	221	208	3
31099	221	254	5
31100	221	256	5
31101	221	258	4
31102	221	261	5
31103	221	264	2
31104	221	281	5
31105	221	298	4
31106	221	314	5
31107	221	369	3
31108	221	383	1
31109	221	406	5
31110	221	499	5
31111	221	524	3
31112	221	525	5
31113	221	526	5
31114	221	528	4
31115	221	576	5
31116	222	17	4
31117	222	36	5
31118	222	208	3
31119	222	217	4
31120	222	280	5
31121	222	300	4
31122	222	317	5
31123	222	318	5
31124	222	337	4
31125	222	416	2
31126	222	443	5
31127	222	472	5
31128	222	478	3
31129	222	483	5
31130	222	536	4
31131	222	683	4
31132	222	724	5
31133	222	726	4
31134	222	733	4
31135	222	734	4
31136	222	737	4
31137	222	738	5
31138	222	742	4
31139	222	753	5
31140	222	764	5
31141	222	884	5
31142	222	886	4
31143	222	890	3
31144	222	892	2
31145	222	957	4
31146	222	959	3
31147	222	1007	4
31148	222	1030	5
31149	222	1066	5
31150	222	1090	4
31151	222	1122	4
31152	222	1133	3
31153	222	1257	4
31154	222	1314	4
31155	222	1342	2
31156	222	1368	4
31157	222	1420	3
31158	222	1469	5
31159	222	1636	2
31160	222	1741	5
31161	222	1819	3
31162	222	1881	2
31163	222	1934	5
31164	222	1975	3
31165	222	2180	4
31166	222	2298	3
31167	222	2374	4
31168	222	2409	5
31169	222	2435	4
31170	223	17	5
31171	223	76	5
31172	223	100	5
31173	223	108	4
31174	223	204	5
31175	223	235	5
31176	223	261	5
31177	223	460	5
31178	223	472	4
31179	223	526	5
31180	223	538	5
31181	223	727	5
31182	223	730	4
31183	223	734	5
31184	223	745	5
31185	223	746	5
31186	223	806	5
31187	223	848	5
31188	223	882	3
31189	223	892	5
31190	223	894	4
31191	223	895	5
31192	223	919	5
31193	223	920	5
31194	223	950	4
31195	223	970	5
31196	223	975	5
31197	223	979	4
31198	223	1023	5
31199	223	1058	3
31200	223	1059	5
31201	223	1158	5
31202	223	1328	4
31203	223	1486	5
31204	223	1505	5
31205	223	1512	5
31206	223	1591	1
31207	223	1689	4
31208	223	1807	5
31209	223	1937	4
31210	223	2018	2
31211	223	2099	4
31212	223	2344	1
31213	223	2465	5
31214	223	2503	5
31215	223	2510	4
31216	223	2524	4
31217	223	2543	5
31218	223	2558	4
31219	223	2601	5
31220	223	2603	4
31221	224	1	4.5
31222	224	2	3.5
31223	224	6	4.5
31224	224	10	4
31225	224	16	4.5
31226	224	19	4.5
31227	224	21	3.5
31228	224	24	4
31229	224	29	4.5
31230	224	32	3
31231	224	42	3
31232	224	45	5
31233	224	48	5
31234	224	54	2.5
31235	224	65	4
31236	224	95	3.5
31237	224	97	3.5
31238	224	99	4
31239	224	100	4.5
31240	224	101	4.5
31241	224	123	3.5
31242	224	127	3.5
31243	224	130	4
31244	224	135	1.5
31245	224	137	3
31246	224	138	4.5
31247	224	139	3
31248	224	140	3.5
31249	224	142	4
31250	224	156	3.5
31251	224	167	1.5
31252	224	170	3
31253	224	181	3.5
31254	224	189	4
31255	224	195	4
31256	224	196	4
31257	224	203	4.5
31258	224	207	3.5
31259	224	208	4
31260	224	217	3.5
31261	224	224	4
31262	224	227	1.5
31263	224	228	5
31264	224	231	3.5
31265	224	247	2
31266	224	254	4.5
31267	224	258	4.5
31268	224	259	4.5
31269	224	261	4.5
31270	224	279	4
31271	224	280	5
31272	224	294	3.5
31273	224	298	3
31274	224	305	4
31275	224	314	4
31276	224	316	3.5
31277	224	317	5
31278	224	322	3.5
31279	224	324	4
31280	224	327	3.5
31281	224	330	3.5
31282	224	337	3
31283	224	368	3
31284	224	369	3.5
31285	224	377	4.5
31286	224	380	4.5
31287	224	384	4
31288	224	391	3.5
31289	224	406	4
31290	224	422	3
31291	224	427	4.5
31292	224	446	3.5
31293	224	460	3
31294	224	465	3.5
31295	224	472	4
31296	224	483	3.5
31297	224	485	4.5
31298	224	495	4.5
31299	224	499	3.5
31300	224	520	4
31301	224	521	2
31302	224	522	4.5
31303	224	523	4.5
31304	224	524	3
31305	224	525	4
31306	224	526	4
31307	224	528	3
31308	224	530	3.5
31309	224	538	4.5
31310	224	564	4
31311	224	565	3
31312	224	568	3.5
31313	224	572	3
31314	224	581	3.5
31315	224	612	2.5
31316	224	614	0.5
31317	224	620	3.5
31318	224	622	3.5
31319	224	624	3.5
31320	224	631	4
31321	224	645	4
31322	224	647	4.5
31323	224	650	2.5
31324	224	651	4.5
31325	224	652	4
31326	224	654	3.5
31327	224	696	3.5
31328	224	730	4
31329	224	745	4
31330	224	746	5
31331	224	788	4.5
31332	224	835	2.5
31333	224	840	4
31334	224	843	3
31335	224	844	3.5
31336	224	845	3.5
31337	224	862	2.5
31338	224	873	3.5
31339	224	875	4
31340	224	877	2.5
31341	224	878	3.5
31342	224	887	5
31343	224	888	3.5
31344	224	890	2.5
31345	224	893	4.5
31346	224	895	3.5
31347	224	898	3
31348	224	902	5
31349	224	915	4.5
31350	224	923	5
31351	224	941	4
31352	224	944	4
31353	224	957	5
31354	224	959	4.5
31355	224	961	4
31356	224	962	4.5
31357	224	963	4.5
31358	224	964	4
31359	224	966	4.5
31360	224	967	3.5
31361	224	968	4.5
31362	224	970	4.5
31363	224	971	4.5
31364	224	972	4
31365	224	974	3.5
31366	224	975	5
31367	224	976	4.5
31368	224	977	4.5
31369	224	979	5
31370	224	980	5
31371	224	981	4.5
31372	224	982	4
31373	224	983	3.5
31374	224	984	3.5
31375	224	987	4
31376	224	991	4
31377	224	998	4.5
31378	224	1000	3
31379	224	1001	3
31380	224	1002	4
31381	224	1004	4
31382	224	1006	3.5
31383	224	1009	4.5
31384	224	1012	5
31385	224	1018	4
31386	224	1019	3.5
31387	224	1021	4.5
31388	224	1022	3
31389	224	1025	4.5
31390	224	1026	4.5
31391	224	1027	3
31392	224	1030	3.5
31393	224	1032	4
31394	224	1034	4
31395	224	1035	3.5
31396	224	1036	1.5
31397	224	1038	4
31398	224	1049	4.5
31399	224	1051	5
31400	224	1053	3.5
31401	224	1060	2.5
31402	224	1083	3
31403	224	1087	3
31404	224	1095	3.5
31405	224	1103	3.5
31406	224	1105	3.5
31407	224	1111	3.5
31408	224	1112	3.5
31409	224	1113	3
31410	224	1114	2.5
31411	224	1119	4
31412	224	1131	3.5
31413	224	1133	3
31414	224	1134	3.5
31415	224	1142	3
31416	224	1144	2.5
31417	224	1145	3.5
31418	224	1189	4
31419	224	1198	2.5
31420	224	1203	4
31421	224	1214	1.5
31422	224	1226	3
31423	224	1233	4.5
31424	224	1244	4
31425	224	1250	3
31426	224	1254	0.5
31427	224	1260	3
31428	224	1261	3.5
31429	224	1265	3.5
31430	224	1271	3
31431	224	1278	3.5
31432	224	1288	4
31433	224	1290	4.5
31434	224	1296	4.5
31435	224	1302	3.5
31436	224	1310	4
31437	224	1315	4
31438	224	1322	4
31439	224	1330	3.5
31440	224	1337	4
31441	224	1338	3.5
31442	224	1340	4
31443	224	1344	4.5
31444	224	1361	4
31445	224	1368	4
31446	224	1369	3.5
31447	224	1372	3.5
31448	224	1375	4
31449	224	1382	4.5
31450	224	1386	3.5
31451	224	1399	3.5
31452	224	1400	4
31453	224	1402	4
31454	224	1412	4
31455	224	1456	2.5
31456	224	1463	4.5
31457	224	1481	3.5
31458	224	1484	3
31459	224	1489	3
31460	224	1490	3.5
31461	224	1492	3.5
31462	224	1494	3
31463	224	1527	3.5
31464	224	1528	3
31465	224	1535	3.5
31466	224	1558	4
31467	224	1561	4.5
31468	224	1564	3
31469	224	1565	4
31470	224	1567	3.5
31471	224	1569	4
31472	224	1570	3.5
31473	224	1572	4.5
31474	224	1573	4
31475	224	1575	3
31476	224	1581	4
31477	224	1582	5
31478	224	1586	3.5
31479	224	1591	5
31480	224	1615	3.5
31481	224	1619	4
31482	224	1640	3
31483	224	1641	3
31484	224	1643	4.5
31485	224	1645	4
31486	224	1656	3.5
31487	224	1669	4
31488	224	1675	3
31489	224	1677	5
31490	224	1707	4
31491	224	1717	4
31492	224	1730	4
31493	224	1749	4.5
31494	224	1771	3
31495	224	1803	4.5
31496	224	1814	3.5
31497	224	1822	3
31498	224	1836	2.5
31499	224	1844	4.5
31500	224	1848	4.5
31501	224	1865	4
31502	224	1867	3.5
31503	224	1930	3
31504	224	1934	4
31505	224	1937	3.5
31506	224	1941	4
31507	224	2002	4
31508	224	2022	3.5
31509	224	2034	4
31510	224	2057	4.5
31511	224	2058	3
31512	224	2080	3.5
31513	224	2091	4
31514	224	2099	3.5
31515	224	2122	3.5
31516	224	2144	3.5
31517	224	2158	3
31518	224	2159	4
31519	224	2160	2
31520	224	2163	3.5
31521	224	2172	4.5
31522	224	2173	4
31523	224	2178	3.5
31524	224	2179	2
31525	224	2187	3.5
31526	224	2198	4
31527	224	2209	3.5
31528	224	2210	4.5
31529	224	2233	4.5
31530	224	2246	3.5
31531	224	2282	4.5
31532	224	2313	4
31533	224	2324	5
31534	224	2330	3.5
31535	224	2332	4
31536	224	2358	4.5
31537	224	2359	4.5
31538	224	2360	4
31539	224	2362	4.5
31540	224	2364	4
31541	224	2366	5
31542	224	2387	3.5
31543	224	2389	3.5
31544	224	2395	4
31545	224	2398	4
31546	224	2399	5
31547	224	2402	4.5
31548	224	2414	4.5
31549	224	2421	5
31550	224	2424	4
31551	224	2430	4
31552	224	2442	4
31553	224	2466	4.5
31554	224	2467	4
31555	224	2472	4.5
31556	224	2474	4.5
31557	224	2484	1.5
31558	224	2488	4.5
31559	224	2497	3.5
31560	224	2520	4.5
31561	224	2542	3.5
31562	224	2543	3.5
31563	224	2596	3.5
31564	224	2597	4
31565	224	2606	5
31566	224	2608	4
31567	224	2614	2.5
31568	224	2616	4.5
31569	224	2628	3.5
31570	224	2633	4.5
31571	224	2652	4
31572	224	2668	4
31573	224	2693	4
31574	224	2713	4
31575	224	2716	4
31576	224	2742	4
31577	224	2751	3
31578	224	2757	4.5
31579	224	2766	2.5
31580	224	2770	4
31581	224	2778	3.5
31582	224	2787	4.5
31583	224	2800	3.5
31584	224	2805	4.5
31585	224	2819	4.5
31586	224	2837	5
31587	224	2855	1.5
31588	224	2869	3
31589	224	2870	4
31590	224	2898	4.5
31591	224	2903	5
31592	224	2906	4.5
31593	224	2907	3.5
31594	224	2926	0.5
31595	224	2938	3.5
31596	224	2965	1
31597	224	2966	4.5
31598	224	2967	4.5
31599	224	3000	3
31600	224	3025	2
31601	224	3055	3.5
31602	224	3056	3.5
31603	224	3087	4.5
31604	224	3108	2.5
31605	224	3109	4
31606	224	3132	2.5
31607	224	3135	4
31608	224	3139	3.5
31609	224	3141	3
31610	224	3149	4.5
31611	224	3150	4.5
31612	224	3155	4
31613	224	3159	3.5
31614	224	3163	4.5
31615	224	3165	3.5
31616	224	3169	4
31617	224	3170	4
31618	224	3173	4.5
31619	224	3176	3.5
31620	224	3177	2.5
31621	224	3219	4.5
31622	224	3233	4.5
31623	224	3248	1.5
31624	224	3265	4
31625	224	3277	3.5
31626	224	3320	4.5
31627	224	3323	4
31628	224	3327	0.5
31629	224	3333	4
31630	224	3345	5
31631	224	3351	3.5
31632	224	3374	5
31633	224	3375	4.5
31634	224	3380	3.5
31635	224	3382	2.5
31636	224	3383	2.5
31637	224	3394	4.5
31638	224	3421	4
31639	224	3422	3
31640	224	3424	2.5
31641	224	3425	4
31642	224	3474	4.5
31643	224	3479	5
31644	224	3481	3.5
31645	224	3491	4
31646	224	3510	4.5
31647	224	3517	4
31648	224	3556	3
31649	224	3578	3
31650	224	3633	3
31651	224	3638	3.5
31652	224	3696	2
31653	224	3698	4
31654	224	3709	4
31655	224	3738	4.5
31656	224	3769	4
31657	224	3792	4.5
31658	224	3796	5
31659	224	3804	4.5
31660	224	3807	3
31661	224	3812	4
31662	224	3813	3.5
31663	224	3818	4
31664	224	3860	4.5
31665	224	3868	4
31666	224	3886	4
31667	224	3888	5
31668	224	3900	4.5
31669	224	3903	4
31670	224	3934	4
31671	224	3966	4.5
31672	224	3999	3.5
31673	224	4033	3.5
31674	224	4062	3
31675	224	4073	5
31676	224	4154	4.5
31677	224	4173	4
31678	224	4184	2.5
31679	224	4188	4.5
31680	224	4200	4
31681	224	4209	4.5
31682	224	4213	4
31683	224	4279	5
31684	224	4286	4.5
31685	224	4313	2.5
31686	224	4319	2
31687	224	4328	4.5
31688	224	4365	5
31689	224	4368	3.5
31690	224	4383	4
31691	224	4386	3.5
31692	224	4435	4
31693	224	4436	5
31694	224	4458	4.5
31695	224	4459	4
31696	224	4461	5
31697	224	4473	4
31698	224	4485	5
31699	224	4487	4
31700	224	4491	4
31701	224	4494	4
31702	224	4504	4.5
31703	224	4561	3.5
31704	224	4583	3.5
31705	224	4600	1.5
31706	224	4643	5
31707	224	4646	3
31708	224	4681	3.5
31709	224	4692	5
31710	224	4705	3.5
31711	224	4706	4.5
31712	224	4710	2.5
31713	224	4779	4.5
31714	224	4780	2.5
31715	224	4801	3.5
31716	224	4803	4.5
31717	224	4804	4
31718	224	4837	1.5
31719	224	4838	3
31720	224	4884	3.5
31721	224	4887	4.5
31722	224	4906	4
31723	224	4909	4
31724	224	4910	4
31725	224	4920	4.5
31726	224	4935	3.5
31727	224	4954	4.5
31728	224	4960	4
31729	224	4968	3.5
31730	224	4977	4
31731	224	4998	2.5
31732	224	5003	3
31733	224	5005	5
31734	224	5020	4
31735	224	5037	3
31736	224	5039	3
31737	224	5046	4.5
31738	224	5054	4
31739	224	5090	2.5
31740	224	5106	4
31741	224	5167	4.5
31742	224	5173	4
31743	224	5201	2
31744	224	5202	4.5
31745	224	5207	5
31746	224	5210	3.5
31747	224	5221	3
31748	224	5269	3
31749	224	5289	3
31750	224	5304	0.5
31751	224	5305	3
31752	224	5306	3.5
31753	224	5311	3.5
31754	224	5312	2.5
31755	224	5322	2.5
31756	224	5323	4
31757	224	5328	4.5
31758	224	5329	4.5
31759	224	5333	3
31760	224	5334	3.5
31761	224	5335	2.5
31762	224	5337	3.5
31763	224	5339	0.5
31764	224	5349	4.5
31765	224	5365	5
31766	224	5366	2.5
31767	224	5370	4
31768	224	5374	2
31769	224	5376	2.5
31770	224	5377	3.5
31771	224	5391	4.5
31772	224	5401	3.5
31773	224	5412	4.5
31774	224	5455	5
31775	224	5514	4.5
31776	224	5539	4
31777	224	5548	4.5
31778	224	5562	3.5
31779	224	5592	5
31780	224	5618	3.5
31781	224	5619	3
31782	224	5624	4.5
31783	224	5627	3.5
31784	224	5628	1
31785	224	5629	1.5
31786	224	5630	3
31787	224	5677	4
31788	224	5678	4
31789	224	5680	1.5
31790	224	5682	3.5
31791	224	5707	4
31792	224	5719	3.5
31793	224	5726	3
31794	224	5729	4
31795	224	5730	3.5
31796	224	5733	3.5
31797	224	5743	4
31798	224	5793	4
31799	224	5794	4
31800	224	5795	3.5
31801	224	5802	4
31802	224	5806	3.5
31803	224	5807	0.5
31804	224	5809	3
31805	224	5812	2
31806	224	5816	3
31807	224	5839	4.5
31808	224	5851	2
31809	224	5859	2.5
31810	224	5868	3.5
31811	224	5873	2.5
31812	224	5875	4
31813	224	5876	4
31814	224	5880	3
31815	224	5881	4
31816	224	5883	3
31817	224	5885	3
31818	224	5890	3.5
31819	224	5891	3.5
31820	224	5898	4
31821	224	5899	4
31822	224	5900	2
31823	224	6013	4.5
31824	224	6061	4
31825	224	6127	4
31826	224	6207	4.5
31827	224	6242	4
31828	224	6260	4.5
31829	224	6281	3.5
31830	224	6300	4.5
31831	224	6346	4.5
31832	224	6356	3.5
31833	224	6362	3.5
31834	224	6370	4.5
31835	224	6373	3.5
31836	224	6381	2.5
31837	224	6390	4
31838	224	6395	1
31839	224	6408	4
31840	224	6411	3
31841	224	6413	5
31842	224	6415	3
31843	224	6417	3.5
31844	224	6418	4
31845	224	6448	1.5
31846	224	6449	4
31847	224	6462	3.5
31848	224	6463	3
31849	224	6469	0.5
31850	224	6485	5
31851	224	6486	4
31852	224	6488	3.5
31853	224	6491	1.5
31854	224	6499	4
31855	224	6503	4
31856	224	6517	1.5
31857	224	6518	3.5
31858	224	6521	3
31859	224	6522	3
31860	224	6540	1.5
31861	224	6563	4.5
31862	224	6565	3
31863	224	6566	3.5
31864	224	6593	4
31865	224	6603	3
31866	224	6616	4
31867	224	6620	2.5
31868	224	6627	3.5
31869	224	6631	2.5
31870	224	6632	4
31871	224	6634	2.5
31872	224	6635	3
31873	224	6642	4
31874	224	6647	0.5
31875	224	6663	3
31876	224	6671	4
31877	224	6673	4
31878	224	6677	3.5
31879	224	6679	4
31880	224	6685	3
31881	224	6694	1.5
31882	224	6697	1
31883	224	6699	4
31884	224	6714	4
31885	224	6716	3.5
31886	224	6723	4
31887	224	6724	2.5
31888	224	6726	4
31889	224	6727	4.5
31890	224	6739	4
31891	224	6742	2.5
31892	224	6743	3.5
31893	224	6744	4
31894	224	6745	3
31895	224	6755	2
31896	224	6757	4
31897	224	6760	4.5
31898	224	6762	4
31899	224	6767	0.5
31900	224	6768	4.5
31901	224	6787	1.5
31902	224	6790	4
31903	224	6800	3
31904	224	6801	3.5
31905	224	6811	4
31906	224	6813	0.5
31907	224	6819	2
31908	224	6820	3.5
31909	224	6824	3
31910	224	6827	4.5
31911	224	6835	4
31912	224	6843	3
31913	224	6847	2.5
31914	224	6848	4
31915	224	6849	4.5
31916	224	6865	4.5
31917	224	6866	3.5
31918	224	6890	1.5
31919	224	6891	5
31920	224	6895	1.5
31921	224	6896	3.5
31922	224	6915	2
31923	224	6923	3
31924	224	6925	3
31925	224	6932	0.5
31926	224	6934	3
31927	224	6946	5
31928	224	6947	0.5
31929	224	6948	3.5
31930	224	6950	5
31931	224	6957	2.5
31932	224	6959	4
31933	224	6967	4.5
31934	224	6979	4
31935	224	6990	1
31936	224	6991	3.5
31937	224	6999	3
31938	224	7006	3
31939	224	7008	1.5
31940	224	7009	3
31941	224	7015	2.5
31942	224	7017	3
31943	224	7018	4
31944	224	7019	2.5
31945	224	7022	2.5
31946	224	7029	2
31947	224	7031	3
31948	224	7032	0.5
31949	224	7036	3.5
31950	224	7037	2.5
31951	224	7038	4
31952	224	7039	2.5
31953	224	7040	0.5
31954	224	7052	4.5
31955	224	7053	2.5
31956	224	7056	3.5
31957	224	7061	3.5
31958	224	7066	4
31959	224	7071	5
31960	224	7082	3.5
31961	224	7083	3
31962	224	7084	3
31963	224	7085	4
31964	224	7086	0.5
31965	224	7089	4.5
31966	224	7091	0.5
31967	224	7095	4
31968	224	7102	2.5
31969	224	7109	2.5
31970	224	7112	4.5
31971	224	7115	3.5
31972	224	7117	4
31973	224	7119	3.5
31974	224	7127	2
31975	224	7137	3.5
31976	224	7139	3.5
31977	224	7151	5
31978	224	7153	3.5
31979	224	7155	4.5
31980	224	7157	4.5
31981	224	7158	3
31982	224	7161	4.5
31983	224	7163	2.5
31984	224	7169	2.5
31985	224	7177	3.5
31986	224	7179	4.5
31987	224	7180	4
31988	224	7181	3.5
31989	224	7185	1
31990	224	7190	4.5
31991	224	7200	4
31992	224	7201	2.5
31993	224	7203	3.5
31994	224	7212	3.5
31995	224	7219	4
31996	224	7221	1.5
31997	224	7222	3.5
31998	224	7229	3.5
31999	224	7232	3
32000	224	7240	4
32001	224	7245	0.5
32002	224	7248	2.5
32003	224	7263	2.5
32004	224	7265	0.5
32005	224	7268	4
32006	224	7271	3.5
32007	224	7273	4.5
32008	224	7287	3
32009	224	7288	3
32010	224	7292	4
32011	224	7297	2
32012	224	7301	4.5
32013	224	7302	1.5
32014	224	7307	3.5
32015	224	7322	4
32016	224	7323	4
32017	224	7332	2.5
32018	224	7333	3.5
32019	224	7334	4
32020	224	7336	4
32021	224	7339	4.5
32022	224	7347	3
32023	224	7355	4.5
32024	224	7363	3
32025	224	7368	4.5
32026	224	7373	3.5
32027	224	7376	3
32028	224	7378	5
32029	224	7383	3
32030	224	7385	3.5
32031	224	7387	4
32032	224	7397	4
32033	224	7398	3.5
32034	224	7403	3
32035	224	7405	3
32036	224	7413	3
32037	224	7418	4
32038	224	7421	3.5
32039	224	7423	3.5
32040	224	7424	4
32041	224	7425	1.5
32042	224	7432	2.5
32043	224	7433	3
32044	224	7435	3.5
32045	224	7439	4.5
32046	224	7446	4
32047	224	7450	2
32048	224	7453	2
32049	224	7454	4
32050	224	7464	3.5
32051	224	7472	3.5
32052	224	7473	5
32053	224	7485	4.5
32054	224	7489	4.5
32055	224	7491	1.5
32056	224	7493	2
32057	224	7494	3.5
32058	224	7501	4
32059	224	7503	3.5
32060	224	7504	4.5
32061	224	7507	2
32062	224	7511	4
32063	224	7528	0.5
32064	224	7538	5
32065	224	7542	5
32066	224	7543	3
32067	224	7545	4.5
32068	224	7547	2.5
32069	224	7549	2
32070	224	7559	0.5
32071	224	7560	3
32072	224	7564	2.5
32073	224	7565	3
32074	224	7567	4
32075	224	7573	3.5
32076	224	7579	4
32077	224	7586	3.5
32078	224	7587	3.5
32079	224	7588	5
32080	224	7589	5
32081	224	7590	2
32082	224	7593	4
32083	224	7612	3.5
32084	224	7615	3
32085	224	7616	0.5
32086	224	7620	3
32087	224	7621	4.5
32088	224	7631	3.5
32089	224	7642	3
32090	224	7643	3.5
32091	224	7648	3
32092	224	7649	4
32093	224	7651	2
32094	224	7654	4
32095	224	7670	5
32096	224	7677	3.5
32097	224	7694	4
32098	224	7699	1.5
32099	224	7703	3.5
32100	224	7715	3.5
32101	224	7719	4.5
32102	224	7720	3
32103	224	7724	1
32104	224	7742	3
32105	224	7747	1
32106	224	7761	4.5
32107	224	7765	3.5
32108	224	7769	3.5
32109	224	7788	1
32110	224	7798	3.5
32111	224	7802	4.5
32112	224	7804	1.5
32113	224	7805	3
32114	224	7811	0.5
32115	224	7817	4.5
32116	224	7827	4
32117	224	7832	3
32118	224	7834	1.5
32119	224	7844	3.5
32120	224	7846	0.5
32121	224	7863	3.5
32122	224	7869	5
32123	224	7870	3.5
32124	224	7885	4
32125	224	7886	2.5
32126	224	7888	2.5
32127	224	7889	3.5
32128	224	7907	5
32129	224	7908	4.5
32130	224	7913	4
32131	224	7914	3.5
32132	224	7915	3.5
32133	224	7917	4
32134	224	7931	3.5
32135	224	7934	0.5
32136	224	7936	2
32137	224	7938	4
32138	224	7946	1.5
32139	224	7952	3.5
32140	224	7956	3
32141	224	7957	3.5
32142	224	7959	4
32143	224	7960	3
32144	224	7961	4
32145	224	7966	0.5
32146	224	7975	4.5
32147	224	7977	1.5
32148	224	7979	4.5
32149	224	7985	4
32150	224	7995	2
32151	224	8011	2.5
32152	224	8015	3
32153	224	8021	3.5
32154	224	8030	1
32155	224	8048	4
32156	224	8052	1.5
32157	224	8057	2
32158	224	8068	2.5
32159	224	8077	1.5
32160	224	8078	3
32161	224	8086	4.5
32162	224	8087	3.5
32163	224	8090	5
32164	224	8095	3
32165	224	8096	4
32166	224	8105	2.5
32167	224	8110	3.5
32168	224	8111	1.5
32169	224	8114	4
32170	224	8121	4
32171	224	8130	3.5
32172	224	8138	3
32173	224	8144	0.5
32174	224	8148	4
32175	224	8151	2
32176	224	8158	3.5
32177	224	8159	3.5
32178	224	8163	4
32179	224	8165	1
32180	224	8168	4.5
32181	224	8173	4
32182	224	8181	3
32183	224	8184	4.5
32184	224	8188	2.5
32185	224	8227	4.5
32186	224	8229	3.5
32187	224	8231	3.5
32188	224	8240	1.5
32189	224	8241	4.5
32190	224	8249	0.5
32191	224	8253	3.5
32192	224	8261	3.5
32193	224	8262	3.5
32194	224	8264	4.5
32195	224	8278	1.5
32196	224	8280	3.5
32197	224	8284	5
32198	224	8313	3.5
32199	224	8329	4
32200	224	8339	2.5
32201	224	8351	3.5
32202	224	8354	4.5
32203	224	8370	3
32204	224	8374	2.5
32205	224	8413	2.5
32206	224	8422	4
32207	224	8485	1.5
32208	224	8489	3.5
32209	224	8496	2
32210	224	8500	4.5
32211	224	8538	5
32212	224	8546	5
32213	224	8564	2
32214	224	8575	3
32215	224	8581	4
32216	224	8600	3.5
32217	224	8616	0.5
32218	224	8627	4
32219	224	8628	4
32220	224	8630	4.5
32221	224	8632	0.5
32222	224	8638	4.5
32223	224	8639	2.5
32224	224	8642	3.5
32225	224	8654	4
32226	224	8661	2.5
32227	224	8662	2.5
32228	224	8690	3.5
32229	224	8704	3.5
32230	224	8705	3
32231	224	8729	4
32232	224	8746	3.5
32233	224	8758	2.5
32234	224	8760	4
32235	224	8761	3.5
32236	224	8773	2.5
32237	224	8778	3.5
32238	224	8779	5
32239	224	8782	4
32240	224	8804	4
32241	224	8805	2.5
32242	224	8826	4
32243	224	8846	2.5
32244	224	8858	2.5
32245	224	8876	2
32246	224	8885	3.5
32247	224	8894	4
32248	224	8925	3.5
32249	224	8934	3.5
32250	224	8959	4.5
32251	224	8960	4.5
32252	224	8963	5
32253	224	8968	3.5
32254	224	8995	3.5
32255	224	8996	2
32256	224	9013	3.5
32257	224	9021	4
32258	224	9028	0.5
32259	224	9029	1
32260	224	9049	4.5
32261	224	9051	3
32262	224	9053	4
32263	224	9061	0.5
32264	224	9070	3.5
32265	224	9073	3.5
32266	224	9111	5
32267	224	9115	4
32268	224	9122	4
32269	224	9128	3
32270	224	9135	4
32271	224	9138	4
32272	224	9156	1.5
32273	224	9171	3.5
32274	224	9173	5
32275	224	9181	3.5
32276	224	9187	3.5
32277	224	9225	4.5
32278	224	9227	5
32279	224	9230	3.5
32280	224	9234	3
32281	224	9236	4.5
32282	224	9280	4.5
32283	224	9315	4.5
32284	224	9322	3.5
32285	224	9343	4.5
32286	224	9360	4.5
32287	224	9369	3.5
32288	224	9382	5
32289	224	9396	1.5
32290	224	9413	4
32291	224	9418	4.5
32292	224	9431	3.5
32293	224	9437	5
32294	224	9438	4.5
32295	224	9447	5
32296	224	9477	3.5
32297	224	9491	4
32298	224	9506	4
32299	224	9509	3.5
32300	224	9520	5
32301	224	9538	3.5
32302	224	9547	4.5
32303	224	9571	4.5
32304	224	9600	3
32305	224	9643	3.5
32306	224	9647	3.5
32307	224	9655	4
32308	224	9671	4.5
32309	224	9695	4
32310	224	9700	4
32311	224	9701	4.5
32312	224	9703	2
32313	224	9712	3
32314	224	9730	4.5
32315	224	9747	4
32316	224	9780	4
32317	224	9787	3.5
32318	224	9792	3.5
32319	224	9805	4
32320	224	9814	4.5
32321	224	9822	4
32322	224	9838	4
32323	224	9847	4.5
32324	224	9866	0.5
32325	224	9877	0.5
32326	224	9883	3.5
32327	224	9896	3.5
32328	224	9897	3
32329	224	9900	1.5
32330	224	9903	5
32331	224	9909	4
32332	224	9915	5
32333	224	9917	4
32334	224	9920	1.5
32335	224	9924	4
32336	224	9929	4
32337	224	9931	1.5
32338	224	9935	4.5
32339	224	9938	3
32340	224	9940	4
32341	224	9941	2.5
32342	224	9949	2.5
32343	224	9950	1.5
32344	224	9955	3
32345	224	9956	4.5
32346	224	9960	2.5
32347	224	9961	3.5
32348	224	9962	3
32349	224	9966	3
32350	224	9970	4
32351	224	9971	3
32352	224	9974	1.5
32353	224	9976	4
32354	224	9978	2.5
32355	224	9980	4.5
32356	224	9983	2.5
32357	224	9984	2.5
32358	224	9985	2.5
32359	224	9986	5
32360	224	9989	3.5
32361	224	9994	1.5
32362	224	9999	3.5
32363	224	10000	5
32364	224	10001	4.5
32365	224	10003	3
32366	224	10005	4.5
32367	224	10006	3.5
32368	224	10009	2.5
32369	224	10020	4.5
32370	224	10023	2.5
32371	224	10025	3
32372	224	10028	1.5
32373	224	10040	4
32374	224	10043	3
32375	224	10056	3.5
32376	224	10064	1.5
32377	224	10067	4
32378	224	10069	2.5
32379	224	10070	4
32380	224	10072	4
32381	224	10074	4
32382	224	10077	4
32383	224	10078	5
32384	224	10079	4
32385	224	10087	3.5
32386	224	10090	5
32387	224	10092	3
32388	224	10095	3.5
32389	224	10098	4.5
32390	224	10103	4
32391	224	10123	4
32392	224	10129	4.5
32393	224	10131	3.5
32394	224	10136	3
32395	224	10137	5
32396	224	10138	3
32397	224	10148	2.5
32398	224	10158	4
32399	224	10177	5
32400	224	10182	4
32401	224	10207	2
32402	224	10256	5
32403	225	5	4
32404	225	11	4
32405	225	17	4
32406	225	36	4
32407	225	96	5
32408	225	127	5
32409	225	161	4
32410	225	162	4
32411	225	232	4
32412	225	247	4
32413	225	300	4
32414	225	310	5
32415	225	311	4
32416	225	318	4
32417	225	324	4
32418	225	403	4
32419	225	416	5
32420	225	425	4
32421	225	427	4
32422	225	472	5
32423	225	483	3
32424	225	520	3
32425	225	524	5
32426	225	525	3
32427	225	526	5
32428	226	1	4
32429	226	3	5
32430	226	5	5
32431	226	6	3
32432	226	7	4
32433	226	14	3
32434	226	17	5
32435	226	25	3
32436	226	26	4
32437	226	58	5
32438	226	60	4
32439	226	73	5
32440	226	80	5
32441	226	85	3
32442	226	97	4
32443	226	117	4
32444	226	120	5
32445	226	121	5
32446	226	133	5
32447	226	231	5
32448	226	336	4
32449	226	539	4
32450	226	542	5
32451	226	555	5
32452	226	560	4
32453	226	564	4
32454	226	565	5
32455	226	581	3
32456	226	592	4
32457	226	602	5
32458	226	604	5
32459	226	605	3
32460	226	611	4
32461	226	614	3
32462	226	620	5
32463	226	622	4
32464	226	623	3
32465	226	639	3
32466	226	654	5
32467	226	659	4
32468	226	669	4
32469	226	673	4
32470	226	677	4
32471	226	681	5
32472	226	682	5
32473	226	687	5
32474	226	694	5
32475	226	873	3
32476	226	947	4
32477	226	1103	5
32478	226	1111	5
32479	226	1133	5
32480	227	100	4
32481	227	231	4
32482	227	261	5
32483	227	280	4
32484	227	472	4
32485	227	526	4
32486	227	631	5
32487	227	712	2
32488	227	887	4
32489	227	944	4
32490	227	957	4
32491	227	959	4
32492	227	983	5
32493	227	987	4
32494	227	991	5
32495	227	1007	5
32496	227	1036	5
32497	227	1053	4
32498	227	1296	5
32499	227	1656	3
32500	227	1907	5
32501	227	2099	3
32502	227	2114	3
32503	227	2246	2
32504	227	2282	5
32505	227	2327	5
32506	227	2476	2
32507	227	2713	4
32508	227	2742	3
32509	227	3073	5
32510	227	3934	4
32511	228	2	4
32512	228	6	3.5
32513	228	10	4
32514	228	12	3.5
32515	228	19	3.5
32516	228	21	4.5
32517	228	31	3
32518	228	32	5
32519	228	45	5
32520	228	48	5
32521	228	65	4.5
32522	228	88	3.5
32523	228	99	5
32524	228	101	4
32525	228	121	4.5
32526	228	127	3
32527	228	128	4
32528	228	130	3.5
32529	228	142	4
32530	228	148	4
32531	228	149	3
32532	228	161	3
32533	228	170	3.5
32534	228	181	3
32535	228	203	4
32536	228	218	4.5
32537	228	224	5
32538	228	227	4
32539	228	231	4
32540	228	236	3.5
32541	228	254	4
32542	228	259	5
32543	228	261	5
32544	228	267	3
32545	228	277	3
32546	228	278	4
32547	228	280	5
32548	228	281	4
32549	228	290	4
32550	228	305	4
32551	228	311	3
32552	228	314	5
32553	228	316	3
32554	228	317	5
32555	228	321	3.5
32556	228	324	4
32557	228	327	4
32558	228	328	3
32559	228	337	4
32560	228	340	3
32561	228	356	3
32562	228	360	3.5
32563	228	369	3.5
32564	228	383	4
32565	228	389	4
32566	228	391	2.5
32567	228	403	4.5
32568	228	406	4
32569	228	414	4
32570	228	422	3
32571	228	427	4
32572	228	431	3
32573	228	446	4
32574	228	452	5
32575	228	453	4
32576	228	462	4
32577	228	465	4.5
32578	228	467	3
32579	228	472	5
32580	228	483	3
32581	228	485	4.5
32582	228	487	4.5
32583	228	495	5
32584	228	496	4
32585	228	497	4
32586	228	520	3.5
32587	228	522	4
32588	228	523	5
32589	228	524	4
32590	228	525	5
32591	228	526	5
32592	228	538	5
32593	228	565	4.5
32594	228	568	4
32595	228	577	3.5
32596	228	620	4
32597	228	622	4
32598	228	624	5
32599	228	627	4
32600	228	630	4.5
32601	228	638	2.5
32602	228	639	2.5
32603	228	645	5
32604	228	647	3
32605	228	651	3.5
32606	228	653	3
32607	228	654	4
32608	228	659	4
32609	228	662	4.5
32610	228	677	4
32611	228	696	4
32612	228	700	4.5
32613	228	708	3
32614	228	726	4
32615	228	746	3.5
32616	228	803	3.5
32617	228	835	4
32618	228	844	4
32619	228	845	3.5
32620	228	864	4
32621	228	877	5
32622	228	878	5
32623	228	887	5
32624	228	888	4
32625	228	890	3.5
32626	228	892	4.5
32627	228	895	4
32628	228	909	4
32629	228	913	4.5
32630	228	915	3.5
32631	228	923	5
32632	228	926	5
32633	228	957	5
32634	228	959	4
32635	228	961	4
32636	228	963	5
32637	228	964	4.5
32638	228	968	5
32639	228	970	3.5
32640	228	971	4.5
32641	228	972	4
32642	228	975	5
32643	228	976	5
32644	228	977	5
32645	228	981	4
32646	228	982	4.5
32647	228	984	5
32648	228	987	4
32649	228	990	4.5
32650	228	994	4
32651	228	1000	4
32652	228	1005	3.5
32653	228	1009	4.5
32654	228	1018	5
32655	228	1019	5
32656	228	1023	4.5
32657	228	1025	4
32658	228	1026	4
32659	228	1030	4
32660	228	1034	5
32661	228	1035	3.5
32662	228	1041	4
32663	228	1051	4
32664	228	1063	3.5
32665	228	1071	5
32666	228	1090	4
32667	228	1092	3
32668	228	1094	4
32669	228	1097	3
32670	228	1103	4
32671	228	1106	3
32672	228	1112	5
32673	228	1119	4
32674	228	1125	3.5
32675	228	1127	4
32676	228	1131	3.5
32677	228	1133	4
32678	228	1134	4
32679	228	1144	5
32680	228	1145	3.5
32681	228	1162	4.5
32682	228	1189	5
32683	228	1206	3.5
32684	228	1212	3.5
32685	228	1226	4
32686	228	1233	5
32687	228	1244	2.5
32688	228	1250	3.5
32689	228	1253	2
32690	228	1261	4.5
32691	228	1265	4.5
32692	228	1268	4.5
32693	228	1271	4.5
32694	228	1278	4.5
32695	228	1279	4.5
32696	228	1288	4
32697	228	1290	3.5
32698	228	1296	3.5
32699	228	1297	4.5
32700	228	1302	4
32701	228	1304	4
32702	228	1310	4
32703	228	1311	4
32704	228	1314	4
32705	228	1315	4
32706	228	1322	3.5
32707	228	1330	4
32708	228	1337	4
32709	228	1340	4.5
32710	228	1343	3
32711	228	1344	4.5
32712	228	1348	4
32713	228	1351	4
32714	228	1361	5
32715	228	1364	4
32716	228	1368	4
32717	228	1369	3
32718	228	1372	5
32719	228	1375	5
32720	228	1382	4.5
32721	228	1392	4
32722	228	1402	5
32723	228	1406	4
32724	228	1427	3
32725	228	1443	4.5
32726	228	1456	3.5
32727	228	1463	5
32728	228	1482	4
32729	228	1484	3.5
32730	228	1488	4
32731	228	1489	3.5
32732	228	1490	4.5
32733	228	1494	3.5
32734	228	1528	4.5
32735	228	1536	3.5
32736	228	1538	4
32737	228	1555	3.5
32738	228	1561	4
32739	228	1564	5
32740	228	1565	4
32741	228	1566	4.5
32742	228	1568	3.5
32743	228	1570	3.5
32744	228	1574	4
32745	228	1575	4
32746	228	1590	3.5
32747	228	1591	4.5
32748	228	1619	4
32749	228	1641	3.5
32750	228	1670	4
32751	228	1675	4
32752	228	1684	4.5
32753	228	1686	4
32754	228	1691	4
32755	228	1700	3
32756	228	1717	4
32757	228	1726	3.5
32758	228	1730	4.5
32759	228	1743	4
32760	228	1748	4
32761	228	1749	3.5
32762	228	1751	4
32763	228	1770	5
32764	228	1771	4
32765	228	1796	3
32766	228	1804	3.5
32767	228	1811	4.5
32768	228	1814	4
32769	228	1822	4
32770	228	1832	4
32771	228	1844	5
32772	228	1849	4
32773	228	1852	2.5
32774	228	1865	4
32775	228	1883	5
32776	228	1884	5
32777	228	1891	4
32778	228	1893	4
32779	228	1894	3
32780	228	1904	4
32781	228	1907	2.5
32782	228	1915	4
32783	228	1930	4
32784	228	1932	2.5
32785	228	1933	4
32786	228	1934	3
32787	228	1937	4.5
32788	228	1938	4
32789	228	1941	4
32790	228	1973	4.5
32791	228	1976	3.5
32792	228	1977	3.5
32793	228	1982	4
32794	228	2008	4
32795	228	2022	2.5
32796	228	2031	3.5
32797	228	2033	2.5
32798	228	2034	5
32799	228	2055	4
32800	228	2057	5
32801	228	2080	3
32802	228	2091	4
32803	228	2099	3
32804	228	2144	4
32805	228	2151	4
32806	228	2158	3
32807	228	2159	4
32808	228	2160	3
32809	228	2163	5
32810	228	2167	2.5
32811	228	2169	3
32812	228	2172	4
32813	228	2173	4
32814	228	2175	3
32815	228	2178	4
32816	228	2191	4
32817	228	2209	3.5
32818	228	2210	5
32819	228	2233	4
32820	228	2245	3.5
32821	228	2247	3
32822	228	2249	2.5
32823	228	2250	3.5
32824	228	2259	3.5
32825	228	2260	3
32826	228	2271	4
32827	228	2282	5
32828	228	2294	3.5
32829	228	2313	4
32830	228	2327	4.5
32831	228	2330	4
32832	228	2332	3
32833	228	2336	4.5
32834	228	2337	5
32835	228	2358	4
32836	228	2360	4
32837	228	2362	5
32838	228	2364	3
32839	228	2366	5
32840	228	2387	4.5
32841	228	2389	4
32842	228	2392	4
32843	228	2396	4
32844	228	2399	5
32845	228	2402	3.5
32846	228	2404	4
32847	228	2414	4.5
32848	228	2421	5
32849	228	2424	5
32850	228	2442	3.5
32851	228	2443	3
32852	228	2466	4.5
32853	228	2488	5
32854	228	2491	4.5
32855	228	2496	4
32856	228	2520	5
32857	228	2531	4.5
32858	228	2541	5
32859	228	2542	4
32860	228	2558	5
32861	228	2567	4
32862	228	2588	3
32863	228	2594	4
32864	228	2595	4
32865	228	2598	4
32866	228	2599	3
32867	228	2603	4.5
32868	228	2604	3.5
32869	228	2606	3.5
32870	228	2608	3.5
32871	228	2612	5
32872	228	2627	4.5
32873	228	2628	5
32874	228	2639	4.5
32875	228	2646	4
32876	228	2661	3.5
32877	228	2662	4.5
32878	228	2684	3
32879	228	2704	0.5
32880	228	2705	4
32881	228	2711	3
32882	228	2713	4
32883	228	2740	4
32884	228	2744	2.5
32885	228	2757	4
32886	228	2761	4.5
32887	228	2778	3
32888	228	2797	4
32889	228	2800	5
32890	228	2804	4
32891	228	2805	5
32892	228	2806	3.5
32893	228	2819	5
32894	228	2837	4
32895	228	2869	3
32896	228	2870	4
32897	228	2874	4
32898	228	2878	4
32899	228	2886	4.5
32900	228	2898	3.5
32901	228	2920	4
32902	228	2921	4
32903	228	2925	4
32904	228	2926	4.5
32905	228	2938	4
32906	228	2963	4
32907	228	2965	3
32908	228	2966	4
32909	228	2967	3
32910	228	2969	3.5
32911	228	2974	3
32912	228	2992	4
32913	228	3000	4
32914	228	3003	4
32915	228	3011	4.5
32916	228	3020	4
32917	228	3025	4
32918	228	3055	4.5
32919	228	3056	4
32920	228	3063	4
32921	228	3069	3
32922	228	3109	5
32923	228	3129	4.5
32924	228	3132	3
32925	228	3134	4
32926	228	3136	3.5
32927	228	3141	3
32928	228	3149	5
32929	228	3150	3.5
32930	228	3151	3
32931	228	3155	4.5
32932	228	3163	5
32933	228	3166	3.5
32934	228	3173	3.5
32935	228	3176	3.5
32936	228	3177	3.5
32937	228	3180	3
32938	228	3184	3.5
32939	228	3218	4.5
32940	228	3219	4
32941	228	3233	4
32942	228	3248	3
32943	228	3285	5
32944	228	3320	3.5
32945	228	3323	5
32946	228	3330	4
32947	228	3333	4.5
32948	228	3340	4.5
32949	228	3342	3
32950	228	3345	4
32951	228	3351	3.5
32952	228	3375	3
32953	228	3380	4
32954	228	3383	3
32955	228	3419	4
32956	228	3422	3
32957	228	3424	2
32958	228	3425	3.5
32959	228	3435	4
32960	228	3444	4
32961	228	3478	4
32962	228	3481	4
32963	228	3482	2
32964	228	3510	3
32965	228	3517	4.5
32966	228	3578	4
32967	228	3619	4
32968	228	3633	2
32969	228	3638	3
32970	228	3661	3.5
32971	228	3683	4
32972	228	3696	4.5
32973	228	3698	4
32974	228	3738	4
32975	228	3788	5
32976	228	3796	4.5
32977	228	3807	5
32978	228	3810	4
32979	228	3812	4.5
32980	228	3816	3.5
32981	228	3818	2.5
32982	228	3822	3
32983	228	3860	4
32984	228	3869	4
32985	228	3870	3
32986	228	3886	5
32987	228	3888	5
32988	228	3895	3.5
32989	228	3900	3.5
32990	228	3904	4
32991	228	3920	4.5
32992	228	3996	5
32993	228	3999	3.5
32994	228	4009	3
32995	228	4033	5
32996	228	4040	4
32997	228	4056	4
32998	228	4062	4
32999	228	4074	3.5
33000	228	4076	1.5
33001	228	4090	3.5
33002	228	4109	4.5
33003	228	4127	3
33004	228	4154	5
33005	228	4173	4
33006	228	4180	3
33007	228	4184	3.5
33008	228	4188	4
33009	228	4200	4
33010	228	4211	4
33011	228	4213	5
33012	228	4216	3.5
33013	228	4228	4
33014	228	4279	5
33015	228	4286	3.5
33016	228	4313	5
33017	228	4319	4.5
33018	228	4328	5
33019	228	4368	4
33020	228	4386	3
33021	228	4416	3
33022	228	4434	3
33023	228	4436	4
33024	228	4452	4
33025	228	4458	5
33026	228	4463	3.5
33027	228	4496	5
33028	228	4504	4.5
33029	228	4523	4
33030	228	4588	5
33031	228	4622	4
33032	228	4642	4.5
33033	228	4649	5
33034	228	4681	3
33035	228	4697	4.5
33036	228	4702	4
33037	228	4705	5
33038	228	4706	3.5
33039	228	4712	4.5
33040	228	4758	4
33041	228	4779	4
33042	228	4780	2.5
33043	228	4798	4
33044	228	4801	4
33045	228	4803	4.5
33046	228	4804	3
33047	228	4853	5
33048	228	4878	3.5
33049	228	4880	5
33050	228	4881	5
33051	228	4909	5
33052	228	4913	5
33053	228	4914	5
33054	228	4936	5
33055	228	4940	4
33056	228	4968	5
33057	228	4994	4.5
33058	228	5003	5
33059	228	5005	5
33060	228	5037	4.5
33061	228	5054	4.5
33062	228	5068	3
33063	228	5085	4
33064	228	5106	5
33065	228	5116	5
33066	228	5167	3.5
33067	228	5170	4
33068	228	5201	4
33069	228	5202	4.5
33070	228	5207	5
33071	228	5213	4
33072	228	5260	5
33073	228	5269	4
33074	228	5312	4
33075	228	5323	4
33076	228	5328	3
33077	228	5329	5
33078	228	5337	4.5
33079	228	5349	4
33080	228	5365	5
33081	228	5377	3.5
33082	228	5385	3.5
33083	228	5402	4
33084	228	5424	4
33085	228	5490	5
33086	228	5542	3.5
33087	228	5618	4
33088	228	5619	3
33089	228	5652	5
33090	228	5663	3.5
33091	228	5675	4
33092	228	5677	4
33093	228	5691	4
33094	228	5701	4
33095	228	5703	5
33096	228	5705	4
33097	228	5719	5
33098	228	5720	4
33099	228	5726	5
33100	228	5733	4
33101	228	5743	1.5
33102	228	5794	5
33103	228	5802	5
33104	228	5809	4
33105	228	5839	5
33106	228	5856	4.5
33107	228	5876	5
33108	228	5880	4.5
33109	228	6209	4
33110	228	6215	4
33111	228	6242	4.5
33112	228	6250	3
33113	228	6313	4.5
33114	228	6320	2
33115	228	6325	4
33116	228	6340	5
33117	228	6356	3.5
33118	228	6361	4.5
33119	228	6364	2.5
33120	228	6411	5
33121	228	6421	5
33122	228	6446	4
33123	228	6465	2
33124	228	6485	5
33125	228	6498	5
33126	228	6499	4
33127	228	6503	5
33128	228	6522	4
33129	228	6563	5
33130	228	6593	4.5
33131	228	6604	4
33132	228	6606	5
33133	228	6616	4
33134	228	6620	4
33135	228	6635	3.5
33136	228	6642	4
33137	228	6649	4
33138	228	6671	3.5
33139	228	6714	3.5
33140	228	6716	3.5
33141	228	6727	4
33142	228	6739	4.5
33143	228	6742	2
33144	228	6745	3
33145	228	6755	5
33146	228	6757	5
33147	228	6760	4.5
33148	228	6786	5
33149	228	6787	4.5
33150	228	6802	4.5
33151	228	6811	4
33152	228	6848	5
33153	228	6896	3.5
33154	228	6903	3.5
33155	228	6946	4
33156	228	6967	5
33157	228	6999	5
33158	228	7019	4
33159	228	7036	4.5
33160	228	7155	5
33161	228	7157	5
33162	228	7179	4
33163	228	7200	4
33164	228	7307	4.5
33165	228	7435	4.5
33166	228	7439	3.5
33167	228	7446	4
33168	228	7542	5
33169	228	7670	5
33170	228	7715	4
33171	228	7970	5
33172	229	231	2
33173	229	259	1.5
33174	229	261	3.5
33175	229	280	2
33176	229	427	2
33177	229	887	3.5
33178	229	966	1
33179	229	970	0.5
33180	229	2057	3.5
33181	229	2366	1
33182	229	2633	0.5
33183	229	2751	0.5
33184	229	3323	2
33185	229	3886	4
33186	229	3900	3.5
33187	229	4154	3.5
33188	229	4458	4
33189	229	4485	3.5
33190	229	4504	3
33191	229	4705	3.5
33192	229	5207	4
33193	229	5743	3.5
33194	229	5883	4
33195	229	6950	1.5
33196	229	7095	5
33197	229	7439	3.5
33198	229	7761	1
33199	229	8096	3
33200	229	8121	1.5
33201	229	8422	1
33202	229	8630	3.5
33203	229	8858	0.5
33204	229	9236	1.5
33205	229	9404	5
33206	229	9477	0.5
33207	229	9547	2
33208	229	9651	5
33209	229	9667	5
33210	229	9669	3.5
33211	229	9712	4
33212	229	9797	4.5
33213	229	9847	5
33214	229	9909	1
33215	229	9915	1
33216	229	9965	4.5
33217	230	1	3
33218	230	34	4
33219	230	48	3.5
33220	230	99	3
33221	230	127	3.5
33222	230	142	2
33223	230	231	4.5
33224	230	261	4
33225	230	280	5
33226	230	314	1
33227	230	317	4
33228	230	337	2.5
33229	230	406	3.5
33230	230	416	3.5
33231	230	423	3.5
33232	230	427	3
33233	230	472	4.5
33234	230	523	3.5
33235	230	524	4.5
33236	230	525	3
33237	230	526	4
33238	230	538	4
33239	230	696	4
33240	230	708	1
33241	230	775	3.5
33242	230	844	4
33243	230	957	3
33244	230	959	4
33245	230	961	4
33246	230	972	3.5
33247	230	975	3.5
33248	230	983	4
33249	230	1026	4
33250	230	1027	3
33251	230	1030	4
33252	230	1043	3.5
33253	230	1112	2
33254	230	1175	3.5
33255	230	1402	4
33256	230	1526	3
33257	230	1558	3
33258	230	1624	3.5
33259	230	1707	2.5
33260	230	1844	3.5
33261	230	1896	1
33262	230	2057	5
33263	230	2145	4
33264	230	2195	5
33265	230	2237	3.5
33266	230	2282	4
33267	230	2481	4
33268	230	2666	5
33269	230	2716	4
33270	230	4453	4.5
33271	230	4705	3.5
33272	230	4909	4.5
33273	230	5200	3
33274	230	5207	4
33275	230	5652	3
33276	230	5795	4
33277	230	6413	4
33278	230	6760	3.5
33279	230	6790	4
33280	230	7061	4.5
33281	230	7066	3.5
33282	230	7161	3.5
33283	230	7219	3
33284	230	7287	1.5
33285	230	7421	4
33286	230	7433	2
33287	230	7439	4
33288	230	7446	3.5
33289	230	7472	3.5
33290	230	7504	4
33291	231	913	4
33292	231	958	4
33293	231	1025	5
33294	231	1057	4
33295	231	1314	2.5
33296	231	1632	3.5
33297	231	1696	4
33298	231	1698	5
33299	231	1814	5
33300	231	1887	4
33301	231	2126	2.5
33302	231	2198	4
33303	231	2584	3
33304	231	2844	3
33305	231	2870	4
33306	231	3277	4
33307	231	3323	4.5
33308	231	3807	4.5
33309	231	5015	4.5
33310	231	5329	5
33311	231	6849	5
33312	231	6946	5
33313	231	7579	3.5
33314	231	8023	4.5
33315	231	8224	3.5
33316	231	8264	4.5
33317	231	8760	5
33318	231	9177	3.5
33319	232	1	3.5
33320	232	2	3.5
33321	232	3	3
33322	232	13	4.5
33323	232	19	4.5
33324	232	32	3.5
33325	232	34	3
33326	232	42	3.5
33327	232	45	5
33328	232	56	3
33329	232	59	3.5
33330	232	61	4
33331	232	64	3.5
33332	232	82	4
33333	232	95	4
33334	232	99	4
33335	232	100	4
33336	232	125	4.5
33337	232	135	3.5
33338	232	142	4
33339	232	149	4
33340	232	151	4
33341	232	156	4.5
33342	232	164	4
33343	232	170	4
33344	232	181	4
33345	232	189	4
33346	232	195	4
33347	232	203	4
33348	232	211	2.5
33349	232	231	4
33350	232	237	4
33351	232	254	4.5
33352	232	258	3.5
33353	232	259	5
33354	232	261	4.5
33355	232	279	3.5
33356	232	280	4
33357	232	294	4.5
33358	232	305	5
33359	232	317	4
33360	232	324	3
33361	232	326	3.5
33362	232	327	3.5
33363	232	337	3.5
33364	232	340	4
33365	232	384	3.5
33366	232	390	4
33367	232	391	4.5
33368	232	404	3.5
33369	232	406	4.5
33370	232	427	3.5
33371	232	431	4
33372	232	439	4
33373	232	446	3
33374	232	459	4.5
33375	232	485	4.5
33376	232	490	3
33377	232	495	4.5
33378	232	520	4
33379	232	521	3
33380	232	522	3.5
33381	232	523	4.5
33382	232	525	3.5
33383	232	526	4
33384	232	527	2.5
33385	232	528	2.5
33386	232	539	3
33387	232	540	4
33388	232	568	4
33389	232	573	4
33390	232	581	3
33391	232	583	4
33392	232	622	4
33393	232	625	4
33394	232	641	4
33395	232	647	4
33396	232	651	4
33397	232	653	3.5
33398	232	654	3.5
33399	232	656	4
33400	232	659	4
33401	232	707	3.5
33402	232	712	4.5
33403	232	741	4
33404	232	824	4.5
33405	232	830	3
33406	232	840	4.5
33407	232	844	4.5
33408	232	873	4
33409	232	878	4.5
33410	232	895	3.5
33411	232	914	4
33412	232	923	5
33413	232	957	4.5
33414	232	958	5
33415	232	959	4
33416	232	960	4
33417	232	961	5
33418	232	969	4
33419	232	972	4
33420	232	977	2.5
33421	232	1000	4
33422	232	1018	4
33423	232	1019	4.5
33424	232	1021	2
33425	232	1025	4
33426	232	1030	4.5
33427	232	1038	3
33428	232	1051	5
33429	232	1057	5
33430	232	1084	3
33431	232	1092	4
33432	232	1094	4
33433	232	1106	2
33434	232	1107	3.5
33435	232	1112	4
33436	232	1122	3.5
33437	232	1123	3
33438	232	1127	3.5
33439	232	1128	3.5
33440	232	1131	3.5
33441	232	1142	4
33442	232	1144	4
33443	232	1146	3.5
33444	232	1164	3.5
33445	232	1167	3.5
33446	232	1183	4
33447	232	1203	4
33448	232	1214	3.5
33449	232	1224	4
33450	232	1226	4
33451	232	1233	4.5
33452	232	1244	3.5
33453	232	1253	3
33454	232	1261	4
33455	232	1269	2
33456	232	1271	4.5
33457	232	1273	3.5
33458	232	1278	4
33459	232	1288	4.5
33460	232	1289	5
33461	232	1300	3.5
33462	232	1302	4
33463	232	1310	4
33464	232	1314	3.5
33465	232	1315	4.5
33466	232	1318	3
33467	232	1340	4
33468	232	1344	5
33469	232	1359	3.5
33470	232	1361	4.5
33471	232	1362	3
33472	232	1366	3
33473	232	1368	5
33474	232	1375	4
33475	232	1385	4.5
33476	232	1386	4
33477	232	1388	3
33478	232	1399	3.5
33479	232	1400	4.5
33480	232	1406	4.5
33481	232	1411	4.5
33482	232	1427	3.5
33483	232	1446	3.5
33484	232	1456	4
33485	232	1461	4
33486	232	1463	5
33487	232	1465	4.5
33488	232	1471	3.5
33489	232	1484	3.5
33490	232	1489	4
33491	232	1494	4
33492	232	1528	4
33493	232	1535	5
33494	232	1536	4
33495	232	1537	3.5
33496	232	1538	3.5
33497	232	1540	3
33498	232	1549	4
33499	232	1554	3.5
33500	232	1555	4
33501	232	1556	4
33502	232	1558	4
33503	232	1559	3.5
33504	232	1564	4
33505	232	1568	4
33506	232	1569	5
33507	232	1574	4
33508	232	1575	4
33509	232	1591	4
33510	232	1604	3.5
33511	232	1609	3
33512	232	1614	4
33513	232	1615	4
33514	232	1650	3
33515	232	1652	3
33516	232	1667	3.5
33517	232	1669	3.5
33518	232	1675	5
33519	232	1677	5
33520	232	1683	3.5
33521	232	1684	3
33522	232	1693	3
33523	232	1699	3.5
33524	232	1723	4.5
33525	232	1730	4.5
33526	232	1771	4.5
33527	232	1800	3.5
33528	232	1804	3
33529	232	1814	5
33530	232	1816	3.5
33531	232	1819	4
33532	232	1821	4.5
33533	232	1822	3.5
33534	232	1834	2.5
33535	232	1836	4
33536	232	1844	4.5
33537	232	1848	3.5
33538	232	1849	4
33539	232	1852	3.5
33540	232	1865	5
33541	232	1867	3.5
33542	232	1890	3.5
33543	232	1903	3
33544	232	1938	4
33545	232	2002	4.5
33546	232	2004	4
33547	232	2008	4
33548	232	2009	3.5
33549	232	2045	1
33550	232	2057	4.5
33551	232	2058	3
33552	232	2064	4
33553	232	2075	5
33554	232	2079	3.5
33555	232	2081	4
33556	232	2091	3.5
33557	232	2099	4.5
33558	232	2122	1.5
33559	232	2144	4
33560	232	2153	4
33561	232	2158	4.5
33562	232	2159	4.5
33563	232	2160	3
33564	232	2163	4
33565	232	2164	3.5
33566	232	2167	3.5
33567	232	2170	3.5
33568	232	2172	4
33569	232	2173	4
33570	232	2175	4
33571	232	2176	3
33572	232	2178	4
33573	232	2209	4
33574	232	2210	4
33575	232	2217	3
33576	232	2230	5
33577	232	2239	4
33578	232	2246	4
33579	232	2250	3
33580	232	2262	2.5
33581	232	2282	5
33582	232	2330	4.5
33583	232	2332	4
33584	232	2337	4
33585	232	2364	4
33586	232	2366	5
33587	232	2387	3.5
33588	232	2389	4
33589	232	2396	3
33590	232	2398	4
33591	232	2424	4
33592	232	2430	4
33593	232	2442	4.5
33594	232	2466	3.5
33595	232	2470	4
33596	232	2496	4.5
33597	232	2497	3.5
33598	232	2520	4
33599	232	2527	4
33600	232	2528	3.5
33601	232	2544	3.5
33602	232	2568	4
33603	232	2584	4.5
33604	232	2594	4
33605	232	2595	4
33606	232	2613	5
33607	232	2614	3
33608	232	2616	5
33609	232	2622	2.5
33610	232	2628	4.5
33611	232	2629	4
33612	232	2631	4
33613	232	2705	4
33614	232	2733	4.5
33615	232	2742	3.5
33616	232	2770	3.5
33617	232	2778	4
33618	232	2783	4.5
33619	232	2788	3.5
33620	232	2800	4.5
33621	232	2805	5
33622	232	2837	4
33623	232	2863	4
33624	232	2870	3.5
33625	232	2883	3
33626	232	2920	3.5
33627	232	2921	4
33628	232	2938	4
33629	232	2953	4
33630	232	2963	4
33631	232	2965	3.5
33632	232	2966	4
33633	232	2967	3.5
33634	232	2969	4
33635	232	2991	3.5
33636	232	2992	3.5
33637	232	3000	4
33638	232	3003	3.5
33639	232	3020	3
33640	232	3025	4
33641	232	3026	4
33642	232	3052	4.5
33643	232	3108	3.5
33644	232	3109	5
33645	232	3126	4
33646	232	3127	4
33647	232	3129	4
33648	232	3134	4
33649	232	3141	3.5
33650	232	3143	3.5
33651	232	3149	4.5
33652	232	3150	4
33653	232	3155	3.5
33654	232	3166	3.5
33655	232	3170	4
33656	232	3173	4
33657	232	3177	4
33658	232	3199	4.5
33659	232	3218	4
33660	232	3219	4
33661	232	3230	4.5
33662	232	3233	2
33663	232	3244	3
33664	232	3266	3.5
33665	232	3274	3.5
33666	232	3320	4.5
33667	232	3323	4.5
33668	232	3338	3.5
33669	232	3343	3.5
33670	232	3347	3.5
33671	232	3351	3.5
33672	232	3375	4
33673	232	3380	3.5
33674	232	3383	3
33675	232	3403	3.5
33676	232	3405	4
33677	232	3422	3.5
33678	232	3423	3
33679	232	3424	4
33680	232	3425	4
33681	232	3436	2
33682	232	3481	4
33683	232	3482	2.5
33684	232	3484	4.5
33685	232	3486	5
33686	232	3619	3
33687	232	3633	3.5
33688	232	3638	3.5
33689	232	3665	4
33690	232	3667	4
33691	232	3683	4
33692	232	3696	3.5
33693	232	3697	3.5
33694	232	3698	3.5
33695	232	3704	3.5
33696	232	3707	4
33697	232	3709	4.5
33698	232	3716	3.5
33699	232	3719	4
33700	232	3733	4
33701	232	3738	5
33702	232	3770	3.5
33703	232	3803	5
33704	232	3806	3.5
33705	232	3807	5
33706	232	3812	3.5
33707	232	3813	3.5
33708	232	3816	3.5
33709	232	3818	4
33710	232	3856	4.5
33711	232	3869	3
33712	232	3870	5
33713	232	3883	3
33714	232	3886	4.5
33715	232	3887	5
33716	232	3888	5
33717	232	3900	4
33718	232	3910	3.5
33719	232	3925	2
33720	232	3939	4
33721	232	3956	3.5
33722	232	3957	3.5
33723	232	3971	4
33724	232	3998	3.5
33725	232	4009	3.5
33726	232	4033	4
33727	232	4034	4
33728	232	4056	3.5
33729	232	4062	3.5
33730	232	4068	3.5
33731	232	4075	4.5
33732	232	4076	4
33733	232	4094	2
33734	232	4109	4
33735	232	4127	4
33736	232	4128	3.5
33737	232	4135	4.5
33738	232	4145	4
33739	232	4146	3.5
33740	232	4154	4.5
33741	232	4155	1.5
33742	232	4173	4.5
33743	232	4177	4
33744	232	4180	3
33745	232	4184	3.5
33746	232	4187	4
33747	232	4197	4
33748	232	4198	4.5
33749	232	4200	4
33750	232	4212	3
33751	232	4213	3
33752	232	4217	3.5
33753	232	4223	3.5
33754	232	4228	4
33755	232	4236	3.5
33756	232	4256	3.5
33757	232	4282	3
33758	232	4300	3
33759	232	4313	4
33760	232	4319	4
33761	232	4367	3
33762	232	4368	4
33763	232	4378	3.5
33764	232	4379	3
33765	232	4383	4
33766	232	4386	4
33767	232	4424	4
33768	232	4426	4
33769	232	4436	5
33770	232	4450	2.5
33771	232	4458	5
33772	232	4459	4.5
33773	232	4461	4.5
33774	232	4485	4.5
33775	232	4502	2.5
33776	232	4522	3.5
33777	232	4523	5
33778	232	4526	4
33779	232	4561	3.5
33780	232	4562	3.5
33781	232	4582	4.5
33782	232	4583	4.5
33783	232	4604	4
33784	232	4622	3.5
33785	232	4631	3.5
33786	232	4642	4.5
33787	232	4646	3.5
33788	232	4648	3.5
33789	232	4654	3.5
33790	232	4673	4
33791	232	4681	4
33792	232	4684	3
33793	232	4697	4
33794	232	4702	4
33795	232	4705	4
33796	232	4710	3
33797	232	4768	3
33798	232	4770	4
33799	232	4779	4
33800	232	4780	3.5
33801	232	4798	3.5
33802	232	4801	3
33803	232	4803	4
33804	232	4804	3.5
33805	232	4817	3.5
33806	232	4838	3.5
33807	232	4850	3
33808	232	4851	4
33809	232	4871	4
33810	232	4878	4
33811	232	4882	3.5
33812	232	4903	4
33813	232	4905	4
33814	232	4909	5
33815	232	4935	4
33816	232	4957	3
33817	232	4958	2.5
33818	232	4968	5
33819	232	4998	4.5
33820	232	5005	3.5
33821	232	5008	4
33822	232	5016	2
33823	232	5018	4
33824	232	5037	4
33825	232	5039	3
33826	232	5041	4.5
33827	232	5048	4
33828	232	5051	4
33829	232	5054	4
33830	232	5090	3.5
33831	232	5201	4
33832	232	5202	4.5
33833	232	5207	5
33834	232	5214	3
33835	232	5216	4
33836	232	5221	3.5
33837	232	5269	4
33838	232	5286	4
33839	232	5289	4
33840	232	5305	4
33841	232	5312	3.5
33842	232	5322	3.5
33843	232	5323	4
33844	232	5328	4
33845	232	5329	5
33846	232	5330	4
33847	232	5337	4
33848	232	5365	4
33849	232	5366	4
33850	232	5370	4
33851	232	5371	4
33852	232	5374	2
33853	232	5376	3.5
33854	232	5377	4
33855	232	5384	4.5
33856	232	5431	3
33857	232	5459	4.5
33858	232	5477	4.5
33859	232	5492	1
33860	232	5526	3.5
33861	232	5618	3.5
33862	232	5624	4
33863	232	5627	3.5
33864	232	5628	2
33865	232	5630	2.5
33866	232	5652	3.5
33867	232	5660	3.5
33868	232	5677	3.5
33869	232	5678	4.5
33870	232	5680	2.5
33871	232	5726	4
33872	232	5730	3.5
33873	232	5733	4.5
33874	232	5743	4.5
33875	232	5744	3
33876	232	5775	3
33877	232	5793	5
33878	232	5794	3
33879	232	5804	4
33880	232	5806	4.5
33881	232	5809	3.5
33882	232	5812	3.5
33883	232	5827	3.5
33884	232	5828	4
33885	232	5830	3.5
33886	232	5839	4.5
33887	232	5851	3.5
33888	232	5853	4.5
33889	232	5856	4.5
33890	232	5859	4.5
33891	232	5870	3.5
33892	232	5873	4
33893	232	5876	4.5
33894	232	5880	4
33895	232	5883	4
33896	232	5887	2
33897	232	5891	4
33898	232	5900	3.5
33899	232	6164	4.5
33900	232	6216	5
33901	232	6292	3.5
33902	232	6307	4.5
33903	232	6322	4
33904	232	6325	3.5
33905	232	6333	4
33906	232	6338	4
33907	232	6341	4
33908	232	6346	4.5
33909	232	6349	4
33910	232	6356	3.5
33911	232	6370	4.5
33912	232	6378	4
33913	232	6387	3.5
33914	232	6394	4
33915	232	6407	4.5
33916	232	6408	5
33917	232	6413	4
33918	232	6415	3.5
33919	232	6416	4.5
33920	232	6417	3
33921	232	6418	3.5
33922	232	6421	4
33923	232	6423	3.5
33924	232	6428	4
33925	232	6448	3.5
33926	232	6463	3.5
33927	232	6488	3
33928	232	6491	5
33929	232	6495	3
33930	232	6499	3
33931	232	6522	3.5
33932	232	6563	4
33933	232	6593	5
33934	232	6595	4
33935	232	6603	3
33936	232	6616	5
33937	232	6620	4
33938	232	6627	3.5
33939	232	6631	4
33940	232	6635	4
33941	232	6642	4.5
33942	232	6650	2.5
33943	232	6652	4.5
33944	232	6663	3.5
33945	232	6668	4.5
33946	232	6671	3.5
33947	232	6673	4
33948	232	6679	4
33949	232	6684	3.5
33950	232	6685	3
33951	232	6691	4.5
33952	232	6694	3.5
33953	232	6698	3
33954	232	6699	4
33955	232	6714	4
33956	232	6716	4
33957	232	6718	3
33958	232	6720	4
33959	232	6724	3.5
33960	232	6727	4.5
33961	232	6734	4
33962	232	6744	3.5
33963	232	6747	3.5
33964	232	6753	4
33965	232	6755	3.5
33966	232	6757	3.5
33967	232	6762	5
33968	232	6765	5
33969	232	6770	4
33970	232	6778	3.5
33971	232	6795	3.5
33972	232	6798	3
33973	232	6802	4
33974	232	6804	2.5
33975	232	6811	4
33976	232	6813	3.5
33977	232	6815	4
33978	232	6819	3.5
33979	232	6821	4
33980	232	6822	4
33981	232	6825	4
33982	232	6827	4
33983	232	6847	3.5
33984	232	6848	3.5
33985	232	6870	4
33986	232	6890	4.5
33987	232	6891	4.5
33988	232	6896	4
33989	232	6899	4.5
33990	232	6910	3
33991	232	6914	4.5
33992	232	6915	3
33993	232	6923	3.5
33994	232	6927	3.5
33995	232	6932	2.5
33996	232	6933	4
33997	232	6941	2.5
33998	232	6942	4
33999	232	6946	5
34000	232	6948	3.5
34001	232	6953	3
34002	232	6954	2
34003	232	6957	4
34004	232	6970	3.5
34005	232	6973	2.5
34006	232	6978	3
34007	232	6980	3.5
34008	232	6990	2
34009	232	6991	4.5
34010	232	6999	4.5
34011	232	7015	4
34012	232	7018	4
34013	232	7019	4
34014	232	7022	3
34015	232	7029	4.5
34016	232	7031	2.5
34017	232	7033	4
34018	232	7036	4
34019	232	7037	4
34020	232	7038	4.5
34021	232	7039	3
34022	232	7040	3
34023	232	7046	2.5
34024	232	7053	3
34025	232	7054	5
34026	232	7056	4
34027	232	7057	4.5
34028	232	7059	4.5
34029	232	7061	4
34030	232	7067	2.5
34031	232	7080	3
34032	232	7082	3.5
34033	232	7083	3.5
34034	232	7085	4
34035	232	7089	4
34036	232	7092	3
34037	232	7095	3.5
34038	232	7104	3.5
34039	232	7109	3.5
34040	232	7117	3.5
34041	232	7127	3
34042	232	7128	3.5
34043	232	7136	4.5
34044	232	7137	4.5
34045	232	7144	3
34046	232	7148	3.5
34047	232	7153	3.5
34048	232	7155	4
34049	232	7157	4.5
34050	232	7161	4.5
34051	232	7162	4
34052	232	7163	3.5
34053	232	7165	4.5
34054	232	7179	4.5
34055	232	7180	4.5
34056	232	7185	4
34057	232	7189	3.5
34058	232	7190	5
34059	232	7191	2
34060	232	7199	4.5
34061	232	7202	3
34062	232	7203	4.5
34063	232	7212	4
34064	232	7217	4
34065	232	7218	3
34066	232	7245	3
34067	232	7265	2.5
34068	232	7266	4
34069	232	7269	1.5
34070	232	7273	3.5
34071	232	7283	3
34072	232	7284	4.5
34073	232	7287	4
34074	232	7288	3.5
34075	232	7291	4
34076	232	7292	4.5
34077	232	7294	4
34078	232	7297	3.5
34079	232	7301	4
34080	232	7307	4
34081	232	7310	4.5
34082	232	7312	4.5
34083	232	7315	4.5
34084	232	7320	2.5
34085	232	7323	5
34086	232	7333	3.5
34087	232	7336	4
34088	232	7339	4.5
34089	232	7347	3.5
34090	232	7348	3
34091	232	7355	4
34092	232	7357	4
34093	232	7363	3.5
34094	232	7374	4.5
34095	232	7376	3.5
34096	232	7378	4
34097	232	7380	3
34098	232	7383	3
34099	232	7385	4
34100	232	7386	3.5
34101	232	7387	4.5
34102	232	7395	4
34103	232	7397	4.5
34104	232	7399	3.5
34105	232	7401	4.5
34106	232	7403	3.5
34107	232	7404	3.5
34108	232	7413	4.5
34109	232	7418	4.5
34110	232	7421	4
34111	232	7422	4
34112	232	7423	4
34113	232	7424	4
34114	232	7425	3.5
34115	232	7430	5
34116	232	7432	3
34117	232	7435	3.5
34118	232	7436	1.5
34119	232	7438	3.5
34120	232	7439	4.5
34121	232	7443	4
34122	232	7446	4.5
34123	232	7450	3
34124	232	7453	3.5
34125	232	7454	4
34126	232	7457	4.5
34127	232	7460	4.5
34128	232	7461	4
34129	232	7468	4.5
34130	232	7474	4.5
34131	232	7475	4.5
34132	232	7477	4.5
34133	232	7480	4
34134	232	7484	5
34135	232	7491	4
34136	232	7494	5
34137	232	7506	4.5
34138	232	7507	3.5
34139	232	7508	4.5
34140	232	7528	3.5
34141	232	7530	3.5
34142	232	7538	4.5
34143	232	7539	3
34144	232	7543	4
34145	232	7549	3
34146	232	7552	4.5
34147	232	7558	4.5
34148	232	7560	4
34149	232	7563	4
34150	232	7564	3.5
34151	232	7565	4
34152	232	7567	4.5
34153	232	7571	3
34154	232	7573	4
34155	232	7583	4.5
34156	232	7586	4
34157	232	7587	4.5
34158	232	7591	3
34159	232	7607	4
34160	232	7616	1.5
34161	232	7620	3.5
34162	232	7621	4.5
34163	232	7631	4
34164	232	7635	5
34165	232	7636	4
34166	232	7637	3
34167	232	7642	3
34168	232	7643	4.5
34169	232	7652	4
34170	232	7655	3.5
34171	232	7660	4.5
34172	232	7670	5
34173	232	7689	4.5
34174	232	7691	2
34175	232	7694	4
34176	232	7700	4
34177	232	7703	4.5
34178	232	7706	4.5
34179	232	7710	4.5
34180	232	7715	4.5
34181	232	7719	3.5
34182	232	7723	4.5
34183	232	7724	3
34184	232	7725	3
34185	232	7727	4.5
34186	232	7728	3.5
34187	232	7732	4
34188	232	7733	4
34189	232	7735	4
34190	232	7739	3
34191	232	7742	5
34192	232	7747	3.5
34193	232	7757	3.5
34194	232	7758	3.5
34195	232	7761	4
34196	232	7762	4
34197	232	7763	4
34198	232	7765	4
34199	232	7769	4.5
34200	232	7779	3.5
34201	232	7780	2
34202	232	7788	4
34203	232	7792	4.5
34204	232	7793	4.5
34205	232	7798	4.5
34206	232	7801	4.5
34207	232	7804	3.5
34208	232	7808	3.5
34209	232	7811	3.5
34210	232	7820	4.5
34211	232	7827	4
34212	232	7828	3.5
34213	232	7832	5
34214	232	7834	4
34215	232	7842	4
34216	232	7844	4
34217	232	7845	2.5
34218	232	7846	4
34219	232	7847	4.5
34220	232	7848	3.5
34221	232	7850	4.5
34222	232	7857	4.5
34223	232	7861	4.5
34224	232	7863	3.5
34225	232	7871	4
34226	232	7874	4
34227	232	7886	4.5
34228	232	7888	4.5
34229	232	7889	4
34230	232	7897	3.5
34231	232	7898	5
34232	232	7899	2
34233	232	7908	4.5
34234	232	7910	3
34235	232	7911	5
34236	232	7914	4
34237	232	7917	4
34238	232	7923	3.5
34239	232	7924	4.5
34240	232	7929	4
34241	232	7931	3.5
34242	232	7934	1.5
34243	232	7935	3
34244	232	7936	3.5
34245	232	7939	3.5
34246	232	7940	2.5
34247	232	7946	4
34248	232	7951	4
34249	232	7952	4.5
34250	232	7953	5
34251	232	7956	4
34252	232	7959	3.5
34253	232	7960	4
34254	232	7961	4.5
34255	232	7966	3
34256	232	7968	4.5
34257	232	7976	4.5
34258	232	7977	4
34259	232	7985	5
34260	232	7993	4.5
34261	232	7995	3.5
34262	232	7999	3
34263	232	8001	3.5
34264	232	8003	2.5
34265	232	8004	3.5
34266	232	8005	3.5
34267	232	8007	4
34268	232	8010	5
34269	232	8011	4.5
34270	232	8015	4.5
34271	232	8016	4.5
34272	232	8018	2.5
34273	232	8021	4.5
34274	232	8030	3.5
34275	232	8032	3
34276	232	8044	4.5
34277	232	8048	4
34278	232	8052	4
34279	232	8055	4.5
34280	232	8057	4
34281	232	8060	4
34282	232	8066	4.5
34283	232	8068	4
34284	232	8077	4
34285	232	8078	3.5
34286	232	8079	4
34287	232	8083	4.5
34288	232	8085	2
34289	232	8086	5
34290	232	8087	4.5
34291	232	8090	4
34292	232	8093	4.5
34293	232	8096	4.5
34294	232	8105	5
34295	232	8107	4.5
34296	232	8110	4
34297	232	8111	3.5
34298	232	8118	3.5
34299	232	8119	3.5
34300	232	8120	3.5
34301	232	8121	4
34302	232	8130	5
34303	232	8136	3.5
34304	232	8138	4
34305	232	8143	3.5
34306	232	8144	4
34307	232	8151	3.5
34308	232	8156	3.5
34309	232	8159	3.5
34310	232	8163	4
34311	232	8165	3
34312	232	8168	4
34313	232	8170	3
34314	232	8173	4.5
34315	232	8174	4.5
34316	232	8177	4.5
34317	232	8180	4
34318	232	8182	3.5
34319	232	8183	4
34320	232	8184	5
34321	232	8187	3
34322	232	8188	3.5
34323	232	8190	4.5
34324	232	8201	4.5
34325	232	8203	3.5
34326	232	8218	4.5
34327	232	8224	4.5
34328	232	8225	5
34329	232	8228	4.5
34330	232	8229	4
34331	232	8231	5
34332	232	8233	3.5
34333	232	8234	3
34334	232	8237	3
34335	232	8238	3.5
34336	232	8239	4
34337	232	8240	4
34338	232	8245	4
34339	232	8249	4
34340	232	8252	5
34341	232	8258	4.5
34342	232	8260	4
34343	232	8261	3.5
34344	232	8262	4.5
34345	232	8263	4
34346	232	8264	4.5
34347	232	8267	3.5
34348	232	8272	3.5
34349	232	8273	3
34350	232	8275	2.5
34351	232	8278	3.5
34352	232	8280	5
34353	232	8283	3.5
34354	232	8290	4.5
34355	232	8295	3.5
34356	232	8298	5
34357	232	8302	4
34358	232	8303	4
34359	232	8305	3.5
34360	232	8309	3.5
34361	232	8310	4
34362	232	8312	4
34363	232	8316	1.5
34364	232	8318	3.5
34365	232	8321	4.5
34366	232	8322	4.5
34367	232	8325	3
34368	232	8327	4
34369	232	8328	3.5
34370	232	8329	4
34371	232	8331	4
34372	232	8333	3.5
34373	232	8338	5
34374	232	8351	4.5
34375	232	8354	4
34376	232	8361	4.5
34377	232	8362	3
34378	232	8367	4.5
34379	232	8369	4
34380	232	8370	4
34381	232	8374	4
34382	232	8375	4.5
34383	232	8378	3.5
34384	232	8379	4.5
34385	232	8395	4
34386	232	8400	4
34387	232	8411	4.5
34388	232	8413	3
34389	232	8422	4
34390	232	8426	4.5
34391	232	8427	4
34392	232	8430	4
34393	232	8434	3.5
34394	232	8435	4.5
34395	232	8442	4.5
34396	232	8443	4
34397	232	8445	3
34398	232	8449	4.5
34399	232	8452	4.5
34400	232	8453	4.5
34401	232	8457	3.5
34402	232	8459	3.5
34403	232	8461	3.5
34404	232	8462	4.5
34405	232	8466	3
34406	232	8468	4
34407	232	8474	3
34408	232	8475	4
34409	232	8480	4
34410	232	8483	4
34411	232	8485	4.5
34412	232	8486	3.5
34413	232	8489	4.5
34414	232	8490	3
34415	232	8497	3.5
34416	232	8498	4
34417	232	8500	4
34418	232	8508	3.5
34419	232	8518	3
34420	232	8526	4
34421	232	8532	4.5
34422	232	8535	4
34423	232	8536	3.5
34424	232	8543	4.5
34425	232	8547	1
34426	232	8548	3
34427	232	8549	3.5
34428	232	8556	4.5
34429	232	8557	4
34430	232	8558	5
34431	232	8562	4
34432	232	8564	4.5
34433	232	8570	4
34434	232	8573	3.5
34435	232	8574	4
34436	232	8575	4.5
34437	232	8578	4.5
34438	232	8579	4.5
34439	232	8581	4.5
34440	232	8582	5
34441	232	8587	3.5
34442	232	8591	2
34443	232	8592	4.5
34444	232	8597	3
34445	232	8598	4
34446	232	8600	4
34447	232	8603	4.5
34448	232	8604	3.5
34449	232	8607	2.5
34450	232	8616	1.5
34451	232	8620	4
34452	232	8627	4.5
34453	232	8628	4
34454	232	8629	4
34455	232	8630	5
34456	232	8631	4
34457	232	8632	4
34458	232	8633	3.5
34459	232	8635	4
34460	232	8639	4.5
34461	232	8642	4.5
34462	232	8645	4
34463	232	8652	4.5
34464	232	8654	5
34465	232	8662	5
34466	232	8665	5
34467	232	8670	4
34468	232	8683	3.5
34469	232	8686	4
34470	232	8688	4
34471	232	8690	3
34472	232	8692	2.5
34473	232	8700	3
34474	232	8703	3.5
34475	232	8704	4
34476	232	8705	3.5
34477	232	8709	3
34478	232	8713	4.5
34479	232	8714	3.5
34480	232	8715	4.5
34481	232	8716	3.5
34482	232	8721	5
34483	232	8723	4
34484	232	8726	3
34485	232	8730	4
34486	232	8739	4
34487	232	8741	3
34488	232	8746	4.5
34489	232	8749	3
34490	232	8753	3.5
34491	232	8755	4
34492	232	8757	3.5
34493	232	8758	4.5
34494	232	8760	4
34495	232	8761	4
34496	232	8762	4.5
34497	232	8770	4
34498	232	8778	4
34499	232	8780	4.5
34500	232	8785	4
34501	232	8786	4.5
34502	232	8788	4
34503	232	8790	4
34504	232	8794	3.5
34505	232	8796	4
34506	232	8804	3.5
34507	232	8805	4.5
34508	232	8807	4
34509	232	8816	3.5
34510	232	8819	3.5
34511	232	8820	4
34512	232	8823	3.5
34513	232	8826	4.5
34514	232	8835	4.5
34515	232	8837	3.5
34516	232	8840	3.5
34517	232	8841	4.5
34518	232	8846	3.5
34519	232	8850	3.5
34520	232	8858	4
34521	232	8862	4
34522	232	8868	3.5
34523	232	8871	4
34524	232	8872	4.5
34525	232	8875	3
34526	232	8876	4
34527	232	8878	4
34528	232	8879	4
34529	232	8881	3.5
34530	232	8884	4
34531	232	8885	4.5
34532	232	8893	3.5
34533	232	8894	4
34534	232	8895	4
34535	232	8896	4.5
34536	232	8902	4
34537	232	8903	4
34538	232	8904	4.5
34539	232	8905	3
34540	232	8906	4
34541	232	8907	4
34542	232	8910	4.5
34543	232	8911	3.5
34544	232	8918	4
34545	232	8922	2
34546	232	8923	3.5
34547	232	8925	4.5
34548	232	8927	4
34549	232	8936	4
34550	232	8938	4
34551	232	8943	3
34552	232	8945	3.5
34553	232	8948	4
34554	232	8953	4
34555	232	8954	3.5
34556	232	8955	4
34557	232	8958	4
34558	232	8959	4.5
34559	232	8960	4
34560	232	8963	5
34561	232	8964	3.5
34562	232	8977	4
34563	232	8985	4
34564	232	8987	3.5
34565	232	8990	4
34566	232	8996	4
34567	232	9002	3.5
34568	232	9004	4
34569	232	9010	4.5
34570	232	9013	5
34571	232	9014	4.5
34572	232	9018	4
34573	232	9021	3.5
34574	232	9024	3.5
34575	232	9027	3
34576	232	9028	3.5
34577	232	9029	4
34578	232	9030	3.5
34579	232	9031	3.5
34580	232	9036	3
34581	232	9037	4
34582	232	9038	4
34583	232	9039	4
34584	232	9048	4
34585	232	9049	4.5
34586	232	9051	5
34587	232	9053	4
34588	232	9054	4
34589	232	9057	5
34590	232	9058	3
34591	232	9060	2
34592	232	9061	3.5
34593	232	9069	4
34594	232	9070	5
34595	232	9072	3.5
34596	232	9074	4
34597	232	9080	3.5
34598	232	9083	4
34599	232	9087	3.5
34600	232	9088	4
34601	232	9090	4
34602	232	9108	4.5
34603	232	9109	3.5
34604	232	9111	4
34605	232	9114	4.5
34606	232	9122	4.5
34607	232	9131	4
34608	232	9135	4.5
34609	232	9147	4
34610	232	9149	4
34611	232	9151	4.5
34612	232	9152	4.5
34613	232	9156	4.5
34614	232	9160	4.5
34615	232	9175	3.5
34616	232	9177	4
34617	232	9178	4
34618	232	9189	4
34619	232	9191	2.5
34620	232	9196	3.5
34621	232	9199	5
34622	232	9208	1.5
34623	232	9220	3
34624	232	9225	4.5
34625	232	9226	4
34626	232	9227	4.5
34627	232	9229	4.5
34628	232	9230	4.5
34629	232	9246	4
34630	232	9251	4.5
34631	232	9259	4
34632	232	9269	4.5
34633	232	9272	4.5
34634	232	9274	5
34635	232	9280	5
34636	232	9298	4
34637	232	9299	4
34638	232	9303	4
34639	232	9308	4.5
34740	233	1	3