--1. What grades are stored in the database?
--SELECT * FROM Grade

--2. What emotions may be associated with a poem?
--SELECT * FROM Emotion

--3. How many poems are in the database?
--SELECT Count(Poem.Id)
--FROM Poem

--4. Sort authors alphabetically by name. What are the names of the top 76 authors?
--SELECT TOP 76 Author.Name
--FROM Author
--ORDER BY Author.Name

--5. Starting with the above query, add the grade of each of the authors.
--SELECT TOP 76 Author.Name, g.Name
--FROM Author
--	JOIN Grade g ON Author.GradeId = g.Id

--6. Starting with the above query, add the recorded gender of each of the authors.
--SELECT TOP 76 Author.Name, g.Name, ge.Name
--FROM Author
--	JOIN Grade g ON Author.GradeId = g.Id
--	JOIN Gender ge ON Author.GenderId = ge.Id

--7. What is the total number of words in all poems in the database?
--SELECT SUM(Poem.WordCount) AS TotalWordCount
--FROM Poem

--8. Which poem has the fewest characters?
--SELECT TOP 1 Poem.Title, Poem.CharCount
--FROM Poem
--ORDER BY Poem.CharCount ASC

--9. How many authors are in the third grade?
--SELECT COUNT(Author.Id)
--FROM Author
--	JOIN grade g ON Author.GradeId = g.Id
--	WHERE GradeId = 3

--10.How many total authors are in the first through third grades?
--SELECT COUNT(Author.Id)
--FROM Author
--	JOIN grade g ON Author.GradeId = g.Id
--	WHERE GradeId = 1 OR GradeId = 2 OR GradeId = 3


--11. What is the total number of poems written by fourth graders?
--SELECT COUNT(p.id)
--FROM POEM p
--	JOIN Author a ON p.AuthorId = a.Id
--	JOIN Grade g ON a.GradeId = g.Id
--	WHERE g.Id = 4

--12. How many poems are there per grade?
--SELECT Count(p.id) AS PoemCount, g.Name
--FROM Poem p
--	JOIN Author a ON p.AuthorId = a.Id
--	JOIN Grade g ON a.GradeId = g.Id
--	GROUP BY g.Id, g.Name

--13. How many authors are in each grade? (Order your results by grade starting with 1st Grade)
--SELECT COUNT(a.id) AS AuthorCount, g.Name
--FROM Author a
--	JOIN Grade g ON a.GradeId = g.Id
--	GROUP BY g.Id, g.Name

--14. What is the title of the poem that has the most words?
--SELECT TOP 1 p.Title, p.WordCount
--FROM Poem p
--ORDER BY p.WordCount DESC

--15. Which author(s) have the most poems? (Remember authors can have the same name.)
--SELECT TOP 10 a.Name, COUNT(p.AuthorId) AS NumOfPoems
--FROM Poem p
--	JOIN Author a ON p.AuthorId = a.Id
--	GROUP BY a.Id, a.Name
--	ORDER BY COUNT(p.AuthorId) DESC

--16. How many poems have an emotion of sadness?
--SELECT e.Name, COUNT(pe.PoemId) AS NumOfEmotionalPoems
--FROM PoemEmotion pe
--	JOIN Poem p ON pe.PoemId = p.Id
--	JOIN Emotion e ON pe.EmotionId = e.Id
--	WHERE e.Name = 'Sadness'
--	GROUP BY e.Name

--17. How many poems are not associated with any emotion?
--SELECT COUNT(p.id) AS PoemsWithNullEmotion
--FROM Poem p
--	LEFT JOIN PoemEmotion pe ON pe.PoemId = p.Id
--	LEFT JOIN Emotion e ON pe.EmotionId = e.Id
--	WHERE pe.EmotionId is Null

--18. Which emotion is associated with the least number of poems?
--SELECT TOP 1 e.Name, COUNT(pe.PoemId) AS NumOfEmotionalPoems
--FROM PoemEmotion pe
--	JOIN Poem p ON pe.PoemId = p.Id
--	JOIN Emotion e ON pe.EmotionId = e.Id
--	GROUP BY e.Name
--	ORDER BY COUNT(pe.PoemId) ASC

--19. Which grade has the largest number of poems with an emotion of joy?
--SELECT TOP 1 g.name AS GradeName, COUNT(p.id) AS NumOFPoemsWithJoy
--FROM Poem p
--	JOIN Author a ON p.AuthorId = a.Id
--	JOIN Grade g ON a.GradeId = g.Id
--	JOIN PoemEmotion pe ON pe.PoemId = p.Id
--	JOIN Emotion e ON pe.EmotionId = e.Id
--	WHERE e.name = 'Joy'
--	GROUP BY g.name
--	ORDER BY COUNT(p.id) DESC

--20. Which gender has the least number of poems with an emotion of fear?
--SELECT 
--	TOP 1 g.name AS GenderName, 
--	COUNT(p.id) AS NumOFPoemsWithFear
--FROM Poem p
--	LEFT JOIN Author a ON p.AuthorId = a.Id
--	LEFT JOIN Gender g ON a.GenderId = g.Id
--	LEFT JOIN PoemEmotion pe ON pe.PoemId = p.Id
--	LEFT JOIN Emotion e ON pe.EmotionId = e.Id
--WHERE e.name = 'Fear'
--GROUP BY g.name
--ORDER BY COUNT(p.id) ASC