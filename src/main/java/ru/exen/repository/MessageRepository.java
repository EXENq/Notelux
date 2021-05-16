package ru.exen.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.transaction.annotation.Transactional;
import ru.exen.model.Message;
import ru.exen.model.User;
import ru.exen.model.dto.MessageDto;

public interface MessageRepository extends JpaRepository<Message, Long> {

	@Query("select new ru.exen.model.dto.MessageDto(" +
			"	m, " +
			"	count(ml), " +
			"	sum(case when ml = :user then 1 else 0 end) >0" +
			") " +
			"from Message m left join m.likes ml " +
			"group by m")
	Page<MessageDto> findAll(Pageable pageable,  @Param("user") User user);

	@Query("select new ru.exen.model.dto.MessageDto(" +
			"	m, " +
			"	count(ml), " +
			"	sum(case when ml = :user then 1 else 0 end) >0" +
			") " +
			"from Message m left join m.likes ml " +
			"where lower(m.tag) like lower(concat('%', :tag,'%')) " +
			"group by m")
	Page<MessageDto> findByTag(@Param("tag") String tag, Pageable pageable,  @Param("user") User user);

	@Query("select new ru.exen.model.dto.MessageDto(" +
			"	m, " +
			"	count(ml), " +
			"	sum(case when ml = :user then 1 else 0 end) >0" +
			") " +
			"from Message m left join m.likes ml " +
			"where m.author = :author " +
			"group by m")
    Page<MessageDto> findByUser(Pageable pageable, @Param("author") User author, @Param("user") User user);

	@Query("select new ru.exen.model.dto.MessageDto(" +
			"   m, " +
			"   count(ml), " +
			"   sum(case when ml = :author then 1 else 0 end) > 0" +
			") " +
			"from Message m left join m.likes ml " +
			"where m.author = :author " +
			"group by m")
	Page<MessageDto> findByUser(Pageable pageable, @Param("author") User author);

	@Transactional
	@Modifying
	@Query("delete from Message m where m.id=:id")
	void deleteMessage(@Param("id") Long id);
}
